<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Panel - jQuery EasyUI Demo</title>
    <%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script> --%>
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
        height: 300px;
        background-color: #F5F5F5;

    }
    .input_box{
    	width: 150px;
    	height:25px;
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
    
	
	<div class="userlist">添加用户</div>
	<div class="usersearch">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff"  method="post" action="${pageContext.request.contextPath }/user/addUser">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户编号:</td>
	    			<td><input class="input_box" type="text" name="number" required/></td>
	    			<td>用户名称:</td>
	    			<td><input onblur="checkUserName()" id="textName" class="input_box" type="text" name="username" required></input>&nbsp;&nbsp;<span id="userNameStatus" style="color:red;"></span></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input id="textPassword" placeholder="请输入密码" class="input_box" type="password"" name="password" required></input></td>
	    			<td>确认密码:</td>
	    			<td><input  id="reTextPassword" onkeyup="checkPwd()" placeholder="请重新密码" class="input_box" type="password"  required></input>&nbsp;&nbsp;<span id="tips_checkPwd" style="color:red;"></span></td>
	    		</tr>
	    		<tr>
	    			<td>手机号:</td>
                    <td><input class="input_box" type="text" name="phone" required></input></td>
                    <td>角色:</td>
	    			<td>
	    				<select id="select_role" class="input_box" name="role_id" style="width: 175px;" >
							<option value='' disabled selected style='display:none;'>请选择角色</option>  
							<c:forEach items="${roles }" var="r">
                           		 <option value="${r.rid }">${r.rname }</option>
                            </c:forEach>
                        </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>备注:</td>
	    			<td><input class="input_box" type="text" name="remark" ></input></td>
	    		</tr>
	    		<tr>
	    			
	    		</tr>
	    	</table>
	    
		    <div style="text-align:center;padding:5px">
		    	<input id="submit" class="input_button" type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
		    	 <input class="input_button" type="reset" value="清除" />
		    </div>
		  </form>
	    </div>
	  </div>
<script>
	function checkPwd() {
        var textPassword = document.getElementById("textPassword").value;
        var reTextPassword = document.getElementById("reTextPassword").value;
        var span = document.getElementById("tips_checkPwd");
        if(textPassword === "" || reTextPassword ===""){
        	span.innerHTML = "";
        }else{
        	if ( textPassword !== reTextPassword){
                span.innerHTML = "*密码不一致";
                document.getElementById("submit").disabled = true; 
            }else {
                span.innerHTML ="";
                document.getElementById("submit").disabled = false;
            }
        }
    }
	
	
	
	function  checkUserName() {
        var userName = document.getElementById("textName").value;
        var xhr;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xhr = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
        xhr.onreadystatechange = function() {
            //alert(xhr.responseText);//得到响应结果
            if (xhr.readyState === 4) {//请求一切正常
                if (xhr.status === 200) {//服务器响应一切正常
                    var status = xhr.responseText;
                    var userNameStatus = document.getElementById("userNameStatus");
                    if (userName !==""){
                        if (status==="no"){
                            userNameStatus.innerHTML = "<font  color='red'>*用户名已存在</font>";
                            document.getElementById("submit").disabled = true;
                        }else {
                            userNameStatus.innerHTML = "<font  color='cornflowerblue'>*可用</font>";
                            document.getElementById("submit").disabled = false;
                        }
                    }else {
                        userNameStatus.innerHTML = "";
                        document.getElementById("submit").disabled = false;
                    }
                }
            }
        }
        xhr.open("post","${pageContext.request.contextPath }/user/checkUserName?username="+userName);
        //发送请求
        xhr.send(null);
    }
</script>
</body>
</html>