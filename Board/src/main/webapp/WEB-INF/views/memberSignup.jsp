<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel='stylesheet'
	href='/resources/vendor/bootstrap/css/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<script type="text/javascript">
	$(function() {
		$('#idCheckLabel').css('display', 'block');
		$('#id_Check').on('click', function() {

			var insertId = $('#m_id').val();

			if (insertId == "") {
				alert("아이디를 입력하세요")
				return;
			}

			var reg_id = /^[0-9a-z]{6,12}$/;
			if (!reg_id.test($("#m_id").val())) {
				alert("아이디 형식이 잘못되었습니다.");
				$("#m_id").val('');
				return;
			}

			$.ajax({

				url : '/member/idCheck',
				type : 'post',
				data : {
					"id" : insertId
				},
				success : function(id) {
					//return 값이 0이면 중복되는 아이디 없음
					if (id == 0) {
						$('.idCheckLabel').css('display', 'none');
						$('#UseId').css('display', 'block');
						$('#idCheck').val(1);
					} else {
						$('.idCheckLabel').css('display', 'none');
						$('#notUseId').css('display', 'block');
						$('#idCheck').val(0);
					}
				},
				error : function() {
					alert("에러!");
				}

			});

		});

		$("#m_pw").on("change", function() {
			var reg_pwd = /^((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{2,15})$/;

			if (!reg_pwd.test($("#m_pw").val())) {
				alert("비밀번호 입력이 옳다르지 않습니다.");
				$("#m_pw").val("");

			}
		});

		$("#m_email")
				.on(
						"change",
						function() {
							var reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
							if (!reg_email.test($("#m_email").val())) {
								alert("이메일 입력이 옳다르지 않습니다.");

							}
						});
		$('#m_pw_check').on('change', function() {

			if ($('#m_pw_check').val() == $('#m_pw').val()) {
				$('.passwordCheckLabel').css('display', 'none');
				$('#samePassword').css('display', 'block');

			} else {
				$('.passwordCheckLabel').css('display', 'none');
				$('#unSamePassword').css('display', 'block');

			}

		});

	})

	function checkIdFuc() {
		if ($('#idCheck').val() == 0) {
			alert("아이디 중복 확인을 해주세요");
			return false;
		}
		if ($('#m_pw_check').val() != $('#m_pw').val()) {
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			return false;
		}

		if ($('#m_pw').val() == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if ($('#m_pw_check').val() == "") {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}

		if ($('#m_name').val() == "") {
			alert("이름을 입력하세요.");
			return false;
		}

		if ($('#m_email').val() == "") {
			alert("이메일을 입력하세요.");
			return false;
		}

	}

	function cancle() {
		location.href = "/member/login";
	}
</script>
<style type="text/css">
.idCheckLabel {
	display: none;
	font-weight: bold;
}

#UseId {
	color: blue;
}

#notUseId {
	color: red;
}

.passwordCheckLabel {
	display: none;
	font-weight: bold;
}

#unSamePassword {
	color: red;
}

#samePassword {
	color: blue;
}

div {
	margin-bottom: 15px;
}
input {
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-10 col-md-offset-1">

			<br> <br>
			<h2>SignUp</h2>

			<br> <br>


			<div>
				<form action="/member/memberSignUp" method="post" name="signUp"
					onsubmit="return checkIdFuc()">
					<input type="hidden" id="idCheck" value="0">
					<div class="col-md-12">
						<div class="col-md-1">
							<p>아이디</p>
						</div>
						<div class="col-md-3">
							<input type="text" name="m_id" id="m_id" size="35"
								class="form-control">
						</div>
						<div class="col-md-2">
							<input type="button" value="중복확인" id="id_Check"
								class="btn btn-primary">
						</div>
						<div class="col-md-6">
							<label id="idCheckLabel" class="idCheckLabel">중복확인을 해주세요.</label>
							<label id="notUseId" class="idCheckLabel">중복된 아이디 입니다. 다시
								입력해 주세요.</label> <label id="UseId" class="idCheckLabel">사용가능한
								아이디 입니다.</label>
						</div>

						<div class="col-md-11 col-md-offset-1">
							<p>6~12자리 영문 소문자와 숫자를 혼합하여 사용하세요.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-1">
							<p>비밀번호</p>
						</div>
						<div class="col-md-3">
							<input type="password" name="m_pw" id="m_pw" size="35"
								class="form-control">
						</div>
						<div class="col-md-8">
							<p>8 ~ 16자리 영문 대 소문자, 숫자, 특수문자를 혼합하여 사용하세요.</p>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-1">
							<p>비밀번호확인</p>
						</div>
						<div class="col-md-3">
							<input type="password" id="m_pw_check" size="35"
								class="form-control">
						</div>
						<div class="col-lg-8">
							<label id="unSamePassword" class="passwordCheckLabel">패스워드가
								일치하지 않습니다.</label> <label id="samePassword" class="passwordCheckLabel">패스워드가
								일치합니다.</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-1">
							<p>이름</p>
						</div>
						<div class="col-md-3">
							<input type="text" name="m_name" size="35" class="form-control">
						</div>
					</div>
					<div class="col-md-12">
						<div class="col-md-1">
							<p>이메일</p>
						</div>
						<div class="col-md-3">
							<input type="text" name="m_email" id="m_email" size="35"
								class="form-control"> <br>
						</div>
					</div>

					<div class="col-md-11 col-md-offset-1">
						<input type="submit" value="확인" class="btn btn-primary"><input
							type="button" value="취소" class="btn btn-primary"
							onclick="cancle()">
					</div>
				</form>



			</div>
			<br> <br>
		</div>
	</div>
</body>
</html>