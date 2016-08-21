package com.imoxion.controller;

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
		System.out.println(member.toString());

		memberService.insetMemberService(member);
		
		
		
		return "/memberSignup";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getlogin(){
		return "/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postlogin(Login login,HttpSession session){
		
		int loginOk = memberService.loginService(login);
		if(loginOk==0){
			System.out.println("비밀번호 일치");
			session.setAttribute("m_id", login.getId());
		}else {
			System.out.println("비밀번호 불일치");
		}
		
		return "/login";
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("id") String id,Model model){
		int id_check = memberService.idCheckService(id);
		return id_check+"";
	}
	
}
