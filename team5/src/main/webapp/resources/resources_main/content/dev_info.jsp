<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

	<div class="w3-row-padding">
		<div class="w3-container w3-third">
			<img src="/app/resources/resources_main/img/sunjae.png"
				style="width: 30%; cursor: pointer" onclick="onClick(this)"
				class="w3-hover-opacity"> <h3>생명정보서비스팀 김선재</h3>

		</div>
		<div class="w3-container w3-third">
			<img src="/app/resources/resources_main/img/yehun.png"
				style="width: 30%; cursor: pointer" onclick="onClick(this)"
				class="w3-hover-opacity"><br>
			<h3>손보인프라팀 한예훈</h3>
		</div>
		<div class="w3-container w3-third">
			<img src="/app/resources/resources_main/img/sangjun.png"
				style="width: 30%; cursor: pointer" onclick="onClick(this)"
				class="w3-hover-opacity"><br>
			<h3>제조서비스사업팀 이상준</h3>
		</div>
	</div>

	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
		<span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
		<div class="w3-modal-content w3-animate-zoom">
			<img id="img01" style="width: 80%">
		</div>
	</div>

	<script>
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
		}
	</script>

</body>
</html>
