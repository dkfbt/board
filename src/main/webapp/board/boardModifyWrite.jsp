<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 page</title>

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
	
		<input type="hidden" name="unq" value="${boardVO.unq}">
	
		<table>
		<caption>(게시판 수정)</caption>
		
		<tr>
			<th width="20%"><label for="title">제목</label></th>
			
			<td width="80%">
			   <input type="text" name="title" id="title" class="input" value="${boardVO.title}">
			</td>
		</tr>
		
		<tr>
			<th><label for="pw">비밀번호</label></th>
			
			<td>
			   <input type="password" name="pw" id="pw" class="input">
			</td>
		</tr>
		
		<tr>
			<th><label for="writer">글쓴이</label></th>
			
			<td>
			   <input type="text" name="writer" id="writer" class="input" value="${boardVO.writer}">
			</td>
		</tr>
		
		<tr>
			<th><label for="content">내용</label></th>
			
			<td>
			    <textarea name="content" id="content" class="textarea">${boardVO.content}</textarea>
			</td>
		</tr>
		
		<tr>
		    <th colspan="2">
		    	<button type="button" onclick="fn_submit(); return false;">수정</button>
		    	
		    	<button type="reset" onclick="location='boardList.do'">취소</button>
		    </th>
		    
		    
		</tr>
	</table>
	
	</form>
	
	<script type="text/javascript">
	
		function fn_submit() {
			
			if ($.trim($("#title").val()) == "") {
				
				alert("제목을 입력하세요");
				
				$("#title").focus();
				
				return false;
				
			}
			
			$("#title").val($.trim($("#title").val()));
			
			if ($.trim($("#pw").val()) == "") {
				
				alert("비밀번호를 입력하세요");
				
				$("#pw").focus();
				
				return false;
			}
			
			$("#pw").val($.trim($("#pw").val()));
			
			let formData = $("#frm").serialize();
			
			$.ajax({
				
				type:"POST",
		        data:formData,
		        url:"boardModifySave.do",
		        dataType:"text",
		        
		        success:function(result) {

		            if(result == "1") {

		                alert("수정 저장 성공");

		                location = "boardList.do";
		                
		            } else if (result == "-1") {
		            	
		            	alert("비밀번호가 일치하지 않습니다!");

		            } else {

		                alert("저장 실패! \n 다시 시도해 주세요.");
		            }
		        },
		        
		        error:function() {

		            alert("오류발생");
		        }
				
			});
			
		}
	</script>
	
	
</body>
</html>