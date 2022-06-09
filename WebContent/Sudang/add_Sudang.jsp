<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 정보 등록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<%
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String gajok=request.getParameter("gajok");
		String jikchak=request.getParameter("jikchak");
		String gunsok=request.getParameter("gunsok");
		String gitasudang=request.getParameter("gitasudang");
		try{
			sql="select table_name from user_tables where table_name='SUDANG0609'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()==false){
				sql="create table sudang0609(id number(8) primary key references info0609(id),gajok number(11),jikchak number(11),gunsok number(11),gitasudang number(11))";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();
	%>
	<script>
	alert("수당 테이블 생성");
	</script>
	<%
			}pstmt.close();
			
			if(id!=null&&id!=""){
				sql="select name from info0609 where id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()){
					name=rs.getString(1);
					sql="select gajok,jikchak,gunsok,gitasudang from sudang0609 where id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					if(rs.next()){
						if(gajok==null||gajok==""){
							gajok=rs.getString(1);
						}
						if(jikchak==null||jikchak==""){
							jikchak=rs.getString(2);
						}
						if(gunsok==null||gunsok==""){
							gunsok=rs.getString(3);
						}
						if(gitasudang==null||gitasudang==""){
							gitasudang=rs.getString(4);
						}
					}
				}else{
					id="";
					name="";
					gajok="";
					jikchak="";
					gunsok="";
					gitasudang="";
	%>
	<script>
	alert("등록되어 있지 않은 사원번호입니다.");
	</script>
	<%
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
	<br>
	<h3>수당 정보 등록</h3>
	<br>
	<table border=1 style="width:50%;">
		<tr>
			<th id="th1">사원번호</th>
			<td><input id="input2" type=text name=id value="<%=id==null||id=="" ? "" : id%>" onchange=search()></td>
			<th id="th1">이름</th>
			<td><input id="input2" type=text name=name value="<%=name==null||name=="" ? "" : name%>" readonly></td>
		</tr>
		<tr>
			<th id="th1">가족수당</th>
			<td><input id="input2" type=number name=gajok value="<%=gajok==null||gajok=="" ? "" : gajok%>"></td>
			<th id="th1">직책수당</th>
			<td><input id="input2" type=number name=jikchak value="<%=jikchak==null||jikchak=="" ? "" : jikchak%>"></td>
		</tr>
		<tr>
			<th id="th1">근속수당</th>
			<td><input id="input2" type=number name=gunsok value="<%=gunsok==null||gunsok=="" ? "" : gunsok%>"></td>
			<th id="th1">기타수당</th>
			<td><input id="input2" type=number name=gitasudang value="<%=gitasudang==null||gitasudang=="" ? "" : gitasudang%>"></td>
		</tr>
		<tr>
			<td colspan=4 style="text-align:center;">
				<input type=button id="bnt" value="저장" onclick=add()>
				<input type=button id="bnt" value="목록" onclick=sel()>
			</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function search(){
	document.form.action="add_Sudang.jsp";
	document.form.submit();
}
function add(){
	var doc=document.form;
	if(doc.id.value==""){
		alert("[사원번호]\n사원번호를 입력하세요.");
		doc.id.focus();
	}else{
		doc.action="add_Sudang_Process.jsp";
		doc.submit();
	}
}
</script>
</html>