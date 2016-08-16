<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#searchBtn').on("click",function(){
			var keyword = $('#keyword').val();
			var select = $("select option:selected").val();
			self.location = "/board/SearchListAll?cpage=1&searchType="+select+"&keyword="+keyword;


			
			
		});
	})
</script>
</head>
<body>
	<div>
		<h2>search</h2>
		<select name="searchType">
			<option value="t">제목</option>
			<option value="tc">제목+내용</option>
			<option value="w">글쓴이</option>
		</select>
		<input type="text" name="keyword" id="keyword">
		<input type="button" value="검색" id="searchBtn">
	
	</div>





	<h2>List Board</h2>

	<br>
	<div style="margin-left: 15%;">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr height="30" class="tdSpace">
				<td width="100" colspan="5">게시판</td>
			</tr>
			<tr height="30" class="tdSpace">
				<td width="50">번호</td>
				<td width="250">제목</td>
				<td width="100">작성자</td>
				<td width="180">날자</td>
				<td width="50">조회수</td>
			</tr>

			<c:forEach var="list" items="${list }" varStatus="loop">
				<tr height="30" class="tdSpace">
					<c:if test="${list.b_flag == 0 }">
						<td width="50"><c:if test="${list.b_depth ==0 }">${list.b_num }</c:if></td>
						<td width="300"><c:forEach begin="1" end="${list.b_depth }"
								step="1">&nbsp;&nbsp;&nbsp;</c:forEach> <a
							href="/board/ReadBoard?b_num=${list.b_num }"><c:if
									test="${list.b_depth !=0 }">ㄴ</c:if>${list.b_title }</a></td>
						<td width="100">${list.m_id }</td>
						<td width="100"><fmt:formatDate value="${list.b_date }"
								type="both" /></td>
						<td width="50">${list.b_count }</td>
					</c:if>

					<c:if test="${list.b_flag != 0 }">

						<td width="50"></td>
						<c:forEach begin="1" end="${list.b_depth }" step="1">&nbsp;&nbsp;&nbsp;</c:forEach>
						<td width="300">&nbsp;&nbsp;<c:if test="${list.b_depth !=0 }">ㄴ</c:if>삭제된
							게시물 입니다.
						</td>
						<td width="100"></td>
						<td width="100"></td>
						<td width="50"></td>

					</c:if>

				</tr>

			</c:forEach>
		</table>
	</div>


	<br>
	<br>
	<br>
	<br>
	<div style="text-align: center;">

		<c:if test="${page.preIcon != 1 }">
			<a href="/board/listAll?cpage=1"> << </a>
		</c:if>
		<c:if test="${page.preIcon != 1 }">
			<a href="/board/listAll?cpage=${page.startBlock-1 }"> &nbsp;< </a>
		</c:if>

		<c:forEach var="page" begin="${page.startBlock }"
			end="${page.endBlock }" step="1">
			<a href="/board/listAll?cpage=${page }">&nbsp;${page }</a>
		</c:forEach>
		<c:if test="${page.nextIcon != 1 }">
			<a href="/board/listAll?cpage=${page.endBlock+1 }"> &nbsp;> </a>
		</c:if>
		<c:if test="${page.nextIcon != 1 }">
			<a href="/board/listAll?cpage=${page.totalPage }"> &nbsp;>> </a>
		</c:if>
	</div>
	<br>
	<br>

	<a href="/board/insertBoard">글쓰기</a>
	




</body>
</html>