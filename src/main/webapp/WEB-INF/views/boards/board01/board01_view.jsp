<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>WAO</title>

<%@include file="./../../include/common_js_css.jsp" %>

<!-- validate -->
<script type="text/javascript" src="/js/validate/jquery.validate.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#list').on('click', function() {
		$('#frm').attr('action','list');
		$('#frm').attr('method','get');
		$('#frm').attr('onsubmit','');
		$('#frm').submit();
	});
	
	var result = '${msg}';
	
	if(result === 'SUCCESS') {
		alert('처리가 완료되었습니다.');
	}
});

//등록 전 유효성 체크
function fnValidate() {
	
	$('#frm').validate({		
		//규칙
		rules: {
			title: {
				required: true,
				maxlength: 50
			},
			contents: {
				required: true
			}
		},
		//규칙체크 실패시 출력될 메세지
		messages: {
			title: {
				required: '필수로 입력하세요',
				maxlength: '최대 {50}글자이하로 작성하세요'
			},
			contents: {
				required: '필수로 입력하세요'
			}
		},
		//validation이 끝난 이후의 submit 직전 실행
		submitHandler: function() {
			var f = confirm('처리하시겠습니까?');
			if(f) {				
				return true;
			} else {
				return false;
			}
		}
	});	
}

function fnUpdate() {	
	
	//수정 전 유효성 체크 셋팅
	fnValidate();
	
	$('#frm').attr('action','update');
	$('#frm').attr('method','post');
	$('#frm').attr('onsubmit','');
	$('#frm').submit();
}


function fnDelete() {	
	
	$('#frm').attr('action','delete');
	$('#frm').attr('method','post');
	$('#frm').attr('onsubmit','');
	$('#frm').submit();
}
</script>

</head>
<body>
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			
			<%@include file="./../../include/header.jsp" %>
			
			<%@include file="./../../include/board_left.jsp" %>			
        </nav>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판1(기본)</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>        

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Default Data
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
							<form role="form" name="frm" id="frm" method="post" onsubmit="return false">
								<input type="hidden" name="bno" id="bno" value="${board01VO.bno}" />
								<input type="hidden" name="page" value="${paging.page}" />
								<input type="hidden" name="perPageNum" value="${paging.perPageNum}" />
								<div class="form-group">
									<label for="title">제목</label>
									<input class="form-control" name="title" id="title" value="${board01VO.title}" placeholder="제목을 입력하세요" />
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" name="writer" id="writer" value="${board01VO.writer}" readonly />
								</div>
								<div class="form-group">
									<label for="contents">내용</label>
									<textarea class="form-control" name="contents" id="contents" rows="5" placeholder="내용을 입력하세요">${board01VO.contents}</textarea>
								</div>
							</form>   
                        </div>
                        <!-- /.panel-body --> 						
                    </div>
                    <!-- /.panel -->
                    
                    <div class="text-right">
                    	<c:if test="${board01VO.writer == login.userId}">
                    	<button type="button" id="update" class="btn btn-primary btn-sm" onclick="javascript:fnUpdate();">수정</button>
                    	<button type="button" id="delete" class="btn btn-primary btn-sm" onclick="javascript:fnDelete();">삭제</button>
                    	</c:if>
                    	<button type="button" id="list" class="btn btn-primary btn-sm">목록</button>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
    	</div>        
		<!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
</body>
</html>