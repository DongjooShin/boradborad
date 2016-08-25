<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='/resources/vendor/bootstrap/css/bootstrap.min.css' type='text/css' rel="stylesheet" />
<script type="text/javascript">
	function signUp() {

		location.href = "/member/memberSignUp";

	}
</script>
<style type="text/css">


#changeLetter1 {
	color: red;
	font-weight: bold;
	font-size: 13px;
}

#changeLetter2 {
	color: red;
	margin-bottom: 15px;
	font-weight: bold;
	font-size: 13px;
}
#loginForm{
	margin-top: 200px;
}
</style>
</head>

<body>


	<div class="container" id="loginForm">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form action="/member/login" method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="아이디" name="id" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="비밀번호" name="pw"
										type="password" value="">
								</div>
								<c:if test="${loginFlag ==0}">
									<p id="changeLetter1">아이디 또는 비밀번호를 다시 확인하세요.</p>
									<p id="changeLetter2">등록되지 않은 아이디이거나,아이디 또는 <br>비밀번호를 잘못입력하셨습니다.</p>
								</c:if>

								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="Login"> <input type="button"
									class="btn btn-lg btn-success btn-block" value="SignUp"
									onclick="signUp()">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>