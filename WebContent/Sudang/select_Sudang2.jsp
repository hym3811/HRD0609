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
			<th>급여</th>
			<th>가족수당</th>
			<th>직책수당</th>
			<th>근속수당</th>
			<th>기타수당</th>
			<th>수당합계</th>
			<th>급여합계</th>
		</tr>
	<%
		Integer no=0;
		String id=null;
		String name=null;
		String salary=null;
		Integer salarysum=0;
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
		String t=null;
		Integer tsum=0;
		String[] sum=new String[7];
		try{
			sql="select a.id,b.name,c.salary,a.gajok,a.jikchak,a.gunsok,a.gitasudang,(a.gajok+a.jikchak+a.gunsok+a.gitasudang) as TOTAL,(a.gajok+c.salary+a.jikchak+a.gunsok+a.gitasudang) as TOTAL2 from sudang0609 a join info0609 b on a.id=b.id join hobong0609 c on b.position=c.position order by a.id";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				no++;
				id=rs.getString(1);
				name=rs.getString(2);
				salary=df.format(rs.getInt(3));
				gajok=df.format(rs.getInt(4));
				jikchak=df.format(rs.getInt(5));
				gunsok=df.format(rs.getInt(6));
				gitasudang=df.format(rs.getInt(7));
				total=df.format(rs.getInt(8));
				t=df.format(rs.getInt(9));
				
				salarysum+=rs.getInt(3);
				gajoksum+=rs.getInt(4);
				jikchaksum+=rs.getInt(5);
				gunsoksum+=rs.getInt(6);
				gitasudangsum+=rs.getInt(7);
				totalsum+=rs.getInt(8);
				tsum+=rs.getInt(9);
	%>
		<tr id="tr2">
			<td style="text-align:center;"><%=no %></td>
			<td style="text-align:center;"><%=id %></td>
			<td style="text-align:center;"><%=name %></td>
			<td style="text-align:right;"><%=salary %> 원</td>
			<td style="text-align:right;"><%=gajok %> 원</td>
			<td style="text-align:right;"><%=jikchak %> 원</td>
			<td style="text-align:right;"><%=gunsok %> 원</td>
			<td style="text-align:right;"><%=gitasudang %> 원</td>
			<td style="text-align:right;"><%=total %> 원</td>
			<td style="text-align:right;"><%=t %> 원</td>
		</tr>
	<%
			}
			sum[0]=df.format(salarysum);
			sum[1]=df.format(gajoksum);
			sum[2]=df.format(jikchaksum);
			sum[3]=df.format(gunsoksum);
			sum[4]=df.format(gitasudangsum);
			sum[5]=df.format(totalsum);
			sum[6]=df.format(tsum);
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
		<tr id="tr2">
			<th style="border-color:red;font-size:1.3em;color:red;" colspan=3>TOTAL</th>
			<td style="text-align:right;border-color:red;"><%=sum[0] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[1] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[2] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[3] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[4] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[5] %> 원</td>
			<td style="text-align:right;border-color:red;"><%=sum[6] %> 원</td>
		</tr>
	</table>
</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>