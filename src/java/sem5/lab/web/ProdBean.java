package sem5.lab.web;

import java.io.Serializable;

public class ProdBean implements Serializable {

    private String type;
    private String name;
    private String description;
    private String image;
    private String cost;
    private int amount;
    private int id;
    private static int counter = 0;

    public ProdBean() {
        this.type = null;
        this.description = null;
        this.image = null;
        this.cost = null;
        this.id = counter;
        counter++;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public void setCost(String cost) {
        this.cost = cost;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId() {
        this.id = counter++;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static void setCounter(int counter) {
        ProdBean.counter = counter;
    }

    public int getCounter() {
        return this.counter;
    }

    public String getType() {
        return this.type;
    }

    public String getDescription() {
        return this.description;
    }

    public String getImage() {
        return this.image;
    }

    public String getCost() {
        return this.cost;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public int getAmount() {
        return this.amount;
    }
}
