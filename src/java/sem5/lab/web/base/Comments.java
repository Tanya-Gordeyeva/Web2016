
package sem5.lab.web.base;


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
@Table(name = "COMMENTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Comments.findAll", query = "SELECT h FROM Comments h"),
    @NamedQuery(name = "Comments.findByUser", query = "SELECT h FROM Comments h WHERE h.user = :user"),
    @NamedQuery(name = "Comments.findByDate_time", query = "SELECT h FROM Comments h WHERE h.date_time = :date_time"),
    @NamedQuery(name = "Comments.findByComment", query = "SELECT h FROM Comments h WHERE h.comment = :comment")})

public class Comments implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "DATE_TIME")
    private String date_time;
    @Column(name = "COMMENT")
    private String comment;
    @Column(name = "USER")
    private String user;


    public Comments() {
    }

    public Comments(String date_time, String comment, String user) {
        this.date_time = date_time;
        this.comment = comment;
        this.user = user;
    }

    public String getDate_time() {
        return this.date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }

    public String getComment() {
        return this.comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    public String getUser() {
        return this.user;
    }

    public void setUser(String user) {
        this.user = user;
    }

   
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (date_time != null ? date_time.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Comments)) {
            return false;
        }
        Comments other = (Comments) object;
        if ((this.date_time == null && other.date_time!= null) || (this.date_time!= null && !this.date_time.equals(other.date_time))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "src.Comments[ date_time=" + date_time + " ][ comment=" + comment + " ][ user=" + user + " ]";
    }
}