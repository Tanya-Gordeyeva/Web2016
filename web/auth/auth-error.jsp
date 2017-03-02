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
                        <ul><li><a href = "" onclick="langPage('ru','lang')"><h4>Русский</h4></a></li>
                            <li><a href = "" onclick="langPage('en','lang')"><h4>English</h4></a></li>
                            <li><a href = "" onclick="langPage('be','lang')"><h4>Беларуская</h4></a></li></ul></li>
                    <li><h3><fmt:message key="Hist.text"/></h3></li>
                    <li><h3 onclick="baskMenuPage('${pageContext.request.parameterMap.lang[0]}')"><fmt:message key="BaskMenu.text"/></h3></li>
                </ul></nav>
        </div>
        <div id="form_auth">
            <label id="text_auth2"><fmt:message key="WrongLog"/></label><br>
            <form action="/LabsWeb/SeqServlet?page=${pageContext.request.parameterMap.page[0]}&lang=${pageContext.request.parameterMap.lang[0]}&id=${pageContext.request.parameterMap.id[0]}" method="post" name="loginForm" id="form_log">
                <div id="again_div">
                    <input id="again" class="btn2" type="submit" value="<fmt:message key="LogAgain"/>" style="margin-top: 20px; margin-left: 60px"/>
                </div>
            </form>
        </div>
        <footer id=main_footer><fmt:message key="Footer.text"/></footer>
    </body>
</html>
