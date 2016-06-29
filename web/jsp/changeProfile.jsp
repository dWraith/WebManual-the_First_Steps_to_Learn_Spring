<%-- 
    Document   : userForm
    Created on : 17.04.2016, 16:49:53
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <link href="<c:url value="/resources/style.css"/>" type="text/css" rel="stylesheet">
        <title>Изменить профиль</title>
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
                    <div style="margin-top: 5px" id="tag_label">РЕДАКТИРОВАТЬ ПРОФИЛЬ:</div>
                </div>
                <div id="right_user_profile">
                    <form:form modelAttribute="user" method="post">
                        <div class="search_user_item">
                            <div id="title">Изменить имя:</div>
                            <form:input path="firstName" placeholder="Имя"/>
                        </div>
                        <div class="search_user_item">
                            <div id="title">Изменить фамилию:</div>
                            <form:input path="lastName" placeholder="Фамилия"/>
                        </div>
                        <div class="search_user_item">
                            <div id="title">Сменить группу:</div>
                            <form:input path="group" placeholder="Группа"/>
                        </div>
                        <div class="search_user_item">
                            <div id="title">Сменить отображаемое имя:</div>
                            <form:input path="nickname" placeholder="Отображаемое имя"/>
                        </div>
                        <div class="search_user_item">
                            <div id="title">Сменить электронную почту:</div>
                            <form:input path="email" placeholder="Электронная почта"/>
                        </div>
                        <div class="search_user_item">
                            <div id="title">Сменить пароль:</div>
                            <form:input type="password" path="password" placeholder="Пароль"/>
                        </div>
                        <button>Сохранить</button>
                    </form:form>
                </div>
            </div>
        <%@ include file="layout/footer.jsp"%>  
    </body>
</html>
