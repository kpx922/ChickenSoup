package com.wtlc.AIFire.beans;

import java.util.List;

public class MenuView {
	private String name;
	private String path;
	private String level;
	private List<MenuView> subMenuList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public List<MenuView> getSubMenuList() {
		return subMenuList;
	}

	public void setSubMenuList(List<MenuView> subMenuList) {
		this.subMenuList = subMenuList;
	}

}
