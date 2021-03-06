<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>이색 여행지에 대한 모든것!</title>
	 
	<!-- 부트스트랩 CSS 추가하기 -->	
	<link rel="stylesheet" href="./css/bootstrap.min.css">

    <!-- 커스텀 CSS 추가하기 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
	}
	
%>

	<nav class="navbar navbar-expand-lg navbar-light bg-dark">
		<a class="navbar-brand text-white" href="index.jsp">이색 여행지에 대한 모든것!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link text-white" href="index.jsp">메인</a>
				</li>
				
				<li class="nav-item active">
					<a class="nav-link text-white" href="bbs.jsp">게시판</a>
				</li>
				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle text-white" id="dropdown" data-toggle="dropdown">
						회원관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
					<%
						if(userID == null) {
					%>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
					<%
					} else{
					%>
						<a class="dropdown-item" href="userLogoutAction.jsp">로그아웃</a>
					<%
					}
					%>
					</div>
				</li>
			</ul>
			<form action="./bbsSearch.jsp" method="get" class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="search">
				<button class="btn btn-primary text-white my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
	</nav>
	
	<section class="container">
		<form method="post" action="./writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="1" style="backgroud-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>	
					<tr>	
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;" ></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex bd-highlight mb-3">
				<div class="mr-auto p-2 bd-highlight"></div>
				<div class="p-2 bd-highlight">
					<!-- writeAction으로 작성한 게시글 전송 -->
					<input type="submit" class="btn btn-primary mr-sm-2" value="글쓰기">
				</div>
			</div>
		</form>
	</section>
	
	
	
	
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2020김민규All Right Reserved.
	</footer>
	
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
    <!-- int형의 maxLength를 확인할 때 -->

</body>
</html>



