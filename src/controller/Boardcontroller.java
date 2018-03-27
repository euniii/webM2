package controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.time.FastDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.msk.Action;
import com.sun.xml.internal.bind.v2.model.core.ID;


import member.memDAO;
import member.memVO;
import my.db.BoardDAO;
import my.db.BoardVO;

public class Boardcontroller extends Action{
	
	//메인화면
	public String index(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		return  "/view/index.jsp"; 
	}
	//어드민 메인화면
	public String admin(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		 return  "/view/admin.jsp";
		} 
	
	//회사위치
	public String contact(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		 return  "/view/menu/contact.jsp";
		} 
	
	//로그인
	public String login(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
		HttpSession session = request.getSession();
		//jsp에서 넘겨준 값을 받는 파라미터
		String id=request.getParameter("login_id");
		String pass=request.getParameter("login_pwd");
		memDAO dao = memDAO.getInstance();
		//로그인체크
		int pwcheck = dao.login(id, pass);
		String name = dao.getname(id);
		session.setAttribute("name", name);
		request.setAttribute("pwcheck", pwcheck);
		session.setAttribute("id", id);
		if(id.equals("admin") && pwcheck==1) { return "/view/admin.jsp"; }
		else
		return  "/view/menu/login.jsp"; 
	}
	
	//로그아웃
	public String logout(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
		HttpSession session = request.getSession();
		//세션아이디가 널값이 아닐때만 불러온다.
		if(session.getAttribute("id") != null){
			session.invalidate();	//세션 끊기
		}
		return "/view/index.jsp"; 
	} 
	
	//회원가입
	public String join(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		memVO member = new memVO();
		member.setM_id(request.getParameter("join_id"));
		member.setM_pwd(request.getParameter("join_pwd"));
		member.setM_name(request.getParameter("join_name"));
		member.setM_birth(request.getParameter("join_birth"));
		member.setM_money(request.getParameter("join_money"));
		member.setM_level(request.getParameter("join_level"));
		member.setM_email(request.getParameter("join_email"));
		memDAO dao = memDAO.getInstance();
		int cnt = dao.insert(member);
		request.setAttribute("cnt", cnt);
		return  "/view/join/joinOk.jsp"; 
	}
	
	/*//아이디 중복체크
	public String checkSignup(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		String id = request.getParameter("m_id");
		String msg = "";

		memDAO dao = memDAO.getInstance();
		int idcheck = dao.idCheck(id);
		
		if(idcheck==1){ //이미 존재하는 계정
			msg = "NO";	
		}else{	//사용 가능한 계정
			msg = "YES";	
		}	
		return msg;
	}*/
	
	//가계부 쓰기
	public String writeForm(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		
		return  "/view/haru/writeForm.jsp"; 
	}
	
