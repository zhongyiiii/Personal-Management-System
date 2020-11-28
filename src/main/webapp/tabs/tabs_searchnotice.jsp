<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Panel - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<style>
    .userlist{
        width: 1150px;
        height: 30px;
        background-color: #E5F0FF;
        font-size: 15px;
        padding-top: 5px;
        padding-left: 10px;
    }
    .usersearch{
        width: 1150px;
        height: 30px;
        background-color: #F5F5F5;

    }
     table{
			border-collapse: collapse;
		}
		table,th,td{
      border:1px,solid,black;
      
      border-color: skyblue;
      height: 25px;
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
    .title{
    	text-decoration: none;
    	color:blue;
    }
    .title:hover {
		color:green;
	}
</style>
<body>
<div>
    <div class="userlist">职位列表</div>
    <div class="usersearch">
        <form id="ff"  method="post" action="${pageContext.request.contextPath }/user/searchNoticeByCondition">
            <table cellpadding="5">
            	<tr>
	                <td>标题:</td>
	                <td><input  type="text" name="title"  class="input_box"/></td>
	                <td>主题:</td>
	                <td><input  type="text" name="theme"  class="input_box"/></td>
	                <td>创建者:</td>
	                <td><input  type="text" name="username"  class="input_box"/></td>
	                <td><input  type="submit" value="查询"  class="input_button"></td>
	                <td><input  type="reset" value="清空"  class="input_button"></td>
	                <td><a onclick="javascript:window.location.reload();"   class="input_button" style="margin-left:330px;">刷新</a></td>
            	</tr>
                
            </table>
        </form>
    </div>
    <div>
	
	<table border="1" style="margin-top:2px" >
          <thead>
            <th width=160px>创建者</th>
            <th width=200px>标题</th>
            <th width=260px>主题</th>
            <th width=400px>备注</th>
            <th width=180px>时间</th>
          </thead>
		
			<c:forEach items="${notices }" var="n">
	          <tr style="text-align: center;">
	            <td style="text-align:center; ">
	            	${n.username}
	            </td>
	            <td style="text-align:center;">
	            	<a href="${pageContext.request.contextPath }/user/displayNotice?id=${n.id}" class="title" >${n.title }</a>
	            </td>
	            <td style="text-align:center;" >
	            	${n.theme}
	            </td>
	            <td style="text-align:center; ">
	            	${n.remark }
	            </td>
	            <td style="text-align:center; ">
	            	<fmt:formatDate value="${n.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
	            </td>
	          </tr>
	         </c:forEach>
      </table>
    </div>
</div>
</body>
</html>