<%-- 
    Document   : userForm
    Created on : 17.04.2016, 16:49:53
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css"/>">
        <title>USER FORM</title>
    </head>
    <body>
        <%@ include file="layout/userpane.jsp"%>  
        <div id="header">
            <a class="header_item" href="<c:url value="/"/>">WebManual</a>
            <a class="header_item" a href="<c:url value="/css/pages?page=1"/>">CSS</a>
            <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            <a class="active_header_item" href="<c:url value="/users/${currentUser.nickname}"/>">ПРОФИЛЬ</a>
            <a class="header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
        <div id="user_profile">
                <%@ include file="layout/user_left.jsp"%> 
                <div id="profile_title">
                    <div style="margin: 5px;">
                        <div id="tag_label">Активность пользователя:</div>
                        <div id="search_panel">
                            <form method="post" action="<c:url value="/users?page=1&s=1"/>">
                                <input name="searchWord" value placeholder="Поиск пользователей">
                                <button>ПОИСК</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="right_user_profile">
                    <c:forEach var="test" items="${user.tests}">
                        <div class="search_user_item">
                            <div id="title">Прошел тест:</div>
                            <div id="rating"><c:out value="${test.points>0?'+':''}${test.points}XP"/></div>
                            <div id="link">
                                <a href="<c:url value="/tests/${test.test.id}"/>"><c:out value="${test.test.name}"/></a>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${user.tests.size() eq 0}">Активность не найдена</c:if>
                </div>
        </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>
