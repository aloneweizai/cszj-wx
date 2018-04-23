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
<script type="text/javascript">
     var ctx = "${ctx}";
</script>
</head>
<body ontouchstart>
<span class="weui-cell weui-cell_access weui-navbar__item weui-bar__item--on" style='background-color: #18b4ed;color:white;font-weight:bold;padding: 5px 15px;font-size: 20px;border-bottom: 1px solid #e5e5e5;'>
    <span class="weui-cell__bd" style='text-align: center;'>
		<label>财税专家账号微信绑定</label>
    </span>
</span>
<div class="weui-msg">
      <div class="weui-msg__icon-area"><i class="weui-icon-success weui-icon_msg"></i></div>
      <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">操作成功</h2>
        <p class="weui-msg__desc">您的微信账号将绑定财税专家账号!</p>
      </div>
      <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
          <a href="javascript:;" class="weui-btn weui-btn_primary">确认</a>
          <a href="javascript:;" class="weui-btn weui-btn_default">取消</a>
        </p>
      </div>
      <div class="weui-msg__extra-area">
        <div class="weui-footer">
          <p class="weui-footer__links">
            <a href="javascript:void(0);" class="weui-footer__link">ABC财税专家</a>
          </p>
          <p class="weui-footer__text">Copyright © 2008-2017 ABC艾博克</p>
        </div>
      </div>
</div>
<script src="${ctx}/js/jqweui/jquery.js"></script>
<script src="${ctx}/js/jqweui/jquery-weui.min.js"></script>
</body>
</html>