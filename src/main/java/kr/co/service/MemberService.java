package kr.co.service;

import kr.co.vo.MemberVO;

public interface MemberService {

	// 회원 가입
	public void register(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원정보수정
	public void memberUpdate(MemberVO vo) throws Exception;
}
