package com.imoxion.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imoxion.domain.Login;
import com.imoxion.domain.MemberVo;
import com.imoxion.persistence.MemberDao;

@Service
public class MemberService {

	private MemberDao memberDao;

	@Autowired
	public void setMemberDaoDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void insetMemberService(MemberVo member) {
		memberDao.insetMember(member);
		
	}

	public int idCheckService(String id) {
		return memberDao.idCheck(id);
	}

	public int loginService(Login login) {
		return memberDao.idCheck(login);
	}
}
