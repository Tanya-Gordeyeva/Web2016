package sem5.lab.web;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class BuyList {

    private List<Integer> ids = new ArrayList<Integer>();
    private static ArrayList<ProdBean> prod = new ArrayList<ProdBean>();
    private static String ent;

    public synchronized void addItem(int id) {
        ids.add(id);
    }

    public static void addProd(ArrayList<ProdBean> prod1) {
        prod.clear();
        prod.addAll(prod1);
    }

    public List<Integer> getIds() {
        return new ArrayList<Integer>(ids);
    }

    public ArrayList<ProdBean> getProd() {
        return new ArrayList<ProdBean>(prod);
    }

    public String getEnt() {
        return BuyList.ent;
    }

    public static void addEnt(String ent) {
        BuyList.ent = ent;
    }

    public  void clear() {
        ids.clear();
        prod.clear();
    }

    public static BuyList get(HttpSession session) {
        BuyList cart = (BuyList) session.getAttribute("cart");
        if (cart == null) {
            cart = new BuyList();
            session.setAttribute("cart", cart);
        }

        return cart;
    }

}
