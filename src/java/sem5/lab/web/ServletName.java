package sem5.lab.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Locale;
import javax.servlet.http.HttpSession;
import java.util.ResourceBundle;

@WebServlet(name = "ServletName", urlPatterns = {"/ServletName"})
public class ServletName extends HttpServlet {

    private Integer param1;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException,
            IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException,
            IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException,
            IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
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
        String id = request.getParameter("id");
        ResourceBundle res = ResourceBundle.getBundle("Bundle", locale);
        StringBuilder sb = new StringBuilder();

        param1 = Integer.valueOf(getServletContext().getInitParameter("parameterDisp1"));
        sb.append("<HTML><HEAD>");
        sb.append("<meta charset=\"UTF-8\">");
        sb.append("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        sb.append("<link rel=\"stylesheet\" href=\"style/Style.css\" type=\"text/css\"/>");
        sb.append("<link rel = 'shortcut icon' href = 'icon.ico' type = 'image/ico'>");
        sb.append("<title>"
                + res.getString("Main.Header")
                + "</title>");
        sb.append("</head>");

        sb.append("<body id=main_body>");
        sb.append("<script src=CodeJS.js>");
        sb.append("</script>");
        sb.append("<div id=back_body><a href='#' class='background_body'></a>");
        sb.append("<nav id=main_nav><ul><li><h3 onclick=mainPage('" + lang + "')>"
                + res.getString("MainMenu.text")
                + "</h3></li>");
        sb.append("<li><h3>"
                + res.getString("LangMenu.text")
                + "</h3>");
        sb.append("<ul><li><a href = \"ServletName?id=" + id + "&lang=ru\"><h4>Русский</h4></a></li>");
        sb.append("<li><a href = \"ServletName?id=" + id + "&lang=en\"><h4>English</h4></a></li>");
        sb.append("<li><a href = \"ServletName?id=" + id + "&lang=be\"><h4>Беларуская</h4></a></li></ul></li>");
        sb.append("<li><h3 onclick=baskMenuPage('" + lang + "')>"
                + res.getString("BaskMenu.text")
                + "</h3></li>");
        if ("0".equals(UserData.get(request.getSession()).getLog())) {
            sb.append("<li><h3 onclick=enter('3','" + lang + "','" + id + "')>"
                    + res.getString("Enter.text")
                    + "</h3></li></ul></nav>");
        } else {
            sb.append("<li><h3>"
                    + res.getString("PersAccT.text")
                    + "</h3>"
                    + "<ul><li id=pers_account onclick=account('" + lang + "')>" + UserData.get(request.getSession()).getName() + "</li>");
            if (BuyList.get(request.getSession()).getIds().size() > 0) {
                sb.append("<li onclick=orderPage('" + lang + "')>Оформить заказ</li>");
            }
            sb.append("<li><a onclick=exit('3','" + lang + "','" + id + "')>"
                    + res.getString("Out.text")
                    + "</a></li>"
                    + "</ul>"
                    + "</li></ul></nav>");
        }
        sb.append("<div id=main_div2></div>");

        sb.append("<div id=main_div>");
        sb.append("<nav id=snav><ul><li onClick=show('none','none','block');><h4>"
                + res.getString("NavigationMenu.text.View")
                + "</h4></li>");
        sb.append("<li onClick=show('none','block','none');><h4>"
                + res.getString("NavigationMenu.text.DitView")
                + "</h4></li>");
        sb.append("<li onClick=show('block','none','none');><h4>"
                + res.getString("NavigationMenu.text.Com")
                + "</h4></li></ul></nav>");
        sb.append("<div id=pict_div><img id=izo src='" + ProductList.getProdList().get(Integer.valueOf(id)).getImage() + "'></a>");
        sb.append("<h2 id=price>" + ProductList.getProdList().get(Integer.valueOf(id)).getCost() + "</h2>");

        sb.append("<form id='formS' action=\"add-cart\" method=\"POST\">"
                + "<button class='btn' name='b' value=" + id + ">"
                + res.getString("Buy.price")
                + "<input name='lang' value=" + request.getParameter("lang") + " style='display: none'>"
                + "<input name='page' value='card' style='display: none'>"
                + "<input name='idS' value='" + id + "' style='display: none'>"
                + "</button>");
        sb.append("</div>");

        sb.append("<div id=text_div>");

        sb.append("<div id=text_comm class=text style='display:" + ((param1 == 3) ? "block" : "none") + "' >");
        sb.append("<text id=aboutN1 class=detail>"
                + res.getString("NavigationMenu.text.Com.Name1")
                + "<br>"
                + "</text>"
                + "<text id=aboutN2 class=detail>"
                + res.getString("NavigationMenu.text.Com1")
                + "<br>"
                + "</text>"
                + "<text id=aboutN1 class=detail>"
                + res.getString("NavigationMenu.text.Com.Name2")
                + "<br>"
                + "</text>"
                + "<text id=aboutN2 class=detail>"
                + res.getString("NavigationMenu.text.Com2")
                + "<br>"
                + "</text>"
                + "<text id=aboutN1 class=detail>"
                + res.getString("NavigationMenu.text.Com.Name3")
                + "<br>"
                + "</text>"
                + "<text  id=aboutN2 class=detail>"
                + res.getString("NavigationMenu.text.Com3")
                + "</text>");
        sb.append("</div>");

        sb.append("<div id=text_detail class=text style='display:" + ((param1 == 2) ? "block" : "none") + "'>");
        sb.append("<text id=about class=detail>"
                + res.getString("NavigationMenu.text.DitView.body")
                + "</text>");
        sb.append("</div>");

        sb.append("<div id=text_about class=text style='display:" + ((param1 == 1) ? "block" : "none") + "'>");
        sb.append("<text id=about1 class=detail>"
                + res.getString("" + ProductList.getProdList().get(Integer.valueOf(id)).getName() + "")
                + "<br>"
                + res.getString("" + ProductList.getProdList().get(Integer.valueOf(id)).getDescription() + "")
                + "<br>"
                + "</text>"
                + "<text  id=about2 class=detail>"
                + res.getString("NavigationMenu.text.View.body1")
                + "</text>");
        sb.append("</div>");

        sb.append("</div>");
        sb.append("</div>");
        sb.append("<footer id=main_footer>"
                + res.getString("Footer.text")
                + "</footer>");
        sb.append("</div>");
        sb.append("</body></html>");
        PrintWriter out = response.getWriter();
        out.println(sb.toString());
        out.close();
    }
}
