<%@ page import="com.fun.pojo.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.fun.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		StudentDao studentDao = new StudentDao();
		List<Student> studentList = studentDao.listStudent();
		request.setAttribute("studentList", studentList);
		int result = 0;
		String id = request.getParameter("id");
		if (id != null && !"".equals(id)) {
			result = studentDao.deleteById(Integer.parseInt(id));

			if (result == 1) {
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		}
	%>
	<table>
		<tr>
			<td>学号
			<td>
			<td>姓名
			<td>
			<td>操作
			<td>
		</tr>
		<c:forEach items="${studentList }" var="student">
			<tr>
				<td>${student.id }
				<td>
				<td>${student.name }
				<td>
				<td><input type="button" onclick="deleteById(${student.id })"
					value="删除">
				<td>
			</tr>
		</c:forEach>
	</table>

</body>
<script type="text/javascript">
function deleteById(id) {

	var studentId=id;
    window.location.href="http:////localhost:8080/HaveFun/index.jsp?id="+studentId; 
}
</script>
</html>