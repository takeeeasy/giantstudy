package com.com.com.dao;

import java.util.List;
import java.util.Map;

public interface BoardDao {
	List<Map<String, Object>> list(Map<String, Object> stEnNum);

	int insert(Map<String, Object> map);

	int modify(Map<String, Object> map);

	Map<String, Object> detail(Map<String, Object> seq);
	
	int delete(List<Integer> list);

	int maxPageInBoard();

}
