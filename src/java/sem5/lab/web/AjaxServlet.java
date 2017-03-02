/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem5.lab.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sem5.lab.web.base.Comments;
import sem5.lab.web.base.HibernateUtil;

@WebServlet(name = "AjaxServlet", urlPatterns = {"/AjaxServlet"})
public class AjaxServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        StringBuilder sb = new StringBuilder();
        Integer resId = null;
        tx = session.beginTransaction();
        HttpSession session1 = request.getSession();
        UserData user = UserData.get(session1);
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.YYYY kk:mm:ss");
        String date = sdf.format(new Date());
        String comment = request.getParameter("comment");
        try (PrintWriter out = response.getWriter()) {
            if ("".equals(comment)) {
            } else {
                Comments c = new Comments();
                c.setDate_time(date);
                c.setComment(comment);
                c.setUser(user.getName());
                session.save(c);
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AjaxServlet</title>");
            out.println("</head>");
            out.println("<body>");
            List list1 = session.createQuery("FROM Comments ORDER BY DATE_TIME DESC").list();
            for (Iterator iterator = list1.iterator(); iterator.hasNext();) {
                Comments cur = (Comments) iterator.next();
                if (user.getName() == null ? cur.getUser() == null : user.getName().equals(cur.getUser())) {
                    out.println("<h2>" + cur.getUser() + "</h2>");
                    out.println("<h3>" + cur.getComment() + "</h3>");
                    out.println("<h3>" + cur.getDate_time() + "</h3>");
                }

            }
            out.println("</body>");
            out.println("</html>");
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
