<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html>
<head>
<title>财税专家</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/css/weui.min.css">
<link rel="stylesheet" href="${ctx}/css/jquery-weui.min.css">
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<button id='bbtt'>11111</button>
<ul class="myfkpage">
      <li style='background-color:red'>
      	
      </li>
      <li style='background-color:blue'>第二页</li>
</ul>
</body>
<script src="js/jqweui/jquery.js"></script>
<script src="js/lib/fkpagetransitions.min.js"></script>
<script >
$("#bbtt").click(function(){
    shownewts()
});
var fkpage,cindex = 37;
function shownewts(){
   fkpage.setSlideMode(17); 
   fkpage.goToNextSlide(); //下一页
}

$(document).ready(function(){
	  fkpage = $('.myfkpage').FKPageTransitions();
});
</script>
</html>