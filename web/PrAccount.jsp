<%@page import="sem5.lab.web.UserData"%>
<%@page import="sem5.lab.web.ProductList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/tag_library.tld"%>

<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="user" class="sem5.lab.web.UserData" scope="session" />
        <jsp:useBean id="history" class="sem5.lab.web.ProductList" scope="session" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = 'shortcut icon' href = 'icon.ico' type = 'image/ico'>
        <link rel="stylesheet" href="style/Style.css" type="text/css">
        <script src=CodeJS.js></script>
        <c:if test="${pageContext.request.parameterMap.lang[0]}">
            <fmt:setLocale value="ru_RU"/>
        </c:if>
        <c:if test="${pageContext.request.parameterMap.lang[0] eq 'ru'}">
            <fmt:setLocale value="ru_RU"/>
        </c:if>
        <c:if test="${pageContext.request.parameterMap.lang[0] eq 'en'}">
            <fmt:setLocale value="en_EN"/>
        </c:if>
        <c:if test="${pageContext.request.parameterMap.lang[0] eq 'be'}">
            <fmt:setLocale value="be_BY"/>
        </c:if>
        <fmt:setBundle basename="Bundle"/>
        <title><fmt:message key="Main.Header"/></title>
    </head>
    <body id="main_body" onload="loadXMLDoc()">

        <div>
            <nav id=main_nav><ul><li><h3 onclick="mainPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="MainMenu.text"/></h3></li>
                    <li><h3><fmt:message key="LangMenu.text"/></h3>
                        <ul><li><a href = "?lang=ru&history=${pageContext.request.parameterMap.history[0]}"><h4>Русский</h4></a></li>
                            <li><a href = "?lang=en&history=${pageContext.request.parameterMap.history[0]}"><h4>English</h4></a></li>
                            <li><a href = "?lang=be&history=${pageContext.request.parameterMap.history[0]}"><h4>Беларуская</h4></a></li></ul></li>
                    <li><h3 onclick="addHistory('${pageContext.request.parameterMap.lang[0]}', '${user.log}')"><fmt:message key="Hist.text"/></h3>
                        <c:if test="${cart.ids.size()>0}"> 
                            <ul>
                                <li onclick="orderPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="Check.text"/></li>
                            </ul>
                        </c:if> 
                    </li>
                    <li><h3 onclick="exit('1', '${pageContext.request.parameterMap.lang[0]}', '0')"><fmt:message key="Out.text"/></h3></li>
                </ul></nav>
        </div>
        <div id="data_area">
            <div id="select_div2" style="width:100%;margin-left: 0px">
                <h1><fmt:message key="PersAcc.text"/></h1> 
                <div id="TIME"></div>
            </div>
            <h2 id="acc_prop"><fmt:message key="User.text"/>: ${user.name}</h2>
            <h2 id="acc_prop"><fmt:message key="UserInit.text"/>: ${user.inf}</h2>
            <h2 id="history_h"><fmt:message key="NavigationMenu.text.Com"/></h2>
            <div id="RESULT"></div>
            <h1 id="text"><fmt:message key="Comm.text"/>:</h1>
            <textarea id="comment"></textarea>
            <button id="but_comm"  type="button"  class="btn2" onclick="loadXMLDoc()"><fmt:message key="Comm.button"/></button>

            <c:if test="${pageContext.request.parameterMap.history[0] eq 'visible'}">
                <div id="history">
                </c:if>
                <c:if test="${pageContext.request.parameterMap.history[0] eq 'none'}">
                    <div id="history" style="display: none">
                    </c:if>
                    <h2 id="history_h"><fmt:message key="Hist.text"/></h2>
                    <c:if test="${history.historyList.size()>0}">
                        <c:forEach items="${history.historyList}" var="History">
                            <div id="ord_itemH">
                                <div id="hist_name">
                                    <div id="nameHist1"><fmt:message key="${History.product}"/></div>
                                    <c:if test="${History.market.length() >3}">
                                        <div id="nameHist">${History.market}</div>
                                    </c:if>
                                    <c:if test="${History.market.length() <3}">
                                        <div id="nameHist"><fmt:message key="${History.market}"/></div>
                                    </c:if>
                                </div>
                                <div id="count_date">
                                    <div id="nameHist"><fmt:message key="Cart.Amount"/>: ${History.amount}</div>
                                    <div id="nameHist">${History.date}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${history.historyList.size() eq 0}">
                        <h2 id="isEmpty"><fmt:message key="Hist.null"/></h2>
                    </c:if>
                </div>
            </div>
            <script>
                var myVar = setInterval(function () {
                    myTimer('${pageContext.request.parameterMap.lang[0]}')
                }, 1000);
            </script>

        </div>
        <footer id=main_footer><fmt:message key="Footer.text"/></footer>
    </body>
</html>
