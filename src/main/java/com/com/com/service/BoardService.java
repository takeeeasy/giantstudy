package com.com.com.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	List<Map<String, Object>> list(int pageNum);
	
	int insert(Map<String, Object> map);

	int modify(Map<String, Object> map);
	
	Map<String, Object> detail(Map<String, Object> seq);
	
	int delete(List<Integer> list);

	int maxPageInBoard();
}
