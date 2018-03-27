<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link href="/webM2/css/bootstrap.min.css" rel="stylesheet" />
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' />
<link href="/webM2/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/webM2/css/jcarousel.css" rel="stylesheet" />
<link href="/webM2/css/flexslider.css" rel="stylesheet" />
<link href="/webM2/css/style.css" rel="stylesheet" />
<link href="/webM2/css/default.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link type="text/css" href="/webM2/css/loginForm.css" rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<head>
<style type="text/css">
img{
	display : block;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
function adJoinForm() {
	var v = document.adJoin;
	if(v.ad_m_id.value==""){
		alert("아이디를 입력하세요");
		v.ad_m_id.focus();
		return;
	}
	if(v.ad_m_pwd.value==""){
		alert("비밀번호를 입력하세요");
		v.ad_m_pwd.focus();
		return;
	}
	if(v.ad_m_name.value==""){
		alert("이름을 입력하세요");
		v.ad_m_name.focus();
		return;
	}
	v.submit();
} 


function adJoinRewrite(){	//다시 작성
	 document.adJoin.reset();
}
function adminList(){	//회원목록으로 이동
	location.href = "adList"; 
}

</script>
<title>관리자 회원등록</title>
</head>
<body>
<!-- 탑메뉴 -->
<jsp:include page="/view/menu/top.jsp"></jsp:include>

<div class="container">
	<div id="wrapper">
<div class="login">
<div class="container">
  <div class="col-lg-6 col-lg-offset-3">
    <h1 class="horizontal">회원등록</h1><!-- <div class="icon text-center"><i class="fa fa-paper-plane fa-2x" aria-hidden="true"></i></div> -->
    <div class="inner-form">
    <form name="adJoin" method="post" action="adJoinPro">
    <div class="row">
      <div class="col-lg-12">
		<label class="control-label required" for="phone">아이디<sup style="color:red">*</sup></label>
        <input id="ad_m_id" name="ad_m_id" type="text" class="form-control3" placeholder="Enter ID">
	  </div>
	  <div class="col-lg-12">
                <label class="control-label required" for="password">비밀번호<sup style="color:red">*</sup></label>
                <input id="ad_m_pwd" name="ad_m_pwd" type="password" class="form-control3" placeholder="Enter password">
            </div>
	  
		    <div class="col-lg-12">
		        <label class="control-label required" for="name">이름<sup style="color:red">*</sup></label>
		        <input id="ad_m_name" name="ad_m_name" type="text" class="form-control3" placeholder="Enter Name">
		    </div>
            <div class="col-lg-12">
                <label class="control-label required" for="phone">생년월일</label>
                <input id="ad_m_birth" name="ad_m_birth" type="text" class="form-control3" placeholder="Enter BirthDay">
            </div>
            <div class="col-lg-12">
                <label class="control-label required" for="email">Email</label>
                <input id="ad_m_email" name="ad_m_email" type="text" class="form-control3" placeholder="Enter Email Address">
            </div>
        <div class="col-lg-12">
                <label class="control-label required" for="name" >회원등급</label>
                <select name="ad_m_level" style="width: 380px; height: 40px; margin-bottom: 30px;">
			        <option value="새싹회원">새싹회원</option>
			        <option value="정회원">정회원</option>
			        <option value="우수회원">우수회원</option>
			        <option value="관리자">관리자</option>
			   </select>
        </div>
        <div class="col-lg-12">
                <label class="control-label required" for="email">월 한도 금액</label>
                <input id="ad_m_money" name="ad_m_money" type="text" class="form-control3" placeholder="Enter Money">
            </div>
    	<div class="col-lg-12" style="text-align: center">
            <input type="button" class="btn33" onclick="adJoinForm();" value="회원등록">
            <input type="button" class="btn33" onclick="adJoinRewrite();" value="다시작성">
            <input type="button" class="btn33" onclick="adminList();" value="회원목록">
        </div>
     </div>
</form>
</div> <!-- inner-form -->
</div></div></div>    
</div></div>
<!-- 바텀 -->
<jsp:include page="/view/menu/footer.jsp"></jsp:include>
</body>
</html>