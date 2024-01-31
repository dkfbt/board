<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 목록</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>

<body>

	<div style="width: 100%; text-align: center">
	
		<select name="address" id="address">
	
			<c:forEach var="result" items="${resultList}">
		
				<option value="${result.address}">${result.address}</option>
		
			</c:forEach>
	
		</select>
	
		<br> <br>
	
		<button type="button" id="apply_btn">적용하기</button>
	</div>
	
	<script type="text/javascript">
	
	$(function() {
		
		$("#apply_btn").click(function() {
			
			let address = $("#address").val();
			
			/* alert(address); */ 
			
			let address_array = address.split(" ");
			
			let zipcode = address_array[0].substring(1, address_array[0].length-1);
			
			/* alert(zipcode); */
			
			let address_only = address.replace(address_array[0], "");
			
			address_only = $.trim(address_only);
			
			/* alert(address_only); */
			
			opener.document.frm.zipcode.value = zipcode;
			opener.document.frm.address.value = address_only;
			
			self.close();
			
		});
		
	});
	

	</script>

	

</body>
</html>