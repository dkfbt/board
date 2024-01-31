package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name = "deptService")
	private DeptService deptService;

	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() {
		
		return "dept/deptWrite";
	}
	
	@RequestMapping(value = "/deptWriteSave.do")
	public String indertDept(DeptVO vo) throws Exception {
		
		
		System.out.println("부서 번호: " + vo.getDeptno());
		System.out.println("부서 이름: " + vo.getDeptname());
		System.out.println("부서 위치: " + vo.getDeptloc());
		
		String result = deptService.insertDept(vo);
		
		System.out.println(result);
		
		if (result == null) {
			
			                                   
			System.out.println("insert--저장 완료");
			
		} else {
			
			System.out.println("insert--저장 실패");
		}
		
		return "redirect:/deptList.do";
	}
	
	@RequestMapping(value = "/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception {
		
		List<?> list = deptService.selectDeptList(vo);
		
		System.out.println("list => " + list);
		
		model.addAttribute("resultList", list);
		
		return "dept/deptList";
	}
	
	@RequestMapping(value = "/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		
		System.out.println("부서 번호 => " + vo.getDeptno());
		
		model.addAttribute("deptVO", vo);
		
		return "dept/deptDetail";
		
	}
	
	@RequestMapping(value = "/deptDelete.do")
	public String deleteDept(int deptno) throws Exception {
		
		int result = deptService.deleteDept(deptno);
		
		if (result == 1) {
			
			System.out.println("삭제 완료!!");
			
		} else {
			
			System.out.println("삭제 실패!!");
		}
		
		return "redirect:/deptList.do";
	}
	
	@RequestMapping(value = "/deptModifyWrite.do")
	public String selectDeptModify(int deptno, ModelMap model) throws Exception  {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		
		model.addAttribute("vo", vo);
		
		
		return "dept/deptModifyWrite";
		
	}
	
	@RequestMapping(value = "/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception {
		
		int result = deptService.updateDept(vo);
		
		if (result == 1) {
			
			System.out.println("수정 완료!!");
			
		} else {
			
			System.out.println("수정 실패!!");
		}
		
		return "";
		
	}
}
