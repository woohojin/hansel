package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.PetBoard;

@Component
public class BoardMybatisDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "petBoard.";
	private static Map map = new HashMap<>();
	
	public int boardCount(String boardid, int petType) {
		map.clear();
		map.put("boardid", boardid);
		map.put("petType", petType);
		int num = session.selectOne(NS+"boardCount", map);
		return num;
	}

	public List<PetBoard> boardList(int pageInt, int limit, String boardid, int petType) {
		map.clear();
		map.put("boardid", boardid);
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		map.put("petType", petType);
		List<PetBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}

	public int insertBoard(PetBoard pb) {
		int num = session.insert(NS+"insertBoard", pb);
		return num;
	}
	
	public PetBoard boardOne(int num) {
		PetBoard board = session.selectOne(NS+"boardOne", num);
		
		return board;
	}
	
	public void readCountUp(int postId) {
		session.update(NS+"readCountUp", postId);
	}
	/*
	public int insertReply(Board board) {
		int num = session.insert(NS+"insertReply", board);
		return num;
	}
	*/
	
	public int boardUpdate(PetBoard pb) {
		int num = session.update(NS+"boardUpdate", pb);
		return num;
	}
	
	public int boardDisable(int postId) {
		int num = session.update(NS+"boardDisable", postId);
		return num;
	}

	/*
	public int boardDelete(int num) {
		int m = session.insert(NS+"boardDelete", num);
		return m;
	}
	*/
	
}
