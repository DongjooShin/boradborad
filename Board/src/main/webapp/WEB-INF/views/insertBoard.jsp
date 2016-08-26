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
		$('#sendMail').on("click", function() {
			$('#Email').toggle();
		})
		
		$('#emailText').on(
				"change",
				function() {
					var reg_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					if (!reg_email.test($("#emailText").val())) {
						alert("이메일 입력이 옳다르지 않습니다.");

					}
				});
		
		
		
		
	});
</script>
<style type="text/css">
.tdSpace td input {
	margin-left: 3px;
	margin-right: 3px;
}

#Email {
	display: none;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-lg-10 col-md-offset-1">

			<br>
			<form action="insertBoard" method="post"
				enctype="multipart/form-data">
				
					<table border="1" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover" id="dataTables-example">
						<tr height="30" class="tdSpace">
							<td width="100">제목</td>
							<td width="300"><input type="text" size="50" name="b_title"class="form-control">
							<td width="100"><input id="sendMail" type="button" size="40"
								value="메일 발송" class="btn btn-primary"><input type="hidden"  value="${rowPerPage }" name="rowPerPage">
						</tr>
						<tr id="Email" height="30" class="tdSpace">
							<td colspan="1">이메일</td>
							<td colspan="4"><input type="text" size="50" name="email" class="form-control" id="emailText">
							
						</tr>
						<tr height="30" class="tdSpace">
							<td colspan="4">내용</td>

						</tr>
						<tr height="30" class="tdSpace">

							<td colspan="4"><textarea rows="20" cols="85"
									name="b_content" style="width: 99%;" class="form-control"></textarea></td>
						</tr>
						<tr height="30" class="tdSpace">
							<td colspan="1">파일 업로드</td>
							<td colspan="3">
							<input multiple="multiple" type="file" name="file" class="form-group" />
						</tr>
						<tr height="30" class="tdSpace">
							<td colspan="4"><input type="submit" value="글쓰기" class="btn btn-primary"> <input
								type="button" value="취소" class="btn btn-primary"> </td>
						</tr>
					</table>
				
			</form>
		</div>
	</div>
</body>
</html>