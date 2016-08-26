
package com.imoxion.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.imoxion.domain.BoardAttaVo;
import com.imoxion.domain.BoardVO;
import com.imoxion.domain.SearchCriteria;
import com.imoxion.domain.SendEmail;
import com.imoxion.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private BoardService boardService;

	@Autowired
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/insertBoard", method = RequestMethod.GET)
	public String getInsertBoard(@RequestParam("rowPerPage") int rowPerPage, Model model) {
		model.addAttribute("rowPerPage", rowPerPage);
		return "/insertBoard";
	}

	@RequestMapping(value = "/insertBoard", method = RequestMethod.POST)
	public String postInsertBoard(Model model, BoardVO board, HttpSession session,
			@RequestParam("file") MultipartFile file[], @RequestParam("email") String email,
			@RequestParam("rowPerPage") int rowPerPage) throws Exception {

		board.setM_id((String) session.getAttribute("m_id"));
		int b_num = boardService.insertBoardService(board);

		List<BoardAttaVo> list = new ArrayList<>();

		if (file[0].getSize() != 0) {
			for (int i = 0; i < file.length; i++) {
				list.add(boardService.fileUploadService(file[i], b_num));
			}
		}

		if (!email.equals("")) {
			SendEmail sendMail = new SendEmail();
			sendMail.mail(email, board, list);

		}

		return "redirect:/board/ReadBoard?b_num=" + b_num + "&rowPerPage=" + rowPerPage + "&cpage=1";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, SearchCriteria searchCriteria, @RequestParam int rowPerPage) {
 
		return "redirect:/board/listAll?cpage="+searchCriteria.getCpage()+"&rowPerPage="+rowPerPage+"&searchType="+searchCriteria.getSearchType()+"&keyword="+ searchCriteria.getKeyword()+"";
	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(Model model, @RequestParam("cpage") int cpage, @RequestParam("searchType") String searchType,
			@RequestParam("keyword") String keyword, @RequestParam("rowPerPage") int rowPerPage) {

		SearchCriteria searchCriteria = boardService.getPaging(searchType, keyword, rowPerPage, cpage);

		List<BoardVO> list = boardService.getListService(searchCriteria);

		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("page", searchCriteria);
		model.addAttribute("list", list);
		return "/listBoard";
	}

	@RequestMapping(value = "/ReadBoard", method = RequestMethod.GET)
	public String ReadBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam("cpage") int cpage,
			HttpSession session, @RequestParam("rowPerPage") int rowPerPage) {
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
		List<BoardAttaVo> boardAtta = null;

		boardAtta = boardService.getboardAttaService(b_num);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("boardAtta", boardAtta);
		model.addAttribute("userFlag", userFlag);
		model.addAttribute("cpage", cpage);
		model.addAttribute("board", board);
		return "/ReadBoard";
	}

	@RequestMapping(value = "/delBoard", method = RequestMethod.GET)
	public String delBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam("b_group") int b_group,
			@RequestParam int cpage, @RequestParam("rowPerPage") int rowPerPage) {

		boardService.delBoardService(b_num, b_group);

		return "redirect:/board/listAll?cpage=" + cpage + "&rowPerPage=" + rowPerPage + "&searchType= &keyword= ";
	}

	@RequestMapping(value = "/ModifyBoard", method = RequestMethod.GET)
	public String getModifyBoard(Model model, @RequestParam("b_num") int b_num, @RequestParam int cpage,
			@RequestParam("rowPerPage") int rowPerPage) {

		BoardVO board = null;
		List<BoardAttaVo> boardAtta = null;

		boardAtta = boardService.getboardAttaService(b_num);
		board = boardService.getBoardService(b_num);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("boardAtta", boardAtta);
		model.addAttribute("board", board);
		model.addAttribute("cpage", cpage);
		return "/modifyBoard";
	}

	@RequestMapping(value = "/answerBoard", method = RequestMethod.GET)
	public String getAnswer(Model model, @RequestParam("b_num") int b_num, @RequestParam("rowPerPage") int rowPerPage,
			@RequestParam int cpage) {

		BoardVO board = null;

		board = boardService.getBoardService(b_num);
		model.addAttribute("rowPerPage", rowPerPage);
		model.addAttribute("board", board);
		model.addAttribute("cpage", cpage);
		return "/answerBoard";
	}

	@RequestMapping(value = "/answerBoard", method = RequestMethod.POST)
	public String postAnswer(Model model, BoardVO board, @RequestParam int cpage, HttpSession session,
			@RequestParam("rowPerPage") int rowPerPage) {
		board.setM_id((String) session.getAttribute("m_id"));
		BoardVO parentBoard = boardService.getBoardService(board.getB_num());
		board.setB_group(parentBoard.getB_group());
		board.setB_depth(parentBoard.getB_depth() + 1);
		board.setB_step(parentBoard.getB_step());

		boardService.addStepService(board);
		boardService.insertBoardService(board);

		return "redirect:/board/listAll?cpage=" + cpage + "&rowPerPage=" + rowPerPage + "&searchType= &keyword= ";
	}

	@RequestMapping(value = "/ModifyBoard", method = RequestMethod.POST)
	public String postModifyBoard(Model model, BoardVO board, @RequestParam int cpage,
			@RequestParam("rowPerPage") int rowPerPage) {
		boardService.boardUpdateService(board);

		int b_num = board.getB_num();
		return "redirect:/board/ReadBoard?b_num=" + b_num + "&rowPerPage="+rowPerPage+"&cpage=" + cpage;

	}


	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String getUploadForm() {

		return "";
	}


	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void getUploadForm(@RequestParam("atta_id") String atta_id, HttpServletResponse response)
			throws IOException {
		BoardAttaVo boardAtta = boardService.getboardAttaBeanService(atta_id);
		byte fileByte[] = FileUtils
				.readFileToByteArray(new File(boardAtta.getAtta_path() + "\\" + boardAtta.getAtta_id()));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(boardAtta.getAtta_name(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

}
