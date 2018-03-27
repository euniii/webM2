<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
img{
	display : block;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
function userUpdate() {
	var v = document.userUpdateP;
	v.submit();
}
function rewrite(){
	 document.userUpdate.reset();
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/webM2/css/haruFonts.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link type="text/css" href="/webM2/css/loginForm.css" rel="stylesheet" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> 

<link href="/webM2/css/bootstrap.min.css" rel="stylesheet" />
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' />
<link href="/webM2/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/webM2/css/jcarousel.css" rel="stylesheet" />
<link href="/webM2/css/flexslider.css" rel="stylesheet" />
<link href="/webM2/css/style.css" rel="stylesheet" />
<link href="/webM2/css/default.css" rel="stylesheet" />
<title>정보수정</title>
</head>
<body>
<jsp:include page="/view/menu/top.jsp"></jsp:include>
<jsp:include page="/view/menu/side.jsp"></jsp:include>

<div class="container">
	<div id="wrapper">

<div class="login">
<div class="container">
  <div class="col-lg-6 col-lg-offset-3">
    <h1 class="horizontal" style="font-family:GoodFont;">내정보 수정하기</h1><!-- <div class="icon text-center"><i class="fa fa-paper-plane fa-2x" aria-hidden="true"></i></div> -->
    <div class="inner-form">
    <form role="form" name="userUpdateP" method="post" action="userUpdateP">
    <input type="hidden" name="m_num" value="${vo.m_num}">
    <div class="row">
      
      <div class="col-lg-12">
				<label class="control-label required" for="phone">아이디<sup style="color:red">*</sup></label>
		        <input id="m_id" name="m_id" type="text" class="form-control2" value="${vo.m_id}" readonly />
		    </div>
		    <div class="col-lg-12">
                <label class="control-label required" for="password">비밀번호<sup style="color:red">*</sup></label>
                <input id="m_pwd" name="m_pwd" type="password" class="form-control3">
            </div>
		    <div class="col-lg-12">
		        <label class="control-label required" for="name">이름<sup style="color:red">*</sup></label>
		        <input id="m_name" name="m_name" type="text" class="form-control3" value="${vo.m_name }">
		    </div>
            <div class="col-lg-12">
                <label class="control-label required" for="phone">생년월일</label>
               <input id="m_birth" name="m_birth" type="text" class="form-control3" value="${vo.m_birth}">
            </div>
            <div class="col-lg-12">
                <label class="control-label required" for="email">Email</label>
                <input id="m_email" name="m_email" type="text" class="form-control3" value="${vo.m_email}">
            </div>
        <div class="col-lg-12">
                <label class="control-label required" for="name">회원등급</label>
                <input id="m_level" name="m_level" type="text" class="form-control2" value="${vo.m_level}" readonly />
        </div>
        <div class="col-lg-12">
		        <label class="control-label required" for="phone">월 한도금액</label>
		        <input id="m_money" name="m_money" type="text" class="form-control3" value="${vo.m_money}">
     		 </div>
    	<div class="col-lg-12" style="text-align: center">
            <input type="button" class="btn22" onclick="userUpdate();" value="수정완료">
            <input type="button" class="btn22" onclick="rewrite();" value="다시작성">
        </div>
     </div>
</form>
</div> <!-- inner-form -->
</div></div></div>    
</div></div>
<jsp:include page="/view/menu/footer.jsp"></jsp:include>
</body>
</html>