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
      String sql = "update info0829 set name=?, phone=?, address=?, major_code=?, ho_code=? where id=?"; //노쉼표!! where id=? <-수정
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(6, id);    //update는 id가 젤 마지막
      pstmt.setString(1, name);  //여기서부터 1번
      pstmt.setString(2, phone); 
      pstmt.setString(3, address); 
      pstmt.setString(4, major_code); 
      pstmt.setString(5, ho_code); 
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("수정이 완료되었습니다");
      location.href="list_info.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   %>
</body>
</html>