<%-- 
    Document   : logout
    Created on : 18.04.2016, 10:21:14
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    request.getSession().invalidate();
%>