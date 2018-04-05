<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
   <meta charset="utf-8">
</head>
<body>
  <div id="shr" align="center" style="margin-top:50">
    <div style="font-size:24"> 学生成绩信息浏览 </div>
       <table border="1">
         <tr>
           <td style="width:100px" > 姓名：</td>
           <td >
             <input type="text" name="xming" value='<s:property value="xming"/>'style="font-size:24"/>
           </td>
		 </tr>
		 <tr>
           <td  style="width:100"> 高数：</td>
           <td>
              <input type="text" name="gaoshu" value='<s:property value="gaoshu"/>'style="font-size:24"/>
           </td>
		 </tr>
		 <tr>
		   <td  style="width:100"> 线性代数：</td>
		   <td>
              <input style=" font-size:24" type="text" name="daishu" value='<s:property value="daishu"/>'/>
           </td>
		 </tr>
         <tr> 
		  <td  style="width:100" > 算数平均值：</td>
           <td>
              <input style=" font-size:24" type="text" name="pjun" value='<s:property value="pjun"/>'/>           </td>
         </tr>		 
      </table>      
 
  </div>


</body>
</html>