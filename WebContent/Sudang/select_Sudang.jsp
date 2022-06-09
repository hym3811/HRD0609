<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 정보 조회</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
<form name=form>
	<br>
	<h3>수당 정보 조회</h3>
	<br>
	<hr>
	<table border=1 style="width:70%;">
		<tr id="tr1">
			<th>No</th>
			<th>사원번호</th>
			<th>이름</th>
			<th>가족수당</th>
			<th>직책수당</th>
			<th>근속수당</th>
			<th>기타수당</th>
			<th>수당합계</th>
			<th style="width:15%;">구분</th>
		</tr>
	<%
		Integer no=0;
		String id=null;
		String name=null;
		String gajok=null;
		Integer gajoksum=0;
		String jikchak=null;
		Integer jikchaksum=0;
		String gunsok=null;
		Integer gunsoksum=0;
		String gitasudang=null;
		Integer gitasudangsum=0;
		String total=null;
		Integer totalsum=0;
		String[] sum=new String[5];
		for(int i=0;i<5;i++){
			sum[i]=null;
		}
		try{
			sql="select a.id,b.name,a.gajok,a.jikchak,a.gunsok,a.gitasudang,(a.gajok+a.jikchak+a.gunsok+a.gitasudang) from sudang0609 a join info0609 b on a.id=b.id order by a.id";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				id=rs.getString(1);
				name=rs.getString(2);
				gajok=df.format(rs.getInt(3));
				jikchak=df.format(rs.getInt(4));
				gunsok=df.format(rs.getInt(5));
				gitasudang=df.format(rs.getInt(6));
				total=df.format(rs.getInt(7));
				
				gajoksum+=rs.getInt(3);
				jikchaksum+=rs.getInt(4);
				gunsoksum+=rs.getInt(5);
				gitasudangsum+=rs.getInt(6);
				totalsum+=rs.getInt(7);
	%>
		<tr id="tr2">
			<td style="text-align:center;"><%=no %></td>
			<td style="text-align:center;"><%=id %></td>
			<td style="text-align:center;"><%=name %></td>
			<td style="text-align:right;"><%=gajok %> 원</td>
			<td style="text-align:right;"><%=jikchak %> 원</td>
			<td style="text-align:right;"><%=gunsok %> 원</td>
			<td style="text-align:right;"><%=gitasudang %> 원</td>
			<td style="text-align:right;"><%=total %> 원</td>
			<td style="text-align:center;"><a id="a1" href="add_Sudang.jsp?id=<%=id%>">수정</a>/<a id="a1" href=# onclick=if(confirm("ID:<%=id%>\n삭제하시겠습니까?")){location.href="delete_Sudang.jsp?id=<%=id %>"} >삭제</a></td>
		</tr>
	<%
			}
			sum[0]=df.format(gajoksum);
			sum[1]=df.format(jikchaksum);
			sum[2]=df.format(gunsoksum);
			sum[3]=df.format(gitasudangsum);
			sum[4]=df.format(totalsum);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr id="tr2">
			<th colspan=3 style="font-size:1.3em;">TOTAL</th>
			<td style="text-align:right;"><%=sum[0] %> 원</td>
			<td style="text-align:right;"><%=sum[1] %> 원</td>
			<td style="text-align:right;"><%=sum[2] %> 원</td>
			<td style="text-align:right;"><%=sum[3] %> 원</td>
			<td colspan=2 style="text-align:right;font-size:1.5em; color:red;"><%=sum[4] %> 원</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>