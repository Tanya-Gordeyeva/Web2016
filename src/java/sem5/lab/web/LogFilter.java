package sem5.lab.web;


import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {

    private ServletContext conteхt;

    public LogFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chаin) throws IOException,
            ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        String ip = httpReq.getRemoteAddr();
        String uri = httpReq.getRequestURI();
        conteхt.log("ip: " + ip + ", uri: " + uri);
        chаin.doFilter(request, response);
    }

    public void init(FilterConfig сonfig) throws ServletException {
        conteхt= сonfig.getServletContext();
    }
}
