package jdbc;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import charactor.LoginPeople;

public interface DAO {
	// ����
	public void add(LoginPeople lp);

	// �޸�
	public void update(LoginPeople lp);

	// ɾ��
	public void delete(int id);

	// ��ȡ
	public LoginPeople get(int id);

	// ��ѯ
	//public List<LoginPeople> list();

	// ��ҳ��ѯ
	//public List<LoginPeople> list(int start, int count);
}
