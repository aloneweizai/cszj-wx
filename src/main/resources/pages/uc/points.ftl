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
<#--
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<a onclick="javascript:window.history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
		<label>我的积分</label>
    </span>
</span>
-->
<div class="bd">
   <div class="page__bd">
        <div class="weui-cells__title">我的积分</div>
        <div class="weui-cells">
          <div class="weui-cell" id="truenamecell">
            <div class="weui-cell__bd">
              <p>可以积分</p>
            </div>
            <div class="weui-cell__ft" id='mypoint' style='color: #ff9000;'></div>
          </div>
		  <div class="weui-cell" id="idcardcell">
            <div class="weui-cell__bd">
              <p>积分收入</p>
            </div>
            <div class="weui-cell__ft" id='income'  style='color: #ff9000;'></div>
          </div>
		  <div class="weui-cell">
            <div class="weui-cell__bd">
              <p>积分支出</p>
            </div>
            <div class="weui-cell__ft" id='outcome'  style='color: #ff9000;'></div>
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
<span id='dossopen' style='display:none;' class="weui-cell weui-cell_access weui-cell_link open-popup" data-target="#full"></span>
<div id="full" class='weui-popup__container' style='z-index:1000;'>
<div class="weui-popup__overlay"></div>
<div class="weui-popup__modal">
<div class="toolbar">
  <div class="toolbar-inner">
    <a href="javascript:;" id='close-popup' class="picker-button picker-button close-popup">关闭</a>
	<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
    <h1 class="title" id='mytitle'>积分明细查看</h1>
  </div>
 </div>
<div class="modal-content">
<div class="weui-tab">
 <div class="weui-navbar">
     <a class="weui-navbar__item weui-bar__item--on" id='tab1hed' data-href="#tab1" tabber>积分明细</a>
     <a class="weui-navbar__item" data-href="#tab2" needloding='true' tabber>兑换记录</a>
 </div>
 <div class="weui-tab__bd">
    <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active infinite">
	<div class="content-padded" id='detail1'>
		
    </div>
     <div class="weui-loadmore" id='loading1'>
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
     </div>
    </div>
    <div id="tab2" class="weui-tab__bd-item infinite2">
    <div class="content-padded" id='detail2'>
    </div>
     <div class="weui-loadmore" id='loading2'>
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
     </div>   
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>
</body>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/cszj/uc/points.js"></script>
</html>