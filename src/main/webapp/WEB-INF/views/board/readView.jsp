<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		// 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();				
		});
		
		// 삭제
		$(".delete_btn").on("click", function(){
			
			var deleteYN =  confirm("삭제하시겠습니까?");
			
			if(deleteYN == true){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}

		});
		
		// 취소
		$(".list_btn").on("click", function(){
			
			location.href = "/board/list";
		});
		
		// 목록
		$(".list_btn").on("click", function(){
		
		location.href = "/board/list?page=${scri.page}"
		+"&perPageNum=${scri.perPageNum}"
		+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
		//댓글 작성 
		$(".replyWriteBtn").on("click", function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "/board/replyWrite");
			formObj.submit();		
		});
		
		//댓글 수정 View 
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?bno=${read.bno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
		});
		
		
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?bno=${read.bno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}"
						+ "&rno="+$(this).attr("data-rno");
		});

		// 첨부파일 다운로드
		function fn_fileDown(fileNo){
			alert("함수 실행");
			
			}

		// onclick 안쓰려고 id값으로 따로 줌
		$("#file_down").on("click", function(){
			var fileNo = $(this).attr("data-rno");
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/board/fileDown");
			formObj.submit();
			})
		
		
	})
	</script>
	<body>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 보기
			</nav>
			<hr />
			<section id="container">
				<form name="readForm" role="form" method="post">
				  <input type="hidden" id="bno" name="bno" value="${read.bno}" />
				  <input type="hidden" id="page" name="page" value="${scri.page}"> 
				  <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
				  <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
				  <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				  <input type="hidden" id="FILE_NO" name="FILE_NO" value="">
				</form>
				
			
			<!-- <label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}" />  -->
			
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<input type="text" id="title" name="title" class="form-control" value="${read.title}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="contents" class="col-sm-2 control-label">내용</label>
				<textarea id="contents" name="contents" class="form-control" readonly="readonly"><c:out value="${read.contents}" /></textarea>
			</div>
			<div class="form-group">
				<label for="writer" class="col-sm-2 control-label">작성자</label>
				<input type="text" id="writer" name="writer" class="form-control" value="${read.writer}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="regdte" class="col-sm-2 control-label">작성날짜</label>
				<fmt:formatDate value="${read.regdte}" pattern="yyyy-MM-dd HH:mm:ss"/>
			</div>
				<hr>
					<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" id="file_down" data-rno="${file.file_no}">${file.org_file_name}</a>(${file.file_size}kb)<br>
					</c:forEach>
				</div>
				<hr>
				<div>
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
				</div>
				<!--댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								작성자 : ${replyList.writer}<br />
								작성 날짜 : <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</p>
								
								<p>${replyList.contents}</p>
								<div>
									<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
								</div>
							</li>
						</c:forEach>
					</ol>
				</div>
				
				<!--댓글 작성 -->
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}" />
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}" />
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}" />
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
					
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="writer" name="writer" class="form-control" />
						</div>
					</div>
						
					<div class="form-group">
						<label for="contents" class="col-sm-2 control-label">댓글 내용</label>
						<div class="col-sm-10">
							<input type="text" id="contents" name="contents" class="form-control"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>