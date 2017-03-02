
<%@page import="sem5.lab.web.BuyList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="f" uri="/WEB-INF/tlds/tag_library.tld"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src=CodeJS.js></script>
    </head>
    <body>
        <div id="div_prod" >
            <img id="image" onclick="servletNamePage('<jsp:getProperty name="ProdListBean" property="type"/>',<jsp:getProperty name="ProdListBean" property="id"/>, '<%=request.getParameter("lang")%>');" src="<jsp:getProperty name="ProdListBean" property="image"/>">
            <textarea readonly id="name"><jsp:getProperty name="ProdListBean" property="name"/></textarea>
            <textarea readonly id="det_text"><jsp:getProperty name="ProdListBean" property="description"/></textarea>
            <div id="cost">
                <jsp:getProperty name="ProdListBean" property="cost"/>
            </div>
            <form action="add-cart" method="POST">
                <button  name="b" class="btn1"  value="<jsp:getProperty name="ProdListBean" property="id"/>"><%=res.getString("Buy.price")%></button>
                <input name="lang" value="${pageContext.request.parameterMap.lang[0]}" style="display: none">
                <input name="page" value="items" style="display: none">
            </form> 
        </div>
    </body>
</html>
