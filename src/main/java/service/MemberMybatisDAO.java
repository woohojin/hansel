package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Member;
import mybatis.MybatisConnection;

@Component
public class MemberMybatisDAO {
	
	@Autowired
	SqlSession session;
	
	private final static String NS = "member.";
	private static Map map = new HashMap<>();
	
	public int insertUser(Member mem) {
		
		int num = session.insert(NS+"insertUser", mem);
		return num;
		
	}
	
	public Member selectOne(String userId) {
		
		Member mem = session.selectOne(NS+"selectOne", userId);
		return mem;
		
	}
	
	public int updateLogin(Member mem) {
		
		int num = session.update(NS+"updateLogin", mem);
		return num;
		
	}
	
}
