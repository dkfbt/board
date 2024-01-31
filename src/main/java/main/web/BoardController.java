package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	public BoardService boardService;
	
	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		
		String result = boardService.insertNBoard(vo);
		
		System.out.println("result => " + result);
		
		String msg = "";
		
		if (result == null) {
			
			msg = "ok-success";
			
		} else {
			
			msg = "fail";
			
		}
		
		return msg;
		
	}
	
	@RequestMapping(value = "/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		int total = boardService.selectNBoardTotal(vo);
		
		int unit = 10;
		
//		int totalPage = (int) Math.ceil((double)total/10); // 분모: 한 page 당 게시글 수
		int totalPage = (int) Math.ceil((double)total/unit);
		
		Integer viewPage = vo.getViewPage();
		
		System.out.println("viewPage ==>> " + viewPage);
		
		if (viewPage > totalPage || viewPage < 1) {
			
			viewPage = 1;
		}
		
		System.out.println("viewPage ==>> " + viewPage);
		
		int startIndex = (viewPage - 1)*unit + 1;
		
		int endIndex = startIndex + (unit - 1);
		
		int startRowNo = total - (viewPage - 1) * unit;
//		int startRowNo = (viewPage - 1) * unit + 1;
		
		vo.setStartIndex(startIndex);
		
		vo.setEndIndex(endIndex);
		
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("list => " + list);
		
		model.addAttribute("resultList", list);
		
		model.addAttribute("total", total);
		
		model.addAttribute("totalPage", totalPage);
		
		model.addAttribute("rowNumber", startRowNo);
		
		return "board/boardList";
		
	}
	
	
	@RequestMapping(value = "/boardDetail.do")
	public String selectNBoardDetail(BoardVO vo, ModelMap model) throws Exception {
		
		boardService.updateNBoardHits(vo.getUnq());
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
		String content = boardVO.getContent();
		
		boardVO.setContent(content.replace("\n", "<br>")); // browser는,,<br>를 인식할 수 있음
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value = "/boardModifyWrite.do")
	public String selectNBoardModifyWrite(BoardVO vo, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq()) ;
		
		model.addAttribute("boardVO", boardVO );
		
		return "board/boardModifyWrite";
		
	}
	
	@RequestMapping(value = "/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception {

		int count = boardService.selectNBoardPw(vo);
		
		int result = 0;
		
		if (count == 1) {
			
			result = boardService.updateNBoard(vo);
			
		} else {
			
			result = -1;
		}
		
	    System.out.println("result + " + result);
		
		return result + "";
		
	}
	
	@RequestMapping(value = "/pwWrite.do")
	public String pwWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq );
		
		return "board/pwWrite";
	}
	
	
	@RequestMapping(value = "/boardDelete.do")
	@ResponseBody
	public String deleteNBoard(BoardVO vo) throws Exception {
		
		int count = boardService.selectNBoardPw(vo);
		
		int result = 0;
		
		if (count == 1) {
			
			result = boardService.deleteNBoard(vo);
			
		} else if (count == 0) {
			
			result = -1;
			
		}
		
		return result + "";
		
	}

}
