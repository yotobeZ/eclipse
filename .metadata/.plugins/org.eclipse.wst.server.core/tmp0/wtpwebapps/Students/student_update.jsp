<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.sql.*,java.sql.Connection,jdbc.*,charactor.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
System.out.println("woshiupdate");
int id = Integer.parseInt(request.getParameter("id"));
 
Student student=new stuDAO().get(id);
//System.out.println(student);
request.setAttribute("student",student);
System.out.println(student.ssex+"!");
%>

<html>
<head>

<meta charset="utf-8">
</head>
<body>
	<div id="shr" align="center" style="margin-top: 50">
	
		<div style="font-size: 24">输入学生信息</div>
		<form id="myform" action="update.jsp" method="post">
		
			<table border="1">
				
				<tr>
					<td style="width: 100px">姓名：</td>
					<td><input type="text" name="xming" style="font-size: 24" value="<%=student.getSname() %>"/></td>
				</tr>
				<tr>
					<td style="width: 100px">年龄：</td>
					<td><input type="text" name="nling" style="font-size: 24" value="<%=student.getSage() %>"/>
					</td>
				</tr>
				<tr>
					<td style="width: 100">性别：</td>
	<td>
					 <input style="font-size: 24"  type="radio" value="男" name="sex"/><label>男</label>
                     <input style="font-size: 24"  type="radio" value="女" name="sex"/><label>女</label>
                  </td>  
	<input type="hidden" name="mysex" id="mysex" value="<%=student.getSsex() %>">	
	<!-- <c items="${student}" var="student" varStatus="status"></c>			-->	
  <script>

    /*本函数传递两个参数，xinfang.sex是要获取元素的名称，${xinfang.sex}是后台所获取的数据*/

 // 
    
    var mysex=document.getElementById("mysex");
    var asex=mysex.value;
  //  document.write(asex);
    sex('sex',asex);
    function sex(rName,rValue){
  	 // document.write(rName);
      /*通过传递的元素名获取元素对象*/

      var rObj = document.getElementsByName(rName);

      /*获取到的对象是数组对象，逐一进行遍历，寻找值等于所获取数据值的子对象*/
      for(var i = 0;i < rObj.length;i++){
           if(rObj[i].value == rValue){

               /*寻找到子对象后，对他进行如下操作就可以实现后台数据显示到单选钮中*/

               rObj[i].checked =  'checked';
       }
    }
  }


      
</script> 


				</tr>

				<tr>
					<td style="width: 100">爱好：</td>
					<td><input style="font-size: 24" type="checkbox" value="吃零食" name="aih" />吃零食
						<input style="font-size: 24" type="checkbox" value="写代码" name="aih" />写代码 <input
						style="font-size: 24" type="checkbox" value="看书" name="aih" />看书 <input
						style="font-size: 24" type="checkbox" value="书法" name="aih" />书法</td>
				</tr>
 <script>
//alert("111");
var hbdata = new Array();
<%
String hobby = student.getShobby() ;
if(hobby!=null){
String[] a = hobby.split("，"); 
List list = java.util.Arrays.asList(a);

if(list!=null){
for(int j=0;j<list.size();j++)
{%>
 //   alert("111");
    hbdata[<%=j%>] = '<%=list.get(j)%>';
 
<%}
}}%>
for(var hbd=0;hbdata[hbd]!=null;hbd++){
	//document.write(hbdata[hbd]);
	//document.write("---------------");
hobby('aih',hbdata[hbd]);
function hobby(rName,rValue){
	 // document.write(rName);
   /*通过传递的元素名获取元素对象*/
   var rObj = document.getElementsByName(rName);
   /*获取到的对象是数组对象，逐一进行遍历，寻找值等于所获取数据值的子对象*/
   for(var i = 0;i < rObj.length;i++){
        if(rObj[i].value == rValue){
            /*寻找到子对象后，对他进行如下操作就可以实现后台数据显示到单选钮中*/
            rObj[i].checked =  'checked';
    }
 }
}
}
</script>

<%!String myschool;  %>
<%
int total = new schDAO().getTotal();
System.out.print(total+"**********");
List<Sschool> schools = new schDAO().list(0,total);


