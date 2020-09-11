package com.wtlc.AIFire.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wtlc.AIFire.beans.Menu;

@Repository
public class SettingDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Menu> findSystmNav() {
		List<Menu> menuList = new ArrayList<>();

		try {
			String sql = "SELECT * FROM SYSTEM_NAV";
			List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);

			for (Map<String, Object> map : maps) {
				Menu menu = new Menu();
				menu.setId((Integer) map.get("ID"));
				menu.setName((String) map.get("NAME"));
				menu.setLevel((String) map.get("LEVEL"));
				menu.setPath((String) map.get("PATH"));
				menu.setPurview((Integer) map.get("PURVIEW"));

				menuList.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return menuList;
	}

	public void insertSystemNav(Menu menu) {
		try {
			String insertData = "INSERT INTO SYSTEM_NAV ( NAME, LEVEL, PATH, PURVIEW ) VALUES (?,?,?,?)";
			jdbcTemplate.update(insertData, menu.getName(), menu.getLevel(), menu.getPath(), menu.getPurview());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateSystemNav(Menu menu) {
		try {
			String updateData = "UPDATE SYSTEM_NAV SET NAME=?, LEVEL=?, PATH=?, PURVIEW=? WHERE ID=?";
			jdbcTemplate.update(updateData, menu.getName(), menu.getLevel(), menu.getPath(), menu.getPurview(), menu.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteSystemNav(Menu menu) {
		try {
			String deleteData = "DELETE FROM SYSTEM_NAV WHERE ID=?";
			jdbcTemplate.update(deleteData, menu.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
