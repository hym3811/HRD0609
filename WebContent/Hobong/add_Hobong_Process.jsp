<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String position=request.getParameter("position");
	String salary=request.getParameter("salary");
	try{
		sql="select * from hobong0609 where position=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, position);
		rs=pstmt.executeQuery();
		if(rs.next()){
			sql="update hobong0609 set salary=? where position=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, salary);
			pstmt.setString(2, position);
			pstmt.executeUpdate();
%>
<script>
alert("호봉 정보 수정 성공");
location.href="add_Hobong.jsp";
</script>
<%
		}else{
			sql="insert into hobong0609 values(?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, position);
			pstmt.setString(2, salary);
			pstmt.executeUpdate();
%>
<script>
alert("호봉 정보 등록 성공");
location.href="add_Hobong.jsp";
</script>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>