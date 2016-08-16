package com.imoxion.springTest;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping(value = "/doA", method = RequestMethod.GET)
	public String doA(){
		logger.info("doA calles...........!!!!!!!!!!!!!!");
		return "doA";
	}
	
	@RequestMapping(value = "/doB", method = RequestMethod.GET)
	public void doB(){
		logger.info("doB calles...........!!!!!!!!!!!!!!");
	}
}
	

