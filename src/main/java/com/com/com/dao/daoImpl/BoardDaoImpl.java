package com.com.com.dao.daoImpl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.com.com.dao.BoardDao;

@Repository("dao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, Object>> list(Map<String, Object> stEnNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.list",stEnNum);
	}

	@Override
	public int insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("mapper.insert", map);
	}


	@Override
	public int modify(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.modify", map);
	}

	@Override
	public Map<String, Object> detail(Map<String, Object> seq) {
		// TODO Auto-generated method stub
		sqlSession.update("mapper.viewCNT", seq);
		return sqlSession.selectOne("mapper.detail", seq);
	}

	@Override
	public int delete(List<Integer> list) {
		// TODO Auto-generated method stub
		return sqlSession.delete("mapper.delete2", list);
	}

	@Override
	public int maxPageInBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.paging");
	}

}
