<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
Student stu=new Student();
String sname=request.getParameter("sname");
stu.setSname(sname);
Integer sage=Integer.parseInt(request.getParameter("sage"));
stu.setSage(sage);

new stuDAO().add(stu);
int total = new stuDAO().getTotal();
List<Student> stus = new stuDAO().list(0,total);
System.out.println(stus.toString());
out.print(stu);
System.out.println("ccc");

%>