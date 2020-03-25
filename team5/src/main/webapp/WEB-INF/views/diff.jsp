<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function recvSal(data) {
		$("#mytable").append(
				"<tr><th>산 이름</th><th>산 위치</th><th>산 뀨뀨<</th></tr>")
		$.each(data, function(i, v) {
			$("#mytable").append(
					"<tr><td>" + v.m_name + "</td><td>" + v.m_loc + "</td><td>"
							+ v.m_lat + "</td></tr>")
		})
	}
	function fn() {
		$('#mytable').empty()
		s = "search?mysearch=" + $("#myt").val() + "&level="
				+ $("#selected_id").val()
		console.log(s)
		$.getJSON("search?mysearch=" + $("#myt").val() + "&level="
				+ $("#selected_id").val(), recvSal)
	}
</script>

</head>
<body>
	난이도를 입력하세요 :
	<select id="selected_id" name="level">
		<option value="none">선택</option>
		<option value="low">하</option>
		<option value="medium">중</option>
		<option value="high">상</option>
	</select>
	<br> 검색하실 주소를 입력하세요 :
	<input id="myt" type="text" name="mysearch" size="20">
	<button onclick="fn()">검색</button>
	<br>
	<table id="mytable">
	</table>
</body>
</html>