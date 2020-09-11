<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath"
	value="${fn:escapeXml(pageContext.request.contextPath)}"
	scope="request"></c:set>

<style>
/* a { */
/* 	color: white; */
/* } */
</style>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wtlc.AIFire.beans.MenuView"%>
<%@ page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="com.wtlc.AIFire.utils.SettingUtil"%>

<%!List<MenuView> menuList = new ArrayList<>();%>
<%
	menuList = new ArrayList<>();

	try {
		ServletContext context = request.getSession().getServletContext();
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(context);
		SettingUtil settingUtil = (SettingUtil) ac.getBean("settingUtil", SettingUtil.class);

		menuList = settingUtil.getMenuList("");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
	<span class="navbar-brand mb-0 h1">AIFire</span>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<c:forEach var="menuView" items="<%=menuList%>">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="${contextPath}${menuView.path}" id="navbarDropdown1"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> ${menuView.name} </a> <c:if
						test="${menuView.subMenuList != null}">
						<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
							<c:forEach var="subMenu" items="${menuView.subMenuList}">
								<a class="dropdown-item" href="${contextPath}${subMenu.path}">${subMenu.name}</a>
							</c:forEach>
						</div>
					</c:if></li>
			</c:forEach>
		</ul>
	</div>
</nav>