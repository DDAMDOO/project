<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function recvSal4(data) {
		alert(data);
	}
	function btn_click(a) {
		console.log(a);
		$.get("fav", {
			'mycode' : a,
			'mycase' : 2
		}, recvSal4)
	}
	function recvSal3(data) {
		$("#mytable")
				.append(
						"<tr><th>산 이름</th><th>산 주소</th><th>등산로 이름</th><th>등산로 길이</th><th>등산 소요시간</th><th>등산로 난이도</th><th>위험 요소</th><th>즐겨찾기</th></tr>")
		var arr = new Array();
		$
				.each(
						data,
						function(i, v) {
							arr[i] = v.climb_code;
							console.log(arr[i])
							$("#mytable")
									.append(
											"<tr><td>"
													+ v.m_name
													+ "</td><td>"
													+ v.m_addr
													+ "</td><td>"
													+ v.climb_name
													+ "</td><td>"
													+ v.climb_len
													+ "</td><td>"
													+ v.climb_time
													+ "</td><td>"
													+ v.climb_diff
													+ "</td><td>"
													+ v.climb_risk
													+ "</td><td><button class=\"btn\" onclick=\"btn_click();\" data-idx=\""
													+ i
													+ "\">즐겨찾기 해제</button></td></tr>")
						})
		$(".btn").click(function() {
			var checkBtn = $(this).attr("data-idx");
			btn_click(arr[checkBtn]);
		})
	}
	function fn3() {
		$('#mytable').empty()
		$.getJSON("favorite", recvSal3)
	}
</script>
</head>
<body onload="fn3()">
	<table id="mytable" class="table table-borderless" style="text-align: center;"></table>
</body>
</html>