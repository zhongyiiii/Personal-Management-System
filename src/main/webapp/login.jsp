<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<style>
    .middle_area_login{
        width: 500px;
        border:1px solid cornflowerblue;
        height: 340px;
        margin-top:80px;
        margin-left:auto;
        margin-right: auto;
        background-color: papayawhip;
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
    .jump2Register{
        margin-left: 222px;
        /* margin: 10px; */
        marign-top: 10px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .jump2Register a{
        font-size: 10px;
        color: cornflowerblue;
        text-decoration: none;
    }
    .jump2Register a:hover{
        color: green;
    }
    .input_button{
        width: 248px;
        height: 30px;
    }
    .loginError{
       /* border: 1px solid red;*/
        height: 20px;
        width: 120px;
        margin-top: 20px;
        margin-left: 175px;
    }
    .div_checkBox{
        margin-left: 105px;
        margin-top: -30px;
    }
    .input_validateCode{
    	height: 25px;
        width:120px;
        margin-left: 108px;
        margin-top:10px;
        border-radius: 10px;
        border:0;
    }
    .validateCode{
    	margin-top:10px;
    	margin-left:10px;
    }
    
</style>
<body>
    <form action="user/login" method="post">
        <div class="middle_area_login">
            <div class="div_input">
                <label class="label" style="margin-left:-20px;">用户名|账号</label>
                <input class="input" type="text" name="number" placeholder="请输入用户名或账号" required>
                <span class="span_input_tips">&nbsp;</span>
            </div>
            <div class="div_input">
                <label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                <input id="textPassword" class="input" type="password" name="password" placeholder="请输入密码" required/>
                <span class="span_input_tips">&nbsp;</span>
            </div>
			<div>
				<input class="input_validateCode" type="text" name="validateCode" placeholder="请输入验证码" required />
				<img class="validateCode" id="getCode"  src="user/getValidateCode" onclick="changeCode()"/>
			</div>
            <div class="jump2Register"><a href="${pageContext.request.contextPath }/register.jsp">没有账号？点击这里注册！</a></div>

            <div class="div_checkBox"><input type="checkbox" name="autoLogin"/><span style="color:cornflowerblue; font-size: 10px;">7日内免登录</span></div>

            <div class="div_input_button" >
                <input id="submit" class="input_button" type="submit" value="登录"  />

            </div>
            <div class="div_input_button">
                <input class="input_button" type="reset" value="重写" />
            </div>
            <div class="loginError"><span id="loginError" style="font-size: 10px; color: red">${param.validateCodeError }${param.numberOrPasswordError }</span></div>
        </div>
    </form>
</body>
<script type="text/javascript">
	function changeCode(){
		var img = document.getElementById("getCode");
		img.src = "user/getValidateCode?time="+new Date().getTime();
		
	}
</script>

</html>
