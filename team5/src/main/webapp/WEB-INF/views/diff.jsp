<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	function alert1(data) {
		alert(data);
	}
	function btn_click(a) {
		console.log(a);
		$.get("fav", {
			'mycode' : a,
			'mycase' : 1
		}, alert1)
	}
	function makeTab(data) {
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
													+ "\">즐겨찾기 추가</button></td></tr>")
						})
		$(".btn").click(function() {
			var checkBtn = $(this).attr("data-idx");
			btn_click(arr[checkBtn]);
		})
	}
	function recommendMountain() {
		$('#mytable').empty()
		$.getJSON("search?mysearch=" + $("#myinput").val() + "&mylevel="
				+ $("#selected_id").val() + "&mytime="
				+ $("#selected_time").val(), makeTab)
	}
</script>
</head>
<body>
	<div style="text-align: left;">
		산 이름을 검색하세요 : <input id="myinput" type="text" name="mysearch"
			size="20"> <br> <br> 가능하신 등산 소요시간을 선택하세요 : <select
			id="selected_time" name="mytime">
			<option value="none">선택</option>
			<option value="low">5분 미만</option>
			<option value="medium">5분 이상~1시간 미만</option>
			<option value="high">1시간 이상</option>
		</select> <br> <br> 난이도를 입력하세요 : <select id="selected_id"
			name="mylevel">
			<option value="none">선택</option>
			<option value="low">쉬움</option>
			<option value="medium">중간</option>
		</select> <br> <br>
		<button onclick="recommendMountain()" style="width: 200px;">검색</button>
		<br> <br>
		<table id="mytable" class="table table-striped">
		</table>
	</div>
</body>
</html>