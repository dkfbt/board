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
<title>전체 code 목록 page</title>

<style type="text/css">
	table {
		
		width: 700px; 
		border-collapse: collapse;
	}
	
	th, td {
	
		border: 1px solid #cccccc; 
		padding: 5px;
	}
</style>
</head
>
<body>
	
	<table>
	
		<caption>
			<div>code 목록</div>
			
			<div style="width: 100; text-align: right;">total: ${resultTotal}개</div>
		
		</caption>
		
		<colgroup>
			<col width="20%">
			<col width="30%">
			<col width="30%">
			<col width="20%">
		</colgroup>
		
		<tr>
			<th>일련 번호</th>
			<th>그룹명(job or hobby)</th>
			<th>code 이름</th>
			
			<th>수정 or 삭제</th>
		</tr>
		
		<c:set var="count" value="1"></c:set>
		
		<c:forEach var="list" items="${resultList}">
		
				<tr align="center">
					<td>${count}</td>
					<td>${list.gid}</td>
					<td>${list.name}</td>
					
					<td>
						<button type="button" onclick="fn_update('${list.code}')">수정</button>
						
						<button type="button" onclick="fn_delete('${list.code}')">삭제</button>
					</td>
					
				</tr>
				
				<c:set var="count" value="${count+1}"></c:set>
		
		</c:forEach>
	
	</table>
	
	<script type="text/javascript">
	
		function fn_delete(code) {
			
			if (confirm("정말 삭제하시겠습니다?")) {
				
				location = "codeDelete.do?code=" + code;
				
			}
			
		}
		
		function fn_update(code) {
			
			if (confirm("정말 수정하시겠습니까?")) {
				
				location = "codeModifyWrite.do?code=" + code;
				
			}
			
		}
	
	</script>

</body>
</html>