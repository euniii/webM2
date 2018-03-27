<!-- deletePro -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<c:if test="${pwcheck == -1}">
<script type="text/javascript">
alert("ID가 존재하지 않습니다!");
history.go(-1);
</script>
</c:if> 

<c:if test="${pwcheck == 0}">
<script type="text/javascript">
alert("비밀번호가 틀립니다!");
history.go(-1);
</script>
</c:if> 


<c:if test="${pwcheck == 1}">
	<script type="text/javascript">
	location.href = "index";
	</script>
</c:if>