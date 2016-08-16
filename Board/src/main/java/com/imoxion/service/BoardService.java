package com.imoxion.service;

import java.util.HashMap;
import java.util.List;

import javax.print.attribute.HashAttributeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imoxion.domain.BoardVO;
import com.imoxion.domain.Criteria;
import com.imoxion.domain.ReplyVO;
import com.imoxion.domain.SearchCriteria;
import com.imoxion.mapper.BoardMapper;
import com.imoxion.persistence.BoardDao;

@Service
public class BoardService {

	private BoardDao boardDao;

	@Autowired
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public int insertBoardService(BoardVO board) {
		return boardDao.insertBoard(board);
	}

	public List<BoardVO> getListService(Criteria criteria) {
		
		
		return boardDao.getList(criteria);
	}

	public BoardVO getBoardService(int b_num) {

		return boardDao.getBoard(b_num);
	}

	public void delBoardService(int b_num, int b_group) {
		int groupCount = boardDao.getGroupCount(b_group);
		
		if(groupCount == 1){//자기 자신이 이 그룹의 마지막 이기때문에 이 그룹의 모든 내용을 지운다.
			boardDao.delBoard(b_group);
		}
		else{	//아직 이 그룹에 게시글이 남아 있기 때문에 b_flag만 1로 변경해 준다.
			boardDao.updateFlag(b_num);
		}
		
		

	}

	public void boardUpdateService(BoardVO board) {
		boardDao.boardUpdate(board);

	}

	public void updateCountService(BoardVO board) {
		boardDao.updateCount(board);

	}

	/*public void insertReplyService(ReplyVO reply) {
		
		int maxGroupNum = boardDao.getMaxGroup(reply.getB_num());
		reply.setR_group(maxGroupNum+1);
		reply.setR_step(1);
		boardDao.insertReply(reply);
	}
*/
/*	public List<ReplyVO> getreplyService(int b_num) {

		return boardDao.getreply(b_num);
	}*/

	public List<BoardVO> getOverListService(BoardVO board) {
		
		return boardDao.getOverList(board);
	}

	public void updateStepService(BoardVO board) {
		boardDao.updateStep(board);
		
	}

	public Criteria getPaging(int rowPerPage,int cpage) {
		int totalCount = boardDao.listTotalCount();
		Criteria crieria = new Criteria();
		crieria.setTotalRow(totalCount);
		crieria.setRowPerPage(rowPerPage);
		crieria.setCpage(cpage);
		crieria.calPaging();
		return crieria;
	}
	
	public SearchCriteria getSearchPaging(int rowPerPage,int cpage,int totalCount) {
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setTotalRow(totalCount);
		searchCriteria.setRowPerPage(rowPerPage);
		searchCriteria.setCpage(cpage);
		searchCriteria.calPaging();
		return searchCriteria;
	}

	public SearchCriteria getSearch(String searchType, String keyword,int rowPerPage,int cpage) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		int searchTotalCount = boardDao.getSearchCount(map);
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setTotalRow(searchTotalCount);
		searchCriteria.setRowPerPage(rowPerPage);
		searchCriteria.setCpage(cpage);
		searchCriteria.setSearchType(searchType);
		searchCriteria.setKeyword(keyword);
		searchCriteria.calPaging();
		return searchCriteria;
	}

	public List<BoardVO> getSearchListService(SearchCriteria searchCriteria) {
		
		return boardDao.getSearchList(searchCriteria);
	}

}
