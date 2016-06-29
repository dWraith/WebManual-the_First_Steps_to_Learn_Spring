<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Форма регистрации</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <script src="check.js"></script>
        <script>
            var description, sendbutton, firstname, lastname, group, email, password;
            window.onload = function() {
                description = document.getElementById('description');
                sendbutton = document.getElementById('send');
                firstName = document.getElementById('firstName');
                lastName = document.getElementById('lastName');
                group = document.getElementById('group');
                email = document.getElementById('email');
                password = document.getElementById('password');
                sendbutton.disabled = true;
            }
            
            function checkAll() {
                if(!firstName.getAttribute("correct")) return;
                if(!lastName.getAttribute("correct")) return;
                if(!group.getAttribute("correct")) return;
                if(!email.getAttribute("correct")) return;
                if(!password.getAttribute("correct")) return;
                sendbutton.disabled = false;
            }
            function checkemail(field) {
                if(/^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/.test(field.value)) {
                    field.style.borderBottomColor = ("#4caf50");
                    field.setAttribute("correct","true");
                    checkAll();
                }
                else {
                    field.style.borderBottomColor = "#f10021";
                    description.innerHTML = "Введенный адрес некорректен";
                    description.style.borderBottom = "2px solid crimson";
                    field.setAttribute("correct","false");
                    sendbutton.disabled = true;
                }
            }
            
            function checksimple(field) {
                field.style.borderBottomColor = ("#4caf50");
                field.setAttribute("correct","true");
                checkAll();
            }
            
            function checkname(field) {    
                if(/^[a-zA-Zа-яА-Я]+$/ui.test(field.value)) {
                    field.style.borderBottomColor = ("#4caf50");
                    field.setAttribute("correct","true");
                    checkAll();
                }
                else {
                    field.style.borderBottomColor = "#f10021";
                    description.innerHTML = 'Поле не должно содержать спецсимволов';
                    description.style.borderBottom = "2px solid crimson";
                    field.setAttribute("correct","false");
                    sendbutton.disabled = true;
                }
            }
            
            function checkpassword() {
                var password = document.getElementById('password');
                var trypassword = document.getElementById('trypassword');
                if(password.value==trypassword.value) {
                    password.style.borderBottomColor = "#4caf50";
                    trypassword.style.borderBottomColor = "#4caf50";
                    password.setAttribute("correct","true");
                    checkAll();
                } else if(trypassword.value==''|| password.value==''){
                    password.style.borderBottomColor = ("#4caf50");
                    password.setAttribute("correct","false");
                    sendbutton.disabled = true;
                }
                else {
                    password.style.borderBottomColor = ("#f10021");
                    trypassword.style.borderBottomColor = ("#f10021");
                    description.innerHTML = 'Введенные пароли не совпадают';
                    description.style.borderBottom = "2px solid crimson";
                    password.setAttribute("correct","false");
                    sendbutton.disabled = true;
                }  
            }
        </script>
        <style>
            table input {
                min-width: 325px;
            }
        </style>
    </head>
    <body id="body"> 
        <%@ include file="layout/userpane.jsp"%>
        <div id="header">
            <a class="header_item" href="<c:url value="/"/>">WebManual</a>
            <a class="header_item" a href="<c:url value="/css/pages?page=1"/>">CSS</a>
            <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            <a class="active_header_item" href="<c:url value="/signup"/>">ПРОФИЛЬ</a>
            <a class="header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
            <%@ include file="layout/left_menu.jsp"%>
            <div id="content">
                <form:form modelAttribute="newUser" method="post">
                    <table>
                        <tr>
                            <td>
                                <div class="table_title">РЕГИСТРАЦИОННАЯ ФОРМА</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="description" class="table_description">Введите в поля нужную информацию:</div>
                            </td>
                        </tr>
                        <tr>
                            <td><form:input path="firstName" correct="true" id="firstName" onchange="checkname(this)" placeholder="Имя:"/></td>
                        </tr>
                        <tr>
                            <td><form:input path="lastName" correct="true" id="lastName" onchange="checkname(this)" placeholder="Фамилия:"/></td>
                        </tr>
                        <tr>
                            <td><form:input path="nickname" correct="true" id="email" onchange="checksimple(this)" placeholder="Отображаемое имя:"/></td>
                        </tr>
                        <tr>
                            <td><form:input path="group" correct="true" id="group" onchange="checksimple(this)" placeholder="Группа:"/></td>
                        </tr>
                        <tr>
                            <td><form:input path="email" correct="true" id="email" onchange="checkemail(this)" placeholder="Электронная почта:"/></td>
                        </tr>
                        <tr>
                            <td><form:input path="password" correct="true" onchange="checkpassword()" id="password" type="password" placeholder="Пароль:"/></td>
                        </tr>
                        <tr>
                            <td><input type="password" correct="true" onchange="checkpassword()" id="trypassword" placeholder="Еще раз:"/></td>
                        </tr>
                        <tr>
                            <td><button id="send">Зарегистрироваться</button></td>
                        </tr>
                    </table>
                </form:form>
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>