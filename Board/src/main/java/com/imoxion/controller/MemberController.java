package com.imoxion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		memberService.insetMemberService(member);
		
		
		
		return "/memberSignup";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("id") String id,Model model){
		int id_check = memberService.idCheckService(id);
		
		System.out.println(id_check);
		return id_check+"";
	}
	
}
