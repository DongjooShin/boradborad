package com.imoxion.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imoxion.domain.Login;
import com.imoxion.domain.MemberVo;
import com.imoxion.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	
	private MemberService memberService;

	
	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value = "/memberSignUp", method = RequestMethod.GET)
	public String getMemberSignUp(){
		return "/memberSignup";
	}
	
	@RequestMapping(value = "/memberSignUp", method = RequestMethod.POST)
	public String postMemberSignUp(MemberVo member){
		member.setM_pw(SHA256(member.getM_pw()));
		memberService.insetMemberService(member);
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getlogin(){
		return "/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(Login login,HttpSession session,Model model){
		login.setPw(SHA256(login.getPw()));
		int loginOk = memberService.loginService(login);
		if(loginOk==0){//비밀번호 일치
			System.out.println("비밀번호 일치");
			session.setAttribute("m_id", login.getId());
			return "redirect:/board/listAll?cpage=1&rowPerPage=5&searchType= &keyword= ";
		}else {
			System.out.println("비밀번호 불일치");
			model.addAttribute("loginFlag", 0);
			return "/login";
				
			
		}	
	}
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("id") String id,Model model){
		int id_check = memberService.idCheckService(id);
		return id_check+"";
	}
	
	public String SHA256(String str) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}
	
}
