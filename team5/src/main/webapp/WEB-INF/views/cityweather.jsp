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
</head>
<body>
	<form action="index">
		<div style="text-align: center;">
			<h4>
				날씨를 보고싶은 지역을 선택해주세요 <select name="selOne" id="selOne">
					<option value="강릉">강릉</option>
					<option value="강진군">강진</option>
					<option value="강화">강화</option>
					<option value="거제">거제</option>
					<option value="경주시">경주</option>
					<option value="고창">고창</option>
					<option value="광주">광주</option>
					<option value="구미">구미</option>
					<option value="군산">군산</option>
					<option value="김해시">김해</option>
					<option value="대구">대구</option>
					<option value="대전">대전</option>
					<option value="동해">동해</option>
					<option value="목포">목포</option>
					<option value="보령">보령</option>
					<option value="봉화">봉화</option>
					<option value="부산">부산</option>
					<option value="부안">부안</option>
					<option value="부여">부여</option>
					<option value="서울" selected="selected">서울</option>
					<option value="속초">속초</option>
					<option value="수원">수원</option>
					<option value="순천">순천</option>
					<option value="안동">안동</option>
					<option value="양산시">양산</option>
					<option value="양평">양평</option>
					<option value="여수">여수</option>
					<option value="영월">영월</option>
					<option value="완도">완도</option>
					<option value="울산">울산</option>
					<option value="원주">원주</option>
					<option value="인제">인제</option>
					<option value="인천">인천</option>
					<option value="장흥">장흥</option>
					<option value="전주">전주</option>
					<option value="제주">제주</option>
					<option value="진주">진주</option>
					<option value="창원">창원</option>
					<option value="천안">천안</option>
					<option value="철원">철원</option>
					<option value="청주">청주</option>
					<option value="춘천">춘천</option>
					<option value="충주">충주</option>
					<option value="태백">태백</option>
					<option value="통영">통영</option>
					<option value="파주">파주</option>
					<option value="포항">포항</option>
					<option value="합천">합천</option>
					<option value="홍천">홍천</option>
					<option value="흑산도">흑산도</option>
				</select>
				<button onclick="weather()" type="button">검색</button>
			</h4>
		</div>
	</form>
	<table id="weatherResult" class="table table-borderless"
		style="text-align: center;">
		<tr>
			<th>지역</th>
			<th>현재온도</th>
			<th>체감온도</th>
			<th>습도</th>
		</tr>
		<tr id="weatherResultTr"></tr>
	</table>
	<script type="text/javascript">
		function weatherRecvFn(data) {
			$("#weatherResultTr").empty();
			$("#weatherResultTr")
					.append(
							'<td>' + data.name + '</td><td>' + data.temp
									+ '°C</td><td>' + data.chegam + '°C</td><td>'
									+ data.seupdo + '%</td>')
		}

		function weather() {
			data = $.getJSON("index?selOne=" + $('#selOne').val(),
					weatherRecvFn)
			weatherRecvFn(data);
		}
	</script>
</body>
</html>