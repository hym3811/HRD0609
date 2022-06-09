<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉 정보 등록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3>인사관리 호봉 등록 화면</h3>
	<br>
	<hr><br>
	<table border=1 style="width:40%;">
		<tr>
			<th id="th1">직급</th>
			<td>
				<select name=position id="input2" onchange=search()>
					<option value="">직급 선택</option>
					<%
					String p=request.getParameter("position");
					if(p==null){
						p="";
					}
					String s=request.getParameter("salary");
					String salary=null;
					String position=null;
					String duty=null;
					try{
						sql="select * from position0609";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next()){
							position=rs.getString(1);
							duty=rs.getString(2);
					%>
					<option value="<%=position %>" <%=p.equals(position) ? "selected" : "" %> ><pre><%=position %>급 :  <%=duty %></pre></option>
					<%
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th id="th1">급여</th>
			<%
				if(p!=""){
					try{
						sql="select salary from hobong0609 where position=?";
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, p);
						rs=pstmt.executeQuery();
						if(rs.next()){
							salary=rs.getString(1);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			%>
			<td><input type=number name=salary id="input2" value="<%=salary=="" ? "" : salary %>"></td>
		</tr>
		<tr>
			<td colspan=2 style="text-align:center;">
				<input type=button id="bnt" value="저장" onclick=add()>
				<input type=button id="bnt" value="목록" onclick="location.href='select_Hobong.jsp'">
			</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="add_Hobong.jsp";
	document.form.submit();
}
function add(){
	document.form.action="add_Hobong_Process.jsp";
	document.form.submit();
}
</script>
</html>