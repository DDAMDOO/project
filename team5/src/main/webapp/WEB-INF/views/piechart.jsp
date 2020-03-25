<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	/* google.charts.setOnLoadCallback(drawChart1); */

	function drawChart(adata) {
		/* console.log(adata) */
		var data = google.visualization.arrayToDataTable(adata);

		var options = {
			title : '',
			legend : 'none',
			pieSliceText : 'label',
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));
		chart.draw(data, options);
	}

	function drawChart1(adata1) {
		var data = google.visualization.arrayToDataTable(adata1);

		var options = {
			title : '',
			legend : 'none',
			pieSliceText : 'label',
		};

		var chart1 = new google.visualization.PieChart(document
				.getElementById('piechart1'));
		chart1.draw(data, options);
	}
	function recvFn(data) {
		arr = []

		arr.push([ "지역", "사고" ])
		$.each(data, function(i, v) {
			arr.push([ v.addr, v.num ])
		})
		drawChart(arr)
	}

	function recvFn1(data) {
		arr1 = []
		arr1.push([ "원인", "발생건수" ])
		$.each(data, function(i, v) {
			console.log("v.log", v.anjeon)
			arr1.push([ "안전", v.anjeon ])
			arr1.push([ "실족사", v.siljok ])
			arr1.push([ "개인적", v.gaein ])
			arr1.push([ "조난", v.jonan ])
			arr1.push([ "기타", v.gita ])
		})
		//console.log(arr)
		drawChart1(arr1)
	}

	function fn() {
		data = $.getJSON("accpc", recvFn)
		data1 = $.getJSON("accpf", recvFn1)
		recvFn(data);
		recvFn1(data1);
	}
</script>
</head>
<body onload="fn()">
	<h1>도시별 산악사고 통계</h1>
	<div id="piechart" style="width: 1000px; height: 500px;"></div>
	<h1>사고 유형별 통계</h1>
	<div id="piechart1" style="width: 1000px; height: 500px;"></div>


</body>
</html>