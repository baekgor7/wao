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

<!-- S : 달력 -->
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-ui.js"></script>
<!-- E : 달력 -->


<script type="text/javascript">
$(document).ready(function() {
	$('#writeForm').on("click", function(event) {
		self.location = "writeForm";
	});
	
	$('#search').on("click", function() {
		$('#frm').attr("method","get");
		$('#frm').attr("action","/boards/board01/list");
		$('#frm').submit();
	});
	
	var result = '${msg}';
	
	if(result === 'SUCCESS') {
		alert('처리가 완료되었습니다.');
	}
	
	fn_calendar_init('fromDate');	
	fn_calendar_init('toDate');	
});

//달력셋팅
function fn_calendar_init(obj_id) {
	$("#" + obj_id).datepicker({
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
        changeYear : true,
        nextText: '다음 달',
        prevText: '이전 달',
        //dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        //monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        showMonthAfterYear: true,
        showOtherMonths: true,
        showButtonPanel: true,
      	selectOtherMonths: true,
      	closeText: "닫기",
      	currentText: "오늘"
	});
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
	            	<form class="form-horizontal" role="form" id="frm" name="frm">
						<div class="form-group">
							<label for="title" class="col-sm-1 control-label">제목</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="title" name="title" />
							</div>
							<div class="col-sm-1">
								<button type="button" id="search" name="search" class="btn btn-default">조회</button>
							</div>								
						</div> 
						<div class="form-group">
							<label for="fromDate" class="col-sm-1 control-label">등록일</label>								
							<div class="col-sm-2">
								<input type="text" class="form-control" id="fromDate" name="fromDate" maxlength="10" />
							</div>
							<div class="col-sm-1 text-center form-control-static">~</div>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="toDate" name="toDate" maxlength="10" />
							</div>
						</div>
	            	</form>     

            	</div>
            </div>  

            <div class="row">            
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Default Data
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-list">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%; text-align: center;">#</th>
                                            <th style="text-align: center;">제목</th>
                                            <th style="width: 15%; text-align: center;">등록자</th>
                                            <th style="width: 15%; text-align: center;">등록일</th>
                                            <th style="width: 10%; text-align: center;">첨부파일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td style="text-align: center;">
                                            	${pageMaker.totalCount - ((pageMaker.paging.page - 1) * pageMaker.paging.perPageNum + status.index)}
                                            </td>
                                            <td><a href="/boards/board01/view${pageMaker.makeQuery(pageMaker.paging.page)}&bno=${list.bno}">${list.title} [${list.viewCnt}]</a></td>
                                            <td style="text-align: center;">${list.writer}</td>
                                            <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.wDate}" /></td>
                                            <td style="text-align: center;"></td>
                                        </tr>                                    
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                            <div class="text-right">
                            	<button type="button" id="writeForm" class="btn btn-primary btn-sm">등록</button>
                            </div>
                            
	                        <div class="box-footer">
			                    <div class="text-center">
			                        <ul class="pagination">
			                            <c:if test="${pageMaker.prev}">
			                                <li><a href="list${pageMaker.makeQuery(pageMaker.startPage -1)}">&laquo;</a> </li>
			                            </c:if>
			                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			                                <li <c:out value="${pageMaker.paging.page == idx? 'class = active':''}"/>>
			                                    <a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
			                                </li>
			                            </c:forEach>
			
			                        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			                            	<li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a> </li>
			                        	</c:if>
			                        </ul>
			                    </div>
			                </div>
							<!-- /.box-footer-->                            
                            
                        </div>
                        <!-- /.panel-body --> 						
                    </div>
                    <!-- /.panel -->
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