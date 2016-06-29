<%-- 
    Document   : page
    Created on : 18.04.2016, 12:26:26
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>${page.name}</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <script src="<c:url value="/resources/check.js"/>"></script>
    </head>
    <body id="body"> 
        <%@include file="layout/userpane.jsp"%>
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
            <div id="content">
                ${page.content}
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>