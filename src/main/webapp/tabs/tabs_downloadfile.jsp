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
        width: 990px;
        height: 30px;
        background-color: #E5F0FF;
        font-size: 15px;
        padding-top: 5px;
        padding-left: 10px;
    }
    .usersearch{
        width: 1000px;
        height: 45px;
        background-color: #F5F5F5;

    }
	
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
    .div_content{
    	width:1000px;
    	height:360px;
    	background-color: #E5F0FF;
    	overflow:scroll; 
    }
    table{
		border-collapse: collapse;
	}
	table,th,td{
      border:1px,solid,black;
      border-color: skyblue;
      height: 25px;
    }
    .div_buttom{
    	width: 1000px;
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
	
	<div class="userlist">用户列表</div>
    <div class="usersearch">
    <form action="${pageContext.request.contextPath }/user/searchFileByCondition" method="post">
    	<table cellpadding="5">
    			<input type="hidden" name="pSize" value="${pbFile.pageSize }" />
    			<input type="hidden" name="currPage" value="${pbFile.currentPage }" />
    			<input type="hidden" id="uploadName" value="${pbFile.uploadName }" />
    			<input type="hidden" id="fromIndexDatetime"  value="${pbFile.fromIndexDatetime }" />
    			<input type="hidden" id="toIndexDatetime" value="${pbFile.toIndexDatetime }" />
    			<%-- <input type="hidden" name="currPage" value="${pbUser.currentPage }" /> --%>
                <td>上传人:</td>
                <td><input id="turn_uploadName" class="input_box"  type="text" name="uploadName"  /></td>
                <td>上传时间:</td>
                <td><input id="turn_fromIndexDatetime" class="input_box" style="width:200px;" type="datetime-local" name="fromIndexDatetime" value="2020-07-19T13:40"/></td>
                <td>至</td>
                <td><input id="turn_toIndexDatetime" class="input_box" style="width:200px;" type="datetime-local" name="toIndexDatetime" /></td>
                
                <td>
                	<input type="submit" value="搜索" class="input_button"/>
                	<input onclick="clearAll()" type="button" value="清除" class="input_button"/>
                </td>
            </table>
      </form>
    </div>
    <div class="div_content">
    	<table border="1" style="margin-top:2px; margin-left:5px" >
          <thead>
          	<!-- <th width=60>索引</th> -->
          	<th width=30><input id="ckAll"  type="checkbox" onclick="checkAll()"/></th>
            <th width=130px>文件编号</th>
            <th width=160px>上传人</th>
            <th width=230px>文件名</th>
            <th width=280px>标题</th>
            <th width=200px>上传时间</th>
          </thead>
			<c:forEach items="${pbFile.uploadfiles}" var="u" >
	          <tr style="text-align: center;">
		          	<td><input type="checkbox" name="numbers" value="${u.id }"/></td>
		          	<td>${u.id }</td>
		          	<td>${u.uploadName }</td>
		          	<td>${u.fileName }</td>
		          	<td>${u.title }</td>
		          	<td><fmt:formatDate value="${u.uploadDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	          </tr>
        	</c:forEach>
      </table>
    </div>
    <!-- 工具栏 -->
    <div class="div_buttom">
    <input type="hidden" id="size" value="${pbFile.pageSize }" />
    <input type="hidden" id="total" value="${pbFile.totalPage}" />
    	<select id="pSize" onchange="changePageSizeOrCurrentPage()"   id="select_job" class="input_box"  style="width: 40px; float:left; margin-top:10px;margin-left:5px;" >
	    	<option value="5">5</option>
	    	<option value="10">10</option>
	    	<option value="20">20</option>
        </select>
        <div class="div_img"><img class="img_first" onclick="jump2FirstPage()()" src="../icons/first.png"/></div>
        <div class="div_img"><img class="img_first" onclick="upPage()" src="../icons/up.png"/></div>
        <span style="float:left;margin-top:10px;margin-left:2px;">页</span>
        
        <input id="currPage" onchange="changePageSizeOrCurrentPage()"  class="input_box" type="text" name="currentPage" value="${pbFile.currentPage }" style="width:30px;height:20px; margin-top:10px;margin-left:2px;float:left;" />
        
        <span style="float:left;margin-top:10px;margin-left:2px; font-size: 15px;">/${pbFile.totalPage }</span>
        <div class="div_img"><img class="img_first" onclick="downPage()" src="../icons/down.png"/></div>
        <div class="div_img"><img class="img_first" onclick="jump2LastPage()" src="../icons/last.png"/></div>
        <div class="div_img"><img class="img_first" onclick="editUser()" src="../icons/pencil.png" style="height:10px;width:15px"/></div>
        <div class="div_img"><img class="img_first" onclick="delManyUsers()" src="../icons/edit_remove.png" style="height:10px;width:15px"/></div>
        <div class="div_img"><img class="img_first" onclick="reload1()" src="../icons/reload.png" style="height:15px;width:15px"/></div>
    </div>
    
    
    
    

</div>
</body>
<script type="text/javascript">
	var uploadName = document.getElementById("uploadName").value;
	var fromIndexDatetime = document.getElementById("fromIndexDatetime").value;
	var toIndexDatetime = document.getElementById("toIndexDatetime").value;
	window.onload = function(){
		var size = document.getElementById("size").value;
		
		/* console.log(size); */
		document.getElementById("pSize").value = size;
		document.getElementById("turn_uploadName").value = uploadName;
		document.getElementById("turn_fromIndexDatetime").value = fromIndexDatetime;
		document.getElementById("turn_toIndexDatetime").value = toIndexDatetime;
		
		
	} 
	
	function changePageSizeOrCurrentPage(){
		var pSize = document.getElementById("pSize").value;
		var currPage = document.getElementById("currPage").value;
		window.location.href="${pageContext.request.contextPath}/user/searchFileByCondition?pSize="+pSize+"&currPage="+currPage+"&uploadName="+uploadName+"&fromIndexDatetime="+fromIndexDatetime+"&toIndexDatetime="+toIndexDatetime;
	}
	
	function upPage(){
		var currPage = document.getElementById("currPage").value;
		if(currPage === "1"){
			alert("到头了");
			return;
		}
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchFileByCondition?pSize="+pSize+"&currPage=${pbFile.currentPage==1?1:pbFile.currentPage-1}&uploadName="+uploadName+"&fromIndexDatetime="+fromIndexDatetime+"&toIndexDatetime="+toIndexDatetime;
	}
	
	function downPage(){
		var currPage = document.getElementById("currPage").value;
		if(currPage === "${pbFile.totalPage}" ){
			alert("到底了");
			return;
		}
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchFileByCondition?pSize="+pSize+"&currPage=${pbFile.currentPage==pbFile.totalPage?pbFile.totalPage:pbFile.currentPage+1}&uploadName="+uploadName+"&fromIndexDatetime="+fromIndexDatetime+"&toIndexDatetime="+toIndexDatetime;
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
		var ids = document.getElementsByName("numbers");
		//循环给每个复选框赋值
		for(var i =0; i<ids.length;i++){
			ids[i].checked = flag;//把ckAll元素的状态赋值给每一个ids[i]的元素
		} 
		
	}
	
	function delManyUsers(){
		//得到所有复选框元素
		var ids = document.getElementsByName("numbers");
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
				location.href="${pageContext.request.contextPath }/user/delManyUploadFiles?"+str; 
			}
		}else{
			alert("请选择要删除的项目");
		}
	}
	
	function jump2FirstPage(){
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchFileByCondition?pSize="+pSize+"&currPage=1&uploadName="+uploadName+"&fromIndexDatetime="+fromIndexDatetime+"&toIndexDatetime="+toIndexDatetime;
	}
	
	function jump2LastPage(){
		var pSize = document.getElementById("pSize").value;
		window.location.href="${pageContext.request.contextPath  }/user/searchFileByCondition?pSize="+pSize+"&currPage=${pbUser.totalPage}&uploadName="+uploadName+"&fromIndexDatetime="+fromIndexDatetime+"&toIndexDatetime="+toIndexDatetime;
	}
	
	function editUser(){
		
		//得到所有复选框元素
		var ids = document.getElementsByName("numbers");
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
				location.href="${pageContext.request.contextPath }/user/downloadFile?"+str; 
		}else{
			alert("请选择要下载的项目");
		}
	}
	
	function clearAll(){
		document.getElementById("turn_uploadName").value = "";
		document.getElementById("turn_fromIndexDatetime").value = "";
		document.getElementById("turn_toIndexDatetime").value = "";
	}
</script>

</html>