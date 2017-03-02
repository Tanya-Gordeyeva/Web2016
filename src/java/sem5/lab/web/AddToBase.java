/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem5.lab.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sem5.lab.web.base.HibernateUtil;
import sem5.lab.web.base.History;

public class AddToBase extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        StringBuilder sb = new StringBuilder();
        Integer resId = null;
        tx = session.beginTransaction();
        HttpSession session1 = request.getSession();
        BuyList list = BuyList.get(session1);
        UserData user = UserData.get(session1);
        if ("add".equals(request.getParameter("page"))) {
            if ("1".equals(request.getParameter("choice"))) {
                for (int i = 0; i < list.getProd().size(); i++) {
                    History h = new History();
                    Date date = new Date();
                    h.setDate(date);
                    h.setUser(user.getName());
                    h.setMarket(request.getParameter("markets"));
                    h.setProduct(list.getProd().get(i).getName());
                    h.setAmount(list.getProd().get(i).getAmount());
                    h.setId(list.getProd().get(i).getId());
                    resId = (Integer) session.save(h);
                }
                list.clear();
                response.sendRedirect("/LabsWeb?lang=" + request.getParameter("lang") + "");
            } else {
                String city = request.getParameter("city");
                String area = request.getParameter("area");
                String street = request.getParameter("street");
                String house = request.getParameter("house");
                if ("".equals(house) || "".equals(city) || "".equals(area) || "".equals(street)) {
                    response.sendRedirect("/LabsWeb/Order.jsp?choice=" + request.getParameter("choice") + "&lang=" + request.getParameter("lang") + "");
                } else {
                    for (int i = 0; i < list.getProd().size(); i++) {
                        History h = new History();
                        Date date = new Date();
                        h.setDate(date);
                        h.setUser(user.getName());
                        String m = city + ", " + area + ", " + street + ", " + house;
                        h.setMarket(new String(m.getBytes("ISO-8859-1"), "UTF-8"));
                        h.setProduct(list.getProd().get(i).getName());
                        h.setAmount(list.getProd().get(i).getAmount());
                        h.setId(list.getProd().get(i).getId());
                        resId = (Integer) session.save(h);
                    }
                    list.clear();
                    response.sendRedirect("/LabsWeb?lang=" + request.getParameter("lang") + "");
                }
            }
        } else {
            ProductList.clearHistory();

                List list1 = session.createQuery("FROM History").list();
                for (Iterator iterator = list1.iterator(); iterator.hasNext();) {
                    History cur = (History) iterator.next();
                    History h = new History();
                    if (user.getName() == null ? cur.getUser() == null : user.getName().equals(cur.getUser())){
                    h.setDate(cur.getDate());
                    h.setUser(cur.getUser());
                    h.setMarket(cur.getMarket());
                    h.setProduct(cur.getProduct());
                    h.setAmount(cur.getAmount());
                    h.setId(cur.getId());
                    ProductList.addHistory(h);
                    }
                }
            response.sendRedirect("/LabsWeb/PrAccount.jsp?lang="+ request.getParameter("lang")+"&history=visible");
        }
        tx.commit();
        PrintWriter out = response.getWriter();
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
