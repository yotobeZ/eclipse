<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
   <meta charset="utf-8">
</head>
<body>
  <div id="shr" align="center" style="margin-top:50">
    <div style="font-size:24"> 请录入学生成绩信息 </div>
    <form id="myform" action="insertAction" method="post" >
      <table border="1">
         <tr>
           <td style="width:100px" > 姓名：</td>
           <td >
             <input type="text" name="xming" style="font-size:24"/>
           </td>
		 </tr>
		 <tr>
           <td  style="width:100"> 高数：</td>
           <td>
              <input type="text" name="gaoshu" style="font-size:24"/>
           </td>
		 </tr>
		 <tr>
		   <td  style="width:100"> 线性代数：</td>
		   <td>
              <input style=" font-size:24" type="text" name="daishu" />
           </td>
		 </tr>
      </table>
      <p/>
      <table>
        <tr>
          <td> <input type="submit" name="add" value="成绩提交"> </td>
		  <td> <input type="reset" name="reset" value="重置" style="width:100"> </td>
        </tr>
      </table>
    </form>
 
  </div>


</body>
</html>