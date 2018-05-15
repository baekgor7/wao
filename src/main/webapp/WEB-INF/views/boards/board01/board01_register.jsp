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
	$('#list').on('click', function() {
		self.location = 'list';
	});
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
							<form role="form">
								<div class="form-group">
									<label for="title">제목</label>
									<input class="form-control" name="title" id="title" placeholder="제목을 입력하세요" />
								</div>
								<div class="form-group">
									<label>작성자</label>
									<input class="form-control" value="${login.userId}" disabled />
								</div>
								<div class="form-group">
									<label for="contents">내용</label>
									<textarea class="form-control" name="contents" id="contents" rows="5" placeholder="내용을 입력하세요"></textarea>
								</div>
							</form>   
                        </div>
                        <!-- /.panel-body --> 						
                    </div>
                    <!-- /.panel -->
                    
                    <div class="text-right">
                    	<button type="button" id="register" class="btn btn-primary btn-sm">등록</button>
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