<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
</head>

<style>
	.input_box{
    	width: 250px;
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
    <form id="form1"  method="post" action="${pageContext.request.contextPath }/user/addNotice" >
        <table cellpadding="5">
        	<input id="username" type="hidden" name="username" value="${user.username }" />
        	<input id="content" type="hidden" name="content" value="" />
            <tr>
                <td>标题:</td>
                <td><input id="title" class="input_box" type="text" name="title" /></td>
                
            </tr>
            <tr>
                <td>主题:</td>
                <td><input class="input_box" type="text" name="theme" /></td>  
            </tr>
            <tr>
                <td>备注:</td>
                <td><input class="input_box" type="text" name="remark" /></td>
                
                <td><button id="save" class="input_box" style="margin-left:508px;width:80px">添加</button></td>
            </tr>
        </table>
        
        <!-- 文本编辑 -->
        <div id="toolbar"
        style="width:900px;border:1px solid skyblue;;padding: 5px;overflow: auto;font-family: 'Courier New', Courier, monospace;">
	        <input type="button" name="bold" value='加粗' class="input_button">
	        <input type="button" name="italic" value='斜体' class="input_button">
	        <input type="button" name="underline" value='下划线' class="input_button">
	        <span style="font-size:13px;font-family: sans-serif;">字体大小</span>
	        <select name="fontSize" class="input_button" style="width:35px;height:22px;">
	            <option value="1">1</option>
	            <option value="2">2</option>
	            <option value="3">3</option>
	            <option value="4">4</option>
	            <option value="5">5</option>
	            <option value="6">6</option>
	            <option value="7">7</option>
	            <option value="8">8</option>
	            <option value="9">9</option>
	        </select>
	        
	        <!-- <select name="insertImage">
	            <option value="">请选择图片</option>
	            <option value="timg.jpg">timg.jpg</option>
	            <option value="timg1.jpg">timg1.jpg</option>
	            <option value="timg2.jpg">timg2.jpg</option>
	            <option value="timg3.jpg">timg3.jpg</option>
	            <option value="timg4.jpg">timg4.jpg</option>
	        </select> -->
	        <!-- <input type="button" name="insertImage" value='插入图片(未完成,可粘贴)' class="insImg"> -->
	        <input type="button" name="selectAll" value='全选' class="input_button">
	        <input type="button" name="undo" value='撤销' class="input_button">
	        <input type="button" name="justifyLeft" value='居左' class="input_button">
	        <input type="button" name="justifyCenter" value='居中' class="input_button">
	        <input type="button" name="justifyRight" value='居右' class="input_button">
    	</div>

	    <div id="edit" style="width:900px;height:400px;border:1px solid skyblue;padding: 5px;overflow: auto;"
	        contenteditable="true"></div>

	    <div id="shade" style="width:100%;height:100%;background-color: white;
	    opacity:0.5;position: absolute;z-index:5;display: none;left:0;top:0;"></div>
        
    </form>
</body>
<script>
        (function () {
            // 富文本编辑器类
            class Editor {
                constructor() {
                    this.bindElem();
                }

                bindElem() {

                    var toolbar = document.getElementById("toolbar");
                    var bs = toolbar.querySelectorAll('input,select');
                    for (var i = 0; i < bs.length; i++) {
                        if (bs[i].tagName.toLowerCase() == 'select') {
                            bs[i].onchange = function () {
                                document.execCommand(this.name, true, this.value);
                            }
                        } else if (bs[i].tagName.toLowerCase() == 'input') {
                            this.action(bs[i], bs[i].name);
                        }
                    }

                }

                action(obj, attr) {
                    obj.onclick = function () {
                        document.execCommand(attr, true);
                    }
                }

            }

            new Editor();

        })();


        // 监听粘贴事件
        document.querySelector('#edit').addEventListener('paste', function (e) {
            // 判断剪切板是否有内容
            if (!(e.clipboardData && e.clipboardData.items)) {
                return;
            }

            for (var i = 0, len = e.clipboardData.items.length; i < len; i++) {
                var item = e.clipboardData.items[i];
                if (item.kind == "file") {
                    var blob = item.getAsFile();
                    var reader = new FileReader();
                    var imgs = new Image();
                    imgs.file = blob;
                    reader.onload = (function (aImg) {
                        return function (e) {
                            aImg.src = e.target.result;
                        }
                    })(imgs)
                    reader.readAsDataURL(blob);
                    document.querySelector('#edit').appendChild(imgs);
                }
            }
        });
		
        //提交表单
        document.getElementById("save").onclick = function () {
        	var username = document.getElementById("username").value;
        	var textedContent = document.getElementById("edit").innerHTML;
        	document.getElementById("content").value = textedContent;
        	var content = document.getElementById("content").value;
            // alert(document.getElementById("edit").innerHTML);
            var title = document.getElementById("title").value;
            
            
            if(username === null || username === ""){
            	alert("请先登录");
            	return false;
            }
            if(title === ""){
            	alert("请输入标题");
            	return false;
            }
            if(content === ""){
            	alert("请输入内容");
            	return false ;
            }
            
            //提交表单
            document.getElementById("form1").submit();
        }

        document.querySelector('.insImg').onclick = function(){
            document.getElementById("shade").style.display = "block";
            var div = document.createElement("div");  
            div.style.cssText=
                "width:300px;height:50px;border:1px solid #000;background-color:white;" + 
                "text-align:center;line-height:50px;" + 
                "position:absolute;z-index:9;left:0; top:0;right:0;bottom:0;margin:auto;"; 
            var input = document.createElement("input");
            input.type = "file";
            div.appendChild(input);
            document.body.appendChild(div);
        }
</script>

</html>