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
<link rel="stylesheet" href="${ctx}/css/main.css">
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<style>
.shade{box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px #00a5e0;margin-bottom:20px;}
.weui-form-preview_bot{padding-left:15px;color:black;}
._label{color:black;}
._value{color:green;}
</style>
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<div class="weui-tab__bd">
<div class="weui-tab__bd weui-tab__panel">
     <div class="page preview js_show" id='detail1' style='padding:10px 10px'>
     </div>
     <div class="weui-loadmore" id='loading1'>
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
     </div>   
</div>
</div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/cszj/etax/sbjgcx.js"></script>
</body>
</html>