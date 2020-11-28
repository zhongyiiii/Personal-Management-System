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
        height: 500px;
        background-color: #F5F5F5;

    }
    .input_box{
    	width: 170px;
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
	<div class="userlist">添加员工</div>
	<div class="usersearch">
		<div style="padding:10px 60px 20px 60px">
		<input id="jid" type="hidden" value="${editEmployeeInfo.job_id }" >
		<input id="did" type="hidden" value="${editEmployeeInfo.dept_id }" >
		<input id="sex" type="hidden" value="${editEmployeeInfo.sex }" >
		<input id="party" type="hidden" value="${editEmployeeInfo.party }" >
		<input id="education" type="hidden" value="${editEmployeeInfo.education }" >
	    <form id="ff" method="post" action="${pageContext.request.contextPath}/user/editEmployee" >
	    	<table cellpadding="5">
	    		<tr>
	    			<td>职位:</td>
	    			<td>
	    				<select  id="select_job" class="input_box" name="job_id" style="width: 175px;" >
	    					<c:forEach items="${jobs }" var="j">
	                            <option value="${j.jid }">${j.jname }</option>
		                    </c:forEach>
                        </select>
	    			</td>
	    			<td>部门:</td>
	    			<td>
	    				<select id="select_dept" class="input_box" name="dept_id" style="width: 175px;" >
                           <c:forEach items="${depts }" var="d">
                           		<option value="${d.did }">${d.dname }</option>
                           </c:forEach>
                        </select>
	    			</td>
	    			 <td><a href="javascript:window.history.back('-1')" class="input_button" style="text-decoration: none; color:black; " >返回</a></td>
	    		</tr>
	    		<tr>
	    			<td>姓名:</td>
	    			<td><input placeholder="姓名" class="input_box" type="text" name="name"  required value="${editEmployeeInfo.name }"/></td>
	    			<td>银行卡号:</td>
	    			<td><input placeholder="银行卡号" class="input_box" type="text" name="card_id" required value="${editEmployeeInfo.card_id }" /></td>
	    		</tr>
	    		<tr>
	    			<td>家庭电话:</td>
	    			<td><input placeholder="家庭电话" class="input_box" type="text"" name="phone" required value="${editEmployeeInfo.phone }" /></td>
	    			<td>手机号码:</td>
	    			<td><input placeholder="手机号码" class="input_box" type="text" name="tel" required value="${editEmployeeInfo.tel }" /></td>
	    		</tr>
	    		<tr>
	    			<td>QQ号:</td>
	    			<td><input placeholder="QQ号" class="input_box" type="text" name="qq_num" value="${editEmployeeInfo.qq_num }" /></td>
	    			<td>QQ邮箱:</td>
	    			<td><input placeholder="QQ邮箱" class="input_box" type="text" name="email" value="${editEmployeeInfo.email }" /></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
                    <td>
	    				<select id="select_sex" class="input_box" name="sex" style="width: 175px;" >
                            <option value="男">男</option>
                            <option value="女">女</option>
                            <option value="其它">其它</option>
                            
                        </select>
	    			</td>
                    <td>政治面貌:</td>
	    			<td>
	    				<select id="select_party" class="input_box" name="party" style="width: 175px;" >
                            <option value="群众">群众</option>
                            <option value="共青团员">共青团员</option>
                            <option value="党员">党员</option>
                            
                        </select>
	    			</td>
				</tr>
				<tr>
	    			<td>生日:</td>
	    			<td><input placeholder="生日" class="input_box" type="date" name="birthday" value="${editEmployeeInfo.birthday }" /></td>
	    			<td>民族:</td>
	    			<td>
	    				<input placeholder="民族" class="input_box" type="text" name="race" value="${editEmployeeInfo.race }" />
	    			</td>
				</tr>

				<tr>
	    			<td>学历:</td>
	    			<td>
	    				<select id="select_education" class="input_box" name="education" style="width: 175px;" >
                            <option value="本科">本科</option>
                            <option value="专科">专科</option>
                            <option value="研究生">研究生</option>
                            
                        </select>
	    			</td>
	    			<td>专业:</td>
	    			<td><input placeholder="专业" class="input_box" type="text" name="speciality" value="${editEmployeeInfo.speciality }" /></td>
	    		</tr>
	    		<tr>
	    			<td>地址:</td>
					<td><input placeholder="地址" class="input_box" type="text" name="address" value="${editEmployeeInfo.address }" /></td>
					<td>邮政编码:</td>
	    			<td><input placeholder="邮政编码" class="input_box" type="text" name="post_code" value="${editEmployeeInfo.post_code }" /></td>
	    		</tr>
	    		<tr>
	                <td>备注:</td>
	                <td><textarea id="textarea_remark" onkeyup="passRemark()" class="input_box" style="height:70px; width:170px;">${editUserInfo.remark }</textarea></td>
	                <input id="input_remark"  type="hidden" name="remark" value="" />
	                <td>备注:</td>
	                <td><textarea id="textarea_hobby" onkeyup="passHobby()" class="input_box" style="height:70px; width:170px;">${editUserInfo.remark }</textarea></td>
	                <input id="input_hobby"  type="hidden" name="hobby" value="" />
	                <input   type="hidden" name="id" value="${editEmployeeInfo.id }" />
            	</tr>
	    	</table>
		    <div style="text-align:center;padding:5px">
		    	<div style="padding-top:10px"></div>
		    	<input id="submit" class="input_button" type="submit" value="添加" />&nbsp;&nbsp;&nbsp;&nbsp;
			    <input class="input_button" type="reset" value="清除" />
           		 <input onclick="refresh()" type="button" value="刷新" class="input_button" />
		    </div>
	    </form>
	   </div>
	 </div>
</body>

<script type="text/javascript">
	window.onload = function(){
		document.getElementById("select_job").value = document.getElementById("jid").value;
		document.getElementById("select_dept").value = document.getElementById("did").value;
		document.getElementById("select_sex").value = document.getElementById("sex").value;
		document.getElementById("select_education").value = document.getElementById("education").value;
		document.getElementById("select_party").value = document.getElementById("party").value;
	}
	
	function refresh(){
		window.location.reload();
	}
	
	function passRemark(){
		document.getElementById("input_remark").value = document.getElementById("textarea_remark").value;
	}
	
	function passHobby(){
		document.getElementById("input_hobby").value = document.getElementById("textarea_remark").value;
	}
	
</script>


</html>