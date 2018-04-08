package tk.gbl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tk.gbl.action.TestAction;
import tk.gbl.util.ActionSupport;
import tk.gbl.util.PropertyUtil;

/**
 * Servlet Filter implementation class GuitarFilter
 */
@WebFilter("/GuitarFilter")
public class GuitarFilter implements Filter {
	String path;
	String path1;

	/**
	 * Default constructor.
	 */
	public GuitarFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 设置request编码用的字符集
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpServletRequest req = (HttpServletRequest) request;
		String reqUrl = req.getRequestURI();
		reqUrl = reqUrl.replaceAll("/[a-zA-Z]*/", "");
		System.out.println(reqUrl);
		PropertyUtil util = new PropertyUtil();
		String classPath = util.getProperty(reqUrl);

		Class<?> action = null;
		try {
			action = Class.forName(classPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ActionSupport as = null;
		try {
			as = (ActionSupport) action.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		as.setRequest((HttpServletRequest) request);
		as.setResponse((HttpServletResponse) response);
		as.setPath(path);
		System.out.println("path:"+path);
		try {
			as.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}

//		TestAction ta = new TestAction();
//		ta.setRequest((HttpServletRequest) request);
//		ta.setResponse((HttpServletResponse) response);
//		ta.execute();
		
//		System.out.println("filter");
//		HttpServletResponse res = (HttpServletResponse) response;
//		res.getWriter().println("why");
//		System.out.println("filterout");
		
		//chain.doFilter(request, response);
		
		return;
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		ServletContext servletContext = filterConfig.getServletContext();  
        path=servletContext.getRealPath("/");  
        path1=servletContext.getRealPath("/freemaker");    
        
        System.out.println(path+"\n"+path1);
	}

}
