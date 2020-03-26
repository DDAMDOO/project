<html>
<head>
<title>:: JAVASCRIPT 지오로케이션 ::</title>
<script type="text/JavaScript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	// Geolocation 객체를 사용
	function asdf(){
		// Geolocation 객체를 사용
		navigator.geolocation.getCurrentPosition(function(position) {

			// 위치를 가져오는데 성공할 경우
			lat = position.coords.latitude
			lon = position.coords.longitude
			console.log(lat, lon)
			$.get("geo1",{'lat':lat, 'lon':lon})
		}, function(error) {
			// 위치를 가져오는데 실패한 경우
			consol.log(error.message);
		});
	}
</script>
</head>
<body onload="asdf()">
	
</body>
</html>