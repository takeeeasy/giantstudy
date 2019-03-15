package com.com.com.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.com.com.dao.BoardDao;
import com.com.com.service.BoardService;

@Service("service")
public class BoardServiceImpl implements BoardService {
	@Resource(name = "dao")
	private BoardDao boardDao;
	private static final int PAGE_LENGTH = 7;
	
	@Override
	public List<Map<String, Object>> list(int pageNum) {
		// TODO Auto-generated method stub
		int enNum = pageNum * PAGE_LENGTH;
		int stNum = enNum - PAGE_LENGTH+1;
		
		Map<String, Object> stEnNum = new HashMap<String, Object>();
		stEnNum.put("stNum",stNum);
		stEnNum.put("enNum",enNum);
		stEnNum.put("pageLen", PAGE_LENGTH);
		
		System.out.println("stNum:"+stEnNum.get("stNum"));
		System.out.println("enNum:"+stEnNum.get("enNum"));
	
		return boardDao.list(stEnNum);
	}

	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.insert(map);
	}

	@Override
	public int modify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return boardDao.modify(map);
	}
	
	@Override
	public Map<String, Object> detail(Map<String, Object> seq) {
		// TODO Auto-generated method stub
		return boardDao.detail(seq);
	}

	@Override
	public int delete(List<Integer> list) {
		// TODO Auto-generated method stub
		return boardDao.delete(list);
	}
	
	@Override
	public int maxPageInBoard() {
		// TODO Auto-generated method stub
		int maxRow = boardDao.maxPageInBoard();
		int maxPage = 0;
		if(maxRow != 0 && maxRow%PAGE_LENGTH != 0) 
		{
			maxPage = (maxRow/PAGE_LENGTH) +1;
		}
		else{
			if(maxRow == 0){
				System.out.println("list.size() is NULL");
				return -1;
			}
			else{
				maxPage = maxRow/PAGE_LENGTH;
			}
		}
		return maxPage;
	}

}
