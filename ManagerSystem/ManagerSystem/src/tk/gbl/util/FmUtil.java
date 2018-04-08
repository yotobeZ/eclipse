package tk.gbl.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FmUtil {

	/**
	 * 根据模版名获得一个指定的模版
	 * 
	 * @param name
	 * @return
	 */
	public Template getTemplate(String name) {
		try {
			// 获得配置对象
			Configuration config = new Configuration();

			// 设置模版的文件夹路径
			config.setClassForTemplateLoading(this.getClass(), "/freemaker");
			// 更具名字获得指定的一个模版
			Template template = config.getTemplate(name);

			return template;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据文件路径和模版名获得一个指定的模版
	 * 
	 * @param name
	 * @return
	 */
	public Template getTemplate(File file, String name) {
		try {
			// 获得配置对象
			Configuration config = new Configuration();

			// 设置模版的文件夹路径
			config.setDirectoryForTemplateLoading(file);
			// 更具名字获得指定的一个模版
			Template template = config.getTemplate(name);

			return template;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据指定的名字获得指定的模版，传入键值对即：key—value ,key对应ftl文件中$｛key｝
	 * 
	 * @param name
	 * @param root
	 */
	public void output(String name, Map<String, Object> root, OutputStream out) {
		try {

			Template template = getTemplate(name);
			// PrintWriter中接收一个输出流，所以写可以传入文件流，输出到一个文
			// 件中
			template.process(root, new PrintWriter(out));
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据指定的名字获得指定的模版，传入键值对即：key—value ,key对应ftl文件中$｛key｝
	 * 
	 * @param name
	 * @param root
	 */
	public void output(String name, Map<String, Object> root, PrintWriter pw) {
		try {

			Template template = getTemplate(name);
			// PrintWriter中接收一个输出流，所以写可以传入文件流，输出到一个文
			// 件中
			template.process(root, pw);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void output(Template template, Map<String, Object> map,
			OutputStream out) {

		try {
			template.process(map, new PrintWriter(out));
		} catch (TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
