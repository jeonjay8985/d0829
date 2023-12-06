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

<h1>학사 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>학번</th>
    <th>성명</th>
    <th>전화</th>
    <th>주소</th>
    <th>전공코드</th>
    <th>취미코드</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select*from info0829";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String name= rs.getString("name");
    		 String phone = rs.getString("phone");
    		 String address = rs.getString("address");
    		 String major_code = rs.getString("major_code");
    		 String ho_code = rs.getString("ho_code");
    		 
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><a href = "update_info.jsp?id=<%=id %>"><%=id %></a> </td>
    <td><%=name %> </td>
    <td><%=phone %> </td>
    <td><%=address %> </td>
    <td><%=major_code %> </td>
    <td><%=ho_code %> </td>
    <td>
      <a href="delete_info.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    
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