package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.QBoard;

@Component
public class QBoardMybatisDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	private final static String NS = "QBoard.";
	private static Map<Object, Object> map = new HashMap<>();
	
	public int boardCount() {
		int num = session.selectOne(NS+"boardCount");
		return num;
	}
	
	public List<QBoard> boardList(int pageInt, int limit) {
		map.clear();
		map.put("start", (pageInt - 1) * limit + 1);
		map.put("end", (pageInt * limit));
		List<QBoard> list = session.selectList(NS+"boardList", map);
		return list;
	}
		
	public int insertBoard(QBoard qb) {
		int num = session.insert(NS+"insertBoard", qb);
		return num;
	}
	
	public QBoard boardOne(int num) {
		QBoard board = session.selectOne(NS+"boardOne", num);
		
		return board;
	}
	
	public void readCountUp(int QId) {
		session.update(NS+"readCountUp", QId);
	}
	
	/*
	public int insertReply(Board board) {
		int num = session.insert(NS+"insertReply", board);
		return num;
	}
	*/
	
	public int boardUpdate(QBoard qb) {
		int num = session.update(NS+"boardUpdate", qb);
		return num;
	}
	
	public int boardDisable(int QId) {
		int num = session.update(NS+"boardDisable", QId);
		return num;
	}
	
	/*
	public int boardDelete(int num) {
		int m = session.insert(NS+"boardDelete", num);
		return m;
	}
	*/
	
}
