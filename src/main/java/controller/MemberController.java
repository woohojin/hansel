package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Member;
//import service.MemberMybatisDAO;
import service.MemberMybatisDAO;

@Controller
@RequestMapping("/member/")
public class MemberController {

	HttpServletRequest request;
	HttpServletResponse response;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m, HttpServletResponse response) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
		this.response = response;
	}

	@Autowired
	MemberMybatisDAO md;

//	메인 페이지
	@RequestMapping("index")
	public String index() throws Exception {
		session.setAttribute("adminPage", false);
		
		return "index";
	}

//	로그인 페이지
	@RequestMapping("signIn")
	public String signIn() throws Exception {
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "로그인");
		
		request.setAttribute("bs", boardSubject);

		return "member/signIn";
	}

	@RequestMapping("signInPro")
	public String signInPro(String userId, String pwd, String autoLogin) throws Exception {

		String msg = "";
		String url = "/member/signIn";

//		로그인할 유저를 입력한 아이디로 가져옴
		Member mem = md.selectOne(userId);
//		유저의 유무 확인
		if (mem != null) {

//			현재 입력한 비밀번호와 db에 있는 비밀번호 비교
			if (pwd.equals(mem.getPwd())) {
//				mem.setLogin(1);
//				md.updateLogin(mem);
				session.setAttribute("userId", userId);
				session.setAttribute("userType", mem.getUserType());
				if (autoLogin != null) {
					Cookie cookie = new Cookie("userId", userId);
					cookie.setMaxAge(60 * 60 * 24 * 30);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				msg = mem.getUserId() + "님이 로그인 하였습니다.";
				url = "/member/index";
			} else {
				msg = "비밀번호가 틀립니다.";
			}

		} else {
			msg = "유효하지 않은 회원입니다.";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

//	회원가입 페이지
	@RequestMapping("signUp")
	public String signUp() throws Exception {
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "회원가입");
		
		request.setAttribute("bs", boardSubject);

		return "member/signUp";
	}

	@RequestMapping("signUpPro")
	public String signUpPro(String pwd, String pwdOk, String userId, Member member) throws Exception {

		String msg = "비밀번호와 비밀번호확인 이 일치 하지 않습니다.";
		String url = "/member/signUp";

		Member mem = md.selectOne(userId);

//		아이디 유효성 확인
		if (mem == null) {
			// 비밀번호 확인 false 면 회원가입 페이지
			if (pwd.equals(pwdOk)) {

				int num = md.insertUser(member);
				if (num > 0) {
					msg = userId + "님의 가입이 완료되었습니다.";
					url = "/member/signIn";
				} else {
					msg = "회원가입을 실패 했습니다.";
					url = "/member/signUp";
				}
			}
		} else {
			msg = "이미 있는 아이디 입니다.";
			url = "/member/signUp";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

//	로그아웃
	@RequestMapping("logout")
	public String logout() throws Exception {

		String userId = (String) session.getAttribute("userId");
		Member mem = md.selectOne(userId);
//		mem.setLogin(0);
//		md.updateLogin(mem);

		Cookie cookie = new Cookie("userId", userId);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);

		session.invalidate();

		String msg = userId + "님이 로그아웃 되었습니다.";
		String url = "/member/index";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}

//	이메일 페이지
	@RequestMapping("email")
	public String sendEmail() throws Exception {

		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "의견 보내기");
		
		request.setAttribute("bs", boardSubject);
		
		return "member/email";
	}

//	내정보 페이지
	@RequestMapping("memberInfo")
	public String memberInfo() throws Exception {

		String userId = (String) session.getAttribute("userId");
		Member mem = md.selectOne(userId);

		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "회원정보");
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("mem", mem);

		return "member/memberInfo";
	}

	@RequestMapping("memberUpdate")
	public String memberUpdate(String userId) throws Exception {

		Member mem = md.selectOne(userId);
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "회원정보 수정");
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("mem", mem);
		
		return "member/memberUpdate";
	}

	@RequestMapping("memberUpdatePro")
	public String memberUpdatePro(Member mem) throws Exception {

		String userId = (String) session.getAttribute("userId");
		String msg = "로그인이 필요합니다";
		String url = "/member/signIn";

		Member dbm = md.selectOne(userId);

		if (dbm != null) {
			if (dbm.getPwd().equals(mem.getPwd())) {
				int num = md.updateMember(mem);
				if (num > 0) {
					msg = mem.getUserId() + "님의 정보가 수정되었습니다";
					url = "/member/memberInfo";
				} else {
					msg = "정보 수정을 실패 했습니다.";
					url = "/member/signUp";
				}
			} else {
				msg = "비밀번호가 틀렸습니다";
				url = "/member/memberUpdate";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert";
	}

	@RequestMapping("memberDelete")
	public String memberDelete(String userId) throws Exception {

		String msg = "회원탈퇴를 실패했습니다";
		String url = "/member/memberInfo";

		int num = md.deleteMember(userId);
		if (num > 0) {
			session.invalidate();
			msg = "회원탈퇴를 완료하였습니다";
			url = "/member/index";
		}
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "회원탈퇴");
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
	
	@RequestMapping("memberPassUpdate")
	public String memberPassUpdate() throws Exception {
		
		return "/member/memberPassUpdate";
	}

	@RequestMapping("memberPassUpdatePro")
	public String memberPassUpdatePro(String pwd, String chgpwd) throws Exception {

		String userId = (String) session.getAttribute("userId");

		String msg = "비밀번호가 틀렸습니다 ";
		String url = "/member/memberPassUpdate";
		System.out.println(chgpwd);
		
		Member mem = md.selectOne(userId);
		if (pwd.equals(mem.getPwd())) {
			int num = md.pwdUpdateMember(userId, chgpwd);
			if (num > 0) {
				msg = userId + "님의 비밀번호가 수정되었습니다.";
				url = "/member/memberInfo";
			} else {
				msg = "비밀번호 수정을 실패했습니다";
				url = "/member/memberPassUpdate";
			}
		} 
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		boardSubject.clear();
		boardSubject.put("boardName", "비밀번호 수정");
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "alert";
	}
}
