<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String id=request.getParameter("id");
	String gajok=request.getParameter("gajok");
	String jikchak=request.getParameter("jikchak");
	String gunsok=request.getParameter("gunsok");
	String gitasudang=request.getParameter("gitasudang");
	try{
		sql="select * from sudang0609 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update sudang0609 set gajok=?,jikchak=?,gunsok=?,gitasudang=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gajok);
			pstmt.setString(2, jikchak);
			pstmt.setString(3, gunsok);
			pstmt.setString(4, gitasudang);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
%>
<script>
alert("수당 정보 수정 성공");
location.href="select_Sudang.jsp";
</script>
<%
		}else{
			sql="insert into sudang0609 values(?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, gajok);
			pstmt.setString(3, jikchak);
			pstmt.setString(4, gunsok);
			pstmt.setString(5, gitasudang);
			pstmt.executeUpdate();
%>
<script>
alert("수당 정보 등록 성공");
location.href="select_Sudang.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>