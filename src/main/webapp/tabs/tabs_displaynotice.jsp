<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content{
		width:800px;
		min-height:600px;
		background-color:#FFFFFF;
		margin:auto;
		
	}
	.input_box{
    	width: 150px;
    	height:20px;
    	border-radius: 5px;
    }
    .input_button{
    	width:60px;
    	heigth:20px;
    	background-color: #F5F5F5;
    	border-radius:5px;
    }
    .div_title{
    	margin:auto;
    	height:30px;
    	width:720px;
    	text-align: center;
    	font-size:18px;
    }
    .div_author{
    	margin:auto;
    	height:20px;
    	width:720px;
    	text-align: center;
    	font-size:12px;
    }
    .div_content{
    	width:720px;
    	min-height:500px;
    	margin:auto;
    }
</style>
<body style="background-color: #E5F0FF;">
	<div class="content">
		<div style="height:10px;"></div>
		<a onclick="javascript:window.history.back('-1');"   class="input_button" style="width:40px;padding-left:10px; float:right; margin-right:40px;">返回</a>
		<a onclick="javascript:window.location.reload();"   class="input_button" style="width:40px;padding-left:10px; float:right; margin-right:15px;">刷新</a>
		<span style="float:right; margin-right:20px;" ><fmt:formatDate value="${notice.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
		<div style="height:50px;"></div>
		<div class="div_title"><span>${notice.title }</span></div>
		<div style="height:10px;"></div>
		<div class="div_author"><span>${notice.username }</span></div>
		
		<div style="height:20px;"></div>
		<div class="div_content">
			${notice.content }
		</div>
	</div>
</body>
</html>