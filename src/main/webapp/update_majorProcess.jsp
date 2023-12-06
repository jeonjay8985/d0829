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
   String major_code = request.getParameter("major_code");   //사원번호(id) 데이터
   String major_name = request.getParameter("major_name");
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update major0829 set major_name=? where major_code=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(2, major_code);    
      pstmt.setString(1, major_name);  

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="list_major.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>