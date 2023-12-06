<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.major_code.value==""){
		alert("전공코드를 입력하세요");
		document.frm.major_code.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.major_name.value==""){
		alert("전공명을 입력하세요");
		document.frm.major_name.focus(); 
		return false;  
	}
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>전공 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String major_code = request.getParameter("major_code"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from major0829 where major_code=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, major_code); //<% String 변수이름이랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String major_name = rs.getString("major_name");

		   
%>
<form name="frm" method="post" action="update_majorProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>전공코드</th>
      <td><input type="text" name="major_code" id=in1 value="<%=major_code%>"></td>
</tr>

<tr> 
      <th>전공명</th>
      <td><input type="text" name="major_name" id=in1 value="<%=major_name%>"></td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>