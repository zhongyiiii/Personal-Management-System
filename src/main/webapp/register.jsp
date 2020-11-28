<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <!DOCTYPE html>
        <html lang="en">
        <head>
        <meta charset="UTF-8">
        <title>注册</title>
        </head>
<style>
    .middle_area{
        width: 500px;
        border:1px solid cornflowerblue;
        height: 450px;
        margin-top:80px;
        margin-left:auto;
        margin-right: auto;
        background-color: lightblue;
        border-radius: 15px;
    }
    .div_input{
        /*border: 1px solid orange;*/
        width:440px;
        height: 30px;
        margin-top:25px;
        margin-left: auto;
        margin-right: auto;
    }
    .input{
        height: 30px;
        width:250px;
        margin-left: 10px;
        border-radius: 10px;
        border:0;
    }
    .span_input_tips{
        font-size: 10px;
    }
    .div_input_button{
        height: 30px;
        border: 1px solid lightblue;
        width: 248px;
        margin-left: 108px;
        margin-top:10px;
    }
    .jump2Login{
        margin-left: 222px;
        /* margin: 10px; */
        marign-top: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .jump2Login a{
        font-size: 10px;
        color: cornflowerblue;
        text-decoration: none;
    }
    .jump2Login a:hover{
        color: green;
    }
    .input_button{
        width: 248px;
        height: 30px;
    }
    
    .input_validateCode{
    	height: 25px;
        width:120px;
        margin-left: 108px;
        margin-top:20px;
        border-radius: 10px;
        border:0;
    }
</style>
<body>
    <form action="user/register" method="post">
        <div class="middle_area" >
            <div class="div_input">
                <label class="label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
                <input onblur="checkUserName()" id="textName" class="input" type="text" name="username" placeholder="请输入用户名" required>
                <span id="userNameStatus" class="span_input_tips">&nbsp;</span>
            </div>
            <div class="div_input">
                <label>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</label>
                <input class="input" type="text" name="phone" placeholder="请输入手机号" required/>
                <span class="span_input_tips">&nbsp;</span>
            </div>
            <div class="div_input">
                <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                <input id="textPassword" class="input" type="password" name="password" placeholder="请输入密码" required/>
                <span class="span_input_tips">&nbsp;</span>
            </div>
            <div class="div_input">
                <label>确认密码</label>
                <input id="reTextPassword" class="input" type="password"  placeholder="请重新输入密码" required onkeyup="checkPassword()"/>
                <span id="tips_checkPwd" class="span_input_tips" style="color: red">&nbsp;</span>
            </div>
			
			<div>
				<input class="input_validateCode" type="text" name="validateCode" placeholder="请输入验证码" required />
				<img class="validateCode" id="getCode"  src="user/getValidateCode" onclick="changeCode()"/>
			</div>
			
            <div class="jump2Login"><a href="login.jsp">已有账号？点击这里登录！</a></div>

            <div class="div_input_button" >
                <input id="submit" class="input_button" type="submit" value="注册" />

            </div>
            <div class="div_input_button">
                <input class="input_button" type="reset" value="重写" />
            </div>
        </div>
    </form>
</body>
<!-- <script src="resources/js/myJS.js"></script> -->
<script>
    function checkPassword() {

        var textPassword = document.getElementById("textPassword").value;
        var reTestPassword = document.getElementById("reTextPassword").value;
        var span = document.getElementById("tips_checkPwd");
        if(textPassword === "" || reTestPassword ===""){
        	span.innerHTML = "";
        }else{
        	if ( textPassword !== reTestPassword){
                span.innerHTML = "*密码不一致";
                document.getElementById("submit").disabled = true;
            }else {
                span.innerHTML ="";
                document.getElementById("submit").disabled = false;

            }
        }
    }
    
    function changeCode(){
		var img = document.getElementById("getCode");
		img.src = "user/getValidateCode?time="+new Date().getTime();
		
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
</html>
