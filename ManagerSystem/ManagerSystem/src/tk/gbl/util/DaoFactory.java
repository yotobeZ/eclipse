package tk.gbl.util;

import java.lang.reflect.Constructor;



/**
 * 工具类 dao工厂 返回dao
 * 
 * @author d
 * 
 */
public class DaoFactory {
	private DaoFactory() {

	}

	
	
	
	public static Object getDao(Class<?> cls) {
		Constructor<?> con;
		Object first = null;
		try {
			con = cls.getDeclaredConstructor();
			con.setAccessible(true);
			first = con.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return first;
	}
}
