<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>

<style type="text/css">

	table {
	
		width: 400px;
		
		border-collapse: collapse;
	}
	
	th, td {
		
		border: 2px solid #cccccc;
		
		padding: 3px;
		
		line-height: 2.0;
	}
	
	
	caption {

		font-size: 18px;	
		
		font-weight: bold;
		
		margin-top: 10px;
		
		margin-bottom: 5px;
    }
    
    .input {
    
    	width: 97%;
    }
    
    #div_btn {
    
    	margin-top: 20px; 
    
    }
    
    
    
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>

<body>

	<%@ include file="../include/topmenu.jsp" %> 

	<form name="frm" id="frm">
	
		<table>
			
			<caption>(로그인)</caption>
			
			<tr>
				<th><label for="userid">id: </label></th> 
				
				<td>
					<input type="text" name="userid" id="userid" class="input" placeholder="id 입력" />
				</td>
			</tr>
			
			<tr>
				<th><label for="pw">비밀번호: </label></th> 
				
				<td>
					<input type="password" name="pw" id="pw" class="input" placeholder="비밀번호 입력" />
				</td>
			</tr>
		
		</table>
		
		<div id="div_btn">
		  	<button type="button" id="submit_btn">로그인</button>
		  	
		  	<button type="reset">취소</button>
		</div>
	</form>

	<script type="text/javascript">
	
		$(function() {
			
			$("#submit_btn").click(function() {
				
				let userid = $("#userid").val();
				
				let pw = $("#pw").val();
				
				userid = $.trim(userid);
				pw = $.trim(pw);
				
				if (userid == "") {
					
					alert("id를 입력해 주세요!");
					
					$("#userid").focus();
					
					return false;
				}
				
				if (pw == "") {
					
					alert("비밀번호를 입력해 주세요!");
					
					$("#pw").focus();
					
					return false;
				} 
				
				$.ajax({

		            type:"POST",
		            data:"userid="+userid+"&pw="+pw,
		            url:"loginWriteSubmit.do",
		            dataType:"text",

		            success:function(result) {
		            	
		            	console.log(result);

		                if(result == "ok") {

		                    alert(userid + "님 login되었습니다");
		                    
		                    location = "boardList.do";

		                } else {

		                    alert("id or 비밀번호를 다시 확인해주세요!!");
		                }
		             },

		             error:function() {

		                alert("오류발생");
		             }
		        });

			});
		})
		
	
		
	
	</script>

</body>
</html>