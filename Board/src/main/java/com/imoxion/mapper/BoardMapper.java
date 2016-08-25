package com.imoxion.mapper;

import java.util.HashMap;
import java.util.List;

import com.imoxion.domain.BoardAttaVo;
import com.imoxion.domain.BoardVO;
import com.imoxion.domain.Criteria;
import com.imoxion.domain.ReplyVO;
import com.imoxion.domain.SearchCriteria;

public interface BoardMapper {

	
	public int insertBoard(BoardVO board);
	public int getGroupNum();
	public void insertGroupNumBoard(int getGroupNum);
	public List<BoardVO> getList(Criteria criteria);
	public BoardVO getBoard(int b_num);
	public void delBoard(int b_num);
	public void boardUpdate(BoardVO board);
	public void updateCount(BoardVO board);
	public void insertReply(ReplyVO reply);
/*	public List<ReplyVO> getreply(int b_num);*/
	public Integer getGroupCount(int b_group);
	public List<BoardVO> getOverList(BoardVO board);
	public void updateStep(BoardVO board);
	public Integer listTotalCount();
	public void updateFlag(int b_num);
	public Integer getSearchCount(HashMap<String, String> map);
	public List<BoardVO> getSearchList(SearchCriteria searchCriteria);
	public void addStep(BoardVO board);
	public void fileUpload(BoardAttaVo boardAtta);
	public List<BoardAttaVo> getboardAtta(int b_num);
	public BoardAttaVo getboardAttaBean(String atta_id);
}
