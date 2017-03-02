package sem5.lab.web.base;
// Generated 05.11.2016 22:50:53 by Hibernate Tools 4.3.1

import java.util.Date;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "HISTORY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "History.findAll", query = "SELECT h FROM History h"),
    @NamedQuery(name = "History.findById", query = "SELECT h FROM History h WHERE h.id = :id"),
    @NamedQuery(name = "History.findByProduct", query = "SELECT h FROM History h WHERE h.product = :product"),
    @NamedQuery(name = "History.findByMarket", query = "SELECT h FROM History h WHERE h.market = :market")})

public class History implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "PRODUCT")
    private String product;
    @Column(name = "MARKET")
    private String market;
    @Column(name = "USER")
    private String user;
    @Column(name = "AMOUNT")
    private int amount;
    @Column(name = "DATE")
    private Date date;

    public History() {
    }

    public History(int id, String product, String market, String user, int amount, Date date) {
        this.id = id;
        this.product = product;
        this.market = market;
        this.user = user;
        this.amount = amount;
        this.date = date;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct() {
        return this.product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getMarket() {
        return this.market;
    }

    public void setMarket(String market) {
        this.market = market;
    }

    public String getUser() {
        return this.user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getAmount() {
        return this.amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof History)) {
            return false;
        }
        History other = (History) object;
        if ((this.id == null && other.id != null) || (this.id
                != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.History[ id=" + id + " ][ market=" + market + " ][ product=" + product + " ][ amount=" + amount + " ][ user=" + user + " ][ date=" + date + " ]";
    }
}
