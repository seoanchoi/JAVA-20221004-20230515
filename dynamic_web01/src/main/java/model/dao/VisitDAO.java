package model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import database.connect.OracleConnection;
import model.dto.VisitDTO;

public class VisitDAO {

	/*
	 * 마이바티스 관련 라이브러리 필요
	 * 	1. ojdbc
	 *  2. mybatis
	 */
	private SqlSession session = OracleConnection.getSqlSession();
	
	public int insert(VisitDTO data) {
		int res = session.insert("visitMapper.insert", data);
		if(res == 1) {
			session.commit();
		}
		return res;
	}

	public List<VisitDTO> select() {
		List<VisitDTO> dataList = session.selectList("visitMapper.select");
		return dataList;
	}

	public List<VisitDTO> selectUserId(VisitDTO data) {
		List<VisitDTO> dataList = session.selectList("visitMapper.selectUserId", data);
		return dataList;
	}
	
	public List<VisitDTO> selectPage(Map<String, Integer> page) {
		List<VisitDTO> dataList = session.selectList("visitMapper.selectPage", page);
		return dataList;
	} 
	
	public int selectTotalRowCount() {
		int count = session.selectOne("visitMapper.totalRowCount");
		return count;
	}
	
	public void commit() {
		session.commit();
	}
	
	public void rollback() {
		session.rollback();
	}
	
	public void close() {
		session.close();
	}
}
