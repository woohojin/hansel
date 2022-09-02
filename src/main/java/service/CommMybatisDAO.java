package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Comm;
import model.PetBoard;

@Component
public class CommMybatisDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "comm.";
	private static Map map = new HashMap<>();
	
	public int commCount(int commId, int boardType) {
		map.clear();
		map.put("commId", commId);
		map.put("boardType", boardType);
		int num = session.selectOne(NS+"commCount", map);
		return num;
	}
	
	public List<Comm> commList(int commId, int boardType) {
		map.clear();
		map.put("commId", commId);
		map.put("boardType", boardType);
		List<Comm> list = session.selectList(NS+"commList", map);
		return list;
	}

	
	public int insertBoard(Comm comm) {
		int num = session.insert(NS+"insertBoard", comm);
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
