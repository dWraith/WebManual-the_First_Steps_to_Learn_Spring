<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="user_panel">
    <c:if test="${!(currentUser eq null)}">
        <div id="sub_user_panel">
            <a class="item" href="<c:url value="/users/${currentUser.nickname}"/>">${currentUser.email}</a>
            <a class="item" href="<c:url value="/logout"/>">Выйти</a>
        </div>
    </c:if>
    <c:if test="${currentUser eq null}">
        <div id="sub_user_panel">
            <a class="item" href="<c:url value="/login"/>">Войти</a>
            <a class="item" href="<c:url value="/signup"/>">Регистрация</a>
        </div>
    </c:if>
</div> 