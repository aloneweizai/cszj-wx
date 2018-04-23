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
<link rel="stylesheet" href="${ctx}/css/video-js.css">
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
.hid{display:none;}
.isplay{color: #FC7D30;}
.laoshi_pingjia span {
    display: inline-block;
    color: #999;
    width: 33%;
    text-align: center;
    font-size: 20px;
}
.br1 {
    border-right: 1px solid #ddd;
}
.laoshi_pingjia span p {
    font-size: 14px;
    color: #666;
}
.ui-tab-content{display: -webkit-box;width: 400%;}
.igray{line-height:1;font-size: 20px;color:#e5e5e5;}
.ired{line-height:1;font-size: 20px;color:red;}
</style>
<script type="text/javascript">
     var ctx = "${ctx}";
	 var _id = "${id}";
</script>
</head>
<body ontouchstart>
<div class="weui-tab">
	  <#--
	  <div class="weui-navbar">
	  <span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;'>
        <div class="weui-cell__bd" style='text-align: center;font-family: "Helvetica Neue",Helvetica,STHeiTi,sans-serif;'>
			<a onclick="javascript:history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
			<p>课程信息</p>
		</div>
      </span>
      </div>
	  -->
	  <div class="weui-tab__bd">
	  <div class="weui-tab__bd weui-tab__panel" style='padding-bottom:10px;'>
		  <img id="show-img" style="width:0;height:0;"></img>
		  <h5 class="kechengt" id="kctitle"></h5>
		  <div class="weui-form-preview">
              <div class="weui-form-preview__bd">
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">价格：<span id="jiage" style='text-decoration: line-through;'>免费</span></label>
                  <span class="weui-form-preview__value">优惠价格：<span id="yhjiage" style='margin-right:20px;color: #ea5555;'>免费</span></span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">积分：<span id="jifen" style='text-decoration: line-through;'>免费</span></label>
                  <span class="weui-form-preview__value">优惠积分：<span id="yhjifen" style='margin-right:20px;color: #f29941;'>免费</span></span>
                </div>
                <div class="weui-form-preview__item">
                  <label class="weui-form-preview__label">VIP免费：</label>
                  <span class="weui-form-preview__value" id="vips" style='text-align:left'></span>
                </div>
              </div>
          </div>
		  <div class="weui-btn-area" id="doBt">
        	
          </div>
		  <section id="tab">
        	<div class="demo-item">
        		<div class="demo-block">
        			<div class="ui-tab" style='width: 100%;overflow: hidden;'>
        			    <ul class="ui-tab-nav ui-border-b">
        			        <li class="current" at-id="kejs" index='0'>课程介绍</li>
        			        <li at-id="keml" index='1'>课程目录</li>
							<li at-id="lsje" index='2'>老师介绍</li>
        			        <li at-id="kepj" index='3' id='kepj-t'>课程评价</li>
        			    </ul>
        			    <ul class="ui-tab-content" id='miantb' style="transition-property: transform; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
			                 <li class="currentli" style='-webkit-box-flex: 1;width: 100%;height:auto;' id='kejs'></li>
			                 <li class="currentli" style='-webkit-box-flex: 1;width: 100%;' id='keml'></li>
							 <li class="currentli" style='-webkit-box-flex: 1;width: 100%;' id='lsje'></li>
			                 <li class="currentli" style='-webkit-box-flex: 1;width: 100%;' id='kepj'>
							    <div class="content-padded" id='kcdetail'>
                                </div>
                                <div class="weui-loadmore" id='kcloading'>
                                    <i class="weui-loading"></i>
                                    <span class="weui-loadmore__tips">正在加载</span>
                                </div>
                             </li>
			            </ul>
        			</div>
        		</div>
        	</div>
          </section>
      </div>
      </div>
</div>

<span id='kcgkopen' style='display:none;' class="weui-cell weui-cell_access weui-cell_link open-popup" data-target="#full"></span>
<div id="full" class='weui-popup__container' style='z-index:1000;'>
<div class="weui-popup__overlay"></div>
<div class="weui-popup__modal" style='background-color: #fff;'>
<div class="toolbar">
  <div class="toolbar-inner">
    <a href="javascript:;" id='close-popup' class="picker-button picker-button">关闭</a>
	<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
    <h1 class="title" id="mytitle" style="width:85%;height:40px;overflow:hidden; text-overflow:ellipsis;"></h1>
  </div>
  <video id="show-video" style='width:100%;height:180px;position:absolute;'   class="video-js vjs-default-skin" controls></video>
  <ul class="ui-tab-nav ui-border-b" style='width:100%;position:absolute;top:220px;'>
    	<li class="current" at-ids="kemls" index='0'>课程目录</li>
  </ul>
</div>
<div class="modal-content infinite" style="padding-top: 265px;">
<div class="content-padded">
	<section id="tab">
    	<div class="demo-item">
    		<div class="demo-block" id='kemls'></div>
    	</div>
    </section>
</div>
</div>
</div>
</div>
</div>

<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/lib/video.js"></script>
<script src="${ctx}/js/lib/videojs-contrib-hls.js"></script>
<script src="${ctx}/js/cszj/home/class.js"></script>
</body>
</html>
