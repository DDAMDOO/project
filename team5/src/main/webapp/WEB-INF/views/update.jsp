<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script> 
function recvJson(data) {
	$("#mytable").append("<tr><th>id</th><th>pw</th><th>name</th><th>birth</th><th>email</th><th>gender</th></tr>")
	$.each(data, (i, v)=>{
		console.log(i, v.id, v.pw, v.name, v.birth, v.email, v.gender)
		$("#mytable").append("<tr><td>"+v.id+"</td><td>"+v.pw+"</td><td>"+v.name+"</td><td>"+v.birth+"</td><td>"+v.email+"</td><td>"+v.gender+"</td>")
	})
}

function viewFn() {
	$.getJSON("update1",recvJson)
}
</script>
</head>
<body onload="viewFn()">
<h1>update success</h1>
	<table id="mytable"></table>
</body>
</html>