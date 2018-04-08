package action;

import com.opensymphony.xwork2.Action;

public class InsertAction implements Action {

	private String xming;
	private Integer gaoshu;
	private Integer daishu;
	private float pjun;
	
	public String getXming() {
		return xming;
	}

	public void setXming(String xming) {
		this.xming = xming;
	}

	public Integer getGaoshu() {
		return gaoshu;
	}

	public void setGaoshu(Integer gaoshu) {
		this.gaoshu = gaoshu;
	}

	public Integer getDaishu() {
		return daishu;
	}

	public void setDaishu(Integer daishu) {
		this.daishu = daishu;
	}

	public float getPjun() {
		return pjun;
	}

	public void setPjun(float pjun) {
		this.pjun = pjun;
	}

	
	public float computJunzhi(){
		float tmp;
		tmp = (gaoshu+daishu)/2;
		return tmp;
	}

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println(gaoshu);
		pjun = computJunzhi();
		System.out.println(pjun);
		return "success";
	}

}
