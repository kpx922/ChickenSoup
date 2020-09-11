package com.wtlc.AIFire.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String index(ModelMap model) {
		return "workLogs";
	}

}
