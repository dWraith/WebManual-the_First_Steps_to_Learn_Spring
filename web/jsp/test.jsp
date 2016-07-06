<%-- 
    Document   : page
    Created on : 18.04.2016, 12:26:26
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html xmlns:th="http://www.thymeleaf.org">

<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <script src="check.js"></script>
        <script>
            function findPos(obj) {
                var curtop = 0; 
                if (obj.offsetParent) {
                    do {
                        curtop += obj.offsetTop;
                        window.scroll(0, curtop);
                    } while (obj = obj.offsetParent);
                }
            }
            
            function timecheckit() {
                var correct_answers = 0;
                var score = 0;
                var questions = document.getElementsByName('question[]');
                var answers;
                var first_wrong_answer = null;
                var correctAnswer;
                    for(var i = 0; i<10; i++) {
                        correctAnswer = document.getElementById(questions[i].getAttribute("correct"));
                        answers = document.getElementsByName((i+1)+"[]");
                        for(var j = 0; j<4; j++) {
                            answers[j].disabled = true;
                        }
                        if(correctAnswer.checked) {
                            questions[i].style.borderBottom="2px solid seagreen";
                            score += 2;
                            correct_answers++;
                        }
                        else {
                            questions[i].style.borderBottom="2px solid crimson";
                            score -= 3;
                            if(first_wrong_answer==null) {
                                first_wrong_answer = questions[i];
                                findPos(first_wrong_answer);
                            }
                        }
                    }
                showNotification(correct_answers, score);
                sendPost(score);
            }
        
            function showNotification(correct_answers, score) {
                var notification = document.getElementById('test_notification');
                var notification_description = document.getElementById('description');
                notification_description.innerHTML = "Вы правильно ответили на <b>" +  correct_answers + "</b> вопросов из <b>10</b>.<br>";
                notification_description.innerHTML += score>0?"К Вашей репутации было добавлено <b>" + score + "XP</b>":"К сожалению, вы не справились с тестом.<br> Ваша репутация была понижена на <b>" + score + "XP</b>";
                notification.style.bottom = 0;
                notification.style.opacity = 1;
                var pos = 210;
                var up = 1;
                var id = setInterval(getLowerOpacityToNull, 25);
                function getLowerOpacityToNull() {
                    if (pos == 0) {
                        clearInterval(id);
                    }
                    else if(pos>200) {
                        pos--;
                        notification.style.bottom = up++ + 'px'; 
                    }
                    else {
                        pos--; 
                        notification.style.opacity -= 0.005; 
                    }
                }
            }
            
            function sendPost(score) {
                var xmlhttp=new XMLHttpRequest();
                xmlhttp.open("POST","save",true);
                xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlhttp.send("id_user=${currentUser.id}&id_test=${test.id}&score="+score);
            }
        </script>
    </head>
    <body id="body"> 
        <%@ include file="layout/userpane.jsp"%>
        <div id="header">
            <a class="header_item" href="<c:url value="/"/>">WebManual</a>
            <c:if test="${languages[0].name == 'CSS'}">
                <a class="active_header_item" href="<c:url value="/css/pages?page=1"/>">CSS</a>
                <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            </c:if>
            <c:if test="${languages[0].name == 'PHP'}">
                <a class="header_item" href="<c:url value="/css/pages?page=1"/>">CSS</a>
                <a class="active_header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            </c:if>
            <c:if test="${!(currentUser eq null)}"><a class="header_item" href="">ПРОФИЛЬ</a></c:if>
            <a class="header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
            <%@ include file="layout/left_menu.jsp"%>
            <div id="profile_title">
                <div>
                    <div id="tag_label">ТЕСТИРОВАНИЕ:</div>
                    <div id="tag"><c:out value="${test.name}"/></div>
                </div>
            </div>
            <div id="search_pane">
                <c:forEach var="question" varStatus="loop" items="${test.questions}">
                    <div name="question[]" correct="${question.correctAnswer.id}" class="test_item">
                        <div id="title"><span>${question.question}</span></div>
                        <table>
                            <c:forEach var="answer"  items="${question.answers}">
                                <tr>
                                    <td>
                                        <input id="${answer.id}" name="${loop.index+1}[]" type="radio"><span name="${question.id}">${answer.answer}</span></input>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>                      
                </c:forEach>
                <div id="test_notification">
                    <div class="title">Вы прошли тест!</div>
                    <div id="description"></div>
                    <div class="bottom"></div>
                </div>  
                <button onclick="timecheckit()">Проверить</button> 
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>