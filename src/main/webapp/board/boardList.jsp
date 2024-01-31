<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 page</title>

<style type="text/css">

	
table {
	
	width: 600px;
	border-collapse: collapse;
}	

th, td {

	border: 1px solid #cccccc;
	padding: 3px;
	line-height: 2.0
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
a {

	text-decoration: none;
}

.div1 {

    width: 600px;
    
    text-align: center;
    
    font-size: 20px;
    
    margin-top: 20px;
    
    font-weight: bold;

}

.div2 {
 
	width: 600px;
	
	text-align: right;
	
	font-size: 18px;
	
	margin-bottom: 10px;
}

</style>
</head>

<body>

	<%@ include file="../include/topmenu.jsp" %>

	<div class="div1">(게시판 목록)</div>
			
	<div class="div2">게시글 total 개수: ${total}</div>
	
	<div class="div2">
	
		<form action="boardList.do" name="searchFrm" method="post">
		
			<select name="searchCategory" id="searchCategory"> 
		
				<option value="title">제목</option>
				<option value="writer">글쓴이</option>
				<option value="content">내용</option>
		
			</select>
		
			<input type="text" name="searchWord" id="searchWord">
		
			<button type="submit">검색</button>
		
		</form>
	
		
	
	</div>
		
	<table>
	
		<tr>
			<th width="15%">번호</th>
			<th width="20%">제목</th>
			<th width="25%">글쓴이</th>
			<th width="30%">등록일</th>
			<th width="10%">조회수</th>
		</tr>
		
		<%-- <c:set var="count" value="1"></c:set> --%>
		<c:set var="count" value="${rowNumber}" />
		
		<c:forEach var="result" items="${resultList}">
		
			<tr align="center">
				<td> <c:out value="${count}" /> </td>
				
				<td align="left"><a href="boardDetail.do?unq=${result.unq}"><c:out value="${result.title}" /></a></td>
				
				<td> <c:out value="${result.writer}" /> </td>
				<td> <c:out value="${result.rdate}" /> </td>
				<td> <c:out value="${result.hits}" /> </td>
			</tr>
			
			<c:set var="count" value="${count - 1}" />
			<%-- <c:set var="count" value="${count + 1}" /> --%>			
		
		</c:forEach>
	</table>
	
	<div style="margin-top: 5px; width: 600px; text-align: center;">
	
		<c:forEach var="i" begin="1" end="${totalPage}">
			<a href="boardList.do?viewPage=${i}">${i  }</a> 
		</c:forEach>
		
	</div>
	
	<div style="margin-top: 5px; width: 600px; text-align: right;">
		<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
	</div>

</body>
</html>