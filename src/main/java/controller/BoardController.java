package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.PetBoard;
import service.BoardMybatisDAO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
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
	BoardMybatisDAO bd;

//	보호중인 동물 과 잃어버린 동물의 게시판
	@RequestMapping("petBoard")
	public String petBoard() throws Exception {
		HttpSession session = request.getSession();
		
		if(request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}
		
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) {
			boardid = "1";
		}
		
		int limit = 8; // 한 page당 게시물 개수
		
		if(request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageInt = Integer.parseInt(pageNum);
		int boardCount = bd.boardCount(boardid);
		List<PetBoard> list = bd.boardList(pageInt, limit, boardid);
		
//		pagination 개수
		int bottomLine = 3;
		
		int start = (pageInt-1)/bottomLine*bottomLine+1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount/limit) + (boardCount%limit==0? 0 : 1);
		if(end > maxPage) {
			end = maxPage;
		}
		
		int boardNum = boardCount - (pageInt-1)*limit;
		
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		switch(boardid) {
		case "1" :
			boardSubject.clear();
			boardSubject.put("boardName", "보호중인 동물");
			boardSubject.put("boardPlace", "발견장소");
			boardSubject.put("boardDate", "발견날짜");
		break;
		case "2" :
			boardSubject.clear();
			boardSubject.put("boardName", "찾고있는 동물");
			boardSubject.put("boardPlace", "잃은장소");
			boardSubject.put("boardDate", "잃은날짜");
		break;
		}
		
		request.setAttribute("list", list);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);
		request.setAttribute("bs", boardSubject);
		
		return "board/petBoard";
	}
	
//	보호중인 동물 과 잃어버린 동물의 게시물 작성 폼
	@RequestMapping("petBoardForm")
	public String petBoardForm() throws Exception {
		HttpSession session = request.getSession();
		
		String boardid = (String) session.getAttribute("boardid");
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		switch(boardid) {
		case "1" :
			boardSubject.clear();
			boardSubject.put("boardName", "보호중인 동물");
			boardSubject.put("boardPlace", "발견장소");
			boardSubject.put("boardDate", "발견날짜");
		break;
		case "2" :
			boardSubject.clear();
			boardSubject.put("boardName", "찾고있는 동물");
			boardSubject.put("boardPlace", "잃은장소");
			boardSubject.put("boardDate", "잃은날짜");
		break;
		}
		
		request.setAttribute("bs", boardSubject);
		
		
		return "board/petBoardForm";
	}
	
	@RequestMapping("petBoardPro")
	public String petBoardPro(PetBoard petboard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";
		
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) boardid = "1";
		
		String userId = (String) session.getAttribute("userId");
		
		petboard.setBoardId(boardid); // 우선 공지사항
		petboard.setUserId(userId);
		
		int num = bd.insertBoard(petboard);
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("petBoardInfo")
	public String petBoardInfo(int postId) throws Exception {
		HttpSession session = request.getSession();
		
		String boardid = (String) session.getAttribute("boardid");
		
		PetBoard pb = bd.boardOne(postId);
		bd.readCountUp(postId);
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		switch(boardid) {
		case "1" :
			boardSubject.clear();
			boardSubject.put("boardName", "보호중인 동물");
			boardSubject.put("boardPlace", "발견장소");
			boardSubject.put("boardDate", "발견날짜");
		break;
		case "2" :
			boardSubject.clear();
			boardSubject.put("boardName", "찾고있는 동물");
			boardSubject.put("boardPlace", "잃은장소");
			boardSubject.put("boardDate", "잃은날짜");
		break;
		}
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("pb", pb);
		return "board/petBoardInfo";
	}
	
	@RequestMapping("petBoardUpdate")
	public String petBoardUpdate(int postId) throws Exception {
		HttpSession session = request.getSession();
		
		String boardid = (String) session.getAttribute("boardid");
		
		PetBoard pb = bd.boardOne(postId);
		
		Map<String, String> boardSubject = new HashMap<String, String>();
		switch(boardid) {
		case "1" :
			boardSubject.clear();
			boardSubject.put("boardName", "보호중인 동물");
			boardSubject.put("boardPlace", "발견장소");
			boardSubject.put("boardDate", "발견날짜");
		break;
		case "2" :
			boardSubject.clear();
			boardSubject.put("boardName", "찾고있는 동물");
			boardSubject.put("boardPlace", "잃은장소");
			boardSubject.put("boardDate", "잃은날짜");
		break;
		}
		
		request.setAttribute("pb", pb);
		request.setAttribute("bs", boardSubject);
		
		
		return "board/petBoardUpdate";
	}
	
	@RequestMapping("petBoardUpdatePro")
	public String petBoardUpdatePro(PetBoard petboard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/petBoardUpdate";
		
		System.out.println(petboard.getPostId());
		
		int num = bd.boardUpdate(petboard);
		if(num>0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/petBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("petBoardDelete")
	public String petBoardDelete(int postId) throws Exception {
		
		String msg = "게시물 삭제 실패";
		String url = "/board/petBoardInfo";
		
		int num = bd.boardDisable(postId);
		if(num>0) {
			msg = "게시물을 삭제하였습니다.";
			url = "/board/petBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	
	
//	유기, 실종동물 입양
	@RequestMapping("adoptBoard")
	public String adopt() throws Exception {
		
		return "board/adoptBoard";
	}
	
//	입양, 찾은 후기
	@RequestMapping("review")
	public String review() throws Exception {
		
		return "board/review";
	}
	
	@RequestMapping("pictureimgForm")
	public String pictureimgForm() throws Exception {
		
		return "board/pictureimgForm";
		
	}
	
	@RequestMapping("pictureimgPro") public String
	 pictureimgPro(@RequestParam("picture") MultipartFile multipartFile) throws Exception {
	  
		String path = request.getServletContext().getRealPath("/")+"view/board/img/";
		 String filename = null;
		 
		 if(!multipartFile.isEmpty()) {
			
			File file = new File(path, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			filename = multipartFile.getOriginalFilename();
			System.out.println(filename);
			
		 }
		 
		 request.setAttribute("filename", filename);
		 return "board/pictureimgPro";
	 
	 
	 }
	
}