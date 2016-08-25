<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='/resources/vendor/bootstrap/css/bootstrap.min.css'
	type='text/css' rel="stylesheet" />
<style type="text/css">
.tdSpace td input {
	margin-left: 3px;
	margin-right: 3px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-lg-10 col-md-offset-1">

			<br>
			<form action="answerBoard?cpage=${cpage}" method="post">
				<input type="hidden" value="${board.b_num }" name="b_num" >
				<div style="margin-left: 50px;">
					<table border="1" cellpadding="0" cellspacing="0" class="table table-striped table-bordered table-hover">
						<tr height="30" class="tdSpace">
							<td width="100">제목</td>
							<td width="300"><input type="text" size="40" name="b_title" class="form-control"
								value="[re]${board.b_title }">
						</tr>
						<tr height="30" class="tdSpace">
							<td colspan="4">내용</td>

						</tr>
						<tr height="30" class="tdSpace">

							<td colspan="4"><textarea rows="20" cols="85"
									name="b_content" style="width: 99%;"></textarea></td>
						</tr>
						<tr height="30" class="tdSpace">
							<td colspan="4"><input type="submit" value="확인" class="btn btn-primary"> <input class="btn btn-primary"
								type="button" value="취소"></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>