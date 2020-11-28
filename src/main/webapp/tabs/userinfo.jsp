<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<div id="userinfo" class="userinfo" >
    <form id="ff" method="post" action="${pageContext.request.contextPath }/user/editUserInfo" >
    <%-- <input  type="hidden" id="role_id" value="${editUserInfo.role_id }" /> --%>
        <table cellpadding="5">
            <tr>
                <td>用户编号:</td>
                <td><input class="input_box"  type="text" name="number" value="${editUserInfo.number }" readonly="readonly" /></td>
                <td><a href="javascript:window.history.back('-1')" class="input_button" style="text-decoration: none; color:black; " >返回</a></td>
            </tr>
            <tr>
                <td>用户名称:</td>
                <td><input class="input_box"   type="text" name="username" value="${editUserInfo.username }"/></td>
            </tr>
            <tr>
                <td>手机号码:</td>
                <td><input class="input_box"   type="text" name="phone" value="${editUserInfo.phone }" /></td>
            </tr>
            <tr>
                <td>角色名:</td>
                <td>
                	<select id="select_role"  name="role_id"   id="select_job" class="input_box"  style="width: 150px; float:left; margin-top:10px;" >
				    	<c:forEach items="${roles }" var="r">
	                		<option value="${r.rid }">${r.rname }</option>
	                	</c:forEach>
			        </select>
                </td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input class="input_box"   type="password" name="password" value="${editUserInfo.password }" /></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><textarea id="textarea_remark" onkeyup="passRemark()" class="input_box" style="height:80px; width:200px;">${editUserInfo.remark }</textarea></td>
                <td><input id="input_remark" class="input_box"   style="height:80px; text-align: left;"  type="hidden" name="remark" value="" /></td>
            </tr>
        </table>
        <div style="margin:20px 0;"></div>
        <div >
            <input type="submit" value="修改" class="input_button" />
            <input type="reset" value="清除" class="input_button" />
            <input onclick="refresh()" type="button" value="刷新" class="input_button" />
            
        </div>
    </form>
</body>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById("select_role").value = "${editUserInfo.role_id}";
	}
	function passRemark(){
		document.getElementById("input_remark").value = document.getElementById("textarea_remark").value;
	}
	
	function refresh(){
		window.location.reload();
	}
	
	function rzllback(){
		window.history.back('-1');
	}
</script>
</html>