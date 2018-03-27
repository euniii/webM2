<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="/webM2/css/haruFonts.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link type="text/css" href="/webM2/css/loginForm.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 날짜선택 스크립트 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script><!-- 날짜끝 --> 
<script src="/webM2/js/search.js" type="text/javascript" charset="euc-kr"></script> 
<head>

<script type="text/javascript">
 function accinsert() {
	var v = document.mainWriteForm;
	if(v.main_writeday.value==""){
		alert("날짜를 입력하세요");
		v.main_writeday.focus();
		return;
	}
	if(v.main_option.value==""){
		alert("항목을 선택하세요");
		v.main_option.focus();
		return;
	}
	if(v.main_account.value==""){
		alert("계정을 선택하세요");
		v.main_account.focus();
		return;
	}
	if(v.main_price.value==""){
		alert("금액을 입력하세요");
		v.main_price.focus();
		return;
	}
	v.submit();
} 

function accrewrite(){	//다시 작성
	document.frm.reset();
}

//날짜선택 자바스크립트
 $(function() {
 	  $( "#main_writeday" ).datepicker({
 	    dateFormat: 'yymmdd'
 	  });
 	});



</script>
 
<title>정보수정</title>
</head>
<body>

<div class="container">
	<div id="wrapper">

<div class="login">
<div class="container">
  <div class="col-lg-6 col-lg-offset-3">
    <h1 class="horizontal">가계부 작성하기</h1><!-- <div class="icon text-center"><i class="fa fa-paper-plane fa-2x" aria-hidden="true"></i></div> -->
    <div class="inner-form2">
    <form name="mainWriteForm" action="writePro" method="post">
    <input type="hidden" name="m_id" value="${id}">
    <div class="row">
      
      <div class="col-lg-12">
				<label class="control-label required" for="phone">날짜<sup style="color:red">*</sup></label>
				<input class="form-control4" type="text" id="main_writeday" name="main_writeday">
		    </div>
		    
		    <div class="col-lg-12">
                <label class="control-label required" for="password">항목<sup style="color:red">*</sup></label>
                <!-- <input id="m_pwd" name="m_pwd" type="password" class="form-control3"> -->
                <select class="form-control4" name="main_option" id="main_option" onchange="doChange(this, 'main_account')">
			        <option value="default">---항목선택---</option>
			        <option value="1">지출</option>
			        <option value="2">수입</option>
			    </select>
            </div>
		    <div class="col-lg-12" >
		        <label class="control-label required" for="phone">계정<sup style="color:red">*</sup></label><br>
		        <select class="form-control4" name="main_account" id="main_account" style="float: left; width: 48%;">
			        <option value="default">---계정 선택---</option>
			    </select>
		        <input id="main_account2" name="main_account2" type="text" class="form-control4" style="float: right; width: 48%;">
		    </div>
		    
            <div class="col-lg-12">
                <label class="control-label required" for="phone">내용</label>
               <input id="main_content" name="main_content" type="text" class="form-control4">
            </div>
            
            <div class="col-lg-12">
                <label class="control-label required" for="email">금액<sup style="color:red">*</sup></label>
                <input id="main_price" name="main_price" type="text" class="form-control4">
            </div>
    	<div class="col-lg-12" style="text-align: center">
    		<input type="button" class="btn33" onclick="accinsert();" value="저장하기">
            <input type="button" class="btn33" onclick="accrewrite();" value="다시작성">
        </div>
     </div>
</form>
</div> <!-- inner-form -->

</div></div></div>   
 
</div></div>
</body>
</html>