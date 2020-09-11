<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<h1>工作記錄</h1>
<form action="/AIFire/submit" method="post">
	<table>
		<thead>
			<th>主題：<input type="text" id="subject" name="subject" required
				maxlength="50" autofocus size="50"></th>
			<th>日期：<input type="date" id="date" name="date" required></th>
		</thead>
		<tbody>
			<tr>
				<td colspan="2" style="height: 450px;">
					<p>
						<label for="comments"></label>
						<textarea name="comments" style="font-size: 15px; border: none;"
							cols="150" rows="24"
							placeholder="請記錄各項研究工作、工程技術、設計結構與分析等之數據、資料及其改變。" required>${message}</textarea>

					</p>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th>見證人：<input type="text" id="supervisor" name="supervisor"
					 maxlength="500" value="${txt}"></th>
				<th>撰寫人：<input type="text" id="worker" name="worker"
					value="${idNo}" required maxlength="500"></th>
			</tr>
		</tfoot>


	</table>
	<p>
		<b></b>＊見證人請找上一層主管簽名見證
	</p>
	<footer>
		<p>
			<button  style="background: gainsboro; id="submin" name="submit">Submit</button>
		</p>
	</footer>
</form>