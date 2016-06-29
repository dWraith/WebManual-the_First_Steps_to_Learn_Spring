<%-- 
    Document   : index
    Created on : 18.04.2016, 10:36:19
    Author     : User
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="<c:url value="/resources/style.css"/>" type="text/css" rel="stylesheet">
        <script src="check.js"></script>
        <title>Добро пожаловать</title>
        <style>
            table {
                border-collapse: collapse;
                min-width: 210px;
                margin-top: 20px;
                background: #F7F7F7;
                display: inline-table;
                font-size: 16px;
            }
            table, th, td {
            }
            
            td {
                padding: 5px 5px;
            }
        </style>
    </head>
    <body>
        <%@ include file="layout/userpane.jsp"%>
        <div id="header">
            <a class="active_header_item" href="<c:url value="/"/>">WebManual</a>
            <a class="header_item" a href="<c:url value="/css/pages?page=1"/>">CSS</a>
            <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            <c:if test="${!(currentUser eq null)}"><a class="header_item" href="<c:url value="/users/${currentUser.nickname}"/>">ПРОФИЛЬ</a></c:if>
            <a class="header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
        <%@ include file="layout/left_menu.jsp"%>
            <div id="profile_title">
                <div>
                    <div id="search_panel">
                        <form method="post" action="<c:url value="/pages?page=1"/>">
                            <input name="searchWord" value placeholder="${param.searchWord eq '' or param.searchWord eq null?'Поиск статей':param.searchWord}">
                            <button>ПОИСК</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id="content" style="background">
                <div class="title">Добро пожаловать на сайт WebManual</div>
                <div class="welcome_text">
                    Здесь Вы можете найти интересующую информацию об языках <a href="<c:url value="/css/pages?page=1"/>">CSS</a> и <a href="<c:url value="/php/pages?page=1"/>">PHP</a>.
                    Статьи на сайте содержат примеры, которые можно опробовать в специальных
                    полях теста кода.
                    <br> Также на сайте имеются <a href="">практические работы</a> и <a href="<c:url value="/tests?page=1"/>">тесты</a> 
                    для закрепления знаний.<br>
                </div>
            </div>
            
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>