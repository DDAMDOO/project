<style>
.slideshow {
	width: 80%;
	height: 300px;
	margin: auto;
	border: 1px solid #bbb;
	background: #ffc
}

.slideshow img {
	opacity: 0;
	filter: alpha(opacity = 0);
}
</style>

<script src="http://malsup.github.io/jquery.cycle2.js"></script>
<script src="http://malsup.github.io/jquery.cycle2.center.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>


<ul class="cycle-slideshow" data-cycle-slides="li"
	data-cycle-fx="scrollHorz">
	<li><img onclick="window.open('http://www.google.com', '_blank')"
		src="/app/resources/resources_main/img/aa.jpeg" width=200 height=200></li>
	<li><img onclick="window.open('http://www.google.com', '_blank')"
		src="/app/resources/resources_main/img/bb.jpeg" width=100 height=100></li>
	<li><img onclick="window.open('http://www.google.com', '_blank')"
		src="/app/resources/resources_main/img/cc.jpeg" width=200 height=150></li>
</ul>
<!-- <ul class="cycle-slideshow" data-cycle-slides="li"
	data-cycle-fx="scrollHorz">
	<li><a href="http://www.naver.com"> <img
			src="/app/resources/resources_main/img/aa.jpeg" width=200 height=200>
	</a></li>
	<li><a href="http://www.naver.com"> <img
			src="/app/resources/resources_main/img/bb.jpeg" width=100 height=100>
	</a></li>
	<li><a href="http://www.naver.com"> <img
			src="/app/resources/resources_main/img/cc.jpeg" width=200 height=150>
	</a></li>
</ul> -->