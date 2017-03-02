package sem5.lab.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddToCart", urlPatterns = {"/add-cart"})
public class AddToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        BuyList list = BuyList.get(session);
        String s=request.getParameter("b");
        Integer i=Integer.valueOf(s);
        
        
        if("-1".equals(s)){
            list.clear();
            response.sendRedirect("/LabsWeb/Cart.jsp?lang="+request.getParameter("lang")+"");
        }else{
            list.addItem(i);
            Utils.addList(list.getIds());
        if("items".equals(request.getParameter("page")))
        response.sendRedirect("/LabsWeb?lang="+request.getParameter("lang")+"");
        else response.sendRedirect("/LabsWeb/ServletName?lang="+request.getParameter("lang")+"&id="+request.getParameter("idS")+"");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "GET requests are not supported");
    }

}
