<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>code 입력 page</title>

<style type="text/css">

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

	<form action="codeWriteSave.do" name="frm" method="post"> 
	
		<table>
			
			<tr>
				<th>분류</th>
				
				<td>
					<select name="gid">
						<option value="1">job(업무)</option>
						<option value="2">hobby(취미)</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>code 이름</th>
				
				<td>
				 	<input type="text" name="name">
				</td>
			</tr>
			
			<tr>
			
				<th colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">저장</button>
					
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	
	</form>
	
	<script type="text/javascript">
	
		function fn_submit() {
			
			if (document.frm.name.value == "") {
				
				alert("code 이름을 입력해주세요!");
				
				document.frm.name.focus();
				
				return false;
				
			}
			
			document.frm.submit();
			
		}
	
	</script>

</body>
</html>