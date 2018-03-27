<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setCharacterEncoding("euc-kr"); %>
<html>
<head>

<link href="/webM2/css/bootstrap.min.css" rel="stylesheet" />
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' />
	<link href="/webM2/css/fancybox/jquery.fancybox.css" rel="stylesheet">
	<link href="/webM2/css/jcarousel.css" rel="stylesheet" />
	<link href="/webM2/css/flexslider.css" rel="stylesheet" />
	<link href="/webM2/css/style.css" rel="stylesheet" />
	<!-- Theme skin -->
	<link href="/webM2/css/default.css" rel="stylesheet" />
</head>
<body>

<!-- 탑메뉴 -->
<jsp:include page="/view/menu/top.jsp"></jsp:include>

<!-- 메인화면 -->
<jsp:include page="/view/menu/body.jsp"></jsp:include>

<!-- 바텀 -->
<jsp:include page="/view/menu/footer.jsp"></jsp:include>

</body>
</html>