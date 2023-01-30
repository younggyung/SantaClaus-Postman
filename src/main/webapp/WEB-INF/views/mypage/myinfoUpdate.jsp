<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보수정</title>
    <link rel="stylesheet" href="/resources/css/mypage/myinfoUpdate.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/header.jsp" %>
	<%@include file="../include/floatingMenu.jsp" %>
	
    <div class="wrapper">
        <form action="/main/myinfoUpdate" id="submit" method="post" enctype="multipart/form-data">
            <div id="info">
           	<h1>회원정보 수정</h1>
           		<input type="button" class="button" id="delete" value="회원탈퇴" >
            	<table class="usermodify" border="1">
            		<colgroup>
	            		<col width="270">
	            		<col width="700">
            		</colgroup>
            		<tr>
            			<th>프로필 변경</th>
					    <td>
					    	<span class="select_img"><img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" width="100"></span>
					    	<input type="file" class="button" id="inputGroupFile02" name="files" value="test"  >
					    </td>
				    </tr>
					<input type="hidden" name="rfileName" value="${memberdto.rfileName}" />
	            	<tr>
	            		<th>이름</th>
	            		<td>
	            			<input type="text" name="name" class="readonly" value="${memberdto.name }" readonly ><br>
	            		</td>
	            		<%-- <span>${memberdto.name }</span><br> --%>
	           		</tr>
	                <tr>
	                	<th>아이디</th>
	                	<td>
	                    	<input type="text" name="user_id" id="id" class="readonly" value="${memberdto.user_id }" readonly><br>
                    	</td>
	                    <%-- <span>${memberdto.user_id }</span><br> --%>
	                </tr>
	                <tr>
	                	<th>현재 비밀번호 <span style="color:red">*</span></th>
	                	<td>
		                    <input type="text" id="passwordck" required="required" placeholder="정보 수정/탈퇴 시 입력 필수">
	                    </td>
	                </tr>
	                <tr style="border-bottom: 0px solid white;">
	                	<th>변경할 비밀번호</th>
	                	<td id="ps">
		                    <input type="text" name="password" id="pw">
	                    	<span id="pwChk" class="error"></span>
	                    </td>
	               	</tr>
	               	<tr>
	               		<th>비밀번호 확인</th>
               			<td id="psck">
	                	    <input type="text" id="pwConfirm" >
	                    	<span id="pwConfirmChk" class="error"></span>
                   		</td>
	                </tr>
	                <tr>
	                	<th>주소</th>
                		<td>
                		<div>
	           				 <label for="post_code">우편번호</label>
	           				 <input name="post_code" id="post_code" type="text" value="${memberdto.post_code }" required="required">
	                 		 <input class="button" type="button" value="주소찾기" onclick="userPostcode()"><br>
                 		 </div>
	                 	<div>	 
			                 <label for="default_addr">기본 주소</label>
			                 <input name="default_addr" id="default_addr" type="text" value="${memberdto.default_addr}" required="required"><br>
			                 </div>
			            <div>     
			                 <label for="detail_addr">나머지 주소</label>
			                 <input name="detail_addr" id="detail_addr" type="text" value="${memberdto.detail_addr}" required="required">
			                 </div>
	                 	</td>
                 	</tr>
	                <tr>
	                	<th>이메일</th>
	                	<td>
		                	<input type="text" name="email" id="email" value="${memberdto.email}" required="required">
	                	</td>
	                </tr>
	                <tr>
	                	<th>휴대전화</th>
	                	<td>
	                		<div>
	                			<label for="phone">핸드폰 번호</label>
			                    <input type="text" name="phone" id="phone" value="${memberdto.phone}" placeholder="'-'없이 숫자만 입력해주세요" required="required">
			                    <input type="hidden" id="phoneChk" value="${memberdto.phone}">
			                    <input type="button" class="button" id="phoneAuth" value="인증번호 전송">
								<span id="sendSucess"></span>                    
							</div>
							<div>
								<label for="phoneckcode">인증코드 입력</label>
								<input id="phoneckcode" type="text" >
								<input id="phoneck" class="button" type="button" value="인증하기">
								<span id="authSuccess"></span>
								<br>기존의 핸드폰번호와 다른데 수정을 누를 시 alert("휴대폰 인증을 해주세요")
							</div>
						</td>
	                </tr>
				</table>
                <div class="end">
                    <input type="submit" class="button" id="update" value="수정">
                    <input type="button" class="button" id="cancel" value="취소" onclick="location.href='/mypage/main'">
                </div>
		    </div>
        </form>    
    </div>
                
	<!-- footer -->
	<%@include file="../include/footer.jsp" %>
	
	<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		//프로필 변경
		$("#inputGroupFile02").change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".select_img img").attr("src", data.target.result).width(200);        
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		
		$("#phoneckcode").attr("required", false);
		$("#phoneckcode").attr("disabled", true);
		$("#pwConfirm").attr("required", false);
		$("#pwConfirm").attr("disabled", true);
		
		
		
		
		//비밀번호 유효성 검사        
		var $pw = $("#pw");
		var $pwChk = $("#pwConfirm");
	
		$pw.on("keyup", function(){
			/* 영문, 숫자, 특수문자 중 2가지 이상 조합하여 7자리 이내의 암호 정규식 ( 2 가지 조합) */
			var regExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{7,}$/;
				if(!regExp.test($pw.val())){
					$("#pwConfirm").attr("disabled", true);
					$("#pwConfirm").attr("required", true);
					$("#pwChk").html("영문/숫자/특수문자 2가지 이상 조합 (7자리 이상)");
					$("#pwChk").css({
						"color" : "red",
						"font-weight" : "bold",
						"font-size" : "15px"
					})
				}else{
					$("#pwChk").html("사용 가능한 비밀번호입니다.");
					$("#pwChk").css({
						"color" : "blue",
						"font-weight" : "bold",
						"font-size" : "15px"
					})
					$("#pwConfirm").attr("disabled", false);
					$("#pwConfirm").attr("placeholder", "비밀번호를 다시 입력해주세요");
				}
		});
	
		$pwChk.on("keyup", function(){
			var password = document.getElementById('pw');
			var passwordConfirm = document.getElementById('pwConfirm');
	
			if(password.value == passwordConfirm.value){
				$("#pwConfirmChk").html("비밀번호가 일치합니다.");
				$("#pwConfirmChk").css({
					"color" : "blue",
					"font-weight" : "bold",
					"font-size" : "15px"
				})
			}else{
				$("#pwConfirmChk").html("비밀번호가 일치하지 않습니다.");
				$("#pwConfirmChk").css({
					"color" : "red",
					"font-weight" : "bold",
					"font-size" : "15px"
				})
			}
			
			
		});
	
		$("#phone").on("keyup", function(){
			var phoneNum = $("#phone").val();
			var phoneChk = $("#phoneChk").val();
			
			if(phoneNum != phoneChk){
				$("#phoneckcode").attr("required", true);
			}else{
				$("#phoneckcode").attr("required", false);
				$("#phoneckcode").attr("readonly", true);
			}
		
		});
		
			function userPostcode() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
	
						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}
	
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementsByName('post_code')[0].value = data.zonecode;
						document.getElementsByName("default_addr")[0].value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementsByName("default_addr")[0].focus();
					}
				}).open();
			}
			
			
			
			$('#phoneAuth').click(function() {
			$("#sendSucess").text("인증번호를 확인 해주세요.");
			var to = $('#user_phone').val();
	
			$.ajax({
				url : '/main/phoneAuth',
				type : 'GET',
				data : {
					"to" : to
				},
				success : function(data) {
					const checkNum = data;
	
					$('#phoneck').click(function() {
						const phoneckcode = $('#phoneckcode').val();
	
						if (checkNum === phoneckcode) {
							$("#authSuccess").text("인증이 완료되었습니다.");
						} else {
							$("#authSuccess").text("인증 실패하였습니다. 재인증 해주세요.");
						}
					});
	
				}
			});
	
		});
		
		$("#update").click(function() {
			var id = $('#id').val();
			var pwChk = $('#passwordck').val();
			var pw = $('#pw').val();
			
			
// 			$.ajax({
// 				url: "/main/pwChk",
// 				type : 'POST',
// 				data: {
// 					"user_id" : id,
// 					"pwChk" : pwChk
// 					},
// 				success: function(res){
// 					var updateCk = confirm("수정하시겠습니까?");
// 					if(updateCk){
// 						if(res == pwChk) {
// 							if(pw == " " || pw == "" || pw == null) {
// 								pw = pwChk;
// 							}
// 							console.log("pwChk="+pwChk);
// 							console.log("pw="+pw);
// 							alert("회원 정보가 수정되었습니다.");
// 							$("#submit").submit();
// 						}else {
// 							alert("비밀번호가 틀렸습니다.");
// 							window.location.reload();
// 						}
// 					}else{
// 						return false;
// 					}
// 				},
// 				error: function(error){
// 					alert("다시 시도해 주세요.");
// 				}	
// 			});
			
		});
	
		$("#delete").click(function(){
			var deleteCk = confirm("정말 삭제하시겠습니까?");
			if(deleteCk){
				location.href='/main/delete';
			} 
		});
		
	</script> 
</body>
</html>