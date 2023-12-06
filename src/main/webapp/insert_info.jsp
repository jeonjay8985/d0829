<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.id.value==""){
		alert("학번을 입력하세요");
		document.frm.id.focus(); //커서가 id에 그대로 남아있도록 
		return false;            //id를 입력하지 않으면 진행불가
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;  
	}

	if(document.frm.address.value==""){
		alert("주소를 입력하세요");
		document.frm.address.focus(); 
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
<h1>학사 정보 등록 화면</h1>

<form name="frm" method="post" action="insert_infoProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>학번</th>
      <td><input type="text" name="id" id=in></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in></td>
</tr>
 
<tr> 
       <th>전화</th>
      
      <td>
     <input type="text" name="phone1" id=in>
      -
        <input type="text" name="phone2" id=in>
        -
          <input type="text" name="phone3" id=in>
    </td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in3></td>
</tr>

<tr> 
      <th>전공</th>
      <td>
      <select name = "major_code" id=in>
      <option value ="10" selected> 컴퓨터공학과</option>
      <option value ="11"> 영문학과</option>
      <option value ="12"> 경영학과</option>
      <option value ="13"> 일어과</option>
      <option value ="14"> 기계과</option>
      <option value ="15"> 인문학과</option>
      <option value ="16"> 간호과</option>
      </select>
    </td>
</tr>

<tr> 
      <th>취미</th>
      <td>
      <select name = "ho_code" id=in>
      <option value ="10" selected> 프로그램</option>
      <option value ="11"> 등산</option>
      <option value ="12"> 여행</option>
      <option value ="13"> 운동</option>
      <option value ="14"> 멍때리기</option>
      <option value ="15"> 영화보기</option>
      <option value ="16"> 낚시</option>
      </select>
    </td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>