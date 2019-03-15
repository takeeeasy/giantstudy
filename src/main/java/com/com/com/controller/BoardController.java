package com.com.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.com.com.service.serviceImpl.BoardServiceImpl;
import com.tobesoft.platform.data.Dataset;

@Controller
public class BoardController 
{

	@Resource(name = "service")
	private BoardServiceImpl boardService;
	
	/* 게시판 List */
	@RequestMapping("list")
	public String list(Model model, @RequestParam(required=false, defaultValue="1") int pageNum) 
	{
		System.out.println(pageNum);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); 
		list = boardService.list(pageNum);
		int maxPage = boardService.maxPageInBoard();
		
		System.out.println("list.isEmpty:"+list.size());
		
		model.addAttribute("boardList", list);
		model.addAttribute("maxPage", maxPage);
		return "board/list";
	}
	
	/*쓰기 및 열람 맵핑 */
	@RequestMapping("writeView")
	public String writeView()
	{
		return "board/writeView";
	}
	
	/* 게시글 열람 및 조회수CNT*/
	@RequestMapping("detail")
	public String detail(@RequestParam Map<String, Object> seq, Model model)
	{
		Map <String, Object> map = new HashMap<String, Object>();
		map = boardService.detail(seq);
		model.addAttribute("dataMap", map);
		return "board/writeView";
	}
	
	
	// 게시글 등록
	@RequestMapping("insert")
	public String insert(Model model , @RequestParam Map<String, Object> map) 
	{
		System.out.println(map);
			boardService.insert(map);
			
		return "redirect:list";
	}
	
	// 게시글 수정
	@RequestMapping("modify")
	public String modify(@RequestParam Map<String, Object> map)
	{
		boardService.modify(map);
		return "redirect:list";
	}

	// 게시글 삭제
	@Autowired
	private SqlSessionTemplate sqlSession;
	@RequestMapping("delete")
	public String delete(Integer[] chkBox)
	{
		List<Integer> list = Arrays.asList(chkBox);// asList = Integer 로
		boardService.delete(list);

		return "redirect:list";
	}
	
	// 게시글 검색
	@RequestMapping("search")
	public String search(@RequestParam Map<String, Object> map, Model model) 
	{

		
		List <Map<String, Object>> list = sqlSession.selectList("mapper.search", map);
		System.out.println("listsize:"+list.size());
		model.addAttribute("boardList", list);
		return "board/list";
	}
	
	@RequestMapping("ajaxSearch")
	public String ajaxSearch(@RequestParam Map<String, Object> map, Model model)
	{
		
		System.out.println("type:"+map.get("searchType"));
		System.out.println("txt:"+map.get("searchTxt"));
		System.out.println("stDate:"+map.get("stDate"));
		System.out.println("enDate:"+map.get("enDate"));
		List <Map<String, Object>> list = sqlSession.selectList("mapper.search", map);
		model.addAttribute("boardList", list);
		return "board/ajaxSearch";
	}
	@RequestMapping("fileUpload")
	public String fileUpload()
	{
		return "board/fileForm";
	}
	
	@RequestMapping("fileUploadProc")
	 public String fileUpload (MultipartHttpServletRequest mRequest) throws Exception, IOException
	{
		String filePath = "\\resources\\upload\\";
		
        Iterator<String> iterator = mRequest.getFileNames();
        // parameter form에서 넘긴 file string name값들 Iterator로 만듬
        
        File file = new File(filePath);
        // filePath 명의 File 인스턴스를 생성

        if(file.exists() == false)
        {

            file.mkdirs();
            // 실제 filePath 명 file을 생성

        }

        while(iterator.hasNext())
        {

        	MultipartFile mFile= mRequest.getFile(iterator.next());

            if(mFile.isEmpty() == false)
            {

            	String fileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
            	// System 클래스의 밀리 세컨드로 나타내지는 현재의 시간+"_"
		
                mFile.transferTo(new File(filePath + fileName));     
                // MultipartFile(파일 업로드 처리를위한 인터페이스).interface의  transferTo(java.io.File dest)형태로 사용
            }
    
        }
        
        return "board/fileUpload";
        
	}
	
}
