<#assign ctx=request.getContextPath()>
<!DOCTYPE html>
<html>
<head>
<title>财税专家</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<meta name="format-detection" content="telephone=no">
<meta name="Keywords" content="财税专家，ABC4000，智能申报，AI企易税，e企惠税，易企惠税，ABC4000惠报税，电子申报，电子税务局，电子税局,掌上办税厅,营改增,互联网+税务,帮邦,">
<meta name="description" content="由艾博克公司打造的财税云服务平台，提供在线涉税业务办理、信息查询、在线培训、知识库学习等财税综合服务，为税务机关提供财税信息化解决方案" />
<link rel="stylesheet" href="${ctx}/css/weui.min.css">
<link rel="stylesheet" href="${ctx}/css/jquery-weui.min.css">
<link rel="stylesheet" href="${ctx}/css/main.css">
<link rel="stylesheet" href="${ctx}/css/index.css">
<link rel="stylesheet" href="${ctx}/css/iconfont.css">
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?a6abbd47e203dea0e025df6e6476c084";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script type="text/javascript">
     var ctx = "${ctx}";
	 sessionStorage.setItem('cfgUrl',"${cfgUrl}");
	 <#if charge??>localStorage.setItem('charge',"${charge}");</#if> 
</script>
<style>
.weui-grid {position: relative;float: left;padding: 10px;height: 100px;box-sizing: border-box;text-align: center;}
.weui-grid__icon{height: 55px; width:60px;text-align: center; color:white;border-radius:5px}
.weui-grid:before,.weui-grid:after{border:0px solid #d9d9d9; }
.iconfont{font-size:35px;font-weight:bold;}
.weui-grid__icon{transition:all 0.6s;}
.weui-grid__icon:active{transform:scale(1.2);}
.ui-tab-nav { top: 45px;width: 100%;background-color: #fff;display: box;display: -webkit-box;font-size: 16px;height: 45px;box-sizing: border-box;}
.ui-tab-nav li.current {color: #00a5e0;border-bottom: 3px #00a5e0 solid;font-weight: bold;}
.ui-tab-nav li {height: 45px;line-height: 45px;min-width: 70px;box-flex: 1;-webkit-box-flex: 1;text-align: center;color: #777;box-sizing: border-box;border-bottom: 2px solid transparent;width: 100%;border-bottom: 1px #e5e5e5 solid;}
li {list-style: none;}
.ui-border-b{width:125%;display: -webkit-box;}
.imgbox{box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px rgba(0,0,0,.35);transition:all 0.2s;}
.kechengli{width:46%;float:left;border-radius:5px;padding: 8px 2%;display: block;}
.kecheng{border-right:0px solid #d9d9d9;padding:8px;box-sizing: border-box;-webkit-box-shadow: 0 0 3px rgba(0,0,0,.35);box-shadow: 0 0 3px rgba(0,0,0,.35);transition:all 0.2s;}
.kecheng:active{background-color:#ececec;transform:scale(1.1);}
.kechengt{height:42px;overflow:hidden; text-overflow:ellipsis;}
.huodongi{font-weight:bold;font-size: 18px;padding-right:10px;color:#FF8F59}
</style>
</head>
<body ontouchstart>

<div class="weui-tab">
	 <#--
	  <div class="weui-navbar">
	  <span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;'>
        <div class="weui-cell__bd" style='text-align: center;font-family: "Helvetica Neue",Helvetica,STHeiTi,sans-serif;'><p>掌上财税专家</p></div>
      </span>
      </div>
	  -->
	  <div class="weui-tab__bd">
      <div class="weui-tab__bd weui-tab__panel">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <div class="swiper-container" id='zixunwdswiper'>
                <div class="swiper-wrapper" id='wdswiper'>
                </div>
                <div class="swiper-pagination"></div>
            </div>
			<div class="weui-cell  weui-cell_select weui-cell_select-after" style='border-bottom: 1px solid #e5e5e5;'>
            <div class="weui-cell__hd">
              <label class="weui-label" style='font-weight:bold;'>我的纳税企业</label>
            </div>
            <div class="weui-cell__bd">
              <select class="weui-select" id="wdsh" name='neirong'>
                  <option value="">登录账号获取纳税企业</option>
              </select>
            </div>
            </div>
			
			<div class="weui-cells__title">我要办税</div>
            <div class="weui-grids">
                <div><a href="javascript:;" id='123GO' class="weui-grid">
                    <div class="weui-grid__icon" style='background:#00E3E3;'><center><i class="iconfont">&#xe791;</i></center></div>
                    <p class="weui-grid__label">简易申报</p>
                </a></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#00DB00;'><center><i class="iconfont">&#xe663;</i></center></div>
                    <p class="weui-grid__label">一键零申报</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#FFA042;'><center><i class="iconfont">&#xe77c;</i></center></div>
                    <p class="weui-grid__label">发票验旧</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon"  style='background:#1AFD9C'><center><i class="iconfont">&#xe776;</i></center></div>
                    <p class="weui-grid__label">发票领用</p>
                </span></div>
            </div>
			<div class="weui-cells__title">我要查询</div>
            <div class="weui-grids">
				<div><span href="${ctx}/tax/jcxx.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon" style='background:#02C874'><center><i class="iconfont">&#xe657;</i></center></div>
                    <p class="weui-grid__label">基本信息查询</p>
                </span></div>
				<div><span href="${ctx}/tax/sbjgcx.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon" style='background:#00A600'><center><i class="iconfont">&#xe697;</i></center></div>
                    <p class="weui-grid__label">申报结果查询</p>
                </span></div>
                <div><span href="${ctx}/tax/nsjg.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon" style='background:#BCEA00'><center><i class="iconfont">&#xe6d5;</i></center></div>
                    <p class="weui-grid__label">缴税结果查询</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#FFD306' needlogin><center><i class="iconfont">&#xe766;</i></center></div>
                    <p class="weui-grid__label">纳税申报表查询</p>
                </span></div>
				<div><span href="${ctx}/tax/sqsxjd.html" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#FFC78E' needlogin><center><i class="iconfont">&#xe77f;</i></center></div>
                    <p class="weui-grid__label">申请事项进度查询</p>
                </span></div>
				<div><span href="${ctx}/tax/fqjc.html" class="weui-grid">
                    <div class="weui-grid__icon"  style='background:#FF8F59' needlogin><center><i class="iconfont">&#xe779;</i></center></div>
                    <p class="weui-grid__label">发票结存信息查询</p>
                </span></div>
				<div><span href="${ctx}/tax/nsxyjb.html" class="weui-grid">
                    <div class="weui-grid__icon"  style='background:#6A6AFF' needlogin><center><i class="iconfont">&#xe6b2;</i></center></div>
                    <p class="weui-grid__label">纳税信用级别查询</p>
                </span></div>
				<div><span href="${ctx}/tax/yhsxba.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon"  style='background:#66B3FF'><center><i class="iconfont">&#xe758;</i></center></div>
                    <p class="weui-grid__label">优惠事项备案查询</p>
                </span></div>
				<div><span href="${ctx}/tax/sfxy.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon"  style='background:#00E3E3;'><center><i class="iconfont">&#xe76c;</i></center></div>
                    <p class="weui-grid__label">三方协议查询</p>
                </span></div>
            </div>
			<div class="weui-cells__title">我要服务</div>
            <div class="weui-grids">
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#750000'><center><i class="iconfont">&#xe6f6;</i></center></div>
                    <p class="weui-grid__label">在线咨询</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#93FF93'><center><i class="iconfont">&#xe70a;</i></center></div>
                    <p class="weui-grid__label" >营改增专题</p>
                </span></div>
                <div><span href="${ctx}/school.html" class="weui-grid" needlogin>
                    <div class="weui-grid__icon" style='background:#FF5809'><center><i class="iconfont">&#xe72d;</i></center></div>
                    <p class="weui-grid__label" >财税课堂</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#0072E3'><center><i class="iconfont">&#xe642;</i></center></div>
                    <p class="weui-grid__label" >内容精选</p>
                </span></div>
				<div><span href="javascript:;" class="weui-grid">
                    <div class="weui-grid__icon" style='background:#80FFFF'><center><i class="iconfont">&#xe72a;</i></center></div>
                    <p class="weui-grid__label">联系我们</p>
                </span></div>
            </div>
        </div>
		
        <div id="tab2" class="weui-tab__bd-item">
           <section id="tab">
        	<div class="demo-item">
        		<div class="demo-block">
        			<div class="ui-tab" style='width: 100%;overflow: hidden;'>
        			    <ul id="faxian" class="ui-tab-nav ui-border-b">
        			        <li class="current" index='0'>活动</li>
							<li index='1'>财税学堂</li>
        			        <li index='2'>财税动态</li>
							<li index='3'>热点问题</li>
        			        <li index='4'>帮友热议</li>
        			    </ul>
        			</div>
        		</div>
        	</div>
          </section>
		  <div class="swiper-container" id='faxianswiper'>
                <div class="swiper-wrapper" id='faxianwdswiper'>
					 <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='huodong'>
						<div class="content-padded" id='huodongdetail' style='overflow:hidden'>
                        </div>
                        <div class="weui-loadmore" id='huodongloading'>
                            <i class="weui-loading"></i>
                            <span class="weui-loadmore__tips">正在加载</span>
                        </div>
					 </div>
                     <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='caishuiketang'>
						<div class="content-padded" id='caishuiketangdetail'>
							<ul id="zuixin" style='box-sizing: border-box;list-style: none;'></ul>
                        </div>
                        <div class="weui-loadmore" id='caishuiketangloading' style='margin-top:20px'>
                            <i class="weui-loading"></i>
                            <span class="weui-loadmore__tips">正在加载</span>
                        </div>
					 </div>
                     <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='caishuidongtai'>
						<div class="content-padded" id='caishuidongtaidetail'>
                        </div>
                        <div class="weui-loadmore" id='caishuidongtailoading'>
                            <i class="weui-loading"></i>
                            <span class="weui-loadmore__tips">正在加载</span>
                        </div>
					 </div>
					 <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='redianwenti'>
						<div class="content-padded" id='redianwentidetail'>
                        </div>
                        <div class="weui-loadmore" id='redianwentiloading'>
                            <i class="weui-loading"></i>
                            <span class="weui-loadmore__tips">正在加载</span>
                        </div>
					 </div>
					 <div class="swiper-slide swiper-slide-prev fxswiper-slide" id='bangyoureyi'>
						<div class="content-padded" id='bangyoureyidetail'>
                        </div>
                        <div class="weui-loadmore" id='bangyoureyiloading'>
                            <i class="weui-loading"></i>
                            <span class="weui-loadmore__tips">正在加载</span>
                        </div>
					 </div>
					 
				</div>
          </div>
        </div>
        <div id="tab3" class="weui-tab__bd-item">
           <div class="weui-cells">
                <a href="${ctx}/profile.html" class="weui-cell weui-cell_access">
                    <div class="weui-cell__hd">
                        <img id='userPicturePath' src="https://team.weui.io/avatar/bear.jpg" alt="" class="avatar">
                    </div>
                    <div class="weui-cell__bd">
                        <h4 class="nickname" id='nickname'></h4>
                        <p class="wxid" id='username'></p>
                    </div>
                    <div class="weui-cell__ft">
                        <i class="icon-qrcode"></i>
                    </div>
                </a>
            </div>
            <div class="weui-cells">
                <a href="javascript:;" class="weui-cell weui-cell_access">
                    <div class="weui-cell__hd">
                        <i class="icon-bangbang"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>我的帮帮</p>
                    </div>
                </a>
                <a href="javascript:;" class="weui-cell weui-cell_access">
                    <div class="weui-cell__hd">
                        <i class="icon-message"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>我的消息</p>
                    </div>
                </a>
				<a href="${ctx}/company.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-enterprise"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">我的纳税企业</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
				<a href="${ctx}/order.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-order"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">我的订单</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
				<a href="${ctx}/invoice.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-invoice"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">我的发票</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>
            <div class="weui-cells">
				<a href="${ctx}/realname.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-smrz"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">实名认证</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>

            <div class="weui-cells">
				<a href="${ctx}/points.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-points"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">我的积分</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
				<a href="${ctx}/exps.html" class="weui-cell weui-cell_access">
					<div class="weui-cell__hd">
                        <i class="icon-exp"></i>
                    </div>
                    <div class="weui-cell__hd">
            			<span style="vertical-align: middle">我的经验值</span>
                    </div>
                    <div class="weui-cell__bd">
                    </div>
                    <div class="weui-cell__ft">
                    </div>
                </a>
            </div>
            <div class="weui-cells openleft" open-id="#fullok">
                <a  class="weui-cell weui-cell_access">
                    <div class="weui-cell__hd">
                        <i class="icon-setting"></i>
                    </div>
                    <div class="weui-cell__bd">
                        <p>设置</p>
                    </div>
                </a>
            </div>
		
      </div>

      <div class="weui-tabbar">
        <a href="#tab1" class="weui-tabbar__item weui-bar__item--on"  tabbar__item='1'>
          <div class="weui-tabbar__icon">
             <i class="icon-tax"></i>
          </div>
          <p class="weui-tabbar__label">办税</p>
        </a>
        <a href="#tab2" class="weui-tabbar__item" tabbar__item='2'>
          <div class="weui-tabbar__icon">
             <i class="icon-activity"></i>
          </div>
          <p class="weui-tabbar__label">发现</p>
        </a>
        <a data_href="#tab3" class="weui-tabbar__item" needlogin tabbar__item='3'>
          <div class="weui-tabbar__icon">
            <i class="icon-profile"></i>
          </div>
          <p class="weui-tabbar__label">我的</p>
        </a>
      </div>
      </div>
      </div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/util.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
<script src="${ctx}/js/jqweui/swiper.min.js"></script>
<script src="${ctx}/js/jqweui/fastclick.js"></script>
<script src="${ctx}/js/cszj/index.js"></script>
</body>
</html>
