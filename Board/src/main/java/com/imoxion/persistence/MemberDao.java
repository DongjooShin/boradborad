package com.imoxion.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imoxion.domain.MemberVo;
import com.imoxion.mapper.MemberMapper;

@Repository
public class MemberDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void insetMember(MemberVo member) {

		sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}

	public int idCheck(String id) {
		
		if(sqlSession.getMapper(MemberMapper.class).idCheck(id)==0){
			return 0; // 중복 회원 없음
		}
		else{
			return 1; // 중복 회원 존재
		}
	}
}
