<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>원, 선, 사각형, 다각형 표시하기</title>

</head>
<body>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cca222af78a9201a7dc9e3dce92b8c5"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.19352807363466,
					127.680918564089609), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도에 표시할 원을 생성합니다
		var circle = new kakao.maps.Circle({
			center : new kakao.maps.LatLng(35.19352807363466,
					127.680918564089609), // 원의 중심좌표 입니다 
			radius : 100, // 미터 단위의 원의 반지름입니다 
			strokeWeight : 5, // 선의 두께입니다 
			strokeColor : '#75B8FA', // 선의 색깔입니다
			strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'dashed', // 선의 스타일 입니다
			fillColor : '#CFE7FF', // 채우기 색깔입니다
			fillOpacity : 0.7
		// 채우기 불투명도 입니다   
		});

		// 지도에 원을 표시합니다 
		circle.setMap(map);

		// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
		var linePath = [
				new kakao.maps.LatLng(35.19352807363466, 127.680918564089609),
				new kakao.maps.LatLng(35.193943885231704, 127.681131902709623),
				new kakao.maps.LatLng(35.194057176851764, 127.681226395655443) ];

		// 지도에 표시할 선을 생성합니다
		var polyline = new kakao.maps.Polyline({
			path : linePath, // 선을 구성하는 좌표배열 입니다
			strokeWeight : 5, // 선의 두께 입니다
			strokeColor : '#FFAE00', // 선의 색깔입니다
			strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
			strokeStyle : 'solid' // 선의 스타일입니다
		});

		// 지도에 선을 표시합니다 
		polyline.setMap(map);
	</script>
</body>
</html>