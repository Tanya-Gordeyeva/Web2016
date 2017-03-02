package sem5.lab.web;

import java.io.*;
import java.util.ArrayList;
import sem5.lab.web.base.History;

public class ProductList {

    private static ArrayList<ProdBean> ProductsList = new ArrayList();
    private static ArrayList<History> HistoryList = new ArrayList();

    public static void addItem(ProdBean prodBean) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream ous = null;
        try {
            ous = new ObjectOutputStream(baos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ous.writeObject(prodBean);
            ous.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(bais);
        } catch (IOException e) {
            e.printStackTrace();
        }
        ProdBean cloneBean = null;
        try {
            cloneBean = (ProdBean) ois.readObject();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        ProductsList.add(cloneBean);
    }

    public static ArrayList<ProdBean> getProdList() {
        return ProductsList;
    }
    public ArrayList<History> getHistoryList() {
        return HistoryList;
    }
    public static void clear() {
        ProductsList.clear();
        ProdBean.setCounter(0);
    }
    
    public static void clearHistory() {
        HistoryList.clear();
    }
    public static void addHistory(History history) {
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream ous = null;
        try {
            ous = new ObjectOutputStream(baos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ous.writeObject(history);
            ous.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        ByteArrayInputStream bais = new ByteArrayInputStream(baos.toByteArray());
        ObjectInputStream ois = null;
        try {
            ois = new ObjectInputStream(bais);
        } catch (IOException e) {
            e.printStackTrace();
        }
        History cloneBean = null;
        try {
            cloneBean = (History) ois.readObject();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        HistoryList.add(cloneBean);
    }
    
}
