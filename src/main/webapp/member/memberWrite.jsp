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
<title>회원 가입 page</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 
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
	
	.div_btn {
	
		width: 600px;
		
		text-align: center;
		
		margin-top: 5px;
	}
	
	.upper_th {
	
		background-color: #ccff99;
	}
	
	caption {

		font-size: 18px;	
		
		font-weight: bold;
		
		margin-top: 10px;
		
		margin-bottom: 5px;
    }
    
    a {
    	text-decoration: none;
    }
</style>
</head>

<body>

	<%@ include file="../include/topmenu.jsp" %> 
	
	<form action="" name="frm" id="frm">
	
		<table>
			<caption>(회원 가입 form)</caption>
			
			<tr>
				<th><label for="userid">id: </label> </th> 
				
				<td>
					<input type="text" name="userid" id="userid" placeholder="id 입력"/>
					
					<button type="button" id="idcheck_btn">id 중복 체크</button>
				</td>
			</tr>
			
			
			<tr>
				<th><label for="pw">비밀번호: </label> </th> 
				
				<td>
					<input type="password" name="pw" id="pw" />
					
				</td>
			</tr>
			
			<tr>
				<th><label for="name">이름: </label> </th> 
				
				<td>
					<input type="text" name="name" id="name" />
					
				</td>
			</tr>
			
			<tr>
				<th><label for="gender">성별: </label> </th> 
				
				<td>
					<input type="radio" name="gender" id="gender1" value="M" />남
					<input type="radio" name="gender" id="gender2" value="F" />여
					
				</td>
			</tr>
			
			<tr>
				<th><label for="birth">생년월일: </label> </th> 
				
				<td>
					<input type="text" name="birth" id="birth" />
					
				</td>
			</tr>
			
			<tr>
				<th><label for="phone">연락처: </label> </th> 
				
				<td>
					<input type="text" name="phone" id="phone" /> (예: 010-1234-1234)
					
				</td>
			</tr>
			
			<tr>
				<th><label for="address">주소: </label> </th> 
				
				<td>
					<input type="text" name="zipcode" id="zipcode" />
					<button type="button" id="zipcode_btn">우편번호 찾기</button>
					
					<br>
					
					<input type="text" name="address" id="address" />
				</td>
			</tr>
			
		</table>
		
		<div class="div_btn">
			<button type="submit" id="submit_btn">저장</button>
			<button type="reset">취소</button>
		</div>
	
	
	</form>

	<script>
  $(function() {
	  
    $("#birth").datepicker({
      changeMonth: true,
      changeYear: true
    });
    
    $("#zipcode_btn").click(function() {
    	
    	let url = "post1.do";
    	
    	window.open(url, 'zipcode', 'width=500, height=400');
		
	}); 
    
    $("#idcheck_btn").click(function() {
    	
    	let userid = $("#userid").val();
    	
    	userid = $.trim(userid);
    	
    	if (userid == "") {
    		
    		alert("id를 입력하세요!!");
    		
    		$("#userid").focus();
    		
    		return false;
    		
    	}
    	
    	$.ajax({

            type:"POST",
            data:"userid="+userid,
            url:"idcheck.do",
            dataType:"text",

            success:function(result) {
            	
            	console.log(result);

                if(result == "ok") {

                    alert("사용 가능한 id입니다");

                } else {

                    alert("이미 사용 중인 id입니다!!");
                }
             },

             error:function() {

                alert("오류발생");
             }
        });
		
	});
    
    $("#submit_btn").click(function() {
    	
    	let userid = $("#userid").val();
    	let pw = $("#pw").val();
    	let name = $("#name").val();
    	
    	userid = $.trim(userid);
    	pw = $.trim(pw);
    	name = $.trim(name);
    	
    	if (userid == "") {
    		
    		alert("id를 입력해주세요!!");
    		
    		$("#userid").focus();
    		
    		return false;
    	}
    	
    	if (pw == "") {
    		
    		alert("비밀번호를 입력해주세요!!");
    		
    		$("#pw").focus();
    		
    		return false;
    	}
    	
    	if (name == "") {
    		
    		alert("이름을 입력해주세요!!");
    		
    		$("#name").focus();
    		
    		return false;
    	}
    	
    	$("#userid").val(userid);
    	$("#pw").val(pw);
    	$("#name").val(name);
    	
    	let formData = $("#frm").serialize();
    	
    	$.ajax({

		        type:"POST",
		        data:formData,
		        url:"memberWriteSave.do",
		        dataType:"text",

		        success:function(result) {

    			            if(result == "ok") {

    			                alert("저장 완료");

    			                location = "loginWrite.do";

    			            } else {

    			                alert("저장 실패! 다시 시도해 주세요.");
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