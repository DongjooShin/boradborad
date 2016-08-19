package com.imoxion.mapper;

import com.imoxion.domain.MemberVo;

public interface MemberMapper {

	
	public void insertMember(MemberVo member);
	public Integer idCheck(String id);
}
