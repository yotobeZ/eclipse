package action;

import com.opensymphony.xwork2.Action;

public class LoginAction implements Action {
    private String username;
    private String password;
    
		
	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public boolean checkUser(){
		boolean temp;
		if(((username.equals("sa"))&&password.equals("123")))
			temp=true;
		else
			temp=false;
		return temp;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		boolean tORf;
		tORf = checkUser();
		if(tORf)
			return "good";
		else
			return "bad";
	}

}
