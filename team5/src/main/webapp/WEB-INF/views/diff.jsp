<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function recvSal4(data) {
		alert(data);
	}
	function btn_click(a) {
		console.log(a);
		$.get("fav", {
			'mycode' : a,
			'mycase' : 1
		}, recvSal4)
	}
	function recvSal3(data) {
		$('#mytable2').empty()
		if (data.length < 1) {
			$("#mytable").append(
					'<tr><td colspan = "8">검색한 데이터가 존재하지 않습니다.</td></tr>')
		} else {
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
		}
		$(".btn").click(function() {
			var checkBtn = $(this).attr("data-idx");
			btn_click(arr[checkBtn]);
		})
	}
	function fn3() {
		$.getJSON("search?mysearch=" + $("#myinput").val() + "&mylevel="
				+ $("#selected_id").val() + "&mytime="
				+ $("#selected_time").val(), recvSal3)
		$.getJSON("mwex?myinput=" + $('#myinput').val(), recvFn2);
		//console.log(data)
		//recvFn2(data);
	}
	function recvFn2(data) {
		$("#weatherResultTr2").empty();
		if (data.length < 1) {
			$("#weatherResultTr2").append(
					'<tr><td colspan = "6">검색한 데이터가 존재하지 않습니다.</td></tr>')
		} else {
			$.each(data, function(i, v) {
				console.log(data);
				$("#weatherResultTr2").append(
						'<tr><td>' + v.name + '</td><td>' + v.city
								+ '</td><td>' + v.temp + '°C</td><td>'
								+ v.seupdo + '%</td><td>' + v.punghyang
								+ '</td><td>' + v.pungsok + 'm/s</td><tr>')
			})
		}
	}
</script>
</head>
<body>
	산 이름을 검색하세요 :
	<input id="myinput" type="text" name="mysearch" size="20">
	<br> 가능하신 등산 소요시간을 선택하세요 :
	<select id="selected_time" name="mytime">
		<option value="none">선택</option>
		<option value="low">5분 미만</option>
		<option value="medium">5분 이상~1시간 미만</option>
		<option value="high">1시간 이상</option>
	</select>
	<br> 난이도를 입력하세요 :
	<select id="selected_id" name="mylevel">
		<option value="none">선택</option>
		<option value="low">쉬움</option>
		<option value="medium">중간</option>
	</select>
	<br>
	<button onclick="fn3()">검색</button>
	<br>
		<table id="mytable">
			<thead>
				<tr>
					<th>산 이름</th>
					<th>산 주소</th>
					<th>등산로 이름</th>
					<th>등산로 길이</th>
					<th>등산 소요시간</th>
					<th>등산로 난이도</th>
					<th>위험 요소</th>
					<th>즐겨찾기</th>
				</tr>
			</thead>
			<tbody id="mytable2">
			</tbody>
		</table>
	<table id="weatherResult2">
		<thead>
			<tr>
				<th>산 이름</th>
				<th>지역</th>
				<th>기온</th>
				<th>습도</th>
				<th>풍향</th>
				<th>풍속</th>
			</tr>
		</thead>
		<tbody id="weatherResultTr2">
		</tbody>
	</table>
</body>
</html>