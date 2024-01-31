<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%-- <%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newline", "\n"); %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 page</title>

<style type="text/css">

body {

	font-size: 18px;
}
	
table {
	
	width: 600px;
	border-collapse: collapse;
}	

th, td {

	border: 1px solid #cccccc;
	padding: 2px;
}

button {

	font-size: 12px; 
}

.input {

	width: 98%;
}

.textarea {

	width: 98%;
	height: 70px; 
	
}
</style>

<script src="/egov_board0/script/jquery-1.12.4.js"></script>
<script src="/egov_board0/script/jquery-ui.js"></script>

</head>

<body>

	<!-- <form action="boardWriteSave.do" name="frm" id="frm" method="post"> -->
	<form id="frm">
	
		<table>
		<caption>(게시판 상세 보기)</caption>
		
		<tr>
			<th width="20%">제목</th>
			
			<td width="80%">
				${boardVO.title}
			</td>
		</tr>
		
		
		<tr>
			<th>글쓴이</th>
			
			<td>
			   ${boardVO.writer}
			</td>
		</tr>
		
		<%-- <c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>')}" /> --%>
		
		<tr>
			<th>내용</th>
				
			<td height="70">
				${boardVO.content}
			</td>
		</tr>
		
		<tr>
			<th>등록일</th>
			
			<td>
				${boardVO.rdate}
			</td>
		</tr>
		
		<tr>
		    <th colspan="2">
		    	<button type="button" onclick="location='boardList.do'">목록</button>
		    	<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
		    	<button type="button" onclick="location='pwWrite.do?unq=${boardVO.unq}'">삭제</button>
		    	
		    </th>
		    
		</tr>
	</table>
	
	</form>
	
	<script type="text/javascript">
	
		
	</script>
	
	
</body>
</html>