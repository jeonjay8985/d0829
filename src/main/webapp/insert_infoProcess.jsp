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
   String id = request.getParameter("id");   //사원번호(id) 데이터
   String name = request.getParameter("name");
   String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
   String address = request.getParameter("address");
   String major_code = request.getParameter("major_code");
   String ho_code = request.getParameter("ho_code");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into info0829 values(?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, name);  //두번째 물음표에 name이 넘어감
      pstmt.setString(3, phone); 
      pstmt.setString(4, address); 
      pstmt.setString(5, major_code); 
      pstmt.setString(6, ho_code); 
      
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장성공");
      location.href="list_info.jsp";
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