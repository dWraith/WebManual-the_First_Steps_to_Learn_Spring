<%-- 
    Document   : user_left
    Created on : 16.06.2016, 0:17:20
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div id="left_user_profile">
    <img id="avatar" src="<c:url value="/avatars/1.jpg"/>"</img>
    <c:if test="${!(user eq null)}">
        <div class="profile_name"><c:out value="${user.firstName} ${user.lastName}"/></div>
        <div class="profile_info">Группа: <a href="<c:url value="/users?page=1&searchWord=${user.group}&s=1"/>">${user.group}</a></div>
        <div class="profile_info">email: <a href="mailto:${user.email}"><c:out value="${user.email}"/></a></div>
        <div class="rating">Рейтинг: <a href="<c:url value="/users/top?page=1"/>">${user.rating}XP</a></div>
    </c:if>
    <c:if test="${(user eq null)}">
    <div class="profile_name"><c:out value="${currentUser.firstName} ${currentUser.lastName}"/></div>
        <div class="profile_info">Группа: <a href="<c:url value="/users?page=1&searchWord=${currentUser.group}&s=1"/>">${currentUser.group}</a></div>
        <div class="profile_info">email: <a href="mailto:${user.email}"><c:out value="${currentUser.email}"/></a></div>
        <div class="rating">Рейтинг: <a href="<c:url value="/users/top?page=1"/>">${currentUser.rating}XP</a></div>
    </c:if>
    <c:if test="${user eq null or currentUser.equals(user)}">
        <div id="action_profile">
            <a href="<c:url value="/users/${currentUser.nickname}/edit"/>">Изменить профиль</a>
            <a href="<c:url value="/login"/>">Выйти</a>
        </div>
</c:if>
</div>