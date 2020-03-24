<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>원, 선, 사각형, 다각형 표시하기</title>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cca222af78a9201a7dc9e3dce92b8c5"></script>
<script>
	function recvSal(arr) {
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(arr[0].lat, arr[0].lon), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePaths = [];

		$.each(arr, function(i, v) {
			var linePath = new kakao.maps.LatLng(Number(arr[i].lat),
					Number(arr[i].lon))
			linePaths.push(linePath)
		})

		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
			path : linePaths, // 선을 구성하는 좌표배열 입니다
			strokeWeight : 5, // 선의 두께 입니다
			strokeColor : '#FFAE00', // 선의 색깔입니다
			strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});

		// 지도에 선을 표시합니다 
		polyline.setMap(map);
		console.log("asdf")
	}

	function fn() {
		$.getJSON("map?mysearch=" + $("#myt").val(), recvSal)
	}
</script>
</head>
<body>
	검색하실 내용을 입력하세요 :
	<input id="myt" type="text" name="mysearch" size="20">
	<button type="button" onclick="fn()" class="btn btn-primary">지도</button>
	<div id="map" style="width:500px; height:500px">
		<h1>aa</h1>
	</div>

</body>
</html>