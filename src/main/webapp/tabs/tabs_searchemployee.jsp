<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.userlist{
        width: 1220px;
        height: 30px;
        background-color: #E5F0FF;
        font-size: 15px;
        padding-top: 5px;
        padding-left: 10px;
    }
    .usersearch{
        width: 1230px;
        height: 45px;
        background-color: #F5F5F5;
		float:left;
    }
	
	.input_box{
    	width: 120px;
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
    .div_content{
    	width:1230px;
    	height:355px;
    	background-color: #E5F0FF;
    	overflow:scroll; 
    	
    }
    table{
		border-collapse: collapse;width:2500px;
	}
	table,th,td{
      border:1px,solid,black;
      border-color: skyblue;
      height: 25px;
    }
    .div_buttom{
    	width: 1230px;
        height: 40px;
        background-color: #E5F0FF;
      /*  float: left; */
    }
    .div_img{
    	width:30px;
    	height:25px;
    	padding-left:10px;
    	float:left;
    	margin-top:9px;
    	margin-left:5px;
    	border-radius: 5px;
    }
    .div_img:hover{
    	background-color:#F5F5F5;
    }
    .img_first{
    	width:20px;
    	height:25px;
    }
    .userinfo{
    	display:none;
    }
</style>

<body>
	
	<div class="userlist">员工列表</div>
    <div class="usersearch" style="width: 1230px;">
    <form action="${pageContext.request.contextPath }/user/searchEmployeeByCondition" method="post">
    	<table cellpadding="5" >
    			<input type="hidden" name="pSize" value="${pbEmployee.pageSize }" />
    			<input type="hidden" id="id" value="${emp4search.id }" />
    			<input type="hidden" id="name"  value="${emp4search.name }" />
    			<input type="hidden" id="phone" value="${emp4search.phone }" />
    			<input type="hidden" id="deptId" value="${emp4search.dept_id }" />
    			<input type="hidden" id="jobId" value="${emp4search.job_id }" />
    			<%-- <input type="hidden" name="currPage" value="${pbUser.currentPage }" /> --%>
                <td style="float:left;">员工号:</td>
                <td style="float:left;"><input id="turn_id" class="input_box" type="text" name="id"  /></td>
                <td style="float:left;">姓名:</td>
                <td style="float:left;"><input id="turn_name" class="input_box" type="text" name="name"  /></td>
                <td style="float:left;">手机:</td>
                <td style="float:left;"><input id="turn_phone" class="input_box" type="text" name="phone" /></td>
                <td style="float:left;">部门:</td>
                <td style="float:left;">
                    <select  id="select_dept" class="input_box" name="deptId" style="width: 175px;" >
	                	<option value=""></option>
                    	<c:forEach items="${depts }" var="d">
	                		<option value="${d.did }">${d.dname }</option>
	                	</c:forEach>
                    </select>
                </td>
                <td style="float:left;">职位:</td>
                <td style="float:left;">
                    <select  id="select_job" class="input_box" name="jobId" style="width: 175px;" >
	                	<option value=""></option>
                    	<c:forEach items="${jobs }" var="j">
	                		<option value="${j.jid }">${j.jname }</option>
	                	</c:forEach>
                    </select>
                </td>
                <td style="float:left;">
                	<input type="submit" value="搜索" class="input_button"/>
                	<input type="reset" value="清除" class="input_button"/>
                </td>
            </table>
      </form>
    </div>
    <div class="div_content">
    	<table border="1" style="margin-top:2px; margin-left:5px; font-size:14px;" >
          <thead>
          	<!-- <th width=60>索引</th> -->
          	<th width=30><input id="ckAll"  type="checkbox" onclick="checkAll()"/></th>
            <th width=250>员工号</th>
            <th width=250>姓名</th>
            <th width=250>部门</th>
            <th width=250>职位</th>
            <th width=250>银行卡号</th>
            <th width=650>地址</th>
            <th width=250>家庭电话</th>
            <th width=250>手机号码</th>
            <th width=250>QQ号</th>
            <th width=80>性别</th>
            <th width=250>政治面貌</th>
            <th width=250>生日</th>
            <th width=150>民族</th>
            <th width=450>学历</th>
            <th width=450>专业</th>
            <th width=250>爱好</th>
            <th width=450>备注</th>
            <th width=250>入职时间</th>
          </thead>
			<c:forEach items="${pbEmployee.employee}" var="e" >
	          <tr style="text-align: center;">
		          	<td><input type="checkbox" name="ids" value="${e.id }"/></td>
		          	<td>${e.id }</td>
		          	<td>${e.name }</td>
		          	<td>${e.deptName }</td>
		          	<td>${e.jobName }</td>
		          	<td>${e.card_id }</td>
		          	<td>${e.address }</td>
		          	<td>${e.phone }</td>
		          	<td>${e.tel }</td>
		          	<td>${e.qq_num }</td>
		          	<td>${e.sex }</td>
		          	<td>${e.party }</td>
		          	
		          	<td><fmt:formatDate value="${e.birthday}" pattern="yyyy-MM-dd"/></td>
		          	
		          	
		          	<td>${e.race }</td>
		          	<td>${e.education }</td>
		          	<td>${e.speciality }</td>
		          	<td>${e.hobby }</td>
		          	<td>${e.remark }</td>
		          	
		          	<td><fmt:formatDate value="${e.create_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	          </tr>
        	</c:forEach>
      </table>
    </div>
    <!-- 工具栏 -->
    <div class="div_buttom">
    <input type="hidden" id="size" value="${pbEmployee.pageSize }" />
    <input type="hidden" id="total" value="${pbEmployee.totalPage}" />
    	<select id="pSize" onchange="changePageSizeOrCurrentPage()"    class="input_box"  style="width: 40px; float:left; margin-top:10px;margin-left:5px;" >
	    	<option value="5">5</option>
	    	<option value="10">10</option>
	    	<option value="20">20</option>
        </select>
        <div class="div_img"><img class="img_first" onclick="jump2FirstPage()()" src="../icons/first.png"/></div>
        <div class="div_img"><img class="img_first" onclick="upPage()" src="../icons/up.png"/></div>
        <span style="float:left;margin-top:10px;margin-left:2px;">页</span>
        
        <input id="currPage" onchange="changePageSizeOrCurrentPage()"  class="input_box" type="text" name="currentPage" value="${pbEmployee.currentPage }" style="width:30px;height:20px; margin-top:10px;margin-left:2px;float:left;" />
        
        <span style="float:left;margin-top:10px;margin-left:2px; font-size: 15px;">/${pbEmployee.totalPage }</span>
        <div class="div_img"><img class="img_first" onclick="downPage()" src="../icons/down.png"/></div>
        <div class="div_img"><img class="img_first" onclick="jump2LastPage()" src="../icons/last.png"/></div>
        <div class="div_img"><img class="img_first" onclick="editEmployee()" src="../icons/pencil.png" style="height:10px;width:15px"/></div>
        <div class="div_img"><img class="img_first" onclick="delManyUsers()" src="../icons/edit_remove.png" style="height:10px;width:15px"/></div>
        <div class="div_img"><img class="img_first" onclick="reload1()" src="../icons/reload.png" style="height:15px;width:15px"/></div>
    </div>
    
    
    
    

</div>
</body>
<script type="text/javascript">
	var id = document.getElementById("id").value;
	var name = document.getElementById("name").value;
	var phone = document.getElementById("phone").value;
	var deptId = document.getElementById("deptId").value;
	var jobId = document.getElementById("jobId").value;
	window.onload = function(){
		var size = document.getElementById("size").value;
		
		/* alert(size);
		console.log(size); */
		
		document.getElementById("pSize").value = size;
		
		document.getElementById("turn_id").value = id;
		document.getElementById("turn_name").value = name;
		document.getElementById("turn_phone").value = phone;
		document.getElementById("select_dept").value = deptId;
		document.getElementById("select_job").value = jobId;
		
	} 
	
	function changePageSizeOrCurrentPage(){
		var pSize = document.getElementById("pSize").value;
		var currPage = document.getElementById("currPage").value;
		window.location.href="${pageContext.request.contextPath}/user/searchEmployeeByCondition?pSize="+pSize+"&currPage="+currPage+"&id="+id+"&name="+name+"&phone="+phone+"&deptId="+deptId+"&jobId="+jobId;
	}
	
	function upPage(){
		var currPage = document.getElementById("currPage").value;
		if(currPage === "1"){
			alert("到头了");
			return;
		}
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchEmployeeByCondition?pSize="+pSize+"&currPage=${pbEmployee.currentPage==1?1:pbEmployee.currentPage-1}&id="+id+"&name="+name+"&phone="+phone+"&deptId="+deptId+"&jobId="+jobId;
		
	}
	
	function downPage(){
		var currPage = document.getElementById("currPage").value;
		if(currPage === "${pbEmployee.totalPage}" ){
			alert("到底了");
			return;
		}
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchEmployeeByCondition?pSize="+pSize+"&currPage=${pbEmployee.currentPage==pbEmployee.totalPage?pbEmployee.totalPage:pbEmployee.currentPage+1}&id="+id+"&name="+name+"&phone="+phone+"&deptId="+deptId+"&jobId="+jobId;
	}
	
	function reload1(){
		window.location.reload();
	}
	
	//全选/全不选
	function checkAll(){
		//得到ckAll元素，并得到它的选中状态
		var flag = document.getElementById("ckAll").checked;
		//alert(flag);
		//得到所有ids复选框元素
		var ids = document.getElementsByName("ids");
		//循环给每个复选框赋值
		for(var i =0; i<ids.length;i++){
			ids[i].checked = flag;//把ckAll元素的状态赋值给每一个ids[i]的元素
		} 
		
	}
	
	function delManyUsers(){
		//得到所有复选框元素
		var ids = document.getElementsByName("ids");
		var count=0;
		var str="";
		//循环得到选中的复选框的id
		for(var i=0;i<ids.length;i++){
			if(ids[i].checked){
				str+="ids="+ids[i].value+"&";
				count = count +1;
			}
		}
		if(str!==""){
			if(confirm("确认删除这"+count+"项吗？")){
				str = str.substring(0, str.length-1); //ids=1001&ids=1002&ids=1003
				//alert(str);
				location.href="${pageContext.request.contextPath }/user/delManyEmployees?"+str; 
			}
		}else{
			alert("请选择要删除的项目");
		}
	}
	
	function jump2FirstPage(){
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchEmployeeByCondition?pSize="+pSize+"&currPage=1&id="+id+"&name="+name+"&phone="+phone+"&deptId="+deptId+"&jobId="+jobId;
	}
	
	function jump2LastPage(){
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchEmployeeByCondition?pSize="+pSize+"&currPage=${pbEmployee.totalPage}&id="+id+"&name="+name+"&phone="+phone+"&deptId="+deptId+"&jobId="+jobId;
	}
	
	function editEmployee(){
		
		//得到所有复选框元素
		var ids = document.getElementsByName("ids");
		var str="";
		//循环得到选中的复选框的id
		for(var i=0;i<ids.length;i++){
			if(ids[i].checked){
				str+="ids="+ids[i].value+"&";
			}
		}
		if(str!==""){
				str = str.substring(0, str.length-1); //ids=1001&ids=1002&ids=1003
				//alert(str);
				location.href="${pageContext.request.contextPath }/user/returnEmployeeInfo?"+str; 
		}else{
			alert("请选择要编辑的项目");
		}
	}
</script>

</html>