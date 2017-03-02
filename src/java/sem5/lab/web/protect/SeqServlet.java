/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem5.lab.web.protect;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sem5.lab.web.ServletName;
import sem5.lab.web.UserData;

/**
 *
 * @author Татьяна
 */
@WebServlet(name = "SeqServlet", urlPatterns = {"/SeqServlet"})
public class SeqServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserData list = UserData.get(session);
        String s = request.getParameter("page");
        Integer i = Integer.valueOf(s);
        list.setInf(getServletContext().getInitParameter("parameterDisp1"));
        list.setLog("1");
        list.setName(request.getRemoteUser());        
        if (i == 1) {
            response.sendRedirect("/LabsWeb?lang=" + request.getParameter("lang") + "");
        }
        if (i == 2) {
            response.sendRedirect("/LabsWeb/Cart.jsp?lang=" + request.getParameter("lang") + "");
        }
        if (i == 3) {
            response.sendRedirect("/LabsWeb/ServletName?lang=" + request.getParameter("lang") + "&id=" + request.getParameter("id") + "");
        }
        if (i == 4) {
            response.sendRedirect("/LabsWeb/AddToBase?lang=" + request.getParameter("lang") + "&page=read");
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
