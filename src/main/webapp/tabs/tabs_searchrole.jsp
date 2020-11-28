<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>角色查询</title>
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
    <div class="userlist">角色列表</div>
    <div class="usersearch">
        <form id="ff"  method="post" action="${pageContext.request.contextPath }/user/findAllRoles">
            <table cellpadding="5">
            	<tr>
	                <td>角色号:</td>
	                <td><input  type="text" name="rid"  class="input_box"/></td>
	                <td>角色名:</td>
	                <td><input  type="text" name="rname"  class="input_box"/></td>
	                <td><input type="submit" value="查询" class="input_button" /></td>
            	</tr>
                
            </table>
        </form>
    </div>
    <div>
	
	<table border="1" style="margin-top:2px" >
          <thead>
            <th width=200px>部门号</th>
            <th width=260px>部门名</th>
            <th width=480px>备注</th>
          </thead>

       <c:forEach items="${roles}" var="r">
          <tr style="text-align: center;">
            <td style="text-align:center;" >${r.rid }</td>
            <td style="text-align:center;">
            	${r.rname }
            </td>
            <td style="text-align:center;">
            	${r.rremark }
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