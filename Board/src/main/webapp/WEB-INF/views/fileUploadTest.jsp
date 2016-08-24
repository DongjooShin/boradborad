<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<script type="text/javascript">
$(function() {
 	$('#fileDrop').on("dragenter dragover", function(event) {
		event.preventDefault();
	}); 
	$('#fileDrop').on("drop", function(event) {
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		console.log(file);
		
	}); 
});
	
</script>
</head>
<body>

	<h1>File Upload Test</h1>

	<form action="/board/uploadForm" method="post"
		enctype="multipart/form-data">
		<div style="border: 1px dotted blue; width: 500px; height: 200px;"
			id="fileDrop"></div>
		<input multiple="multiple" type="file" name="file" />
	<input type="submit" value="제출">
	</form>
</body>
</html>