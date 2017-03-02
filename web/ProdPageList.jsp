<%@page import="sem5.lab.web.BuyList"%>
<%@page import="java.util.Locale" %>
<%@page import="java.util.ResourceBundle" %>
<%@page import="java.util.ArrayList" %>
<%@page import="sem5.lab.web.ProductList"%>
<%@page import="sem5.lab.web.ProdBean"%>
<%@page import="sem5.lab.web.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style/Style.css" type="text/css">
        <script src=CodeJS.js></script>
        <link rel = 'shortcut icon' href = 'icon.ico' type = 'image/ico'>
        <jsp:useBean id="ProdListBean" class="sem5.lab.web.ProdBean" scope="page"/>
        <jsp:useBean id="cart" class="sem5.lab.web.BuyList" scope="session" />
        <jsp:useBean id="user" class="sem5.lab.web.UserData" scope="session" />
        <%  request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String lang = request.getParameter("lang");
            Locale locale;
            if ("en".equals(lang)) {
                locale = new Locale("en", "EN");
            } else if ("ru".equals(lang)) {
                locale = new Locale("ru", "RU");
            } else if ("be".equals(lang)) {
                locale = new Locale("be", "BY");
            } else {
                locale = new Locale("ru", "RU");
            }
            ResourceBundle res = ResourceBundle.getBundle("Bundle", locale);       
            ProductList.clear();
            String type = request.getParameter("type");
        %>
        <title><%=res.getString("Main.Header")%></title>

                <jsp:setProperty name="ProdListBean" property="type" value="paints"/>
                <jsp:setProperty name="ProdListBean" property="name" value="0.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="0.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/div_p.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="1700"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="brush"/>
                <jsp:setProperty name="ProdListBean" property="name" value="1.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="1.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/nabor_sintetika.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="354"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="paints"/>
                <jsp:setProperty name="ProdListBean" property="name" value="2.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="2.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/master_class.jpeg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="581"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="paints"/>
                <jsp:setProperty name="ProdListBean" property="name" value="3.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="3.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/akrilic_decola.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="156"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="office"/>
                <jsp:setProperty name="ProdListBean" property="name" value="4.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="4.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/e_k.png"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="54"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="modeling"/>
                <jsp:setProperty name="ProdListBean" property="name" value="5.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="5.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/plast_l.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="124"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="office"/>
                <jsp:setProperty name="ProdListBean" property="name" value="6.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="6.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/pensil.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="690"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="easel"/>
                <jsp:setProperty name="ProdListBean" property="name" value="7.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="7.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/molb.png"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="4945"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="brush"/>
                <jsp:setProperty name="ProdListBean" property="name" value="8.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="8.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/br_braub.png"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="738"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="office"/>
                <jsp:setProperty name="ProdListBean" property="name" value="9.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="9.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/rubber.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="50"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="modeling"/>
                <jsp:setProperty name="ProdListBean" property="name" value="10.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="10.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/model.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="188"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="paper"/>
                <jsp:setProperty name="ProdListBean" property="name" value="11.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="11.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/paper_p.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="25"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="easel"/>
                <jsp:setProperty name="ProdListBean" property="name" value="12.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="12.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/mabef.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="4563"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="paper"/>
                <jsp:setProperty name="ProdListBean" property="name" value="13.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="13.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/paper_sonet.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="276"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="paints"/>
                <jsp:setProperty name="ProdListBean" property="name" value="14.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="14.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/batik.jpg"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="740"/>
                <%ProductList.addItem(ProdListBean);%>
                <jsp:setProperty name="ProdListBean" property="type" value="modeling"/>
                <jsp:setProperty name="ProdListBean" property="name" value="15.about"/>
                <jsp:setProperty name="ProdListBean" property="description" value="15.text"/>
                <jsp:setProperty name="ProdListBean" property="image" value="img/plastic.png"/>
                <jsp:setProperty name="ProdListBean" property="cost" value="410"/>
                <%ProductList.addItem(ProdListBean);%>
                <%Cookie[] cookies = request.getCookies();%>
                <%for (int i = 0; i < ProductList.getProdList().size(); i++) {
                    ProductList.getProdList().get(i).setId();
                }%>
    </head>
    <body id="main_body">
        
        <%@include file="ProdPageHat.jsp"%>
        <div id=main_div2>
            <div id="select_div">
                <h1><%=res.getString("Catalog.text")%></h1>
                <select name='selectName' id="select_menue" onchange="itemsChanged();">
                    <option disabled selected value=""><%=res.getString("Choise.text")%></option>
                    <option value='all'><%=res.getString("All.text")%></option>
                    <option value='paints'><%=res.getString("Paint.text")%></option>
                    <option value='brush'><%=res.getString("Brush.text")%></option>
                    <option value='paper'><%=res.getString("Paper.text")%></option>
                    <option value='office'><%=res.getString("Office.text")%></option>
                    <option value='model'><%=res.getString("Model.text")%></option>
                    <option value='easel'><%=res.getString("Easel.text")%></option>
                </select>
            </div>
            <div id=main_divList > 
                <% if (type == null) {
                        if (cookies == null) {
                            type = "all";
                            Cookie cookie = new Cookie("type", type);
                            response.addCookie(cookie);
                        } else {
                            for (int i = 0; i < cookies.length; i++) {
                                if ("type".equals(cookies[i].getName())) {
                                    type = cookies[i].getValue();
                                    break;
                                }
                            }
                            if (type == null) {
                            type = "all";
                            Cookie cookie = new Cookie("type", type);
                            response.addCookie(cookie);
                        }
                        }
                    } else {
                        Cookie cookie = new Cookie("type", type);
                        response.addCookie(cookie);
                    }
                    if (type != null) {
                        switch (type) {
                            case "paints":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("paints")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());
                %>
                <%@include file="ProdItem.jsp" %>
                <%
                        }
                    }
                    break;
                            case "brush":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("brush")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());
                %>
                <%@include file="ProdItem.jsp" %>
                <%
                        }
                    }
                    break; 
                         case "paper":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("paper")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());
                %>
                <%@include file="ProdItem.jsp" %>
                <%
                        }
                    }
                    break; 
                        case "office":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("office")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());
                %>
                <%@include file="ProdItem.jsp" %>
                <%
                        }
                    }
                    break; 
                        case "model":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("modeling")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());
                %>
                <%@include file="ProdItem.jsp" %>
                <%
                        }
                    }
                    break;
                        case "easel":
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                    if (ProductList.getProdList().get(i).getType().equals("easel")) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());

                        %>
                    <%@include file="ProdItem.jsp" %>
                    <%
                            }
                        }
                            break;
                            default:
                                for (int i = 0; i < ProductList.getProdList().size(); i++) {
                                        ProdListBean.setName(res.getString(ProductList.getProdList().get(i).getName()));
                                        ProdListBean.setDescription(res.getString(ProductList.getProdList().get(i).getDescription()));
                                        ProdListBean.setImage(ProductList.getProdList().get(i).getImage());
                                        ProdListBean.setCost(ProductList.getProdList().get(i).getCost());
                                        ProdListBean.setId(ProductList.getProdList().get(i).getId());
                                        ProdListBean.setType(ProductList.getProdList().get(i).getType());

                    %>
                    <%@include file="ProdItem.jsp" %>
                    <%
                            }
                            break;
               }
}
            %>
             ${f: addEnt("0")}
            </div>
            <footer id=main_footer><%=res.getString("Footer.text")%></footer>
        </div>
    </body>
</html>
