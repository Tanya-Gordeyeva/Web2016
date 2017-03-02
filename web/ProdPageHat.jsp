
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="hat">
            <nav id=main_nav><ul>
                    <li><h3><%=res.getString("LangMenu.text")%></h3>
                        <ul><li><a href = "?lang=ru"><h4>Русский</h4></a></li>
                            <li><a href = "?lang=en"><h4>English</h4></a></li>
                            <li><a href = "?lang=be"><h4>Беларуская</h4></a></li></ul></li>
                    <li><h3 onclick="baskMenuPage('<%=request.getParameter("lang")%>')"><%=res.getString("BaskMenu.text")%></h3></li>
                    <li><h3 onclick="addHistory('<%=request.getParameter("lang")%>','${user.log}')"><%=res.getString("Hist.text")%></h3></li>

                    <c:if test="${user.log eq "0"}">
                        <li><h3 onclick="enter('1', '<%=request.getParameter("lang")%>')"><%=res.getString("Enter.text")%></h3></li>
                        </c:if>
                        <c:if test="${user.log eq "1"}">
                        <li><h3><%=res.getString("PersAccT.text")%></h3>
                            <ul><li id='pers_account' onclick="account('<%=request.getParameter("lang")%>')">${user.name}</li>
                                <c:if test="${cart.ids.size()>0}">
                                <li onclick="orderPage('<%=request.getParameter("lang")%>')"><%=res.getString("Check.text")%></li>
                                </c:if>
                                <li><a onclick="exit('1', '<%=request.getParameter("lang")%>','0')"><%=res.getString("Out.text")%></a></li>
                            </ul></li>
                        </c:if>  
                </ul></nav>
        </div>
    </body>
</html>
