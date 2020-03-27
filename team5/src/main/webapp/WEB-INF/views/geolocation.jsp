<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cca222af78a9201a7dc9e3dce92b8c5"></script>
<script type="text/javascript">
	// Geolocation 객체를 사용

	var avg_lat = 0
	var avg_lon = 0

	function gps_origin() {
		// Geolocation 객체를 사용
		navigator.geolocation.getCurrentPosition(function(position) {
			// 위치를 가져오는데 성공할 경우
			/* 			lat = position.coords.latitude
			 lon = position.coords.longitude */

			lat = 37.5030042
			lon = 127.0507571
			/* 			lat = 33.407003
			 lon = 126.561696 */
			console.log("asdf fn", lat, lon)
			/* $.getJSON("geo1",{'lat':lat, 'lon':lon} */
			$.getJSON("geo1", {
				'lat' : lat,
				'lon' : lon
			}, nearMt)
		}, function(error) {
			// 위치를 가져오는데 실패한 경우
			console.log(error.message);
		});
	}

	function gps() {
		// Geolocation 객체를 사용

		// 위치를 가져오는데 성공할 경우
		/* 			lat = position.coords.latitude
		 lon = position.coords.longitude */

		lat = 37.5030042
		lon = 127.0507571
		/* 			lat = 33.407003
		 lon = 126.561696 */
		console.log("asdf fn", lat, lon)
		/* $.getJSON("geo1",{'lat':lat, 'lon':lon} */
		$.getJSON("geo1", {
			'lat' : lat,
			'lon' : lon
		}, nearMt)
	}
	function nearMt(arr) {

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {

			center : new kakao.maps.LatLng(Number(arr[10].lat),
					Number(arr[10].lon)), // 지도의 중심좌표 

			/* 					center : new kakao.maps.LatLng(33.407003,
			 126.561696), */// 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		$.each(arr, function(i, v) {
			// 마커가 표시될 위치입니다 
			console.log(i, arr[i].name, Number(arr[i].lat), Number(arr[i].lon))
			avg_lat += Number(arr[i].lat)
			avg_lon += Number(arr[i].lon)
			var markerPosition = new kakao.maps.LatLng(Number(arr[i].lat),
					Number(arr[i].lon));
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="text-align:center">' + arr[i].name
					+ '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new kakao.maps.LatLng(Number(arr[i].lat),
					Number(arr[i].lon)), //인포윈도우 표시 위치입니다
			iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				position : iwPosition,
				content : iwContent,
				removable : iwRemoveable
			});
			infowindow.open(map, marker);
			console.log("dddd", arr[i].lat)
		})
	}
</script>
</head>

<body onload="gps()">
	<div id="map" style="width: 80%; height: 80%; text-align: center;"></div>
</body>
</html>