package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.AdoptBoard;

@Component
public class AdoptBoardMybatisDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "adoptBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount(int petType) {
		int num = session.selectOne(NS+"boardCount", petType);
		return num;
	}
	
	public List<AdoptBoard> boardList(int pageInt, int limit, int petType) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		map.put("petType", petType);
		List<AdoptBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
	
	public List<AdoptBoard> userBoard(String userId) {
		List<AdoptBoard> list = session.selectList(NS+"userBoard", userId);
		return list;
	}
	
	public int insertBoard(AdoptBoard pb) {
		int num = session.insert(NS+"insertBoard", pb);
		return num;
	}
	
	public AdoptBoard boardOne(int num) {
		AdoptBoard board = session.selectOne(NS+"boardOne", num);
		
		return board;
	}
	
	public void readCountUp(int adoptId) {
		session.update(NS+"readCountUp", adoptId);
	}
	
	public void reportCountUp(int adoptId) {
		session.update(NS+"reportCountUp", adoptId);
	}
	
	
	/*
	public int insertReply(Board board) {
		int num = session.insert(NS+"insertReply", board);
		return num;
	}
	*/
	
	public int boardUpdate(AdoptBoard pb) {
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
