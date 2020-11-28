<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>人事管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
</head>
<style>
    .fun{
        height:30px;
        margin:10px auto;
        /*text-align: left;*/
        padding:5px 0;
    }
    .fun:hover{
        background-color:#E0ECFF;
        color:blue;
    }
    .td_left{
        width:150px;
        font-size:10px;
        height:30px;
    }
    .table{
        background: #E0ECFF;
        margin: 10px auto;
        height:170px;
        width:750px;
        border-color: aliceblue;
        border-collapse: collapse;

    }
    .head_user_time{
        /* border:1px solid blueviolet; */
        height: 30px;
        width: 1000px;
        float: right;
        border-top-left-radius: 20px;
        background-color:#DDE8FB ;
    }
    .tabs_greetings{
        height: 50px;
        width:1000px;
        
        background-color: #F1F1EF;
    }
    .fieldset_showdata{
        width:1000px;
        height: 150px;
        border-color: #D5D7CB;
    }
    .fieldset_showdata_data{
        width: 120px;
        height: 100px;
        background-color: #F8F8F8;
        margin: 0 20px;
        float: left;
    }
    .title{
    	text-decoration: none;
    	color:blue;
    }
    .title:hover {
		color:green;
	}
</style>
<body class="easyui-layout" id="index_body">

