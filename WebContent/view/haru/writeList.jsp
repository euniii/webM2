<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
input{
	height: 30px;
}
td .view-message{
	background-color: #4a8aa0;
	color: white; 
	font-size: 16px
}



</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loosedtd">
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webM2/css/haruFonts.css">
<link type="text/css" href="/webM2/css/mem.css" rel="stylesheet" />
<link type="text/css" href="/webM2/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/webM2/css/main.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 날짜선택 스크립트 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script><!-- 날짜끝 -->
<script src="/webM2/js/search.js" type="text/javascript" charset="euc-kr"></script> 

<link href="/webM2/css/bootstrap.min.css" rel="stylesheet" />
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' />
<link href="/webM2/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/webM2/css/jcarousel.css" rel="stylesheet" />
<link href="/webM2/css/flexslider.css" rel="stylesheet" />
<link href="/webM2/css/style.css" rel="stylesheet" />
<link href="/webM2/css/default.css" rel="stylesheet" />
<title>Insert title here</title>

<script>
function main_search(frm){
	//회원검색기능
	var frm = document.search;
	
	frm.submit();
}

//날짜선택 자바스크립트
 $(function() {
 	  $( "#main_writeday" ).datepicker({
 	    dateFormat: 'yymmdd'
 	  });
 	});
 $(function() {
	  $( "#main_writeday2" ).datepicker({
	    dateFormat: 'yymmdd'
	  });
	});
 
</script>
</head>
<body>
<jsp:include page="/view/menu/top2.jsp"></jsp:include>
<jsp:include page="/view/menu/side.jsp"></jsp:include>

<div class="container2" style="margin-top: 30px;">
<div id="wrapper">
<section id="content">
<div class="container">
 <div class="mail-box">
 <aside class="lg-side"></aside></div>
 <div style="text-align: center; font-family:'GoodFont'; ">
	 <b style="font-size:40px;">${name}님의 사용내역 (총 ${count}건)</b> <br>
	 <b style="font-size:25px; color:red">지출 : ${mainboard.tot_spend}원</b>&nbsp;&nbsp;&nbsp;&nbsp;
	 <b style="font-size:25px; color:blue"> 수입: ${mainboard.tot_import}원</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 </div>
 
 <div style="height: 3px; background-color: #00000029; margin-top: 7px;"></div><!-- 선 -->
 <br>
<!-- 검색기능 -->
 <form name ="search" method="post" align="right">
 		날짜 : <input type="text" id="main_writeday" name="main_writeday" style="width: 100px;"> 
 							~ <input type="text" id="main_writeday2" name="main_writeday2" style="width: 100px;">&nbsp;&nbsp;
		항목 : <select name="key1" style="height: 30px;" onchange="doChange(this, 'main_account')">
		<option>항목선택</option>
		<option value="1">지출</option>
		<option value="2">수입</option>
		</select>
		<select name="key2" id="main_account" style="height: 30px;">
		<option>계정선택</option>
		</select>
		<input type="button" value="검색" onclick="main_search(form)" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<%-- <b>계정별지출 : ${mainboard.sum_spend}&nbsp;&nbsp;&nbsp;&nbsp;계정별수입: ${mainboard.sum_import}</b> --%>
</form><!-- 검색기능  끝-->
	
<div class="inbox-body">
<div class="mail-option">
<c:if test="${count == 0}">
<table class="table table-inbox table-hover">
	  <tr height="30">
		 <td colspan="6" style="text-align: center;">등록된 게시물이 없습니다.</td>
	  </tr>
</table>
</c:if>

<c:if test="${count !=0 }">
<table class="table table-inbox table-hover">
       <tr class="unread">
         <td class="view-message" align="center" width="10%" style="background-color: #4a8aa0;color: white; font-size: 16px;">번호</td>
         <td class="view-message" align="center" width="20%" style="background-color: #4a8aa0;color: white; font-size: 16px;">날짜</td>
         <td class="view-message" align="center" width="15%" style="background-color: #4a8aa0;color: white; font-size: 16px;">항목</td>
         <td class="view-message" align="center" width="15%" style="background-color: #4a8aa0;color: white; font-size: 16px;">계정</td>
         <td class="view-message" align="center" width="30%" style="background-color: #4a8aa0;color: white; font-size: 16px;">내용</td>
         <td class="view-message" align="center" width="10%" style="background-color: #4a8aa0;color: white; font-size: 16px;">금액</td>
      </tr>
<c:forEach var="mainboard" items="${mainList}">
	  <tr height="30">
		<td align="center" width="10%">${mainboard.main_num}</td><!-- 번호 -->
		<td align="center" width="20%">
				<a href="content?num=${mainboard.main_num}">${mainboard.main_writeday}
				</a></td><!-- 날짜 -->
		<td align="center" width="15%">${mainboard.main_option}</td><!-- 항목 -->
		<td align="center" width="15%">${mainboard.main_account}</td><!-- 계정 -->
		<td align="center" width="30%">${mainboard.main_content}</td><!-- 내용 -->
		<td align="center" width="10%" style="text-align: right;">${mainboard.main_price}</td><!-- 금액 -->
	  </tr>
	  </c:forEach>
	</table></c:if>
	
	<!-- 하단 페이지 -->
	<div class="w3-center" style="margin-top: 20px; text-align: center;">
	<c:if test="${count>0}">
	<c:if test="${startPage > bottomLine }">
		<a href="writeList?pageNum=${startPage - bottomLine}">[이전]</a> 
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">	
	<a href="writeList?pageNum=${i}">
	<c:if test="${i !=  currentPage}">[${i}]</c:if>
	<c:if test="${i ==  currentPage}">
	<font color='red'>[${i}]</font></c:if></a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<a href="writeList?pageNum=${startPage+bottomLine}">[다음]</a>
	</c:if>	
		
</c:if>	
	</div>
	</div>
	</div>
	</div>
	</div></div>
<jsp:include page="/view/menu/footer.jsp"></jsp:include>
</body>
</html>