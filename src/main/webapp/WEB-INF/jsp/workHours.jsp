<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
table {
	width: 100%;
}

#title {
	text-align: left;
}

span {
	font-family: "微軟正黑體", "Microsoft JhengHei", Tahoma, Verdana, Arial,
		sans-serif;
}
</style>
<h1 class="span"
	style="text-align: center; font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif; font-size: 36px; letter-spacing: 7px; font-weight: bold;">
	<span>工時卡</span>
</h1>

<div
	style="background-color: lightcyan; border: none; font-size: 22px; padding: 10px; margin: auto; width: 49%; line-height: 200%;">
	<span>執行單位：</span><input type="text" id="depart" name="depart"
		size="40" style="height: 32px;"><br> <span>執行計畫：產業升級創新平台輔導計畫</span><br>
	<div style="color:dimgray">


		( 
		  <input type="radio" name="subject" value="EP" checked="checked"><span>產業高值計畫</span> 
		  <input type="radio" name="subject" value="IP"><span>創新優化計畫</span> 
		  <input type="radio" name="subject" value="NP"><span>新興育成計畫</span> 
		  <input type="radio" name="subject" value="SP"><span>主題式研發計畫</span>
		 ) 


	</div>
	
	<span>計劃名稱：</span> <input type="text" id="project" name="project"
		size="40" placeholder="XX計畫" style="height: 32px;"><br>
	<span> 記錄時間：</span><span>西元年:</span> <input id="year" name="year"
		maxlength="4" size="5" style="height: 32px;"> <span>月:</span>
		<select>
		<c:forEach
			begin="1" end="12" varStatus="month">
			<option value="${month.index }" >${month.index }</option>
		</c:forEach>
		</select> 
		<br>
	<span> 記錄人員： </span><input type="text" id="depart" name="depart"
		size="20" style="height: 32px;"><br>
</div>

<div style="width:79%;overflow-x:auto;padding: 10px; margin: auto; ">
	<form method="POST" action="/AIFire/day">
		<table class="table">
			<tr class="table-warning">
				<th scope="col"></th>
				<c:forEach begin="1" end="${maxDate}" varStatus="idx">
					<th align="center" scope="col">${idx.index}</th>
				</c:forEach>
			</tr>
			<tr>
				<td>
					<input name="name">
				</td>
				<c:forEach begin="1" end="${maxDate}" varStatus="idx">
					<td>
						<input name="hours" maxlength="3" style="width: 30px">
					</td>
				</c:forEach>
			</tr>
			<tr>
				<td>
					<input name="name">
				</td>
				<c:forEach begin="1" end="${maxDate}" varStatus="idx">
					<td>
						<input name="hours" maxlength="3" style="width: 30px">
					</td>
				</c:forEach>
			</tr>
		</table>
		<button>Submit</button>
	</form>
</div>


<div style="margin: 10px; font-size: 20px">
<p><span>計畫主持人簽章:_____________________
	主管簽章:_____________________記錄人簽名(親簽):_____________________</span></p>
<div style="background-color: lightblue; padding: 10px; width: 65%;">
	<span>查核點 A:</span><input type="text" id="check1" name="check1" size="20">
	<span> B:</span><input type="text" id="check2" name="check2" size="20">
	<span> C:</span><input type="text" id="check3" name="check3" size="20">
</div>
</div>
