<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Basic Panel - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <script type="text/javascript" src="../easyui/jquery.min.js"></script>
    <script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
</head>
<body>
    <div class="easyui-panel" title="添加部门" style="width:800px; height: 400px;">
		<div style="padding:10px 60px 20px 60px">
	    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${pageContext.request.contextPath }/user/addDepartment">
	    	<table cellpadding="5">
	    		<tr>
	    			<td>部门名称:</td>
	    			<td><input id="dept_name" class="easyui-textbox" type="text" name="dname" data-options="required:true"></input></td>
	    			<td>备注:</td>
	    			<td><input class="easyui-textbox" type="text" name="dremark" data-options="required:true"></input></td>
	    		</tr>
	    	</table>
	    </form>
	    <div style="text-align:center;padding:5px; margin:50px auto;">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">添加</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
	    </div>
	    </div>
	</div>
	<script>
		/* function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableVal.idation').form('validate');
				}
			});
		}
		function clearForm(){
			$('#ff').form('clear');
		} */
		
		/* function submitForm(){
			alert("aaaaaaaa");
			document.getElementById("ff").submit();
			alert("bbbbbbb");
		} */
		
		function submitForm(){
			var dname = document.getElementById("dept_name").value;
			if(dname ===""){
				alert("请输入部门名称");
				return;
			}else{
				$('#ff').form('submit');
			}
			
		}
		function clearForm(){
			$('#ff').form('clear');
		}
	</script>
</body>
</html>