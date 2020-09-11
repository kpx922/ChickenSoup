<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
body {
	background: lightcyan;
}

table {
	font-size: 20px;
	font-family: Georgia, 'Times New Roman', Times, serif;
	border-collapse: collapse;
	width: 100%;
	background: white;
	border: 2px solid black
}

td, th {
	border: 1px solid black;
	text-align: left;
	padding: 8px;
}
</style>

<div>
	<select name="YourLocation">
		<c:forEach begin="1" end="12" varStatus="idx">
			<option value="${idx.index}">${idx.index}</option>
		</c:forEach>
	</select>
</div>

<div>
	<form action="/AIFire/aaa/submitList" method="post">
		<div>
			<input name="testList[0].name" value=""> 
			<input name="testList[0].phone" value="">
			<input name="testList[0].address" value="">
		</div>
		<div>
			<input name="testList[1].name" value=""> 
			<input name="testList[1].phone" value="">
			<input name="testList[1].address" value="">
		</div>
		<div>
			<input name="testList[2].name" value=""> 
			<input name="testList[2].phone" value="">
			<input name="testList[2].address" value="">
		</div>
		<div>
			<button>SUBMIT</button>
		</div>
	</form>
</div>
<form action="/AIFire/submit" method="post">

</form>
