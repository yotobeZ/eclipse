package tk.gbl.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import tk.gbl.util.ActionSupport;
import tk.gbl.util.FmUtil;
import freemarker.template.Template;

public class TestAction extends ActionSupport{
	
	public void execute() throws IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", "testaction");
		
		FmUtil util = new FmUtil();
		Template template = util.getTemplate(new File(path+"freemaker"),"01.ftl");
		util.output(template, map ,response.getOutputStream());
		
		
	}

}
