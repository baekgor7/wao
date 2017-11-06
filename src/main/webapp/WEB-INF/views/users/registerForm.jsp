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
	
	//회원가입 전 유효성 체크 셋팅
	fnValidate();
});

//회원가입 전 유효성 체크
function fnValidate() {
	
	$('#frm').validate({		
		//규칙
		rules: {
			userId: {
				required: true,
				minlength: 5,
				maxlength: 20,
				remote: {
					url: '/users/userIdCheck',
					type: 'post'
				}
			},
			userNm: {
				required: true,
				minlength: 2,
				maxlength: 20
			},
			email: {
                required : true,
                minlength : 2,
                email : true
            },
			password: {
                required : true,
                minlength : 3,
				maxlength: 20
            },
            password_confirmation: {
                required : true,
                minlength : 3,
				maxlength: 20,
                equalTo : '#password'
            }
		},
		//규칙체크 실패시 출력될 메세지
		messages: {
			userId: {
				required: '필수로 입력하세요',
				minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다',
				remote: '존재하는 아이디입니다.'
			},
			userNm: {
				required: '필수로 입력하세요',
				minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다'
			},
			email: {
                required : '필수로 입력하세요',
                minlength : '최소 {0}글자이상이어야 합니다',
                email : "메일규칙에 어긋납니다"
            },
			password: {
                required : '필수로 입력하세요',
                minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다'
            },
            password_confirmation: {
                required : '필수로 입력하세요',
                minlength: '최소 {0}글자이상이어야 합니다',
				maxlength: '최대 {0}글자이하이어야 합니다',
                equalTo : '비밀번호가 일치하지 않습니다'
            }
		},
		//validation이 끝난 이후의 submit 직전 실행
		submitHandler: function() {
			var f = confirm('등록하시겠습니까?');
			if(f) {
				//비밀번호 암호화
				var hash = CryptoJS.SHA256($('#password').val());
				$('#encPw').val(hash.toString(CryptoJS.enc.Base64));
				$('#password').val('');					//pw값 없애기
				$('#password_confirmation').val('');	//pw값 없애기
				
				return true;
			} else {
				return false;
			}
		}
	});	
}

function fnRegister() {	
	
	$('#frm').attr('action','/users/register');
	$('#frm').attr('method','post');
	$('#frm').attr('onsubmit','');
	$('#frm').submit();
}

</script>
</head>
<body>
<div class="container">

	<div class="row" style="margin-top:20px">
	    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" name="frm" id="frm" method="post" onsubmit="return false">
				<input type="hidden" name="encPw" id="encPw" />
				<h2>Please Sign Up <!-- <small>It's free and always will be.</small> --></h2>
				<hr class="colorgraph" />
				<div class="form-group">
					<input type="text" name="userId" id="userId" class="form-control input-lg" placeholder="User ID" tabindex="1" />
				</div>
				<div class="form-group">
					<input type="text" name="userNm" id="userNm" class="form-control input-lg" placeholder="User Name" tabindex="2" />
				</div>				
				<div class="form-group">
					<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="3" />
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="4" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="5" />
						</div>
					</div>
				</div>
				
				<hr class="colorgraph" />
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<a href="#" class="btn btn-primary btn-block btn-lg" tabindex="6" onclick="javascript:fnRegister();">Register</a>
					</div>
					<div class="col-xs-12 col-md-6">
						<a href="/users/loginForm" class="btn btn-success btn-block btn-lg" tabindex="7">Sign In</a>
					</div>
				</div>
			</form>
		</div>
	</div>

</div>

</body>
</html>