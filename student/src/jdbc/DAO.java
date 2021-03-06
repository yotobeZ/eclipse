package jdbc;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import charactor.LoginPeople;

public interface DAO {
	// 增加
	public void add(LoginPeople lp);

	// 修改
	public void update(LoginPeople lp);

	// 删除
	public void delete(int id);

	// 获取
	public LoginPeople get(int id);

	// 查询
	//public List<LoginPeople> list();

	// 分页查询
	//public List<LoginPeople> list(int start, int count);
}
