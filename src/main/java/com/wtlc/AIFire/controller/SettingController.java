package com.wtlc.AIFire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wtlc.AIFire.beans.Menu;
import com.wtlc.AIFire.beans.NavForm;
import com.wtlc.AIFire.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Autowired
	private SettingService settingService;

	@GetMapping("/nav")
	public String initSettingNav(ModelMap model) {
		model.put("menuList", settingService.findSystmNav(""));
		return "settingNav";
	}

	@PostMapping("/update")
	public String updateSettingNav(ModelMap model, NavForm navForm) {
		if (navForm != null && navForm.getMenuList() != null) {
			for (Menu menu : navForm.getMenuList()) {
				if (menu.getId() != null) {
					if(Boolean.TRUE.equals(menu.getIsDelete())) {
						settingService.deleteSystemNav(menu);
					}else {
						settingService.updateSystemNav(menu);
					}
				} else {
					if(menu.getIsDelete() == null || Boolean.FALSE.equals(menu.getIsDelete())) {
						settingService.insertSystemNav(menu);
					}
				}
			}
		}

		return "redirect:/setting/nav";
	}
	
}
