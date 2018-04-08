package tk.gbl.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {
	
	public String getProperty(String key) {
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream("guitar.properties");
		Properties p = new Properties();
		try {
			p.load(inputStream);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		String value = p.getProperty(key);

		return value;
	}

}
