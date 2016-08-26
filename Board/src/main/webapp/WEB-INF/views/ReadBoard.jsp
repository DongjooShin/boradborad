<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<link rel='stylesheet'
	href='/resources/vendor/bootstrap/css/bootstrap.min.css'
	type='text/css' rel="stylesheet" />

<script type="text/javascript">
	function goList() {

		location.href = "/board/listAll?cpage=${cpage}&rowPerPage=${rowPerPage}&searchType= &keyword= ";
	}
	function delBoard() {

		location.href = "/board/delBoard?cpage=${cpage}&rowPerPage=${rowPerPage}&b_num=${board.b_num }&b_group=${board.b_group}";
	}
	function ModifyBoard() {

		location.href = "/board/ModifyBoard?cpage=${cpage}&rowPerPage=${rowPerPage}&b_num=${board.b_num }";
	}
	
	function answer() {
		location.href = "/board/answerBoard?cpage=${cpage}&rowPerPage=${rowPerPage}&b_num=${board.b_num }";
	}
	
</script>
</head>
<body>
	<div class="row" style="margin-bottom 100px;">
		<div class="col-lg-10 col-md-offset-1">

			<br>

			<table border="1" cellpadding="0" cellspacing="0"
				style="margin-bottom: 15px"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<tr height="30" class="tdSpace">
					<td width="100">글번호</td>
					<td width="250">${board.b_num }</td>
					<td width="100">작성시간</td>
					<td width="200"><fmt:formatDate value="${board.b_date }"
							type="both" /></td>
				</tr>

				<tr height="30" class="tdSpace">
					<td width="100">제목</td>
					<td width="250">${board.b_title }</td>
					<td width="100">작성자</td>
					<td width="200">${board.m_id }
				</tr>
				<tr height="30" class="tdSpace">
					<td colspan="4">내용</td>

				</tr>
				<tr height="30" class="tdSpace">

					<td colspan="4"><textarea rows="20" cols="85" name="b_content"
							readonly="readonly" style="width: 99%;">${board.b_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="1">첨부파일</td>
					<td colspan="3"><c:forEach var="row" items="${boardAtta }">
							<a name="file" href="/board/download?atta_id=${row.atta_id }">${row.atta_name }</a>
							<label>(${row.atta_size })KB</label>
							<br>
						</c:forEach></td>
				</tr>
				<tr height="30" class="tdSpace">
					<td colspan="4"><input type="button" value="리스트"
						class="btn btn-primary" onclick="goList()"> <input
						type="button" value="답변" class="btn btn-primary"
						onclick="answer()"> <c:if test="${userFlag==0}">
							<input type="button" value="수정" onclick="ModifyBoard()"
								class="btn btn-primary">
							<input type="button" value="삭제" onclick="delBoard()"
								class="btn btn-primary">
						</c:if></td>
				</tr>

			</table>
			
			
		</div>
	</div>
</body>
</html>