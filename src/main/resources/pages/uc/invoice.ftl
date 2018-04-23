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
<span class="weui-cell weui-cell_access weui-navbar__item" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<a onclick="javascript:window.history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
		<label>我的发票</label>
    </span>
</span>
-->
<div class="weui-tab">
 <div class="weui-navbar">
     <span class="weui-navbar__item weui-bar__item--on" index='0'>索要发票</span>
     <span class="weui-navbar__item" needloading='true'  index='1'>历史发票</span>
 </div>
 <div class="weui-tab__bd">
 <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active infinite2">
 <div class="swiper-container" id="loginType">
 <div class="swiper-wrapper" >
	<div class="swiper-slide swiper-no-swiping">
     <div class="weui-cells weui-cells_checkbox"  id='tab111'>
		<div class="weui-cells" id='zwqm'>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="syfpBt">索要发票</a>
          </div>
		</div>
     </div>
    </div>
	<div class="swiper-slide swiper-no-swiping ">
      <div id="lsfp">
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
<a id='syfpclick'  class="open-popup" data-target="#full" style='display:none;'></a>
<a id='syxqclick'  class="open-popup" data-target="#full2" style='display:none;'></a>
<div id="full" class='weui-popup__container' style='z-index:1000;'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
            <h1 class="title">索要发票</h1>
          </div>
        </div>
		<div class="modal-content">
		 <form id='syfpform'>
		 <div class="weui-cells weui-cells_form">
           <div class="weui-cell  weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
              <label class="weui-label">发票抬头</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select1" name='taitou'>
                  <option value='1'>个人</option>
				  <option value='2' selected>公司</option>
              </select>
            </div>
           </div>
		   <div class="weui-cell" for-tp='gs'>
            <div class="weui-cell__hd"><label class="weui-label">纳税人识别号</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text"  name='nsrsb'  id='nsrsb' placeholder="纳税人识别号" >
            </div>
          </div>
		  <div class="weui-cell" for-tp='gs'>
            <div class="weui-cell__hd"><label class="weui-label">公司名称</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text"  name='gsmc'  id='gsmc' placeholder="公司名称" >
            </div>
          </div>
		  <div class="weui-cell" for-tp='gs'>
            <div class="weui-cell__hd"><label class="weui-label">注册地址</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text"  name='zcdz'  id='zcdz' placeholder="注册地址" >
            </div>
          </div>
		  <div class="weui-cell" for-tp='gs'>
            <div class="weui-cell__hd"><label class="weui-label">注册电话</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text"  name='zcdh'  id='zcdh' placeholder="注册电话" >
            </div>
          </div>
		  <div class="weui-cell" for-tp='gs'>
            <div class="weui-cell__hd"><label class="weui-label">开户银行</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="text"  name='khyh'  id='khyh' placeholder="开户银行" >
            </div>
          </div>
		  <div class="weui-cell  weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
              <label class="weui-label">发票内容</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select2" name='neirong'>
                  <option value='1'selected>软件服务费</option>
				  <option value='2' >财税培训费</option>
				  <option value='3' >技术服务费</option>
				  <option value='4' >财税咨询费</option>
              </select>
            </div>
           </div>
		  <div class="weui-cell  weui-cell_select weui-cell_select-after">
            <div class="weui-cell__hd">
              <label class="weui-label">发票性质</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select3" name='property'>
                  <option value='1'selected>纸质发票</option>
				  <option value='2' >电子发票</option>
              </select>
            </div>
           </div>
		   <div class="weui-cell  weui-cell_select weui-cell_select-after" id='doaddress'>
            <div class="weui-cell__hd">
              <label class="weui-label">地址</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="select4" name='dizhi' needloading='true'>
                  
              </select>
            </div>
           </div>
		   <div class="weui-btn-area">
        	 <a class="weui-btn weui-btn_primary" href="javascript:" id="tijiaofp">确定</a>
           </div>
         </div>
		 </form>
        </div>
      </div>
</div>

<div id="full2" class='weui-popup__container' style='z-index:1000;'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup2' class="picker-button close-popup">关闭</a>
            <h1 class="title">发票详情</h1>
          </div>
        </div>
		<div class="modal-content">
            <div class="weui-cells">
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票状态</p></div>
                <div class="weui-cell__ft" id='sfpzt'></div>
              </div>
              <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票金额</p></div>
                <div class="weui-cell__ft" id='sfpje'></div>
              </div>
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票抬头</p></div>
                <div class="weui-cell__ft" id='sfptt'></div>
              </div>
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票内容</p></div>
                <div class="weui-cell__ft" id='sfpnr'></div>
              </div>
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票编码</p></div>
                <div class="weui-cell__ft" id='sfpbm'></div>
              </div>
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>发票性质</p></div>
                <div class="weui-cell__ft" id='sfpxz'></div>
              </div>
			  <div class="weui-cell">
                <div class="weui-cell__bd"><p>申请时间</p></div>
                <div class="weui-cell__ft" id='sfpsj'></div>
              </div>
			  <div class="weui-cell" for='dianzi'>
                <div class="weui-cell__bd"><p>收件人</p></div>
                <div class="weui-cell__ft" id='sfpsjr'></div>
              </div>
			  <div class="weui-cell" for='dianzi'>
                <div class="weui-cell__bd"><p>地址</p></div>
                <div class="weui-cell__ft" id='sfpdz'></div>
              </div>
			   <div class="weui-cell" for='dianzi'>
                <div class="weui-cell__bd"><p>联系电话</p></div>
                <div class="weui-cell__ft" id='sfpdh'></div>
              </div>
			   <div class="weui-cell" for='dianzi'>
                <div class="weui-cell__bd"><p>物流公司</p></div>
                <div class="weui-cell__ft" id='sfpwl'></div>
              </div>
			   <div class="weui-cell" for='dianzi'>
                <div class="weui-cell__bd"><p>物流编号</p></div>
                <div class="weui-cell__ft" id='sfpwlbh'></div>
              </div>
			  <div class="weui-cells__title">备注信息</div>
              <div class="weui-cell">
                <div class="weui-cell__bd">
                      <textarea class="weui-textarea" id='bzxx' name='bzxx' readonly rows="3"></textarea>
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
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/cszj/uc/invoice.js"></script>
</html>