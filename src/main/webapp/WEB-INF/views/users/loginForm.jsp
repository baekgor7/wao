<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>WAO</title>

<%@include file="../include/common_js_css.jsp" %>

<!-- bootstrap free down css -->
<link href="/css/user.css" rel="stylesheet">

<!-- validate -->
<script type="text/javascript" src="/js/validate/jquery.validate.min.js"></script>

<!-- crypto-js : 비밀번호등 암호화 -->
<script type="text/javascript" src="/js/crypto/aes.js"></script>
<script type="text/javascript" src="/js/crypto/sha256.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	//bootstrap 디자인 가져온 스크립트(최초 실행)
	readyFn();	
	
	//회원가입 전 유효성 체크 셋팅
	fnValidate();
	
	var result = '${msg}';
	if(result == 'SUCCESS') {
		alert('처리가 완료되었습니다.');
	}
	else if(result == 'FAIL') {
		alert('아이디 또는 비밀번호가 틀렸습니다.');
	}
});

//회원가입 전 유효성 체크
function fnValidate() {
	
	$('#frm').validate({		
		//규칙
		rules: {
			userId: {
				required: true,
				minlength: 5,
				maxlength: 20
			},
			password: {
                required : true,
                minlength : 3,
				maxlength: 20
            }
		},
		//규칙체크 실패시 출력될 메세지
		messages: {
			userId: {
				required: '필수로 입력하세요',
				minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다'
			},
			password: {
                required : '필수로 입력하세요',
                minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다'
            }
		},
		//validation이 끝난 이후의 submit 직전 실행
		submitHandler: function(form) {

			//비밀번호 암호화
			var hash = CryptoJS.SHA256($('#password').val());
			$('#password').val(hash.toString(CryptoJS.enc.Base64));
			
			form.action = '/users/login';
			form.submit();
		}
	});	
}

//bootstrap login script
function readyFn() {
    $('.button-checkbox').each(function(){
		var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
					on: {
						icon: 'glyphicon glyphicon-check'
					},
					off: {
						icon: 'glyphicon glyphicon-unchecked'
					}
			};

		$button.on('click', function () {
			$checkbox.prop('checked', !$checkbox.is(':checked'));
			$checkbox.triggerHandler('change');
			updateDisplay();
		});

		$checkbox.on('change', function () {
			updateDisplay();
		});

		function updateDisplay() {
			var isChecked = $checkbox.is(':checked');
			// Set the button's state
			$button.data('state', (isChecked) ? "on" : "off");

			// Set the button's icon
			$button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

			// Update the button's color
			if (isChecked) {
				$button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
			}
			else
			{
				$button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
			}
		}
		function init() {
			updateDisplay();
			// Inject the icon if applicable
			if ($button.find('.state-icon').length == 0) {
				$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
			}
		}
		init();
	});
}
</script>
</head>
<body>
<div class="container">

	<div class="row" style="margin-top:20px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" name="frm" id="frm" method="post" onsubmit="return false">
				<input type="hidden" name="encPw" id="encPw" />
				<fieldset>
					<h2>Please Sign In</h2>
					<hr class="colorgraph" />
					<div class="form-group">
	                    <input type="text" name="userId" id="userId" class="form-control input-lg" placeholder="User ID" />
					</div>
					<div class="form-group">
	                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" />
					</div>
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info">Remember Me</button>
	                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden" />
						<a href="" class="btn btn-link pull-right">Forgot Password?</a>
					</span>
					<hr class="colorgraph" />
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
	                        <input type="submit" class="btn btn-lg btn-success btn-block" value="Sign In" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="/users/registerForm" class="btn btn-lg btn-primary btn-block">Register</a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

</div>



</body>
</html>