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
<style>
.kechengt{
  height:45px;overflow:hidden; text-overflow:ellipsis;font-size: 0.93em;margin:5px 1px;
}
.ui-tab-nav {
    top: 45px;
    width: 100%;
    background-color: #fff;
    display: box;
    display: -webkit-box;
    font-size: 16px;
    height: 45px;
    box-sizing: border-box;
}
.ui-tab-nav li.current {
    color: #00a5e0;
    border-bottom: 2px #00a5e0 solid;
}
.ui-tab-nav li {
    height: 45px;
    line-height: 45px;
    min-width: 70px;
    box-flex: 1;
    -webkit-box-flex: 1;
    text-align: center;
    color: #777;
    box-sizing: border-box;
    border-bottom: 2px solid transparent;
    width: 100%;
	border-bottom: 1px #e5e5e5 solid;
}
li {list-style: none;}
.ui-tab-content{display: -webkit-box;width: 300%;}
.doxinxi{margin:10px 0;border-top: 1px solid #e5e5e5;border-bottom: 1px solid #e5e5e5;}
</style>
<script type="text/javascript">
    var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<section id="tab">
<div class="demo-item">
	<div class="demo-block">
		<div class="ui-tab" style='width: 100%;overflow: hidden;'>
		    <ul id="faxian" class="ui-tab-nav ui-border-b">
		        <li class="current" index='0'>基本资料</li>
				<li index='1'>银行信息</li>
		        <li index='2'>核定信息</li>
		    </ul>
		</div>
	</div>
</div>
</section>
  <div class="swiper-container" id='faxianswiper'>
    <div class="swiper-wrapper" id='faxianwdswiper'>
		 <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='jibenziliao'>
			<div class="content-padded" id='jibenziliaodetail' style='overflow:hidden'>
				<div class="weui-cells">
                  <div class="weui-cell" id="truenamecell">
                    <div class="weui-cell__bd">
                      <p>纳税人名称</p>
                    </div>
                    <div class="weui-cell__ft" id='nsrmc' style='color: green;font-size:14px;'></div>
                  </div>
        		  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>纳税人识别号</p>
                    </div>
                    <div class="weui-cell__ft" id='nsrsbh'  style='color:green;font-size:14px;'></div>
                  </div>
                </div>
				<div class="weui-cells">
                  <div class="weui-cell" id="truenamecell">
                    <div class="weui-cell__bd">
                      <p>法定代表人</p>
                    </div>
                    <div class="weui-cell__ft" id='fddbrmc' style='color: green;font-size:14px;'></div>
                  </div>
        		  <div class="weui-cell">
                    <div class="weui-cell__bd">
                      <p>法人电话号码</p>
                    </div>
                    <div class="weui-cell__ft" id='frDhhm'  style='color:green;font-size:14px;'></div>
                  </div>
				  <div class="weui-cell" id="truenamecell">
                    <div class="weui-cell__bd">
                      <p>法人移动电话</p>
                    </div>
                    <div class="weui-cell__ft" id='frYddhhm' style='color: green;font-size:14px;'></div>
                  </div>
        		  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>法人电子邮箱</p>
                    </div>
                    <div class="weui-cell__ft" id='frDydz'  style='color:green;font-size:14px;'></div>
                  </div>
                </div>
				
				<div class="weui-cells">
                  <div class="weui-cell" id="truenamecell">
                    <div class="weui-cell__bd">
                      <p>负责人电话</p>
                    </div>
                    <div class="weui-cell__ft" id='cwfzrYddhhm' style='color: green;font-size:14px;'></div>
                  </div>
        		  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>办税员名称</p>
                    </div>
                    <div class="weui-cell__ft" id='cwfzrmc'  style='color:green;font-size:14px;'></div>
                  </div>
                </div>
				
				<div class="weui-cells">
                  <div class="weui-cell" id="truenamecell">
                    <div class="weui-cell__bd">
                      <p>开业设立日期</p>
                    </div>
                    <div class="weui-cell__ft" id='kyslrq' style='color: green;font-size:14px;'></div>
                  </div>
        		  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>批准机关</p>
                    </div>
                    <div class="weui-cell__ft" id='pzjg'  style='color:green;font-size:14px;'></div>
                  </div>
				  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>批准文号</p>
                    </div>
                    <div class="weui-cell__ft" id='cwfzrmc'  style='color:green;font-size:14px;'></div>
                  </div>
				  <div class="weui-cell" id="pzwh">
                    <div class="weui-cell__bd">
                      <p>注册地址</p>
                    </div>
                    <div class="weui-cell__ft" id='zcdz'  style='color:green;font-size:14px;'></div>
                  </div>
				  <div class="weui-cell" id="idcardcell">
                    <div class="weui-cell__bd">
                      <p>注册资本</p>
                    </div>
                    <div class="weui-cell__ft" id='zczb'  style='color:green;font-size:14px;'></div>
                  </div>
                </div>
				<div class="weui-cells__title">经营范围</div>
                <div class="weui-cell">
                  <div class="weui-cell__bd">
                      <textarea class="weui-textarea" id='jyfw' name='orderRmk' readonly rows="2"></textarea>
                  </div>
                </div>
            </div>
		 </div>
         <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='yinhangxinxi'>
			<div class="content-padded" id='yinhangxinxidetail'>
				
            </div>
		 </div>
         <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='hedingxinxi'>
			<div class="content-padded" id='hedingxinxidetail'>
				
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
<script src="${ctx}/js/cszj/etax/jcxx.js"></script>
</html>