<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% 
	String id = (String)session.getAttribute("id");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function changeView(value) {
	
	var id = "<%=(String)session.getAttribute("id")%>";
		if(id == "null"){
			alert("로그인 후 이용바랍니다");
		}else{
			if(value == "1") {// 입력페이지
				location.href="writeForm";
			}else if(value == "2") {// 보기페이지
			    location.href="writeList";
			}else if(value == "3") {// 통계페이지
			    location.href="chart";
			}else if(value == "4") {// 설정페이지
			    location.href="calendar";
			}else if(value == "8") {// 회원관리페이지
			    location.href="main.jsp?contentPage=/admin/list.jsp";
			}
		}
	}
</script>
</head>
<body>

<div class="container">
<div class="row">
					<div class="col-lg-12">
						<div class="row">
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<!-- <h4>하루,쓰기</h4> -->
										<div class="icon">
											<i class="fa fa-edit fa-3x"></i>
											<!-- <i class="fa fa-desktop fa-3x"></i> -->
										</div>
										<p>
											가계부 쓰기
										</p>

									</div>
									<div class="box-bottom" onclick="changeView('1');">
										<a href="#" >하루,쓰기</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<!-- <h4>하루,보기</h4> -->
										<div class="icon">
											<i class="fa fa-desktop fa-3x"></i>
											
										</div>
										<p>
											월별, 일별 내역
										</p>

									</div>
									<div class="box-bottom" onclick="changeView('2');">
										<a href="#">하루,보기</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<!-- <h4>하루,통계</h4> -->
										<div class="icon">
											<i class="fa fa-pagelines fa-3x"></i>
										</div>
										<p>연도별, 월별 통계</p>

									</div>
									<div class="box-bottom" onclick="changeView('3');">
										<a href="#">하루,통계</a>
									</div>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="box">
									<div class="box-gray aligncenter">
										<!-- <h4>하루,달력</h4> -->
										<div class="icon">
											<i class="fa fa-code fa-3x"></i>
										</div>
										<p>세부계정 설정</p>

									</div>
									<div class="box-bottom" onclick="changeView('4');">
										<a href="#">하루,달력</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>

</body>
</html>