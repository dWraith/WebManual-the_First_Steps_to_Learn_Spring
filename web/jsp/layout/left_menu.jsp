<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="menu">
    <c:forEach var="language" items="${languages}">
        <div class="chapter">${language.name}</div>
            <c:forEach var="toctext" items="${language.listTocTexts}">
                <div class="menu_title">${toctext.name}</div>
                <div id="submenu">
                    <c:forEach var="page" items="${toctext.listPages}">
                        <div class="menuitem"><a title="${page.description}" href="<c:url value="/${language.name}/pages/${page.name}"/>">${page.name}</a></div>
                    </c:forEach>
                </div>
            </c:forEach>
            <div class="menu_title">Тесты</div>
    </c:forEach>
    <div id="submenu">
        <c:forEach var="test" items="${tests}">
            <div class="menuitem"><a title="${test.name}" href="<c:url value="/tests/${test.id}"/>">${test.name}</a></div>
        </c:forEach>
    </div>
</div>