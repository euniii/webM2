<!-- deletePro -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!-- 회원등록 성공/실패 메시지 -->
<c:if test="${cnt == 1}">
	<script type="text/javascript">
	alert("회원등록 되었습니다.");
	location.href = "index";
	</script>
</c:if> 

<c:if test="${cnt == 0}">
<script type="text/javascript">
alert("회원등록 실패했습니다.");
history.go(-1);
</script>
</c:if> 
