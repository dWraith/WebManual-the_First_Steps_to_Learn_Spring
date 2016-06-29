<%-- 
    Document   : userForm
    Created on : 17.04.2016, 16:49:53
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <title>Топ пользователей</title>
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
                    <div style="margin: 5px;">
                        <div id="tag_label">ТОП ПОЛЬЗОВАТЕЛЕЙ:</div>
                    </div>
                </div>
                <div id="search_pane">
                    <c:if test="${users.size() eq 0}">
                        По вашему запросу ничего не найдено
                    </c:if>    
                    <c:forEach begin="${(param.page-1)*10}" end="${param.page*10-1}" var="user" items="${users}" varStatus="loop">
                        <div class="search_user_item">
                            <table>    
                                <tr>
                                    <td align="center" width="50">   
                                        <b><c:out value="#${loop.index+1}"/></b>
                                        <div style="font-size: 10px">позиция</div>
                                    </td>
                                    <td align="center" width="100">
                                        <span><c:out value="${user.rating}XP"/></span>
                                        <div style="font-size: 10px">репутация</div>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/users/${user.nickname}"/>"><c:out value="${user.firstName} ${user.lastName}"/></a>
                                    <td>
                                </tr>
                            </table>
                        </div>
                    </c:forEach>
                    <c:if test="${users.size()/10 < 10 and users.size()/10 > 1}">
                        <c:forEach begin="1" end="${Math.ceil(users.size()/10)}" varStatus="loop">
                            <div class="pagination"><a href="users/top?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${users.size()/10 > 10 and param.page<(users.size()/10)-10}">
                        <div class="pagination"><a href="users/top?page=1">..</a></div>
                        <c:forEach begin="${param.page}" end="${param.page+10}" varStatus="loop">
                            <div class="pagination"><a href="users/top?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                        <div class="pagination"><a href="users/top?${users.size()/10}">..</a></div>
                    </c:if>
                    <c:if test="${users.size()/10 > 10 and param.page>users.size()-10}">
                        <div class="pagination"><a href="users/top?page=1">..</a></div>
                        <c:forEach begin="${users.size()-10}" end="${users.size()}" varStatus="loop">
                            <div class="pagination"><a href="users/top?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>
