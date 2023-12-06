<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.ho_code.value==""){
		alert("취미코드를 입력하세요");
		document.frm.ho_code.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.ho_name.value==""){
		alert("취미이름을 입력하세요");
		document.frm.ho_name.focus(); 
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
<h1>취미 정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String ho_code = request.getParameter("ho_code"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from hope0829 where ho_code=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, ho_code); //<% String 변수이름이랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String ho_name = rs.getString("ho_name");

		   
%>
<form name="frm" method="post" action="update_hoProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>취미코드</th>
      <td><input type="text" name="ho_code" id=in1 value="<%=ho_code%>"></td>
</tr>

<tr> 
      <th>취미명</th>
      <td><input type="text" name="ho_name" id=in1 value="<%=ho_name%>"></td>
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