<input type="hidden" id="loginedUserName" value="${user.username }"/>
<input type="hidden" id="loginedRoleId" value="${user.role_id }"/>
<div class="easyui-layout" style="width:100%;height:100%;">
    <!-- 北 -->
    <div data-options="region:'north'" style="height:90px; background-color: #6F9DE2;">
        <div style="margin-top:20px; margin-left:100px;"><span style="font-size:28px; font-family: cursive; color:#0049AF;">人事管理系统</span>
            <a href="${pageContext.request.contextPath }/user/logout" class="easyui-linkbutton" data-options="iconCls:'icon-no'" style="border: 0; background: #6F9DE2; float: right;margin-right: 120px;  color: #FFFFFF;">退出登录</a>
            <a onclick="$('#userinfo').dialog('open')" class="easyui-linkbutton" data-options="iconCls:'icon-man'" style="border: 0; background: #6F9DE2; float: right; margin-right: 15px; color: #FFFFFF;" >个人信息</a>
        </div>
        
        <div class="head_user_time">
            <div id="show_time" style="float: right;margin-right: 150px; margin-top: 5px; color: #7862A9;"></div>
            <div style="margin-left: 50px; margin-top:5px;"><span style="color: #7862A9;">当前用户：&nbsp;${user.username }</span></div>
        </div>
        <!-- <a href="#" class="easyui-linkbutton" style="margin-left:15px;width: 150px;height:20px"><span style="color:red;">管理员</span>，您好！</a> -->
    </div>
    <!-- 南 -->
    <div data-options="region:'south',split:true" style="height:50px;">
        <div style="text-align: center; padding-top:15px;"><span>JavaEE大作业：&copy; 170809 陈钟毅  陈骏贤  梁晓诗</span></div>
    </div>
    <!-- 西 -->
    <div data-options="region:'west',split:true" title="公司人事信息管理" style="width:180px;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <!-- 用户管理 -->
            <div data-options="iconCls:'icon-man'" title="用户管理" style="padding:10px;">
                <div class="fun"><a  onclick="openTab('用户查询','${pageContext.request.contextPath }/user/searchUserByCondition')">用户查询</a></div>
                <div id="add_user" class="fun"><a onclick="openTab('添加用户','${pageContext.request.contextPath }/user/returnRoleList')">添加用户</a></div>
            </div>
            <!-- 部门管理 -->
            <div title="部门管理" style="padding:10px;">
                <div class="fun"><a onclick="openTab('部门查询','${pageContext.request.contextPath }/user/findAllDepartments')">部门查询</a></div>
                <div id="add_dempartment" class="fun"><a onclick="openTab('添加部门','${pageContext.request.contextPath }/tabs/tabs_adddepartment.jsp')">添加部门</a></div>
            </div>
            <div title="职位管理" style="padding:10px;">
                <div class="fun"><a onclick="openTab('职位查询','${pageContext.request.contextPath }/user/findAllJobs')">职位查询</a></div>
                <div id="add_job" class="fun"><a onclick="openTab('添加职位','${pageContext.request.contextPath }/tabs/tabs_addposition.jsp')">添加职位</a></div>
            </div>
            <div title="员工管理" style="padding:10px;">
                <div class="fun"><a onclick="openTab('员工查询','${pageContext.request.contextPath }/user/searchEmployeeByCondition')">员工查询</a></div>
                <div id="add_employee" class="fun"><a onclick="openTab('添加员工','${pageContext.request.contextPath}/user/getDeptAndJob')">添加员工</a></div>
            </div>
            <div title="角色管理" style="padding:10px;">
                <div class="fun"><a onclick="openTab('角色查询','${pageContext.request.contextPath }/user/findAllRoles')">角色查询</a></div>
                <div id="add_role" class="fun"><a onclick="openTab('添加角色','${pageContext.request.contextPath }/tabs/tabs_addrole.jsp')">添加角色</a></div>
            </div>
            <div title="公告管理" style="padding:10px;">
                <div class="fun"><a onclick="openTab('公告查询','${pageContext.request.contextPath }/user/searchNoticeByCondition')">公告查询</a></div>
                <div id="add_notice" class="fun"><a onclick="openTab('添加公告','${pageContext.request.contextPath }/tabs/tabs_addnotice.jsp')">添加公告</a></div>
            </div>
            <div title="下载中心" style="padding:10px;">
                <div class="fun"><a onclick="openTab('文件下载','${pageContext.request.contextPath }/user/searchFileByCondition')">文件下载</a></div>
                <div id="uploadfile"  class="fun"><a onclick="openTab('文件上传','${pageContext.request.contextPath }/tabs/tabs_uploadfile.jsp')">文件上传</a></div>
            </div>
        </div>
    </div>
    <!-- 中 -->
    <div data-options="region:'center'," >
        <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true" >
            <div title="WelCome" style="padding:10px; " >
                <!-- 上 -->
                <div class="tabs_greetings">
                    <div style="height: 50px; width: 10px; background-color: #1F8D1D;"></div>
                    <div style="margin-top: -35px; margin-left: 20px;">欢迎您，${user.username }</div>
                </div>
                <div style="margin-top: 20px;"></div>
                <!-- 中 -->
                <div>
                    <fieldset class="fieldset_showdata">
                        <legend style="font-size:20px">数据统计</legend>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">用户数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countUsers }</div>
                        </div>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">员工数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countEmployees }</div>
                        </div>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">部门数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countDepts }</div>
                        </div>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">职位数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countJobs }</div>
                        </div>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">公告数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countNotices }</div>
                        </div>
                        <div class="fieldset_showdata_data">
                            <div style="margin-top: 10px; text-align: center;font-size: 16px;">文件数</div>
                            <div style="margin-top: 15px;text-align: center;font-size:30px;color: #2E852F;">${countItems.countFiles }</div>
                        </div>
                    </fieldset>
                </div>

                <!-- 下 -->
                <div>
                    <fieldset class="fieldset_showdata" style="height: auto;">
                        <legend style="font-size:20px" >最新公告</legend>
                        <table table rules=rows style="border-color: #D7D5D0;" >
                            <thead>
                                <th style="width: 50px; height: 30px;">#</th>
                                <th style="width: 750px; height: 30px;">公告标题</th>
                                <th style="width: 150px; height: 30px;">作者</th>
                            </thead>
                            <c:forEach items="${countItems.notices }" var="no" varStatus="i">
	                            <tr style="height: 40px;">
	                                <td>${i.index+1 }</td>
	                                <td><a href="${pageContext.request.contextPath }/user/displayNotice?id=${no.id}" class="title" >${no.title }</a></td>
	                                <td>${no.username}</td>
	                            </tr>
                            </c:forEach> 
                        </table>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
</div>
  


