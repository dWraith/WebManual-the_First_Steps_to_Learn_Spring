<%-- 
    Document   : index
    Created on : 18.04.2016, 10:36:19
    Author     : User
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <link href="resources/style.css" type="text/css" rel="stylesheet">
        <script src="check.js"></script>
    </head>
    <body id="body"> 
        <div id="user_panel">
            <%  if(user!=null) {
                     out.print("<a class=\"item\" href=\"logout.jsp\">Выйти</a>");   
                     out.print("<a class=\"item\" href=\"userForm.jsp\">" + user.getEmail() + "</a>");
                } else { out.print("<a class=\"item\" href=\"signup.jsp\">РЕГИСТРАЦИЯ</a>"
                    + "<a class=\"item\" href=\"login.jsp\">ВОЙТИ</a>"); 
                } 
            %>
        </div>
        <div id="header">
            WebManual
        </div>
            <div id="menu">
                <div class="chapter">CSS</div>
                <div class="chapter">FONT</div>
                <div id="submenu">
                    <div class="menuitem">SIZE</div>
                    <div class="menuitem">COLOR</div>
                    <div class="menuitem">SHADOW</div>    
                    <div class="menuitem">ALIGN</div>
                    <div class="menuitem">FAMILY</div>
                    <div class="menuitem">STYLE</div>
                    <div class="menuitem">WEIGHT</div>    
                    <div class="menuitem">STREIGHT</div>
                </div>
                </style>
                <div class="chapter">DIV</div>
                <div id="submenu">
                    <div class="menuitem">LEFT</div>
                    <div class="menuitem">POSITION</div>
                    <div class="menuitem">RIGHT</div>    
                    <div class="menuitem">PADDING</div>
                    <div class="menuitem">MARGIN</div>
                    <div class="menuitem">BORDER</div>
                    <div class="menuitem">HEIGHT</div>    
                    <div class="menuitem">WIDTH</div>
                </div>
                <div class="chapter">JAVASCRIPT</div>
                <div id="submenu">
                    <div class="menuitem">var</div>
                    <div class="menuitem">alert()</div>
                    <div class="menuitem">window</div>    
                    <div class="menuitem">window.onload()</div>
                    <div class="menuitem">function()</div>
                </div>
                </div>
                <div id="profile_title">
                    <div>
                        <div id="search_panel">
                            <input value placeholder="Поиск статей">
                            <button>ПОИСК</button>
                        </div>
                    </div>
                </div>
            <div id="content">
                    <div class="T1"> Добро пожаловать </div>
            </div>
        <!-- Put this script tag to the <head> of your page -->
<!-- Put this div tag to the place, where the Comments block will be -->

    </body>
</html>