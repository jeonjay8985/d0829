<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>

<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String major_code = request.getParameter("major_code");  
   String major_name = request.getParameter("major_name");

   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into major0829 values(?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, major_code);    
      pstmt.setString(2, major_name);  

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장성공");
      location.href="list_major.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   %>
</body>
</html>