<!-- 个人信息 -->
<div id="userinfo" class="easyui-dialog" title="个人信息" data-options="modal:true,closed:true,iconCls:'icon-man'" style="width:320px;height:370px;padding:10px">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${pageContext.request.contextPath }/user/editLoginUserInfo">
        <table cellpadding="5">
            <tr>
                <td>用户编号:</td>
                <td><input class="easyui-textbox" type="text" name="number" data-options="required:true" value="${user.number }" readonly="readonly"></input></td>
            </tr>
            <tr>
                <td>用户名称:</td>
                <td><input class="easyui-textbox" type="text" name="username" data-options="required:true,validType:'email'" value="${user.username }"></input></td>
            </tr>
            <tr>
                <td>手机号码:</td>
                <td><input class="easyui-textbox" type="text" name="phone" data-options="required:true" value="${user.phone }"></input></td>
            </tr>
            <tr>
                <td>角色名:</td>
                <td><input class="easyui-textbox" type="text" name="subject" data-options="required:true" value="${roleName }" readonly="readonly"></input></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input class="easyui-textbox" type="password" name="password" data-options="required:true" value="${user.password }"></input></td>
            </tr>
            <tr>
                <td>备注:</td>
                <td><input class="easyui-textbox" type="text" name="remark" data-options="required:true" value="${user.remark }"></input></td>
            </tr>
        </table>
        <div style="margin:20px 0;"></div>
        <div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:document.getElementById('ff').submit()" style="width:80px">修改</a>
            <!-- <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:alert('cancel')" style="width:80px">取消</a> -->
            <input  type="reset" value="清除" class="input_button"/>
        </div>
    </form>

</div>

</body>
<script type="text/javascript">

	 window.onload = function(){
		var loginedUserName = document.getElementById("loginedUserName").value;
		var loginedRoleId = document.getElementById("loginedRoleId").value;
		if(loginedUserName === null || loginedUserName ===""){
			document.getElementById("index_body").style.display = "none";
		}
		
		if(loginedRoleId === "0"){
			document.getElementById("add_user").style.display = "block";
		}else if(loginedRoleId === "1"){
				document.getElementById("add_user").style.display = "none";
				return;
		}else{
			document.getElementById("add_user").style.display = "none";
			document.getElementById("add_dempartment").style.display = "none";
			document.getElementById("add_job").style.display = "none";
			document.getElementById("add_employee").style.display = "none";
			document.getElementById("add_role").style.display = "none";
			document.getElementById("add_notice").style.display = "none";
			document.getElementById("uploadfile").style.display = "none";
		}
		
	}
 
    function openTab(text,url) {    
    	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
    // 添加一个未选中状态的选项卡面板,具体参考Easyui table 选项卡
        if ($('#tabs').tabs('exists', text)) {
            $('#tabs').tabs('select', text);
        } else {
            $('#tabs').tabs('add', {title : text,closable : true,content : content});
        }
    }

        setInterval("fun(show_time)",1);
	function fun(timeID){ 
		var date = new Date();  //创建对象  
		var y = date.getFullYear();     //获取年份  
		var m =date.getMonth()+1;   //获取月份  返回0-11  
		var d = date.getDate(); // 获取日  
		var w = date.getDay();   //获取星期几  返回0-6   (0=星期天) 
		var ww = ' 星期'+'日一二三四五六'.charAt(new Date().getDay()) ;//星期几
		var h = date.getHours();  //时
		var minute = date.getMinutes()  //分
		var s = date.getSeconds(); //秒
		var sss = date.getMilliseconds() ; //毫秒
		if(m<10){
			m = "0"+m;
		}
		if(d<10){
			d = "0"+d;
		}
		if(h<10){
			h = "0"+h;
		}
		
		
		if(minute<10){
			minute = "0"+minute;
		}
		
		
		if(s<10){
			s = "0"+s;
		}
		
		if(sss<10){
			sss = "00"+sss;
			}else if(sss<100){
			sss = "0"+sss;
		}
		document.getElementById(timeID.id).innerHTML 
			= y+"-"+m+"-"+d+"   "+h+":"+minute+":"+s+"   "+" "+ww;
	}


</script>
</html>