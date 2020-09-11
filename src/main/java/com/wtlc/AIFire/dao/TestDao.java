package com.wtlc.AIFire.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.wtlc.AIFire.beans.WorkLogsBean;

@Repository
public class TestDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<String> findEmployee(){
		List<String> resultList = new ArrayList<>();
		try {

			String sql = "select * from TB_EMPLOYEE limit 10";

			List<Map<String, Object>> maps = jdbcTemplate.queryForList(sql);

			if (maps != null && !maps.isEmpty()) {
				for (Map<String, Object> map : maps) {
					resultList.add((String) map.get("EMPLOYEE_NO"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultList;
	}
	public void insertData(WorkLogsBean workLogs) {
		
		String insertData = "INSERT INTO WORK_LOG ( "
				+ "TITLE, WRITE_DATE, CONTENT, EMPLOYEE_NO,CREATE_DATE"
				+ " ) VALUES (?,?,?,?,?)";
		
		
		jdbcTemplate.update(insertData,workLogs.getSubject(),workLogs.getDate(),
				workLogs.getComments(),workLogs.getWorker(),new Date());
	}
}
