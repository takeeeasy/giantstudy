package com.com.com.approval.dao;

import java.util.List;
import java.util.Map;

public interface ApprovalDao {

	List<Map<String, Object>> login(Map<String, Object> map);

	List<Map<String, Object>> selectList(Map<String, Object> map);


	List<Map<String, Object>> selectHistory(Map<String, Object> map);

	void insertHistory(Map<String, Object> map);

	int selectSeq();

	List<Map<String, Object>> selectContent(Map<String, Object> map);

	void updateHistory(Map<String, Object> map);

	void updateList(Map<String, Object> map);

	void insertList(Map<String, Object> map);

	List<Map<String, Object>> ajaxList(Map<String, Object> map);

	List<Map<String, Object>> searchList(Map<String, Object> map);

	List<Map<String, Object>> selectMember(Map<String, Object> map);

	void insertAdmin(Map<String, Object> map);

	Map<String, Object> isAdminList(Map<String, Object> map);

}
