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
<link rel="stylesheet" href="${ctx}/css/index.css">
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<#--
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<a onclick="javascript:window.history.back(-1);" style='float:left;'><i class="iconfont" style='font-size: 20px;font-weight:bold;color:white'>&#xe700;</i></a>
		<label>个人资料</label>
    </span>
</span>
-->
<section>
    <div class="weui-cells">
        <div class="weui-cell" id="avatarCell">
            <div class="weui-cell__bd"><p>头像</p></div>
            <div class="weui-cell__ft"><img id='headImg' src="" class="avatar" alt=""></div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd"><p>名字</p></div>
            <div class="weui-cell__ft" id='nickname'></div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__bd"><p>财税专家号</p></div>
            <div class="weui-cell__ft" id='username'></div>
        </div>
        
    </div>

    <div class="weui-cells">
		<div class="weui-cell weui-cell_access" id='showziliao'>
            <div class="weui-cell__bd">
              <span style="vertical-align: middle">个人资料</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
        <div class="weui-cell weui-cell_access open-popup" data-target="#full">
            <div class="weui-cell__bd">
              <span style="vertical-align: middle">修改密码</span>
            </div>
            <div class="weui-cell__ft"></div>
        </div>
		<a href="${ctx}/myaddress.html" class="weui-cell weui-cell_access">
            <div class="weui-cell__hd">
				<span style="vertical-align: middle">我的地址</span>
            </div>
            <div class="weui-cell__bd">
            </div>
            <div class="weui-cell__ft">
            </div>
        </a>
    </div>
    <div class="weui-btn-area">
        <button class="weui-btn weui-btn_warn" id="exitBtn">退出登录</button>
    </div>
    <span class="weui-cell weui-cell_access open-popup" style='display:none;' id='showziliaofull' data-target="#full2"></span>
<section>

<div id="full2" class='weui-popup__container'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup2' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close2' class="picker-button close-popup"></a>
            <h1 class="title">我的资料</h1>
          </div>
        </div>
		<div class="modal-content">
		 <form id='myziliao'>
          <div class="weui-cells weui-cells_form">
              <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" id='usernamess'>
                </div>
              </div>
			  <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">昵称</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" id='nicknamess'>
                </div>
              </div>
			  <div class="weui-cell  weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                  <label class="weui-label">性别</label>
                </div>
                <div class="weui-cell__bd">
                  <select class="weui-select" id="select4" name='shhy'>
					  <option value='1'>男</option>
					  <option value='0'>女</option>
                  </select>
                </div>
             </div>
              <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">出身年月</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" name='birthday' id="time-format">
                </div>
              </div>
			  <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">从业时间</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" name='careerDuration' maxlength="4" id="time-format2">
                </div>
              </div>
			  <div class="weui-cell  weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                  <label class="weui-label">所属行业</label>
                </div>
                <div class="weui-cell__bd">
                  <select class="weui-select" id="select5" name='shhy'>
                      <option value=''>请选择</option>
                  </select>
                </div>
              </div>
			  <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">最高学历</label></div>
                <div class="weui-cell__bd" id='educations'>
				   <select class="weui-select" id="education" name='education'>
    			        <option value=''>请选择</option>
                        <option value="小学">小学</option>
                        <option value="中学">中学</option>
                        <option value="高中">高中</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="博士">博士</option>
                   </select>
                </div>
              </div>
			  <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">QQ号码</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" name='QQ' maxlength="10" id="QQ">
                </div>
              </div>
			  <div class="weui-cell ">
                <div class="weui-cell__hd"><label class="weui-label">电子邮箱</label></div>
                <div class="weui-cell__bd">
                  <input class="weui-input" type="text" name='email' id="email">
                </div>
              </div>
			  <div class="weui-cell  weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                  <label class="weui-label">擅长领域</label>
                </div>
                <div class="weui-cell__bd">
                  <select class="weui-select" id="select6" name='scly'>
                      <option value=''>请选择</option>
                  </select>
                </div>
              </div>
			  <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">省份</label></div>
                <div class="weui-cell__bd" id='province'>
                   <select class="weui-select" id="select1" name='province'>
                      <option value=''>请选择</option>
                   </select>
                </div>
              </div>
              <div class="weui-cell  weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                  <label class="weui-label">城市</label>
                </div>
                <div class="weui-cell__bd">
                  <select class="weui-select" id="select2" name='city'>
                      <option value=''>请选择</option>
                  </select>
                </div>
              </div>
    		  <div class="weui-cell  weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd"><label class="weui-label">区域</label></div>
                <div class="weui-cell__bd">
                  <select class="weui-select" id="select3" name='area'>
                      <option value=''>请选择</option>
                  </select>
                </div>
              </div>
    		  <div class="weui-cells__title">详细地址</div>
              <div class="weui-cell">
                <div class="weui-cell__bd">
                      <textarea class="weui-textarea" id='detailss' name='detail' rows="3"></textarea>
                 </div>
              </div>
			  
			  <div class="weui-btn-area">
            	<a class="weui-btn weui-btn_primary" href="javascript:" id="xgmmzl">确定</a>
              </div>
		     </div>
			 
         </form>
		</div>  
      </div>
</div>		
		
		
		
<div id="full" class='weui-popup__container'>
      <div class="weui-popup__overlay"></div>
      <div class="weui-popup__modal">
		<div class="toolbar">
          <div class="toolbar-inner">
            <a href="javascript:;" id='close-popup' class="picker-button">关闭</a>
			<a href="javascript:;" style='display:none;' id='close' class="picker-button close-popup"></a>
            <h1 class="title">密码修改</h1>
          </div>
        </div>
		<div class="modal-content">
          <div class="weui-cells weui-cells_form">
          <div class="weui-cell">
            <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
            <div class="weui-cell__bd" id='phoneNo'>  
            </div>
          </div>
          <div class="weui-cell ">
            <div class="weui-cell__hd">
              <label class="weui-label">验证码</label>
            </div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="number" id='code' placeholder="请输入验证码">
            </div>
            <div class="weui-cell__ft">
              <button id='getCode' class="weui-vcode-btn">获取验证码</button>
            </div>
          </div>
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">新密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="password" id='password' placeholder="新密码">
            </div>
          </div>
		  <div class="weui-cell ">
            <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
            <div class="weui-cell__bd">
              <input class="weui-input" type="password" id='newpassword' placeholder="确认密码">
            </div>
          </div>
          </div>
		  <div class="weui-btn-area">
        	<a class="weui-btn weui-btn_primary" href="javascript:" id="xgmm">确定</a>
          </div>
        </div>
      </div>
</div>
<div id="time-container"></div>
</body>
<script data-main="${ctx}/js/cszj/user/profile" src="${ctx}/js/require.js"></script>
</html>