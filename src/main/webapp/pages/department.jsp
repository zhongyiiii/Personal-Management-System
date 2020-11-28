<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table{
		border-collapse: collapse;
	}
	table,th,td{
	border:1px,solid,black;
	
	border-color: skyblue;
	height: 40px;
	}
</style>
<body>
	<div>
		<table border="1"  >
	          <thead>
	            <th style="width: 80px;">部门号</th>
	            <th>部门名</th>
	            <th>备注</th>
	          </thead>

	        <c:forEach items="${depts }" var="b">
	          <tr style="text-align: center;">
	            <td>${b.did }</td>
	            <td style="text-align:center; width:180px;">
	            	${b.dname }
	            </td>
	            <td style="text-align:center; width:180px;">
	            	${b.dremark }
	            </td>
	            
	          </tr>
	        </c:forEach>
    	</table>
	</div>
</body>
</html>