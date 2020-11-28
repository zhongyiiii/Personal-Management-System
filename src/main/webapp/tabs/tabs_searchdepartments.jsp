<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Panel - jQuery EasyUI Demo</title>
</head>
<style>
    .userlist{
        width: 940px;
        height: 30px;
        background-color: #E5F0FF;
        font-size: 15px;
        padding-top: 5px;
        padding-left: 10px;
    }
    .usersearch{
        width: 950px;
        height: 45px;
        background-color: #F5F5F5;

    }
     table{
			border-collapse: collapse;
		}
		table,th,td{
      border:1px,solid,black;
      
      border-color: skyblue;
      height: 40px;
    }
    .input_box{
    	width: 150px;
    	height:20px;
    	border-radius: 5px;
    	border:1px solid skyblue;
    }
    .input_button{
    	width:60px;
    	heigth:20px;
    	background-color: #E5F0FF;
    	border:1px solid skyblue;
    }
</style>
<body>
<div>
    <div class="userlist">部门列表</div>
    <div class="usersearch">
        <form id="ff"  method="post" action="${pageContext.request.contextPath }/user/findAllDepartments">
            <table cellpadding="5">
            	<tr>
	                <td>部门号:</td>
	                <td><input  type="text" name="did" class="input_box"  /></td>
	                <td>部门名:</td>
	                <td><input  type="text" name="dname" class="input_box" /></td>
	                <td><input class="input_button" type="submit" value="查询" /></td>
            	</tr>
                
            </table>
        </form>
    </div>
    <div>
    <%-- <iframe scrolling="auto" frameborder="0" src="${pageContext.request.contextPath }/pages/department.jsp" style="width:100%;height:100%;"></iframe> --%>
        <%-- <table id="dg" class="easyui-datagrid"  style="width:700px;height:250px"
			data-options="rownumbers:false,singleSelect:false,url:'datagrid_data1.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true" ></th>
                <th data-options="field:'itemid',width:150">部门号</th>
                <th data-options="field:'productid',width:150">部门名</th>
                <th data-options="field:'listprice',width:150,align:'left'">备注</th>
			</tr>
        </thead>
        <c:forEach items="${depts }" var="d">
	        <tr>
	            <td></td>
	            <td>${d.did }</td>
	            <td>${d.dname }</td>
	            <td>${d.dremark }</td>
	        </tr>
        </c:forEach>
	</table> --%>
	
	<table border="1" style="margin-top:2px" >
          <thead>
            <th width=200px>部门号</th>
            <th width=260px>部门名</th>
            <th width=480px>备注</th>
          </thead>

       <c:forEach items="${departments}" var="d">
          <tr style="text-align: center;">
            <td style="text-align:center; width:80px;">${d.did }</td>
            <td style="text-align:center; width:180px;">
            	${d.dname }
            </td>
            <td style="text-align:center; width:180px;">
            	${d.dremark }
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
</div>
</body>
<script type="text/javascript">

	function submitForm(){
			$('#ff').form('submit');
	}
</script>

</html>