<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">
				<h3>Menu</h3>
			</div>
			<a class="nav-link" href="/app/">
				<div class="sb-nav-link-icon"></div><h4>MainPage</h4>
			</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapseMounts" aria-expanded="false"
				aria-controls="collapseMounts">
				<div class="sb-nav-link-icon"></div> <h4>Mountain Info</h4>
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseMounts"
				aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav accordion"
					id="sidenavAccordionPages">
					<a class="nav-link" href="/app/mapinfo">
						<div class="sb-nav-link-icon"></div><h5>Info</h5>
					</a> <a class="nav-link" href="/app/diff">
						<div class="sb-nav-link-icon"></div><h5>Search</h5>
					</a> <a class="nav-link" href="/app/chart">
						<div class="sb-nav-link-icon"></div><h5>Accident</h5>
					</a> <a class="nav-link" href="/app/geoview">
						<div class="sb-nav-link-icon"></div><h5>Recommend</h5>
					</a>
				</nav>
			</div>

			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapsePages" aria-expanded="false"
				aria-controls="collapsePages">
				<div class="sb-nav-link-icon"></div> <h4>Member Info</h4>
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapsePages"
				aria-labelledby="headingThree" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav accordion"
					id="sidenavAccordionPages">
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#pagesCollapseAuth" aria-expanded="false"
						aria-controls="pagesCollapseAuth"><h4>Authentication</h4>
						<div class="sb-sidenav-collapse-arrow"></div>
					</a>
					<div class="collapse" id="pagesCollapseAuth"
						aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<c:choose>
								<c:when test="${not empty sessionScope.ses}">
									<a class="nav-link" href="resources/resources_main/mypage.jsp"><h4>MyPage</h4></a>
									<a class="nav-link" href="getfav"><h4>My Favorite</h4></a>
									<a class="nav-link" href="logout"><h4>Logout</h4></a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" href="resources/resources_main/login.jsp"><h4>Login</h4></a>
							<a class="nav-link" href="resources/resources_main/register.jsp"><h4>Register</h4></a>
								</c:otherwise>
							</c:choose>
						</nav>
					</div>


					</a>
				</nav>
			</div>

		</div>
	</div>
</nav>