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

<h1>전공(학과) 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>전공코드</th>
    <th>전공명</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select*from major0829";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String major_code = rs.getString("major_code");
    		 String major_name= rs.getString("major_name");
    
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><a href = "update_major.jsp?major_code=<%=major_code %>"><%=major_code %></a> </td>
    <td><%=major_name %> </td>

    <td>
      <a href="delete_major.jsp?major_code=<%=major_code %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 8  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_major.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>