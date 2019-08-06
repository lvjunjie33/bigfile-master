<html>
<head>
    <meta charset="utf-8">
    <title>HTML5大文件分片上传demo</title>
    <script src="http://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="../static/js/md5.js"></script>
    <script type="text/javascript">
       
        var shardSize = 1 * 1024 * 1024;    //以1MB为一个分片
        var count=1;
        var page = {
            init: function () {
                $("#upload").click(function () {
                    	realUpload();
                });
            }
        };
        $(function () {
            page.init();
        });
        
        function realUpload(){
        	
        	var form = new FormData();
            dataBegin = new Date();
            var file = $("#file")[0].files[0];  //文件对象
            name = file.name;
  			size = file.size;
  			var shardCount = Math.ceil(size / shardSize);  //总片数
  			if((count-1)==shardCount){
  				return;
  			}
//  			form.append("uuid", uuid);
//          form.append("md5", md5);
            form.append("date", new Date());
            form.append("name", name);
            form.append("size", size);
            form.append("total", shardCount);  //总片数  
 		    form.append("index", count); 
 		    //计算每一片的起始与结束位置
 	        var start = (count-1) * shardSize;
 	        var end = Math.min(size, start + shardSize);
 	 	    form.append("action", "upload");  //直接上传分片
 	        form.append("data", file.slice(start, end));  //slice方法用于切出文件的一部分
 		    	 //按大小切割文件段　　
            var data = file.slice(start, end);
            var r = new FileReader();
            r.readAsBinaryString(data);
            $(r).load(function (e) {
                var bolb = e.target.result;
                var partMd5 = hex_md5(bolb);
                form.append("partMd5", partMd5);
                //Ajax提交
                $.ajax({
                    url: "upload",
                    type: "POST",
                    data: form,
                    async: true,        //异步
                    processData: false,  //很重要，告诉jquery不要对form进行处理
                    contentType: false,  //很重要，指定为false才能形成正确的Content-Type
                    success: function (data) {
                        var flag = data.flag;
                        if (flag != "2") {

                            if (flag == "1") {
                                $("#output").text(count + " / " + shardCount);
                                count++;
                            }
                            realUpload();
                        }else{
                        	 $("#output").text(count + " / " + shardCount);
                        	count++;
                        }
//                        else {
//                            ++succeed;
//                            $("#output").text(succeed + " / " + shardCount);
//                            //服务器返回分片是否上传成功
//                            if (succeed  == shardCount) {
//                                dataEnd = new Date();
//                                $("#uuid").append(fileuuid);
//                                $("#useTime").append((dataEnd.getTime() - dataBegin.getTime())/1000);
//                                $("#useTime").append("s")
//                                $("#param").append("<br/>" + "上传成功！");
//                            }
//                        }
                    }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("服务器出错!");
                    }
                });
            });
    }
       
    </script>
</head>

<body>

<input type="file" id="file" />
<button id="upload">上传</button>
<br/><br/>
<span style="font-size:16px">上传进度：</span><span id="output" style="font-size:16px"></span>
<span id="useTime" style="font-size:16px;margin-left:20px;">上传时间：</span>
<span id="uuid" style="font-size:16px;margin-left:20px;">文件ID：</span>
<br/><br/>
<span id="param" style="font-size:16px">上传过程：</span>

</body>
</html>