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
<div class="weui-tab">
<div class="weui-tab__bd">
<div class="weui-tab__bd weui-tab__panel">
<div class="bd">
   <div class="page__bd">
        <div class="weui-cells__title">我的经验值</div>
        <div class="weui-cells">
          <div class="weui-cell" id="truenamecell">
            <div class="weui-cell__bd">
              <p>我的经验值</p>
            </div>
            <div class="weui-cell__ft" id='mypoint' style='color: green;'></div>
          </div>
		  <div class="weui-cell" id="idcardcell">
            <div class="weui-cell__bd">
              <p>本月增长</p>
            </div>
            <div class="weui-cell__ft" id='incomeM'  style='color:green;'></div>
          </div>
		  <div class="weui-cell" id="idcardcell">
            <div class="weui-cell__bd">
              <p>本月扣除</p>
            </div>
            <div class="weui-cell__ft" id='outcomeM'  style='color: red;'></div>
          </div>
		  <div class="weui-cell" id="idcardcell">
            <div class="weui-cell__bd">
              <p>本年增长</p>
            </div>
            <div class="weui-cell__ft" id='incomeY'  style='color: green;'></div>
          </div>
		  <div class="weui-cell">
            <div class="weui-cell__bd">
              <p>本年扣除</p>
            </div>
            <div class="weui-cell__ft" id='outcomeY'  style='color:red;'></div>
          </div>
		  <span href="javascript:;" class="weui-cell weui-cell_access" id='showdetail' needloading='true'>
            <div class="weui-cell__hd">
    			<span style="vertical-align: middle">查看明细</span>
            </div>
            <div class="weui-cell__bd">
            </div>
            <div class="weui-cell__ft">
            </div>
          </span>
        </div>
   </div>
</div>
</div>
</div>
</div>


<div id="full" class='weui-popup__container' style='z-index:1000;'>
<span id='dossopen' style='display:none;' class="weui-cell weui-cell_access weui-cell_link open-popup" data-target="#full"></span>
<div class="weui-popup__overlay"></div>
<div class="weui-popup__modal">
<div class="toolbar">
  <div class="toolbar-inner">
    <a href="javascript:;" id='close-popup' class="picker-button picker-button close-popup">关闭</a>
	<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
    <h1 class="title" id='mytitle'>积分明细查看</h1>
  </div>
</div>
<div class="modal-content infinite">
<div class="content-padded" id='detail'>
</div>
<div class="weui-loadmore" id='loading'>
    <i class="weui-loading"></i>
    <span class="weui-loadmore__tips">正在加载</span>
</div>
</div>
</div>
</div>


</body>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/cszj/uc/exp.js"></script>
</html>