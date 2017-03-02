package sem5.lab.web;

import javax.servlet.http.HttpSession;

public class UserData {

    private String name;
    private String inf;
    private String log="0";

    public String getName() {
        return name;
    }

    public String getInf() {
        return inf;
    }

    public void setLog(String log) {
        this.log=log;
    }

    public String getLog() {
        return log;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setInf(String inf) {
        this.inf = inf;
    }

    public static UserData get(HttpSession session) {
        UserData user = (UserData) session.getAttribute("user");
        if (user == null) {
            user = new UserData();
            session.setAttribute("user", user);
        }

        return user;
    }
}
