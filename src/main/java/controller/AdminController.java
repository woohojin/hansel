package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import model.AdoptBoard;
import model.Comm;
import model.Member;
import model.PetBoard;
import model.ReviewBoard;
import service.AdoptBoardMybatisDAO;
import service.BoardMybatisDAO;
import service.CommMybatisDAO;
import service.MemberMybatisDAO;
import service.ReviewBoardMybatisDAO;

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
	@Autowired
	CommMybatisDAO cd;
	@Autowired
	BoardMybatisDAO pd;
	@Autowired
	AdoptBoardMybatisDAO ad;
	@Autowired
	ReviewBoardMybatisDAO rd;
	
	
	@RequestMapping("adminUser")
	public String adminUser(String userType) throws Exception {
		
		if(userType.equals("normal")) {
			List<Member> normal = md.memberList(0);
			request.setAttribute("memList", normal);
		} else {
			List<Member> admin = md.memberList(2);
			request.setAttribute("memList", admin);
		}
		
		request.setAttribute("userType", userType);
		session.setAttribute("adminPage", true);
		
		return "admin/adminUser";
		
	}
	
	@RequestMapping("updateAuth")
	public String updateAuth(String userId, int userType) throws Exception {
		
		String msg = "권한 없데이트를 실패했습니다.";
		
		String str = "";
		if(userType == 0) {
			str = "normal";
		} else if (userType == 2) {
			str = "admin";
		}
		
		String url = "/admin/adminUser?userType="+str;
		
		int num = md.updateAuth(userId, userType);
		
		if(num > 0) {
			msg = userId+"님의 권한을 업데이트 했습니다.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("deleteUser")
	public String deleteUser(String userId, int userType) throws Exception {
		
		String str = "";
		if(userType == 0) {
			str = "normal";
		} else if (userType == 2) {
			str = "admin";
		}
		
		String msg = "회원삭제 를 실패했습니다.";
		String url = "/admin/adminUser?userType="+str;
		
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
	
	@RequestMapping("adminSearch")
	public String adminSearch(String userId, int boardType) throws Exception {
		
		Member mem = md.selectOne(userId);
		List<Comm> comm = cd.commUser(userId);
		
		if(boardType == 1) {
			List<PetBoard> petboard = pd.userBoard("1", userId);
			request.setAttribute("board", petboard);
		} else if (boardType == 2) {
			List<PetBoard> petboard = pd.userBoard("2", userId);
			request.setAttribute("board", petboard);
		} else if (boardType == 3) {
			List<AdoptBoard> adoptboard = ad.userBoard(userId);
			request.setAttribute("board", adoptboard);
		} else if (boardType == 4) {
			List<ReviewBoard> reviewboard = rd.userBoard(userId);
			request.setAttribute("board", reviewboard);
		} 
		request.setAttribute("boardType", boardType);
		request.setAttribute("mem", mem);
		request.setAttribute("comm", comm);
		
		return "admin/adminSearch";
	}
	
}



















