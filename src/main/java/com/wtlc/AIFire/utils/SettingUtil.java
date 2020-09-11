package com.wtlc.AIFire.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;

import com.wtlc.AIFire.beans.Menu;
import com.wtlc.AIFire.beans.MenuView;
import com.wtlc.AIFire.service.SettingService;

public class SettingUtil {
	@Autowired
	private SettingService settingService;
	
	public List<MenuView> getMenuList(String employeeNo) {
		List<MenuView> viewList = new ArrayList<>();
		Map<String, MenuView> map = new HashMap<>();
		List<Menu> menuList = settingService.findSystmNav(employeeNo);
		for(Menu menu: menuList) {
			String[] levels = menu.getLevel().split("\\.");
			if(!map.containsKey(levels[0])) {
				MenuView mv = new MenuView();
				map.put(levels[0], mv);
				mv.setSubMenuList(new ArrayList<>());
				mv.setLevel(menu.getLevel());
				mv.setName(menu.getName());
				mv.setPath(menu.getPath());
			}
			
			if(levels.length == 2 && !"00".equals(levels[1])) {
				MenuView mv = map.get(levels[0]);
				MenuView mvSub = new MenuView();
				
				mvSub.setLevel(menu.getLevel());
				mvSub.setName(menu.getName());
				mvSub.setPath(menu.getPath());
				
				mv.getSubMenuList().add(mvSub);
			}
			
		}
		
		for(Entry<String, MenuView> entry: map.entrySet()) {
			viewList.add(entry.getValue());
		}
		
		if(!viewList.isEmpty()) {
			Collections.sort(viewList,
					new Comparator<MenuView>() {
						public int compare(MenuView o1, MenuView o2) {
							return o1.getLevel().compareTo(o2.getLevel());
						}
					});
		}
		
		return viewList;
	}
}
