<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<c:if test="${!empty rstmodel}">
	<table>
			<tr>
				<th>지역</th>
				<th>현재온도</th>
				<th>체감온도</th>
				<th>습도</th>
			</tr>
			<tr>
				<td>${rstmodel.name}</td>
				<td>${rstmodel.temp}°C</td>
				<td>${rstmodel.chegam}°C</td>
				<td>${rstmodel.seupdo}%</td>
			</tr>
		</table>
	</c:if>
</body>
</html>