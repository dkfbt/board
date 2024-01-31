<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록</title>

<style>
	table {
	
		width: 400px;
		border-collapse: collapse;
	}
	
	th, td {
		
		border: 1px solid #cccccc;
		padding: 5px;
	}
</style>
</head>

<body>

	<table>
		
		<caption>부서 목록</caption>
		
		<tr>
			<th>부서 번호</th>
			<th>부서 이름</th>
			<th>부서 위치</th>
		</tr>
		
		<c:forEach var="result" items="${resultList}" varStatus = "status">
		
			<tr>
				<td>${result.deptno}</td>
				
				<td><a href="deptDetail.do?deptno=${result.deptno}">${result.deptname}</a></td>
							  
				<td>${result.deptloc}</td>			  
			</tr>
		
		</c:forEach>
	</table>

</body>
</html>