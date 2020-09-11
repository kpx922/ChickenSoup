package com.wtlc.AIFire.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtlc.AIFire.beans.WorkLogsBean;
import com.wtlc.AIFire.dao.TestDao;

@Service
public class TestService {

	@Autowired
	private TestDao testDao;

	public List<String> findEmployee() {
		return testDao.findEmployee();
	}

	public void insert( WorkLogsBean workLogs) {

		testDao.insertData(workLogs);

	}
}
