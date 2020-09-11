<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="contextPath"
	value="${fn:escapeXml(pageContext.request.contextPath)}"
	scope="request"></c:set>
<script>
	function addCol() {
		var count = $("#funcTable tr").length - 1;

		var trHtml = 
		  	"<tr class='tbContext' id='menuList[" + count + "]'>																" +
			"	<td><input name='menuList["+ count + "].name' class='form-control mr-sm-2' value='${menu.name}'></td>       " +
			"	<td><input name='menuList["+ count + "].level' class='form-control mr-sm-2' value='${menu.level}'></td>     " +
			"	<td><input name='menuList["+ count + "].path' class='form-control mr-sm-2' value='${menu.path}'></td>       " +
			"	<td><input name='menuList["+ count + "].purview' class='form-control mr-sm-2' value='${menu.purview}'></td> " +
			"	<td>                                                                                                        " +
			"		<input type='hidden' name='menuList["+ count + "].id' class='form-control mr-sm-2' value='${menu.id}'>  " +
			"		<input class='form-control mr-sm-2' type='checkbox' name='menuList["+ count + "].isDelete'>				" +
			"	</td>                                                                                                       " +
			"</tr>                                                                                                          ";  

		$("#funcTable tr:last-child").after(trHtml);

	}
</script>
<div
	style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 10%">
	<form:form action="${contextPath}/setting/update"
		modelAttribute="navForm">
		<div style="margin-bottom: 10px;">
			<button type="button" class="btn btn-outline-info" onclick="addCol()">新增</button>
		</div>
		<table class="table" id="funcTable">
			<tr class="table-primary">
				<th scope="col">功能名稱</th>
				<th scope="col">層級</th>
				<th scope="col">路徑</th>
				<th scope="col">權限</th>
				<th scope="col">刪除</th>
			</tr>
			<c:forEach var="menu" items="${menuList}" varStatus="status">
				<tr class="tbContext" id="menuList[${status.index}]">
					<td><input name="menuList[${status.index}].name"
						class="form-control mr-sm-2" value="${menu.name}"></td>
					<td><input name="menuList[${status.index}].level"
						class="form-control mr-sm-2" value="${menu.level}"></td>
					<td><input name="menuList[${status.index}].path"
						class="form-control mr-sm-2" value="${menu.path}"></td>
					<td><input name="menuList[${status.index}].purview"
						class="form-control mr-sm-2" value="${menu.purview}"></td>
					<td><input type="hidden" name="menuList[${status.index}].id"
						class="form-control mr-sm-2" value="${menu.id}"> <input
						class="form-control mr-sm-2" type="checkbox"
						name="menuList[${status.index}].isDelete" value="false"></td>
				</tr>
			</c:forEach>
		</table>
		<div style="margin-top: 10px; text-align: right;">
			<button class="btn btn-primary">送出</button>
		</div>
	</form:form>
</div>
