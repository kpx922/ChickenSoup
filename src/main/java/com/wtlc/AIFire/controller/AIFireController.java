package com.wtlc.AIFire.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtlc.AIFire.beans.Hour;
import com.wtlc.AIFire.beans.WorkLogsBean;
import com.wtlc.AIFire.service.AIFireService;

@Controller
public class AIFireController {

	@Autowired
	private AIFireService aifireService;

	@GetMapping("/workLogs")
	public String workLogs(ModelMap model) {
		return "workLogs";
	}

	@PostMapping("/submit")
	public String submit(ModelMap model, WorkLogsBean workLogs) {

		model.put("message", "送出成功!");
		aifireService.insert(workLogs);
		return "test";
	}

	@GetMapping("/workHours")
	public String workHours(ModelMap model) {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.YEAR, 2019);
		c.set(Calendar.MONTH, 2-1);
		model.put("maxDate", c.getActualMaximum(Calendar.DATE));
		return "workHours";
	}
	
	@PostMapping("/day")
	@ResponseBody
	public String day(ModelMap model, List<Hour> list) {
		System.out.println("IN");
		
		
		return "workHours";
	}
}
