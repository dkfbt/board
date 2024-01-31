package main.service;

import java.util.List;

public interface MemberService {
	
	public String insertMember(MemberVO vo) throws Exception;
	
	public int selectMemberIdCheck(String userid) throws Exception;
	
	public List<?> selectPostList(String dong) throws Exception;
	
	public int selectMembercount(MemberVO vo) throws Exception;
	
	public MemberVO selectTheMember(String userid) throws Exception;
	
	public int updateMember(MemberVO vo) throws Exception;
	

}
