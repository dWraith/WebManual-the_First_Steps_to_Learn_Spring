<%@page import="com.Content.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta charset="utf-8"/>
        <title>Войти на сайт</title>
        <link href="<c:url value="/resources/style.css"/>" type="text/css" rel="stylesheet">
        <script src="check.js"></script>
        <style>
            table input {
                min-width: 300px;
            }
        </style>
    </head>
    <body id="body"> 
        <%@ include file="layout/userpane.jsp"%>
        <div id="header">
            <a class="header_item" href="<c:url value="/"/>">WebManual</a>
            <a class="header_item" a href="<c:url value="/css/pages?page=1"/>">CSS</a>
            <a class="header_item" href="<c:url value="/php/pages?page=1"/>">PHP</a>
            <a class="active_header_item" href="<c:url value="/login"/>">ПРОФИЛЬ</a>
            <a class="header_item" href="<c:url value="/users?page=1&s=1"/>">Пользователи</a>
        </div>
            <%@ include file="layout/left_menu.jsp"%>
            <div id="content">
                <form method="POST">
                    <table>
                        <tr>
                            <td>
                                <div class="table_title">ВОЙТИ НА САЙТ</div>
                            </td>
                        </tr>
                        <c:if test="${!(message eq null)}">
                            <tr>
                                <td>
                                    <div style="text-align: center; border-bottom: 2px solid crimson; padding: 5px 0; color: black; width: 320px;">
                                        <span>${message}</span>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${!(param.message eq null)}">
                            <tr>
                                <td>
                                    <div style="text-align: center; border-bottom: 2px solid seagreen; padding: 5px 0; color: black; width: 320px;">
                                        <span>${param.message}</span>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                        <tr>
                            <td><input style="margin: 10px 0px 5px 0px" value placeholder="ЛОГИН" name="login"></td>
                        </tr>
                        <tr>
                            <td><input style="margin: 0px 0px 10px 0px" type="password" value placeholder="ПАРОЛЬ" name="password"></td>
                        </tr>
                        <tr>
                            <td><button>ВОЙТИ</button></td>
                        </tr>
                        <tr>
                            <td>Еще не зарегистрированы?</td>
                        </tr>
                        <tr>
                            <td><a href="<c:url value="/signup"/>">Зарегистрироваться</a></td>
                        </tr>                            
                    </table>         
                </form>
            </div>
        <%@ include file="layout/footer.jsp"%> 
    </body>
</html>