	//가계부 쓰기완료
	public String writePro(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); //고유id를 가져와 db에 저장시킴 >> 본인이 작성한 글만 보이게
		int count = 0;
		BoardVO mainboard = new BoardVO();
		mainboard.setMain_writeday(request.getParameter("main_writeday"));
		mainboard.setMain_option(request.getParameter("main_option"));
		mainboard.setMain_account(request.getParameter("main_account"));
		mainboard.setMain_content(request.getParameter("main_content"));
		mainboard.setMain_price(request.getParameter("main_price"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.insert(mainboard, id);
		
		//금액 체크
		if("1".equals(mainboard.getMain_option())){
		count = dao.moneyCheck(id);
		}
		
		request.setAttribute("count", count);
		request.setAttribute("id", id);
		return  "/view/haru/writePro.jsp";
	}
	
	//가계부 수정 폼
	public String updateForm(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
			int num = Integer.parseInt(request.getParameter("num"));
			BoardDAO dao = BoardDAO.getInstance();
			BoardVO vo = dao.Contentview(num);
			request.setAttribute("vo", vo);
		
		return  "/view/haru/updateForm.jsp"; 		 
	} 
	
	//가계부 수정 완료
		public String haruUpdatePro(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
			HttpSession session = request.getSession();
			System.out.println("111");
			BoardDAO dao = BoardDAO.getInstance();
			BoardVO vo = new BoardVO();
			
			String id = (String)session.getAttribute("id");
			int num = Integer.parseInt(request.getParameter("main_num"));
			vo.setMain_writeday(request.getParameter("main_writeday"));
			vo.setMain_content(request.getParameter("main_content"));
			vo.setMain_price(request.getParameter("main_price"));
			
			int check = dao.updateBoard(vo, num, id);
			request.setAttribute("check", check);
			return  "/view/haru/updatePro.jsp"; 
		}
	
	
	//가계부 목록
	public String writeList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		
		BoardVO mainboard = new BoardVO();
		BoardVO mainboard2 = new BoardVO();
		
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		
		//검색처리(키워드)
		String key1 = request.getParameter("key1");
		String key2 = request.getParameter("key2");
		
		
		//날짜 검색
		String startDt = request.getParameter("main_writeday");
		String endDt = request.getParameter("main_writeday2");
		
		
		//페이지처리
		int pageSize=10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum == ""){
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage* pageSize;
		
		BoardDAO dao = BoardDAO.getInstance();
		int count = 0;
		List mainList = null;
		count=dao.mainCount(id, key1, key2, startRow, endRow, startDt, endDt);
		if(count>0){
			mainList = dao.mainList(id, key1, key2, startRow, endRow, startDt, endDt);
			mainboard = dao.totPrice(id, key2, key2, startDt, endDt);
			/*mainboard2 = dao.sumPrice(id, key1, key2);*/
			//요기!다 메소드 만들기
			
		int bottomLine=5;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage = 1+(currentPage-1)/bottomLine*bottomLine;
		int endPage = startPage+bottomLine-1;
		if(endPage>pageCount)endPage=pageCount;
		
		System.out.println("===================count=========================="+count);
		
		request.setAttribute("mainboard", mainboard);
		request.setAttribute("mainList", mainList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		}
		request.setAttribute("count", count);
		
		return  "/view/haru/writeList.jsp"; 
	}
	
	//가계부 상세보기
	public String content(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.Contentview(num);
		System.out.println(vo.getMain_account());
		request.setAttribute("vo", vo);
			
		return  "/view/haru/content.jsp"; 
	}
		
		
	//가계부 삭제	
	public String deletePro(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		
			BoardDAO dao = BoardDAO.getInstance();
			int check = dao.deleteMember(num, id);
			
			request.setAttribute("check", check);
		
		return  "/view/haru/deletePro.jsp";
	} 
		
		
		
	
	//어드민_회원관리
	public String adList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		//검색처리
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");

		//페이지처리
		int pageSize=10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum===="+pageNum);
		if(pageNum == null || pageNum == ""){
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage* pageSize;

		memDAO dao = memDAO.getInstance();
		List memList = null;
		int count = 0;
		int number = 0;
		count = dao.SelectCountMem(startRow, endRow, keyField, keyWord);
		if(count>0){
			memList = dao.memList(startRow, endRow, keyField, keyWord);
		int bottomLine=5;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage = 1+(currentPage-1)/bottomLine*bottomLine;
		int endPage = startPage+bottomLine-1;
		if(endPage>pageCount) endPage=pageCount;
		
		request.setAttribute("memList", memList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		} 
		request.setAttribute("count", count);
		return  "/view/admin/adList.jsp"; 
	}
	
	//어드민_회원등록
	public String adJoin(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		return  "/view/admin/adJoin.jsp";  
		} 
	
	//어드민_회원등록완료
	public String adJoinPro(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		memVO member = new memVO();
		member.setM_id(request.getParameter("ad_m_id"));
		member.setM_pwd(request.getParameter("ad_m_pwd"));
		member.setM_name(request.getParameter("ad_m_name"));
		member.setM_birth(request.getParameter("ad_m_birth"));
		member.setM_email(request.getParameter("ad_m_email"));
		member.setM_level(request.getParameter("ad_m_level"));
		memDAO dao = memDAO.getInstance();
		dao.insert(member);
		/*int cnt = dao.insert(member);*/
		
		return  "/view/admin/adJoinPro.jsp"; 
		} 
	
	//어드민_회원보기
	public String adView(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int num = Integer.parseInt(request.getParameter("num"));
			memDAO dao = memDAO.getInstance();
			memVO vo = dao.SelectViewMem(num);
			request.setAttribute("vo", vo);
		return  "/view/admin/adView.jsp";  
		} 
	
	//어드민_회원수정폼
	public String adUpdate(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		try{
			memDAO dao = memDAO.getInstance();
			memVO vo = dao.SelectViewMem(num);
			request.setAttribute("vo", vo);
		}catch(Exception e){e.printStackTrace();}
		return  "/view/admin/adUpdate.jsp";  
		} 
	
	//어드민_회원탈퇴폼
	public String adDelete(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int num = Integer.parseInt(request.getParameter("num"));
		try{
			memDAO dao = memDAO.getInstance();
			memVO vo = dao.SelectViewMem(num);
			request.setAttribute("vo", vo);
		}catch(Exception e){e.printStackTrace();}
		return  "/view/admin/adDelete.jsp"; 
	} 
	
	
	
	//어드민_회원탈퇴완료
	public String adDeleteP(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num")); //deleteForm 에서 넘어온 데이터
		try{
			String passwd = request.getParameter("ad_pwd");
			memDAO dao = memDAO.getInstance();
			String id = (String)session.getAttribute("id"); 
			int passcheck = dao.deleteMember(num, passwd, id);
			request.setAttribute("passcheck", passcheck);
		}catch(Exception e){e.printStackTrace();}
	return  "/view/admin/adDeleteP.jsp"; 
	} 
	
	//회원정보수정(관리자)
	public String adUpdateP(HttpServletRequest request, HttpServletResponse response)  throws Throwable {
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();   //세션에 저장된 아이디를 가져와 회원 정보를 가져온다
		
		memDAO dao = memDAO.getInstance();
		memVO member = new memVO();
		
		member.setM_num(Integer.parseInt(request.getParameter("m_num")));
		member.setM_pwd(request.getParameter("m_pwd"));
		member.setM_id(request.getParameter("m_id"));
		member.setM_name(request.getParameter("m_name"));
		member.setM_birth(request.getParameter("m_birth"));
		member.setM_email(request.getParameter("m_email"));
		member.setM_level(request.getParameter("m_level"));
		member.setAd_pwd(request.getParameter("ad_pwd"));
		
		int pwdcheck = dao.updateMember(member, id);
		
		request.setAttribute("pwdcheck", pwdcheck);
		
		return  "/view/user/userUpdateP.jsp"; 
	}
	
	//마이홈
	public String userView(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		String id = session.getAttribute("id").toString();   //세션에 저장된 아이디를 가져와 회원 정보를 가져온다
		memDAO dao = memDAO.getInstance();
		memVO vo = dao.myhomeView(id);
		request.setAttribute("vo", vo);
		return "/view/user/userView.jsp";
		} 
	
	//마이홈_정보수정폼
	public String userUpdate(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		try{
			int num = Integer.parseInt(request.getParameter("m_num"));
			System.out.println("============================="+num);
			memDAO dao = memDAO.getInstance();
			memVO vo = dao.SelectViewMem(num);
			request.setAttribute("vo", vo);
		}catch(Exception e){ e.printStackTrace();}
		return  "/view/user/userUpdate.jsp"; 
	}
	
	
	//마이홈_정보수정완료
	public String userUpdateP(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		memDAO dao = memDAO.getInstance();
		memVO member = new memVO();
		String id = (String)session.getAttribute("id");
		
		member.setM_num(Integer.parseInt(request.getParameter("m_num")));
		member.setM_pwd(request.getParameter("m_pwd"));
		member.setM_id(request.getParameter("m_id"));
		member.setM_name(request.getParameter("m_name"));
		member.setM_birth(request.getParameter("m_birth"));
		member.setM_email(request.getParameter("m_email"));
		member.setM_money(request.getParameter("m_money"));
		member.setM_level(request.getParameter("m_level"));
		
		int pwdcheck = dao.updateMember(member, id);
		request.setAttribute("pwdcheck", pwdcheck);
		return  "/view/user/userUpdateP.jsp"; 
	}
	
	
	//마이홈_회원탈퇴폼
	public String userDelete(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int num = Integer.parseInt(request.getParameter("m_num"));
		try{
			memDAO dao = memDAO.getInstance();
			memVO vo = dao.SelectViewMem(num);
			request.setAttribute("vo", vo);
		}catch(Exception e){e.printStackTrace();}
		return  "/view/user/userDelete.jsp"; 
		} 
	
	
	//마이홈_회원탈퇴완료
	public String userDeleteP(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("m_num")); //deleteForm 에서 넘어온 데이터
		try{
			String passwd = request.getParameter("m_pwd");
			memDAO dao = memDAO.getInstance();
			String id = (String)session.getAttribute("id"); 
			int passcheck = dao.deleteMember(num, passwd, id);
			request.setAttribute("passcheck", passcheck);
		}catch(Exception e){e.printStackTrace();}
		return  "/view/user/userDeleteP.jsp"; 
	} 
	
	
	
	//차트
   public String chart(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
      return  "/view/haruChart/chart.jsp"; 
      } 
   
   public String chartView (HttpServletRequest request, HttpServletResponse response) throws Throwable { 
      
	   	String main_option = request.getParameter("main_option");
	   	String date1 = request.getParameter("date1");
	   	String date2 = request.getParameter("date2");
	   	HttpSession session = request.getSession();
		  
		 BoardDAO dao = BoardDAO.getInstance();
		 String id = (String)session.getAttribute("id"); 
		  
		 if(main_option.equals("1")) {
		 int foodcnt = dao.foodCnt(id, main_option, date1, date2);
		 int carcnt = dao.carCnt(id, main_option, date1, date2);
		 int phoneCnt = dao.phoneCnt(id, main_option, date1, date2);
		 int culturalCnt = dao.culturalCnt(id, main_option, date1, date2);
		 int healthcnt = dao.healthCnt(id, main_option, date1, date2);
		 int articlecnt = dao.articleCnt(id, main_option, date1, date2);
		 int beautycnt = dao.beautyCnt(id, main_option, date1, date2);
		 request.setAttribute("foodcnt", foodcnt);
		 request.setAttribute("carcnt", carcnt);
		 request.setAttribute("phoneCnt", phoneCnt);
		 request.setAttribute("culturalCnt", culturalCnt);
		 request.setAttribute("healthcnt", healthcnt);
		 request.setAttribute("articlecnt", articlecnt);
		 request.setAttribute("beautycnt", beautycnt);
		 return  "/view/haruChart/chart.jsp"; }
		
		else{
		     int payCnt = dao.payCnt(id, main_option, date1, date2);
		     int interestCnt = dao.interestCnt(id, main_option, date1, date2);
		     int otherCnt = dao.otherCnt(id, main_option, date1, date2);
		     request.setAttribute("payCnt", payCnt);
		 request.setAttribute("interestCnt", interestCnt);
		 request.setAttribute("otherCnt", otherCnt);
		 return  "/view/haruChart/chart2.jsp"; 
		 }
}
	   
	   //달력
	   public String calendar (HttpServletRequest request, HttpServletResponse response) throws Throwable { 
		      return  "/view/haruCal/calendar.jsp"; 
		      }
}


