package com.wtlc.AIFire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtlc.AIFire.beans.Menu;
import com.wtlc.AIFire.dao.SettingDao;

@Service
public class SettingService {
	@Autowired
	private SettingDao settingDao;
	
	public List<Menu> findSystmNav(String employeeNo) {
		return settingDao.findSystmNav();
	}
	
	public void insertSystemNav(Menu menu) {
		settingDao.insertSystemNav(menu);
	}
	
	public void updateSystemNav(Menu menu) {
		settingDao.updateSystemNav(menu);
	}
	
	public void deleteSystemNav(Menu menu) {
		settingDao.deleteSystemNav(menu);
	}
} 
