package com.com.com.approval.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.com.com.approval.dao.ApprovalDao;
import com.com.com.approval.service.ApprovalService;

@Service("ApprovalService")
public class ApprovalServiceImpl implements ApprovalService {
	
	@Resource(name = "ApprovalDao")
	private ApprovalDao approvalDao;
	
	@Override
	public List<Map <String, Object>> login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.login(map);
	}
	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.selectList(map);
	}
	@Override
	public void insertList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		approvalDao.insertList(map);
	}
	@Override
	public List<Map<String, Object>> selectHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.selectHistory(map);
	}
	@Override
	public void insertHistory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		approvalDao.insertHistory(map);
	}
	@Override
	public int selectSeq() {
		return approvalDao.selectSeq();
	}
	@Override
	public List<Map<String, Object>> selectContent(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.selectContent(map);
	}
	
	@Override
	public void updateHistory(Map <String, Object >map) {
		approvalDao.updateHistory(map);
	}
	
	@Override
	public void updateList(Map <String, Object >map) {
		approvalDao.updateList(map);
	}
	@Override
	public List<Map<String, Object>> ajaxList(Map<String, Object> map) {
		return approvalDao.ajaxList(map);
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<Map<String, Object>> searchList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.searchList(map);
	}
	@Override
	public List<Map<String, Object>> selectMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.selectMember(map);
		
	}
	
	@Override
	public void insertAdmin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		approvalDao.insertAdmin(map);
	}
	
	@Override
	public Map<String, Object> isAdminList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return approvalDao.isAdminList(map);
	}
	
}
