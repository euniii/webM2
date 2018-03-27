<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="member.memDAO"%>
<%
	String id = request.getParameter("join_id");
	String str = "";

	memDAO dao = memDAO.getInstance();

	int idcheck = dao.idCheck(id);
	
	if(idcheck==1){ //이미 존재하는 계정
		str = "NO";	
		out.print(str);
	}else{	//사용 가능한 계정
		str = "YES";	
		out.print(str);
	}
	
%>