request.setAttribute("schools", schools);
myschool=student.sschool; 
System.out.println(myschool);
 %>

	</div>	
		<script>
		 function smajorShow(v){
		  alert("学院"+v);

	document.getElementById("mma").value=v;

		  
		 
		<%
		 String st=request.getParameter("mma");
		   //out.print(st);
		//String var = request.getParameter("v");
		System.out.println(st+"456456");
		%>  
	  }
	</script>
<input type="hidden" name="mma" value=""/>
			<tr>
					<td style="width: 100">学院：</td>
					<td><select id="xyuan"  name="xyuan" onchange="smajorShow(this.options[this.options.selectedIndex].value)" style="font-size: 24">
		
							<c:forEach items="${schools}" var="school" varStatus="status">
							
							<c:if test="${school.scname==student.sschool}">
							<option   value="${school.scname}" selected> ${school.scname}</option>
						</c:if>		
							
		                 </c:forEach>
		                 <c:forEach items="${schools}" var="school" varStatus="status">
							
							<c:if test="${school.scname!=student.sschool}">
							<option value="${school.scname}" > ${school.scname}</option>
						</c:if>		
				
		                 </c:forEach>
					</select></td>

				</tr>
	 <script>
	  function sel2Show(){
		  alert("学院2");
	    var sel1 = document.getElementById("sel1");
		var index =  sel1.selectedIndex;
		var sel1Value = sel1.options[index].value;
		var sel2 = document.getElementById("sel2");
		//alert(sel1Value);
		if(sel1Value=="安徽"){
		    sel2.options.length=0;
			sel2.options.add(new Option("------------","------------"));
			sel2.options.add(new Option("合肥","合肥"));
			sel2.options.add(new Option("芜湖","芜湖"));
		}
		else{
		    sel2.options.length=0;
			sel2.options.add(new Option("------------","------------"));
			sel2.options.add(new Option("南京","南京"));
			sel2.options.add(new Option("无锡","无锡"));
		}
	  }
	</script>

	  <select id="sel1" onchange="sel2Show()">
	    <option>------------</option>
		<option> 安徽 </option>
		<option> 江苏 </option>
	  </select>
	  <select id="sel2">
	    <option>------------</option>		
	  </select>
	
<%
//int total = new schDAO().getTotal();
System.out.println(myschool+"222");
List<Smajor> mymajors = new schDAO().getMajor(myschool);

//String mymajor=student.smajor; 

request.setAttribute("mymajors", mymajors);
System.out.println(mymajors+"999999");
//System.out.println(mymajor);
 %>			

<tr>
				
					<td style="width: 100">专业：</td>
					<td><select id="zhye"  name="zhye" style="font-size: 24">
						<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
							<c:if test="${ssmajor.mname==student.smajor}">
							<option value="${ssmajor.mname}" selected>${ssmajor.mname}</option>
						</c:if>					
		                 </c:forEach>
						<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
							<c:if test="${ssmajor.mname!=student.smajor}">
							<option value="${ssmajor.mname}" >${ssmajor.mname}</option>
						</c:if>					
		                 </c:forEach>	
		                 <!-- 当学院等于换了的学院，专业也要对应改变
		                 	<c:forEach items="${mymajors}" var="ssmajor" varStatus="status">
							<c:if test="${ssmajor.mname==student.smajor}">
							<option value="${ssmajor.mname}" >${ssmajor.mname}</option>
						</c:if>					
		                 </c:forEach>	 -->
					</select></td>
				</tr>
		
			</table>
			<p />
<input type="hidden" name="id" value="<%=student.getId() %>">
			<table>
				<tr>
					<td><input type="submit" name="add" value="确认修改" ></td>
					<td><input type="reset" name="cancel" value="取消" onclick="javascrtpt:window.location.href='student_allroot.jsp'"
						style="width: 100"></td>
				</tr>
			</table>
		</form>

	</div>
<script type="text/javascript" LANGUAGE="JavaScript">
function add() {
	var studentId=id;
	window.location.href="student_delete.jsp?id="+studentId; 

} 

</script>
<% 	
//update database first
//response.sendRedirect("student_infor.jsp");%>
</body>
</html>