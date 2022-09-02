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

import model.AdoptBoard;
import model.PetBoard;
import model.QBoard;
import model.ReviewBoard;
import service.AdoptBoardMybatisDAO;
import service.BoardMybatisDAO;
import service.QBoardMybatisDAO;
import service.ReviewBoardMybatisDAO;

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
	public String petBoard(int petType) throws Exception {
		
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
		int boardCount = 0;
		
		if(petType == 0) {
			List<PetBoard> list = bd.dogBoardList(pageInt, limit, boardid);
			request.setAttribute("petType", 0);
			request.setAttribute("list", list);
			boardCount = bd.dogboardCount(boardid);
		} else if(petType == 1) {
			List<PetBoard> list = bd.catBoardList(pageInt, limit, boardid);
			request.setAttribute("petType", 1);
			request.setAttribute("list", list);
			boardCount = bd.catboardCount(boardid);
		}
		
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
			boardSubject.put("boardPlace", "실종장소");
			boardSubject.put("boardDate", "실종날짜");
		break;
		}
		
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
			boardSubject.put("boardPlace", "실종장소");
			boardSubject.put("boardDate", "실종날짜");
		break;
		}
		
		request.setAttribute("bs", boardSubject);
		
		
		return "board/petBoardForm";
	}
	
	@RequestMapping("petBoardPro")
	public String petBoardPro(PetBoard petboard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/petBoardForm";
		
		int petType = Integer.parseInt(petboard.getPetType());
		String boardid = (String) session.getAttribute("boardid");
		if(boardid == null) boardid = "1";
		
		String userId = (String) session.getAttribute("userId");
		
		petboard.setBoardId(boardid); // 우선 공지사항
		petboard.setUserId(userId);
		
		int num = bd.insertBoard(petboard);
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/petBoard?petType="+petType;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("petBoardInfo")
	public String petBoardInfo(int postId) throws Exception {
		
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
			boardSubject.put("boardPlace", "실종장소");
			boardSubject.put("boardDate", "실종날짜");
		break;
		}
		
		request.setAttribute("bs", boardSubject);
		request.setAttribute("pb", pb);
		return "board/petBoardInfo";
	}
	
	@RequestMapping("petBoardUpdate")
	public String petBoardUpdate(int postId) throws Exception {
		
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
			boardSubject.put("boardPlace", "실종장소");
			boardSubject.put("boardDate", "실종날짜");
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
		
		int postId = petboard.getPostId();
		
		int num = bd.boardUpdate(petboard);
		if(num>0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/petBoardInfo?postId="+postId;
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
	
	@Autowired
	AdoptBoardMybatisDAO ab;
	
//	유기, 실종동물 입양
	@RequestMapping("adoptBoard")
	public String adoptBoard() throws Exception {
		
		if(request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
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
		int boardCount = ab.boardCount();
		List<AdoptBoard> list = ab.boardList(pageInt, limit);
		
//		pagination 개수
		int bottomLine = 3;
		
		int start = (pageInt-1)/bottomLine*bottomLine+1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount/limit) + (boardCount%limit==0? 0 : 1);
		if(end > maxPage) {
			end = maxPage;
		}
		
		int boardNum = boardCount - (pageInt-1)*limit;
		
		request.setAttribute("list", list);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);
		
		return "board/adoptBoard";
		
	}
	
	@RequestMapping("adoptBoardInfo")
	public String adoptBoardInfo(int adoptId) throws Exception {
		
		AdoptBoard pb = ab.boardOne(adoptId);
		ab.readCountUp(adoptId);
		
		request.setAttribute("pb", pb);
		
		return "board/adoptBoardInfo";
	}
	
	@RequestMapping("adoptBoardForm")
	public String adoptBoardForm() throws Exception {
		return "board/adoptBoardForm";
	}
	
	@RequestMapping("adoptBoardPro")
	public String adoptBoardPro(AdoptBoard adoptBoard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/adoptBoardForm";
		
		String userId = (String) session.getAttribute("userId");
		
		adoptBoard.setUserId(userId);
		
		int num = ab.insertBoard(adoptBoard);
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/adoptBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("adoptBoardUpdate")
	public String adoptBoardUpdate(int adoptId) throws Exception {
		
		AdoptBoard pb = ab.boardOne(adoptId);
		
		request.setAttribute("pb", pb);
		
		return "board/adoptBoardUpdate";
	}
	
	@RequestMapping("adoptBoardUpdatePro")
	public String adoptBoardUpdatePro(AdoptBoard adoptboard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/adoptBoardUpdate";
		
		int adoptId = adoptboard.getAdoptId();
		
		int num = ab.boardUpdate(adoptboard);
		if(num>0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/adoptBoardInfo?adoptId="+adoptId;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("adoptBoardDelete")
	public String adoptBoardDelete(int adoptId) throws Exception {
		
		String msg = "게시물 삭제 실패";
		String url = "/board/adoptBoardInfo";
		
		int num = ab.boardDisable(adoptId);
		if(num>0) {
			msg = "게시물을 삭제하였습니다.";
			url = "/board/adoptBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@Autowired
	ReviewBoardMybatisDAO rb;

	@RequestMapping("reviewBoard")
	public String reviewBoard() throws Exception {
		
		
		int limit = 8; // 한 page당 게시물 개수
		
		if(request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageInt = Integer.parseInt(pageNum);
		int boardCount = rb.boardCount();
		List<ReviewBoard> list = rb.boardList(pageInt, limit);
		
//		pagination 개수
		int bottomLine = 3;
		
		int start = (pageInt-1)/bottomLine*bottomLine+1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount/limit) + (boardCount%limit==0? 0 : 1);
		if(end > maxPage) {
			end = maxPage;
		}
		
		int boardNum = boardCount - (pageInt-1)*limit;
		
		request.setAttribute("list", list);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);
		
		return "board/reviewBoard";
		
	}
	
	@RequestMapping("reviewBoardInfo")
	public String reviewBoardInfo(int reviewId) throws Exception {
		
		ReviewBoard pb = rb.boardOne(reviewId);
		
		request.setAttribute("pb", pb);
		
		return "board/reviewBoardInfo";
	}
	
	@RequestMapping("reviewBoardForm")
	public String reviewBoardForm() throws Exception {
		
		
		return "board/reviewBoardForm";
	}
	
	@RequestMapping("reviewBoardPro")
	public String reviewBoardPro(ReviewBoard reviewBoard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/reviewBoardForm";
		
		int num = rb.insertBoard(reviewBoard);
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/reviewBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("reviewBoardUpdate")
	public String reviewBoardUpdate(int reviewId) throws Exception {
		
		ReviewBoard pb = rb.boardOne(reviewId);
		
		request.setAttribute("pb", pb);
		
		return "board/reviewBoardUpdate";
	}
	
	@RequestMapping("reviewBoardUpdatePro")
	public String reviewBoardUpdatePro(ReviewBoard reviewBoard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/reviewBoardUpdate";
		
		int reviewId = reviewBoard.getReviewId();
		
		int num = rb.boardUpdate(reviewBoard);
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/reviewBoardInfo?reviewId="+reviewId;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("reviewBoardDelete")
	public String reviewBoardDelete(int reviewId) throws Exception {
		
		String msg = "게시물 삭제 실패";
		String url = "/board/reviewBoardInfo";
		
		int num = rb.boardDisable(reviewId);
		if(num>0) {
			msg = "게시물을 삭제하였습니다.";
			url = "/board/reviewBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	
	@Autowired
	QBoardMybatisDAO qb;
	
	@RequestMapping("QBoard")
	public String QBoard() throws Exception {
		
		if(request.getParameter("boardid") != null) {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
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
		int boardCount = qb.boardCount();
		List<QBoard> list = qb.boardList(pageInt, limit);
		
//		pagination 개수
		int bottomLine = 3;
		
		int start = (pageInt-1)/bottomLine*bottomLine+1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount/limit) + (boardCount%limit==0? 0 : 1);
		if(end > maxPage) {
			end = maxPage;
		}
		
		int boardNum = boardCount - (pageInt-1)*limit;
		
		request.setAttribute("list", list);
		request.setAttribute("boardCount", boardCount);
		request.setAttribute("boardNum", boardNum);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("bottomLine", bottomLine);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageInt", pageInt);
		
		return "board/qaBoard";
		
	}
	
	@RequestMapping("QBoardForm")
	public String QBoardForm() throws Exception {
		
		return "board/qaBoardForm";
	}
	
	@RequestMapping("QBoardPro")
	public String QBoardPro(QBoard qBoard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/QBoardForm";
		
		int num = qb.insertBoard(qBoard);
		
		if(num>0) {
			msg = "게시물을 등록하였습니다.";
			url = "/board/QBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("QBoardInfo")
	public String QBoardInfo(int QId) throws Exception {
		
		QBoard QB = qb.boardOne(QId);
		qb.readCountUp(QId);
		
		request.setAttribute("pb", QB);
		return "board/qaBoardInfo";
	}
	
	@RequestMapping("QBoardUpdate")
	public String QBoardUpdate(int QId) throws Exception {
		
		QBoard QB = qb.boardOne(QId);
		
		request.setAttribute("pb", QB);
		
		return "board/qaBoardUpdate";
	}
	
	@RequestMapping("QBoardUpdatePro")
	public String QBoardUpdatePro(QBoard qboard) throws Exception {
		
		String msg = "게시물 등록 실패";
		String url = "/board/QBoardUpdate";
		
		int QId = qboard.getQId();
		int num = qb.boardUpdate(qboard);
		
		if(num>0) {
			msg = "게시물을 수정하였습니다.";
			url = "/board/QBoardInfo?QId="+QId;
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
	}
	
	@RequestMapping("QBoardDelete")
	public String QBoardDelete(int QId) throws Exception {
		
		String msg = "게시물 삭제 실패";
		String url = "/board/QBoardInfo";
		
		int num = qb.boardDisable(QId);
		if(num>0) {
			msg = "게시물을 삭제하였습니다.";
			url = "/board/QBoard";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "alert";
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
