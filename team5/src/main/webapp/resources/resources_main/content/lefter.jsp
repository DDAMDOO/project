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
				<div class="sb-nav-link-icon"></div>MainPage
			</a> <a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapseMounts" aria-expanded="false"
				aria-controls="collapseMounts">
				<div class="sb-nav-link-icon"></div> Mountain Info
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseMounts"
				aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav accordion"
					id="sidenavAccordionPages">
					<a class="nav-link" href="/app/mapinfo">
						<div class="sb-nav-link-icon"></div>Mountain Info
					</a> <a class="nav-link" href="/app/diff">
						<div class="sb-nav-link-icon"></div>Mountain Search
					</a> <a class="nav-link" href="/app/chart">
						<div class="sb-nav-link-icon"></div>Mountain Accident
					</a> <a class="nav-link" href="/app/">
						<div class="sb-nav-link-icon"></div>Mountain Recommend
					</a>
				</nav>
			</div>

			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapsePages" aria-expanded="false"
				aria-controls="collapsePages">
				<div class="sb-nav-link-icon"></div> Member Info
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
						aria-controls="pagesCollapseAuth">Authentication
						<div class="sb-sidenav-collapse-arrow"></div>
					</a>
					<div class="collapse" id="pagesCollapseAuth"
						aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
						<nav class="sb-sidenav-menu-nested nav">
							<c:choose>
								<c:when test="${not empty sessionScope.ses}">
									<a class="nav-link" href="resources/resources_main/mypage.jsp">MyPage</a>
									<a class="nav-link" href="getfav">My Favorite</a>
									<a class="nav-link" href="logout">Logout</a>
								</c:when>
								<c:otherwise>
									<a class="nav-link" href="resources/resources_main/login.jsp">Login</a>
							<a class="nav-link" href="resources/resources_main/register.jsp">Register</a>
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