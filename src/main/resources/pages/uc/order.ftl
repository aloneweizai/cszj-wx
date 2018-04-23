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
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<div class="weui-tab">
<#--
<div class="weui-navbar">
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<a onclick="javascript:window.history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
		<label>我的订单</label>
    </span>
</span>
</div>
-->
<div class="weui-tab__bd">
<div class="weui-tab__bd weui-tab__panel">
     <div class="content-padded" id='detail1' style='border-top: 1px solid #e5e5e5;border-bottom: 1px solid #e5e5e5;'>
     </div>
     <div class="weui-loadmore" id='loading1'>
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
     </div>   
</div>
</div>
</div>
<a class="open-popup" data-target="#full" id='showorder' style='display:none;'></a>
<div id="full" class='weui-popup__container' style='z-index:1000;'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button close-popup">关闭</a>
            <h1 class="title" id='mytitle'>订单详情</h1>
          </div>
         </div>
	     <div class="modal-content">
		 <div class="weui-cells">
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>订单号码</p></div>
                <div class="weui-cell__ft" id='ddhm'></div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>下单时间</p></div>
                <div class="weui-cell__ft" id='xdsj'></div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>订单状态</p></div>
                <div class="weui-cell__ft" id='jjzt' style='color:#009900'></div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>支付方式</p></div>
                <div class="weui-cell__ft" id='jsfs'></div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>订单金额(积分)</p></div>
                <div class="weui-cell__ft" id='jsje' style='color:#993399'></div>
            </div>
			<div class="weui-cell">
                <div class="weui-cell__bd"><p>赠送积分</p></div>
                <div class="weui-cell__ft" id='zsjf' style='color:#449d44'></div>
            </div>
			<div class="weui-cells__title">商品信息</div>
			<div class="content-padded" id='goods' style='border-top: 1px solid #e5e5e5;border-bottom: 1px solid #e5e5e5;'>
            </div>
			<div class="weui-cells__title">备注信息</div>
            <div class="weui-cell">
              <div class="weui-cell__bd">
                  <textarea class="weui-textarea" id='orderRmk' name='orderRmk' readonly rows="2"></textarea>
              </div>
            </div>
			<div class="weui-cells__title" for='peisong'>配送信息</div>
            <div class="weui-cell" for='peisong'>
                 <div class="weui-cell__bd"><p>快递号码</p></div>
                 <div class="weui-cell__ft" id='kudihm'></div>
            </div>
			<div class="weui-cell" for='peisong'>
                 <div class="weui-cell__bd"><p>收件人</p></div>
                 <div class="weui-cell__ft" id='sjr'></div>
            </div>
			<div class="weui-cell" for='peisong'>
                 <div class="weui-cell__bd"><p>电话号码</p></div>
                 <div class="weui-cell__ft" id='dhhm'></div>
            </div>
			<div class="weui-cell" for='peisong'>
                 <div class="weui-cell__bd"><p>地址</p></div>
                 <div class="weui-cell__ft" id='dizhi'></div>
            </div>
			<div class="weui-cell" for='peisong'>
                 <div class="weui-cell__bd"><p>详细地址</p></div>
                 <div class="weui-cell__ft" id='xxdizhi'></div>
            </div>
         </div>
         </div>
      </div>  
</div>

<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/cszj/uc/order.js"></script>
</body>
</html>