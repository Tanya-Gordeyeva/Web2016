<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="sem5.lab.web.base.History"%>
<%@page import="sem5.lab.web.base.HibernateUtil"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="sem5.lab.web.BuyList"%>
<%@page import="sem5.lab.web.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/tag_library.tld"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = 'shortcut icon' href = 'icon.ico' type = 'image/ico'>
        <link rel="stylesheet" href="style/Style.css" type="text/css">
        <script src=CodeJS.js></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCuw25o4Gd03t_KHG67FRYtPbSdRFxDU2U&callback=initMap"
        async defer></script>
        <jsp:useBean id="cart" class="sem5.lab.web.BuyList" scope="session" />
        <jsp:useBean id="user" class="sem5.lab.web.UserData" scope="session" />
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
                        <ul><li><a href = "" onclick="langPage('ru', 'lang')"><h4>Русский</h4></a></li>
                            <li><a href = "" onclick="langPage('en', 'lang')"><h4>English</h4></a></li>
                            <li><a href = "" onclick="langPage('be', 'lang')"><h4>Беларуская</h4></a></li></ul></li>
                    <li><h3 onclick="baskMenuPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="BaskMenu.text"/></h3></li>
                    <li><h3 onclick="exit('1', '${pageContext.request.parameterMap.lang[0]}', '0')"><fmt:message key="Out.text"/></h3></li>
                </ul></nav>
        </div>
        <form action="AddToBase" method="post" id="add_base">

            <div id="form_order">
                <input name="lang" value="${pageContext.request.parameterMap.lang[0]}" style="display: none">
                <input name="choice" value="${pageContext.request.parameterMap.choice[0]}" style="display: none">
                <input name="page" value="add" style="display: none">
                <div id="order_div" >
                    <h1><fmt:message key="Cart.Ord"/></h1>     
                </div>
                <c:forEach items="${cart.prod}" var="ProdBean">
                    <div id="ord_item">
                        <img src="${ProdBean.image}" class="order_image">
                        <div id="nameB"><fmt:message key="${ProdBean.name}"/></div>
                        <div id="nameAbInCart">  
                            <div id="nameDescr"><fmt:message key="${ProdBean.description}"/></div>
                            <div id="nameCost"><fmt:message key="Cart.Price"/>: ${ProdBean.cost}</div>
                            <div id="nameAm"><fmt:message key="Cart.Amount"/>: ${ProdBean.amount}</div>
                        </div>
                        <div class="price"><fmt:message key="Cart.PrOne"/>: ${f: avCost(ProdBean.cost,ProdBean.amount)}</div>
                    </div>
                </c:forEach>

                <c:if test="${pageContext.request.parameterMap.choice[0] eq '1'}">
                    <nav id=snav class="orderMenu"><ul><li id=b1 onClick="choice('1','${pageContext.request.parameterMap.lang[0]}')" style="border: 2px solid #209DCA"><h4><fmt:message key="Pick.text"/></h4></li>
                            <li id=b2 onClick="choice('2','${pageContext.request.parameterMap.lang[0]}')"><h4><fmt:message key="Del.text"/></h4></li>
                        </ul>
                    </nav>
                    <div id="maps" style="display: block">
                    </c:if>
                    <c:if test="${pageContext.request.parameterMap.choice[0] eq '2'}">
                        <nav id=snav class="orderMenu"><ul><li id=b1 onClick="choice('1','${pageContext.request.parameterMap.lang[0]}')"><h4><fmt:message key="Pick.text"/></h4></li>
                                <li id=b2 onClick="choice('2','${pageContext.request.parameterMap.lang[0]}')" style="border: 2px solid #209DCA"><h4><fmt:message key="Del.text"/></h4></li>
                            </ul>
                        </nav>
                        <div id="maps" style="display: none">
                        </c:if>
                        <div id="map" style="height: 90%"></div>
                        <div id="market">
                            <p><input name="markets" type="radio" value="m1" id="m1" checked><fmt:message key="m1"/></p>
                            <p><input name="markets" type="radio" value="m1" id="m2"><fmt:message key="m2"/></p>
                            <p><input name="markets" type="radio" value="m3" id="m3"><fmt:message key="m3"/></p>
                            <p><input name="markets" type="radio" value="m4" id="m4"><fmt:message key="m4"/></p>
                            <p><input name="markets" type="radio" value="m5" id="m5"><fmt:message key="m5"/></p>
                            <p><input name="markets" type="radio" value="m6" id="m6"><fmt:message key="m6"/></p>
                            <p><input name="markets" type="radio" value="m7" id="m7"><fmt:message key="m7"/></p>
                        </div>
                    </div>
                    <c:if test="${pageContext.request.parameterMap.choice[0] eq '2'}">
                        <div id="adress" style="display: block">
                        </c:if>
                        <c:if test="${pageContext.request.parameterMap.choice[0] eq '1'}">
                            <div id="adress" style="display: none">
                            </c:if>
                            <label id="text_order_main"><fmt:message key="Adress.text"/></label><br>
                            <label id="text_order"><fmt:message key="City.text"/></label><br>
                            <p><input name="city" type="text" placeholder="<fmt:message key="City.text"/>" class="param"></p>
                            <label id="text_order"><fmt:message key="Area.text"/></label><br>
                            <p><input name="area" type="text" placeholder="<fmt:message key="Area.text"/>" class="param"></p>
                            <label id="text_order"><fmt:message key="Street.text"/></label><br>
                            <p><input name="street" type="text" placeholder="<fmt:message key="Street.text"/>" class="param"></p>
                            <label id="text_order"><fmt:message key="House.text"/></label><br>
                            <p><input name="house" type="text" placeholder="<fmt:message key="House.text"/>" class="param"></p>
                        </div>
                        <h4 id="order_all"><fmt:message key="Cart.OdSum"/>: ${f:avCostCart(cart.prod)}</h4>
                        <input type="submit" id="order" class="btn" value="<fmt:message key="Order.button"/>">
                    </div>
                </div>
            </div>
        </form>
        <footer id=main_footer><fmt:message key="Footer.text"/></footer>
    </body>
</html>

