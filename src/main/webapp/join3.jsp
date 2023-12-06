<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>학사 정보 목록(join3)</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>학번</th>
    <th>성명</th>
    <th>전화</th>
    <th>주소</th>
    <th>전공코드</th>
    <th>전공명</th>
    <th>취미코드</th>
    <th>취미명</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select a.id, a.name, a.phone, a.address, a.major_code, b.major_name, a.ho_code, c.ho_name from info0829 a, major0829 b, hope0829 c where a.major_code=b.major_code and a.ho_code=c.ho_code";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString(1);
    		 String name = rs.getString(2);
    		 String phone = rs.getString(3);
    		 String address = rs.getString(4);
    		 String major_code = rs.getString(5);
    		 String major_name = rs.getString(6);
    		 String ho_code = rs.getString(7);
    		 String ho_name = rs.getString(8);
    		 no++;
    		
%>
<tr>

    <td><%=no %> </td>
    <td><%=id %> </td>
    <td><%=name %> </td>
    <td><%=phone %></td>
    <td><%=address %></td>
    <td><%=major_code %></td>
    <td><%=major_name %></td>
    <td><%=ho_code %></td>
    <td><%=ho_name %></td>



</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_info.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>