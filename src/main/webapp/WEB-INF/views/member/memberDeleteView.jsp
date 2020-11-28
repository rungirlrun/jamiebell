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
<title>회원탈퇴</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
			$(".cancle").on("click", function(){
				
				location.href= "/";
			})
			
			// submit
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
		
		// 비밀번호 유효성
			$.ajax({
				url : "/member/passChk",
				type : "POST",
				dataType : "json",
				data : $("#delForm").serializeArray(),
				success : function(data){
					if(data==true){
						console.log("여기까지 옴");
						if(confirm("회원탈퇴하시겠습니까?")){
							$("#delForm").submit();
						}
					}else{
						alert("패스워드가 틀렸습니다.");
						return;
					}
				}
			})
		});
	})
</script>
<body>
	<section id="container">
		<form action="/member/memberDelete" method="post" id="delForm">
			<div class="form-group has-feedback">
				<label class="control-label" for="userId">아이디</label>
				<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userPass">패스워드</label>
				<input class="form-control" type="password" id="userPass" name="userPass" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="userName">이름</label>
				<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}" readonly="readonly"/>
			</div>
		</form>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="button" id="submit">회원탈퇴</button>
			<button class="cancle btn btn-danger" type="button">취소</button>
		</div>
		<div>
			<c:if test="${msg == false}">
				비밀번호가 맞지 않습니다.
			</c:if>
		</div>
	</section>
</body>
</html>