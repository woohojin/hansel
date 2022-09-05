package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Member;
import service.MemberMybatisDAO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	HttpServletRequest request;
	Model m;
	HttpSession session;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
      this.request = request;
      this.m = m;
      this.session = request.getSession();
	}
	
	@Autowired
	MemberMybatisDAO md;
	
	@RequestMapping("adminUser")
	public String adminUser() throws Exception {
		
		List<Member> normal = md.memberList(0);
		List<Member> admin = md.memberList(2);
		
		request.setAttribute("normal", normal);
		request.setAttribute("admin", admin);
		
		return "admin/adminUser";
	}
	
	@RequestMapping("updateAuth")
	public String updateAuth(String userId, int userType) throws Exception {
		
		String msg = "권한 없데이트를 실패했습니다.";
		String url = "/admin/adminUser";
		
		int num = md.updateAuth(userId, userType);
		
		if(num > 0) {
			msg = userId+"님의 권한을 업데이트 했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("deleteUser")
	public String deleteUser(String userId) throws Exception {
		
		String msg = "회원삭제 를 실패했습니다.";
		String url = "/admin/adminUser";
		
		int num = md.deleteMember(userId);
		
		if(num > 0) {
			msg = userId+"님을 삭제 하였습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("adminReport")
	public String adminReport() throws Exception {
		
		return "admin/adminReport";
	}
	
}
