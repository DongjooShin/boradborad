package com.imoxion.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.imoxion.domain.BoardVO;
import com.imoxion.domain.Criteria;
import com.imoxion.domain.ReplyVO;
import com.imoxion.domain.SearchCriteria;
import com.imoxion.mapper.BoardMapper;

@Repository
public class BoardDao {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insertBoard(BoardVO board) {
		
		sqlSession.getMapper(BoardMapper.class).insertBoard(board);
		int getGroupNum = sqlSession.getMapper(BoardMapper.class).getGroupNum();
		if(board.getB_num()==0){
		sqlSession.getMapper(BoardMapper.class).insertGroupNumBoard(getGroupNum);
		}
		return getGroupNum;
		
	}

	public List<BoardVO> getList(Criteria criteria) {

		return sqlSession.getMapper(BoardMapper.class).getList(criteria);
	}

	public BoardVO getBoard(int b_num) {

		return sqlSession.getMapper(BoardMapper.class).getBoard(b_num);

	}

	public void delBoard(int b_group) {
		sqlSession.getMapper(BoardMapper.class).delBoard(b_group);

	}

	public void boardUpdate(BoardVO board) {

		sqlSession.getMapper(BoardMapper.class).boardUpdate(board);

	}

	public void updateCount(BoardVO board) {
		sqlSession.getMapper(BoardMapper.class).updateCount(board);

	}

	public void insertReply(ReplyVO reply) {

		sqlSession.getMapper(BoardMapper.class).insertReply(reply);
	}

	/*public List<ReplyVO> getreply(int b_num) {

		return sqlSession.getMapper(BoardMapper.class).getreply(b_num);
	}
*/
	public int getGroupCount(int b_group) {

		int groupCount = sqlSession.getMapper(BoardMapper.class).getGroupCount(b_group);

		System.out.println(groupCount);
		return groupCount;
		
	}

	public List<BoardVO> getOverList(BoardVO board) {
		
		return sqlSession.getMapper(BoardMapper.class).getOverList(board);
	}

	public void updateStep(BoardVO board) {
		sqlSession.getMapper(BoardMapper.class).updateStep(board);
		
	}

	public int listTotalCount() {
		Integer totalCount = sqlSession.getMapper(BoardMapper.class).listTotalCount();
		if(totalCount == null){
			return 0;
		}
		else{
			return totalCount;
		}
		
		
	}

	public void updateFlag(int b_num) {
		sqlSession.getMapper(BoardMapper.class).updateFlag(b_num);
		
	}

	public int getSearchCount(HashMap<String, String> map) {
		
		Integer SearchTotalCount = sqlSession.getMapper(BoardMapper.class).getSearchCount(map);
		if(SearchTotalCount ==null){
			return 0 ;
		}
		else{
			return SearchTotalCount;
		}
		
	}
	public List<BoardVO> getSearchList(SearchCriteria searchCriteria) {
		
		return sqlSession.getMapper(BoardMapper.class).getSearchList(searchCriteria);
	}

}
