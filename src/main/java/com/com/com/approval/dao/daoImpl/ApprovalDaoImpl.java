package com.com.com.approval.dao.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.com.com.approval.dao.ApprovalDao;

@Repository("ApprovalDao")
public class ApprovalDaoImpl implements ApprovalDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.login", map);
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.list", map);
	}

	@Override
	public void insertList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("apMapper.insertList", map);
	}

	@Override
	public List<Map<String, Object>> selectHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.history", map);
	}

	@Override
	public void insertHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("apMapper.insertHistory", map);
	}
	@Override
	public int selectSeq() {
		return sqlSession.selectOne("apMapper.selectSeq");
	}
	
	@Override
	public List<Map<String, Object>> selectContent(Map<String, Object> map) {
		
		return sqlSession.selectList("apMapper.selectContent", map);
	}

	@Override
	public void updateHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("apMapper.updateHistory", map);
	}
	
	@Override
	public void updateList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("apMapper.updateList", map);
	}

	@Override
	public List<Map<String, Object>> ajaxList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.ajaxList", map);
	}

	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.searchList", map);
	}

	@Override
	public List<Map<String, Object>> selectMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("apMapper.selectMember", map);
	}

	@Override
	public void insertAdmin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("apMapper.insertAdmin", map);
	}

	@Override
	public Map<String, Object> isAdminList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("apMapper.isAdminList", map);
	}

}
