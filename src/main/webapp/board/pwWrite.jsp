<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 check page</title>

<script src="/egov_board0/script/jquery-1.12.4.js"></script>
<script src="/egov_board0/script/jquery-ui.js"></script>

</head>

<body>

	<table>
		
		<tr>
			<th>비밀번호 입력</th>
			
			<td><input type="password" name="pw" id="pw"></td> 
			
			<td><button type="button" id="delBtn">삭제</button></td>
		</tr>
	
	</table>
	
	<script type="text/javascript">
	
		$(function() {
			
			$("#delBtn").click(function() {
				
				let password = $("#pw").val();
				
				password = $.trim(password);
				
				if (password == "") {
					
					alert("비밀번호를 입력하세요!");
					
					$("#pw").focus();
					
					return false;
				}
				
				let sendData = "unq=${unq}&pw=" + password;
				
				$.ajax({
					
					type:"POST",
					
			        data:sendData,
			        
			        url:"boardDelete.do",
			        dataType:"text",
			        
			        success:function(result) {

			            if(result == "1") {

			                alert("삭제 완료");

			                location = "boardList.do";

			            } else if(result == "-1") {
			            	
			            	alert("암호가 일치하지 않습니다!!");
			            	 
			            } else {

			                alert("삭제 실패!\n다시 시도해 주세요.");
			            }
			        },
			        error:function() {

			            alert("오류발생");
			        }
					
					
				});
				
			});
			
		});
	</script>
</body>
</html>