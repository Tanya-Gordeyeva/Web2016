package sem5.lab.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.servlet.http.HttpSession;

public class Utils {

    public static String getCurrentDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.YYYY");
        return sdf.format(new Date());
    }

    public static void addList(List list) {
        ArrayList<ProdBean> products = new ArrayList();
        ArrayList<Integer> productsId = new ArrayList();
        ArrayList<Integer> productsI = new ArrayList(list);
        for (int i = 0; i < productsI.size(); i++) {
            int k = -1;
            for (int j = 0; j < productsId.size(); j++) {
                if (Objects.equals(productsI.get(i), productsId.get(j))) {
                    k = j;
                    break;
                }
            }
            if (k == -1) {
                products.add(ProductList.getProdList().get(productsI.get(i)));
                productsId.add(productsI.get(i));
                products.get(products.size()-1).setAmount(products.get(products.size()-1).getAmount()+1);
                //ProductList.getProdList().get(productsI.get(i)).setAmount(ProductList.getProdList().get(productsI.get(i)).getAmount()+1);
            }
            else{
                products.get(k).setAmount(products.get(k).getAmount()+1);
                //ProductList.getProdList().get(productsI.get(k)).setAmount(ProductList.getProdList().get(productsI.get(k)).getAmount()+1); 
            }

        }
        BuyList.addProd(products);
    }

    public static void addEnt(String ent) {
        BuyList.addEnt(ent);
    }
    
    
    public static Integer avCost(String cost,String amount){
        return Integer.valueOf(cost)*Integer.valueOf(amount);
    }
    
    public static Integer avCostCart(ArrayList<ProdBean> prod){
        Integer sum=0;
        for (int i=0;i<prod.size();i++){
            sum+=Integer.valueOf(prod.get(i).getCost())*prod.get(i).getAmount();
        }
        return sum;
    }
}
