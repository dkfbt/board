package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite() {
		
		return "code/codeWrite";
		
	}
	
	@RequestMapping(value = "/codeWriteSave.do")
	public String insertCodes(CodeVO vo) throws Exception {
		
		String result = codeService.insertCodes(vo);
		
		if (result == null) {
			
			System.out.println("insert 완료");
			
		} else {
			
			System.out.println("insert 실패");
		}
		
		return "";
		
	}
	
	@RequestMapping(value = "/codeList.do")
	public String selectCodesList(CodeVO vo, ModelMap model) throws Exception {
		
		int total = codeService.selectCodesCount(vo); // (2 from DB)
		
		List<?> list = codeService.selectCodesList(vo); // (1 from DB)
		
		System.out.println("list => " + list);
		
		model.addAttribute("resultList", list); // (1 to jsp) 
		
		model.addAttribute("resultTotal", total); // (2 to jsp)
		
		return "code/codeList";
		
	}
	
	@RequestMapping(value = "/codeDelete.do")
	public String deleteCodes(int code) throws Exception {
		
		int result = codeService.deleteCodes(code);
		
		System.out.println("result => " + result);
		
		if (result == 1) {
			
			System.out.println("OOO삭제 성공OOO");
			
		} else {
			
			System.out.println("XXX삭제 실패XXX");
			
		}
		
		return "redirect:/codeList.do";
		
	}

	@RequestMapping(value = "/codeModifyWrite.do")
	public String selectCodesDetail(int code, ModelMap model) throws Exception {
		
		CodeVO vo = codeService.selectCodesDetail(code);
		
		System.out.println("gid ===>>>" +vo.getGid());
		
		System.out.println("code ===>>>" +vo.getCode());
		
		model.addAttribute("vo", vo);
		
		return "code/codeModifyWrite";
		
	}
	
	@RequestMapping(value = "/codeModifySave.do")
	public String updateCodes(CodeVO vo) throws Exception {
		
		codeService.updateCodes(vo);
		
		return "redirect:/codeList.do";
		
	}
	

}
