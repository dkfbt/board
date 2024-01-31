<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>top menu</title>

<style type="text/css">

	table {
	
		width: 600px;
		
		border-collapse: collapse;
	}
	
	th, td {
		
		border: 2px solid #cccccc;
		
		padding: 3px;
		
		line-height: 2.0;
	}
	
	.upper_th {
	
		background-color: #ccff99;
	}
	
	a {
    	text-decoration: none;
    }

</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>
   
    <%
      String userid = (String) session.getAttribute("SessionUserID");
    %>

	<table>
		<tr class="upper_th">
			<th width="25%"><a href="/egov_board0/home.do">홈</a></th>
			
			<th width="25%"><a href="/egov_board0/boardList.do">게시판</a></th>
			
	<% 
	  if (userid == null) {
	%>		
	
	  <th width="25%"><a href="/egov_board0/memberWrite.do">회원 가입</a></th>
	  <th width="25%"><a href="/egov_board0/loginWrite.do">로그인</a></th>
	<%
	  } else {
	%>
	
	  <th width="25%"><a href="/egov_board0/memberModifyWrite.do" id="userModify">회원 정보 수정</a></th>

	  <th width="25%"><a href="/egov_board0/logout.do" id="logout">로그아웃</a></th>
	
	<%
	  }
	%>
			
		</tr>
	</table>
	
	<script type="text/javascript">
	
		$(function() {
			
			$("#logout").click(function() {
				
					alert("logout되었습니다");
					
			});
			
			$("#userModify").click(function() {
				
				alert("회원 정보 수정");
				
				
				
			});
			
		})
	</script>

</body>
</html>