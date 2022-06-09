<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3>호봉 정보 조회</h3>
	<br>
	<hr>
	<table border=1 style="width:40%;">
		<tr id="tr1">
			<th>No</th>
			<th>등급</th>
			<th>급여</th>
		</tr>
		<%
			Integer no=0;
			String position=null;
			String salary=null;
			try{
				sql="select * from hobong0609 order by position";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
					no++;
					position=rs.getString(1);
					salary=df.format(rs.getInt(2));
		%>
		<tr id="tr2">
			<td style="text-align:center;"><%=no %></td>
			<td style="text-align:center;"><a id="a1" href="add_Hobong.jsp?position=<%=position%>"><%=position %>급</a></td>
			<td style="text-align:right;"><%=salary %>원</td>
		</tr>
		<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>