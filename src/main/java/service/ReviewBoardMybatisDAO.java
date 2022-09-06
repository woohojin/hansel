package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import model.ReviewBoard;

@Component
public class ReviewBoardMybatisDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "reviewBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount() {
		int num = session.selectOne(NS+"boardCount");
		return num;
	}
	
	public List<ReviewBoard> boardList(int pageInt, int limit) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		List<ReviewBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<ReviewBoard> userBoard(String userId) {
		List<ReviewBoard> list = session.selectList(NS+"userBoard", userId);
		return list;
	}
	
	public int insertBoard(ReviewBoard pb) {
		int num = session.insert(NS+"insertBoard", pb);
		return num;
	}
	
	public ReviewBoard boardOne(int num) {
		ReviewBoard board = session.selectOne(NS+"boardOne", num);
		
		return board;
	}
	
	public void readCountUp(int reviewId) {
		session.update(NS+"readCountUp", reviewId);
	}
	
	public void reportCountUp(int reviewId) {
		session.update(NS+"reportCountUp", reviewId);
	}
	/*
	public int insertReply(Board board) {
		int num = session.insert(NS+"insertReply", board);
		return num;
	}
	*/
	
	public int boardUpdate(ReviewBoard pb) {
		int num = session.update(NS+"boardUpdate", pb);
		return num;
	}
	
	public int boardDisable(int adoptId) {
		int num = session.update(NS+"boardDisable", adoptId);
		return num;
	}

	/*
	public int boardDelete(int num) {
		int m = session.insert(NS+"boardDelete", num);
		return m;
	}
	*/
	
}
