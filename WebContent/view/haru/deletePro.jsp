<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<c:if test="${check == 1}">
	<script>
	alert("해당 내용이 삭제되었습니다.");
	</script>
    <META http-equiv=refresh content="0;url=/webM2/board/writeList">
</c:if>
<c:if test="${check !=1 }">

<script type="text/javascript">
alert("삭제 실패.");
history.go(-1);
</script>
</c:if>
