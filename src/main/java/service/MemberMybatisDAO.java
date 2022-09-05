package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Member;
import model.PetBoard;

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
	
	public List<Member> memberList(int userType) {
		List<Member> list = session.selectList(NS+"memberList", userType);
		return list;
	}
	
	public Member selectOne(String userId) {
		
		Member mem = session.selectOne(NS+"selectOne", userId);
		return mem;
		
	}
	
	public int updateAuth(String userId, int userType) {
		
		map.clear();
		map.put("userId", userId);
		map.put("userType", userType);
		
		int num = session.update(NS+"updateAuth", map);
		return num;
		
	}
	
	public int updateLogin(Member mem) {
		
		int num = session.update(NS+"updateLogin", mem);
		return num;
		
	}
	
	public void reportCountUp(String repoUerId) {
		session.update(NS+"reportCountUp", repoUerId);
	}
	
	public int updateMember(Member mem) {
		int num = session.update(NS+"updateMember", mem);
		return num;
		
	}
	public int deleteMember(String userId) {
		int num = session.delete(NS+"deleteMember", userId);
		return num;
		
	}
	
	public int pwdUpdateMember(String userId,  String chgpwd) {
		Map map = new HashMap();
		map.put("userId", userId);
		map.put("pwd", chgpwd);
		int num = session.update(NS+"pwdUpdateMember", map);
		return num;
		
	}
}
