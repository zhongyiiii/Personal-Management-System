<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.input_box{
    	width: 145px;
    	height:25px;
    	border-radius: 5px;
    	border:1px solid skyblue;
    }
    .input_button{
    	width:60px;
    	height:30px;
    	background-color: #E5F0FF;
    	border:1px solid skyblue;
    	border-radius: 5px;
    }
</style>

<body>
	<form id="form1"  action="${pageContext.request.contextPath }/user/uploadFile" method="post" enctype="multipart/form-data">
		
        <input id="username" class="input_box" type="hidden" name="uploadName" value="${user.username }"/><br/>
        <input  class="input_box" type="hidden" name="number" value="${user.number }"/><br/>
        <input id="textTitle" class="input_box" type="text" name="title" required="required" /><br/><br/>
        <input id="chooseFile" class="input_box" type="file" name="upload" required="required"/><br/><br/>
        <input onclick="submitFile()"  class="input_button" type="button" value="上传"/>
        <input class="input_button" type="reset" value="清除"/>
    </form>
</body>
<script type="text/javascript">
	function submitFile(){
		var username = document.getElementById("username").value;
		if(username===null || username==="" ){
			alert("请先登录");
			return;
		}
		
		var textTitle = document.getElementById("textTitle").value;
		var chooseFile = document.getElementById("chooseFile").value;
		
		if(textTitle==="" || chooseFile==="" ){
			alert("请输入标题和选择文件");
			return;
		}
		document.getElementById("form1").submit();
		
	}
		
	
</script>
</html>