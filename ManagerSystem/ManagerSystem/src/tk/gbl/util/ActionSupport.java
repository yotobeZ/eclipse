package tk.gbl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionSupport {
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected String path;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void execute() throws Exception{
		
	}

	public void setPath(String path) {
		this.path = path;
	}
}
