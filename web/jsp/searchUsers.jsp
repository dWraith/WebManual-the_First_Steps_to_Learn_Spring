<%-- 
    Document   : userForm
    Created on : 17.04.2016, 16:49:53
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <title>Поиск пользователей</title>
    </head>
    <body>
        <%@ include file="layout/userpane.jsp"%>
        <div id="header">
            <a class="header_item" href="<c:url value="/"/>">WebManual</a>
            <a class="header_item" a href="<c:url value="/css/pages?page=1"/>">CSS</a>
            <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            <a class="header_item" href="<c:url value="/users/${currentUser.nickname}"/>">ПРОФИЛЬ</a>
            <a class="active_header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
        <div id="user_profile">
                <%@ include file="layout/user_left.jsp"%>
                <div id="profile_title">
                    <div id="tag_label">ПОИСК ПОЛЬЗОВАТЕЛЕЙ:</div>
                    <div id="tag"><c:out default="По дате регистрации" value="${param.searchWord eq ''?'По дате регистрации':param.searchWord}"/></div>
                    <div id="search_panel">
                        <form method="post" action="users?page=1">
                            <input name="searchWord" value placeholder="${param.searchWord eq '' or param.searchWord eq null?'Поиск пользователей':param.searchWord}">
                            <button>ПОИСК</button>
                        </form>
                    </div>
                </div>
                <div id="search_pane">
                    <div id="navig_chapter">
                        <div class="lng_chapter"><a href="">ПО РЕЙТИНГУ</a></div>
                        <div class="lng_chapter"><a href="">ПО ДАТЕ РЕГИСТРАЦИИ</a></div>
                        <div class="lng_chapter"><a href="">ПО АЛФАВИТУ</a></div>
                    </div>
                    <c:if test="${users.size() eq 0}">
                        По вашему запросу ничего не найдено
                    </c:if>
                    <c:forEach begin="${(param.page-1)*10}" end="${param.page*10-1}" var="user" items="${users}">
                        <div class="search_user_item">
                            <div id="link">
                                <a href="users/${user.nickname}"><c:out value="${user.firstName} ${user.lastName}"/></a>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${users.size()/10 < 10 and users.size()/10 > 1}">
                        <c:forEach begin="1" end="${Math.ceil(users.size()/10)}" varStatus="loop">
                            <div class="pagination"><a href="users?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${users.size()/10 > 10 and param.page<(users.size()/10)-10}">
                        <div class="pagination"><a href="users?page=1">..</a></div>
                        <c:forEach begin="${param.page}" end="${param.page+10}" varStatus="loop">
                            <div class="pagination"><a href="users?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                        <div class="pagination"><a href="users?${users.size()/10}">..</a></div>
                    </c:if>
                    <c:if test="${users.size()/10 > 10 and param.page>users.size()-10}">
                        <div class="pagination"><a href="users?page=1">..</a></div>
                        <c:forEach begin="${users.size()-10}" end="${users.size()}" varStatus="loop">
                            <div class="pagination"><a href="users?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>
