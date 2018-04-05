package action;

import java.awt.event.ActionEvent;

public class LoginAction extends ActionEvent{
private String name;
private String password;
	public LoginAction(Object arg0, int arg1, String arg2) {
		super(arg0, arg1, arg2);
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
   public String execute() throws Exception{
	   if(this.name.equals("admin")&&this.password.equals("123"))
		   return "success";
	   else
		   return "error";
   }
}
