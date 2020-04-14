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
<script>
	function recvSal(arr) {

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(arr[parseInt((arr.length)/2)].lat, arr[parseInt(arr.length/2)].lon), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var cnt=0;
		var linePaths = [];
		
		$.each(arr,function(i, v) {

			// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
			var linePath = new kakao.maps.LatLng(
					Number(arr[i].lat), Number(arr[i].lon))
			linePaths.push(linePath)
			
			if (( arr[i + 1] != null && arr[i].climb_code != arr[i+1].climb_code)
					|| (i - 1 >= 0 && arr[i].climb_code != arr[i-1].climb_code) ) {

				// 지도에 표시할 선을 생성합니다
				var polyline = new kakao.maps.Polyline({
					path : linePaths, // 선을 구성하는 좌표배열 입니다
					strokeWeight : 4, // 선의 두께 입니다
					strokeColor : '#0033cc', // 선의 색깔입니다
					strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid' // 선의 스타일입니다
				});
				console.log("ASdf")
				polyline.setMap(map);
				
				if(((i + 1 != null && arr[i].climb_name != arr[i + 1].climb_name)
						|| (i - 1 >= 0 && arr[i].climb_name != arr[i - 1].climb_name))&&arr[i].climb_name.length>=3&&arr[i].climb_code%2==0){
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(arr[i].lat, arr[i].lon); 
					console.log("asdf")
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					var iwContent = '<div style="text-align:center">'+arr[i].climb_name+'</div><div style="text-align:center">'+arr[i].climb_diff+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(arr[i].lat, arr[i].lon), //인포윈도우 표시 위치입니다
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성하고 지도에 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent,
					    removable : iwRemoveable
					});
					infowindow.open(map, marker);
				}
				linePaths = [];
			}
		})
	}

	function fn() {
		$.getJSON("map?mysearch=" + $("#myt").val(), recvSal)
	}
</script>
</head>
<body>
	<div style="text-align: right">
		검색하실 내용을 입력하세요 : <input id="myt" type="text" name="mysearch" size="20">
		<button type="button" onclick="fn()" class="btn btn-primary">지도</button>
	</div>
	<div id="map" style="width: 80%; height: 80%; text-align: center;"></div>
</body>
</html>