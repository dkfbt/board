package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	public MemberService memberService;
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do") 
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		
		String result = memberService.insertMember(vo);
		
		System.out.println("result ==>> " + result);
		
		String message = "";
		
		if(result == null) {
			
			message = "ok";
			
		}
		
		return message;
		
	}
	
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid) throws Exception {
		
		int count = memberService.selectMemberIdCheck(userid);
		
		String message = "";
		
		if(count == 0) {
			
			message = "ok";
			
		}
		
		return message;
		
	}
	
	@RequestMapping("/post1.do")
	public String post1() {
		
		return "member/post1";
	}
	
	@RequestMapping("/post2.do")
	public String selectPostList(String dong, ModelMap model) throws Exception {
		
		List<?> list = memberService.selectPostList(dong);
		
		model.addAttribute("resultList", list);
		
		
		return "member/post2";
	}
	
	@RequestMapping("/loginWrite.do")
	public String loginWrite() {
		
		return "member/loginWrite";
	}
	
	@RequestMapping("/loginWriteSubmit")
	@ResponseBody
	public String selectMemberCount(MemberVO vo, HttpSession session) throws Exception {
		
		int count = memberService.selectMembercount(vo);
		
		String message = "";
		
		if (count == 1) {
			
			session.setAttribute("SessionUserID", vo.getUserid());
			
			message = "ok";
			
		}
		
		return message;
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("SessionUserID");
		
		return "member/loginWrite";
	}
	
	@RequestMapping("/memberModifyWrite.do")
	public String memberModifyWrite(HttpSession session, ModelMap model) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserID");
		
		MemberVO memberVO = memberService.selectTheMember(userid);
		
		model.addAttribute("memberVO", memberVO );
		
		return "member/memberModifyWrite";
	}
	                 
	@RequestMapping("/memberModifySave.do")
	@ResponseBody
	public String updateMember(MemberVO vo) throws Exception {
		
		int result = memberService.updateMember(vo);
		
		System.out.println("result ==>> " + result);
		
        String message = "";
		
		if (result == 1) {
			
			message = "ok";
			
		}
		
		return message;
		
	}

}
