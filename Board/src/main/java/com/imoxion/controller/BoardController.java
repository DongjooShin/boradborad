
package com.imoxion.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.imoxion.domain.BoardAttaVo;
import com.imoxion.domain.BoardVO;
import com.imoxion.domain.Criteria;
import com.imoxion.domain.ReplyVO;
import com.imoxion.domain.SearchCriteria;
import com.imoxion.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController{

	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String dashBoard() {

		return "/dashBoard";
	}

	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String getInsertBoard() {

		return "/insertBoard";
	}

	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public String postInsertBoard(Model model, BoardVO board, HttpSession session,
			@RequestParam("file") MultipartFile filename[]) throws Exception {
		board.setM_id((String) session.getAttribute("m_id"));
		
		int b_num = boardService.insertBoardService(board);
		for (int i = 0; i < filename.length; i++) {
			uploadFile(filename[i],b_num);
		}
		return "redirect:/board/ReadBoard?b_num=" + b_num + "&cpage=1";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, SearchCriteria searchCriteria) {

		return "redirect:/board/listAll?cpage=" + searchCriteria.getCpage() + "&searchType="
				+ searchCriteria.getSearchType() + "&keyword=" + searchCriteria.getKeyword();
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)

	public String listAll(Model model, @RequestParam("cpage") int cpage, @RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword) {

		int rowPerPage = 3;

		SearchCriteria searchCriteria = boardService.getPaging(searchType, keyword, rowPerPage, cpage);

		List<BoardVO> list = boardService.getListService(searchCriteria);

		model.addAttribute("page", searchCriteria);
		model.addAttribute("list", list);
		return "/listBoard";
	}

	@RequestMapping(value = "/ReadBoard", method = RequestMethod.GET)
	public String ReadBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam("cpage") int cpage,
			HttpSession session) {
		String m_id = (String) session.getAttribute("m_id");
		int userFlag = 1;
		BoardVO board = null;
		board = boardService.getBoardService(b_num);// 해당 번호의 board 정보를 가져온다.
		int boardCount = board.getB_count() + 1;
		board.setB_count(boardCount);
		boardService.updateCountService(board);
		if (board.getM_id().equals(m_id)) {
			userFlag = 0;
		} else {
			userFlag = 1;
		}
		List<BoardAttaVo> boardAtta = boardService.getboardAttaService(b_num);
		
		
		model.addAttribute("userFlag", userFlag);
		model.addAttribute("cpage", cpage);
		model.addAttribute("board", board);
		return "/ReadBoard";
	}

	@RequestMapping(value = "/delBoard", method = RequestMethod.GET)
	public String delBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam("b_group") int b_group,
			@RequestParam int cpage) {

		boardService.delBoardService(b_num, b_group);

		return "redirect:/board/listAll?cpage=" + cpage + "&searchType= &keyword= ";
	}

	@RequestMapping(value = "/ModifyBoard", method = RequestMethod.GET)
	public String getModifyBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam int cpage) {

		BoardVO board = null;

		board = boardService.getBoardService(b_num);

		model.addAttribute("board", board);
		model.addAttribute("cpage", cpage);
		return "/modifyBoard";
	}

	@RequestMapping(value = "/answerBoard", method = RequestMethod.GET)
	public String getAnswer(Model model, @RequestParam("b_num") int b_num, @RequestParam int cpage) {

		BoardVO board = null;

		board = boardService.getBoardService(b_num);

		model.addAttribute("board", board);
		model.addAttribute("cpage", cpage);
		return "/answerBoard";
	}

	@RequestMapping(value = "/answerBoard", method = RequestMethod.POST)
	public String postAnswer(Model model, BoardVO board, @RequestParam int cpage, HttpSession session) {
		board.setM_id((String) session.getAttribute("m_id"));
		BoardVO parentBoard = boardService.getBoardService(board.getB_num());
		System.out.println(parentBoard.toString());
		board.setB_group(parentBoard.getB_group());
		board.setB_depth(parentBoard.getB_depth() + 1);
		board.setB_step(parentBoard.getB_step());
		
		boardService.addStepService(board);
		System.out.println(board.toString());
		boardService.insertBoardService(board);

		return "redirect:/board/ReadBoard?b_num=" + board.getB_num() + "&cpage=" + cpage;
	}

	@RequestMapping(value = "/ModifyBoard", method = RequestMethod.POST)
	public String postModifyBoard(Model model, BoardVO board, @RequestParam int cpage) {
		boardService.boardUpdateService(board);

		int b_num = board.getB_num();
		return "redirect:/board/ReadBoard?b_num=" + b_num + "&cpage=" + cpage;

	}

	/*
	 * @RequestMapping(value = "/insertReply", method = RequestMethod.POST)
	 * public String insertReply(Model model, ReplyVO reply) {
	 * 
	 * boardService.insertReplyService(reply); int b_num = reply.getB_num();
	 * return "redirect:/board/ReadBoard?b_num=" + b_num + "";
	 * 
	 * }
	 */

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String getUploadForm() {

		return "";
	}

/*	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String postUploadForm(Model model, @RequestParam("file") MultipartFile filename[],
			HttpServletRequest request) throws Exception {

		for (int i = 0; i < filename.length; i++) {

			System.out.println(filename[i].getOriginalFilename());
			System.out.println(filename[i].getSize());
			System.out.println(filename[i].getContentType());
			String savedName = uploadFile(filename[i].getOriginalFilename(), filename[i].getBytes());

		}
	
		return "/fileUploadTest";
	}*/

	private void uploadFile(MultipartFile file,int b_num) throws Exception {
		
		boardService.fileUploadService(file,b_num);
		/*UUID uid = UUID.randomUUID();
		String saveName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);*/
		//return saveName;
	}


}
