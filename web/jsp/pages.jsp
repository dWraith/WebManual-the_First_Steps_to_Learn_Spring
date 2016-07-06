<%-- 
    Document   : page
    Created on : 18.04.2016, 12:26:26
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />">
        <script src="check.js"></script>
        <script>
            ${param.page} = 2;
            alert(${param.page});
        </script>
    </head>
    <body id="body"> 
        <%@ include file="layout/userpane.jsp"%>
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
            <div id="profile_title">
                <div>
                    <div id="tag_label">ПОИСК СТРАНИЦ:</div>
                    <div id="tag"><c:out default="По дате добавления" value="${param.searchWord eq ''?'По дате добавления':param.searchWord}"/></div>
                    <div id="search_panel" value placeholder="Поиск статей">
                        <form method="post" action="<c:url value="/${languages[0].name}/pages?page=1"/>">
                            <input name="searchWord" value placeholder="${param.searchWord eq '' or param.searchWord eq null?'Поиск статей':param.searchWord}">
                            <button>ПОИСК</button>
                        </form>
                    </div>
                </div>
            </div>
            <div id="search_pane">
                <div id="navig_chapter">
                    <div class="lng_chapter"><a href="<c:url value="/tests?page=1"/>">ТЕСТЫ</a></div>
                    <div class="lng_chapter"><a href="">ПРАКТИЧЕСКИЕ РАБОТЫ</a></div>
                </div>
                <c:if test="${pages.size() eq 0}">
                    По вашему запросу ничего не найдено
                </c:if>
                <c:forEach begin="${((param.page-1)*10)}" end="${param.page*10-1}" var="page" items="${pages}">
                    <div class="search_page_item">
                        <a href="<c:out value="pages/${page.name}"/>"><c:out value="${page.name}"/></a>
                        <div id="description">
                            <c:out value="${page.description}"/>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${pages.size()/10 > 1}">
                    <c:forEach begin="1" end="${Math.ceil(pages.size()/10)}" varStatus="loop">
                        <div class="pagination"><a href="pages?page=${loop.index}"><c:out value="${loop.index}"/></a></div>
                    </c:forEach>
                </c:if>
                
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>