<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 등록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3>인사관리 사원등록 화면</h3>
	<br>
	<table border=1 style="width:50%;">
	<%
		Integer id=0;
		try{
			sql="select max(id) from info0609";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()){
				id=rs.getInt(1)+1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr>
			<th id="th1">사원번호(자동생성)</th>
			<td><input id="input2" type=number name=id value="<%=id%>" readonly></td>
		</tr>
		<tr>
			<th id="th1">성명</th>
			<%
				String name=request.getParameter("name");
			%>
			<td><input id="input2" type=text name=name value="<%=name==null ? "" : name %>"></td>
		</tr>
		<tr>
			<th id="th1">소속부서</th>
			<td>
				<select id="input2" name=dept>
					<option value="">소속부서 선택</option>
				<%
					String dept_no2=request.getParameter("dept");
					if(dept_no2==null){
						dept_no2="";
					}
					Integer dept_no=0;
					String dept=null;
					try{
						sql="select * from dept0609";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next()){
							dept_no=rs.getInt(1);
							dept=rs.getString(2);
				%>
					<option value="<%=dept_no%>" <%=Integer.toString(dept_no).equals(dept_no2) ? "selected" : "" %>><%=dept %></option>
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
			<th id="th1">직급</th>
			<td>
				<select id="input2" name=position onchange=search()>
				<option value="">직급 선택</option>
				<%
					String position_no=request.getParameter("position");
					if(position_no==null){
						position_no="";
					}
					Integer position=0;
					try{
						sql="select * from position0609";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next()){
							position=rs.getInt(1);
				%>
					<option value="<%=position%>" <%=position_no.equals(Integer.toString(position)) ? "selected" : "" %>><%=position %>급</option>
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
			<th id="th1">직책</th>
			<%
				String duty=null;
				if(position_no!=null){
					try{
						sql="select duty from position0609 where position=?";
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, position_no);
						rs=pstmt.executeQuery();
						if(rs.next()){
							duty=rs.getString(1);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			%>
			<td><input id="input2" type=text name=duty value="<%=duty==null ? "" : duty%>" readonly></td>
		</tr>
		<tr>
			<th id="th1">연락처</th>
			<%
				String phone=request.getParameter("phone");
			%>
			<td><input id="input2" type=text name=phone placeholder="010-0000-0000" value="<%=phone==null ? "" : phone%>"></td>
		</tr>
		<tr>
			<th id="th1">주소</th>
			<%
				String address=request.getParameter("address");
			%>
			<td><input id="input2" type=text name=address value="<%=address==null ? "" : address%>"></td>
		</tr>
		<tr>
			<td colspan=2 style="text-align:center;">
				<input type=button value="등록" onclick=add() id="bnt">
				<input type=button value="취소" onclick=reset() id="bnt">
			</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="add_Info.jsp";
	document.form.submit();
}
function add(){
	var doc=document.form;
	if(doc.name.value==""){
		alert("[성명]\n성명을 입력하세요.");
		doc.name.focus();
	}else if(doc.dept.value==""){
		alert("[소속부서]\n소속부서를 선택하세요.");
		doc.dept.focus();
	}else if(doc.position.value==""){
		alert("[직급]\n직급을 선택하세요.");
		doc.position.focus();
	}else if(doc.phone.value==""){
		alert("[연락처]\n연락처를 입력하세요.");
		doc.phone.focus();
	}else if(doc.address.value==""){
		alert("[주소]\n주소를 입력하세요.");
		doc.address.focus();
	}else{
		doc.action="add_Info_Process.jsp";
		doc.submit();
	}
}
</script>
</html>