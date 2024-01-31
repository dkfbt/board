<%@ 	page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 정보 입력 page</title>

<style>
	table {
	
		width: 400px;
		
		border-collapse: collapse;
	}
	
	th, td {
	
		border: 1px solid #cccccc;
		padding: 0.5rem;
	
	}
</style>
</head>

<body>

	<form action="deptWriteSave.do" name="frm" method="post">
	
		<table>
		
			<tr>
				<th>부서 번호</th>
				
				<td>
					<input type="text" name="deptno">
				</td>
			</tr>
			
			<tr>
				<th>부서 이름</th>
				
				<td>
				    <input type="text" name="deptname">
				</td>
			</tr>
			
			<tr>
				<th>부서 위치</th>
				
				<td>
					<input type="text" name="deptloc">
				</td>
			</tr>
			
			<tr>
			    <th colspan="2">
			    	<button type="submit">저장</button>
			    </th>
				
			</tr>
			
			
		</table>
	
		
	</form>
	

</body>
</html>