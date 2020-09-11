package com.wtlc.AIFire.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.wtlc.AIFire.beans.WorkLogsBean;
import com.wtlc.AIFire.dao.AIFireDao;
import com.wtlc.AIFire.dao.TestDao;

@Service
public class AIFireService {

	@Autowired
	private AIFireDao aifireDao;

	public List<String> findEmployee() {
		return aifireDao.findEmployee();
	}

	public void insert( WorkLogsBean workLogs) {

		aifireDao.insertData(workLogs);

	}
}
