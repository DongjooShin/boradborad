package com.imoxion.mapper;

import com.imoxion.domain.Login;
import com.imoxion.domain.MemberVo;

public interface MemberMapper {

	
	public void insertMember(MemberVo member);
	public Integer idCheck(String id);
	public Integer login(Login login);
}
