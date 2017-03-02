<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="sem5.lab.web.BuyList"%>
<%@page import="sem5.lab.web.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/tag_library.tld"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="cart" class="sem5.lab.web.BuyList" scope="session" />
        <jsp:useBean id="user" class="sem5.lab.web.UserData" scope="session" />
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
    <body id="main_body">
        <div>
            <nav id=main_nav><ul><li><h3 onclick="mainPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="MainMenu.text"/></h3></li>
                    <li><h3><fmt:message key="LangMenu.text"/></h3>
                        <ul><li><a href = "?lang=ru"><h4>Русский</h4></a></li>
                            <li><a href = "?lang=en"><h4>English</h4></a></li>
                            <li><a href = "?lang=be"><h4>Беларуская</h4></a></li></ul></li>
                    <li><h3 onclick="addHistory('${pageContext.request.parameterMap.lang[0]}', '${user.log}')"><fmt:message key="Hist.text"/></h3></li>
                        <c:if test="${user.log eq "0"}">
                        <li><h3 onclick="enter('2', '${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="Enter.text"/></h3></li>
                        </c:if>
                        <c:if test="${user.log eq "1"}">
                        <li><h3><fmt:message key="PersAccT.text"/></h3>
                            <ul><li id='pers_account' onclick="account('${pageContext.request.parameterMap.lang[0]}')">${user.name}</li>
                                    <c:if test="${cart.ids.size()>0}">    
                                    <li onclick="orderPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="Check.text"/></li>
                                    </c:if>    
                                <li><a onclick="exit('2', '${pageContext.request.parameterMap.lang[0]}', '0')"><fmt:message key="Out.text"/></a></li>
                            </ul>
                        </li>
                    </c:if> 
                </ul></nav>
        </div>
        <div id=main_div2>
            <div id="select_div2">
                <h1><fmt:message key="BaskMenu.text"/></h1>     
            </div>
            <div id=main_divL> 
                <div id=main_divList2>   
                    <c:choose>
                        <c:when test="${cart.ids.size() eq 0}">
                            <h2 id="isEmpty"><fmt:message key="Cart.isEmpty"/></h2>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${cart.prod}" var="ProdBean">
                                <div id="prIn">
                                    <img id="imageB" src="${ProdBean.image}">
                                    <div id="nameB"><fmt:message key="${ProdBean.name}"/></div>
                                    <div id="nameAbInCart">  
                                        <div id="nameDescr"><fmt:message key="${ProdBean.description}"/></div>
                                        <div id="nameCost"><fmt:message key="Cart.Price"/>: ${ProdBean.cost}</div>
                                        <div id="nameAm"><fmt:message key="Cart.Amount"/>: ${ProdBean.amount}</div>
                                    </div>
                                    <div id="nameAll"><fmt:message key="Cart.PrOne"/>: ${f: avCost(ProdBean.cost,ProdBean.amount)}</div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>  
                </div>
            </div>
            <div id=mainB >
                <h1><fmt:message key="Cart.Order"/>:</h1>
                <h4 id="tov"><fmt:message key="Cart.AllProd"/>: ${cart.ids.size()}</h4>
                <h4 id="tov"><fmt:message key="Cart.OdSum"/>: ${f:avCostCart(cart.prod)}</h4>
                <c:if test="${user.log eq '1'}"> 
                    <c:if test="${cart.ids.size()>0}">
                        <a class="btn2" onclick="orderPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="Cart.Ord"/></a>
                    </c:if>
                    <c:if test="${cart.ids.size()>0}">
                        <a class="btn2" onclick="orderPage('${pageContext.request.parameterMap.lang[0]}')" style="opacity: 0"><fmt:message key="Cart.Ord"/></a>
                    </c:if>
                </c:if>
                <c:if test="${user.log eq '0'}">
                    <a class="btn2" style="font-size: 15px"><fmt:message key="Log.text"/></a>
                </c:if>
                <c:if test="${cart.ids.size()>0}">
                    <form id="cartF" action="add-cart" method="POST">
                        <button id="clear"><fmt:message key="Cart.Clear"/></button>
                        <input name="b" value="-1" style="display: none">
                        <input name="lang" value="${pageContext.request.parameterMap.lang[0]}" style="display: none">
                    </form>
                </c:if>
            </div>
            <footer id=main_footer><fmt:message key="Footer.text"/></footer>
        </div>
    </body>
</html>
