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

<%@include file="./../../include/morris_charts_js_css.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	$('#registerForm').on("click", function(event) {
		self.location = "registerForm";
	});
	
	var result = '${msg}';
	
	if(result === 'SUCCESS') {
		alert('처리가 완료되었습니다.');
	}
});
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
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-list">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%; text-align: center;">#</th>
                                            <th style="text-align: center;">제목</th>
                                            <th style="width: 15%; text-align: center;">등록자</th>
                                            <th style="width: 15%; text-align: center;">등록일</th>
                                            <th style="width: 10%; text-align: center;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:forEach items="${list}" var="list" varStatus="status">
                                        <tr>
                                            <td style="text-align: center;">
                                            	${pageMaker.totalCount - ((pageMaker.paging.page - 1) * pageMaker.paging.perPageNum + status.index)}
                                            </td>
                                            <td>${list.title}</td>
                                            <td style="text-align: center;">${list.writer}</td>
                                            <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.wDate}" /></td>
                                            <td style="text-align: center;">${list.viewCnt}</td>
                                        </tr>                                    
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                            
                            <div class="text-right">
                            	<button type="button" id="registerForm" class="btn btn-primary btn-sm">등록</button>
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