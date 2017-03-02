package sem5.lab.web.protect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem5.lab.web.BuyList;

public class ExitServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String s = request.getParameter("page");
        Integer i = Integer.valueOf(s);
        BuyList list = BuyList.get(session);
        list.clear();
        session.invalidate();
        if (i == 1) {
            response.sendRedirect("/LabsWeb?lang=" + request.getParameter("lang") + "");
        }
        if (i == 2) {
            response.sendRedirect("/LabsWeb/Cart.jsp?lang=" + request.getParameter("lang") + "");
        }
        if (i == 3) {
            response.sendRedirect("/LabsWeb/ServletName?lang=" + request.getParameter("lang") + "&id="+request.getParameter("id")+"");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
