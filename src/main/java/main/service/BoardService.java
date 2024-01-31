package main.service;

import java.util.List;

public interface BoardService {
	
	public String insertNBoard(BoardVO vo) throws Exception;
	
	public List<?> selectNBoardList(BoardVO vo) throws Exception;
	
	public int selectNBoardTotal(BoardVO vo) throws Exception;
	
	public BoardVO selectNBoardDetail(int unq) throws Exception;
	
	public int updateNBoardHits(int unq) throws Exception;
	
	public int updateNBoard(BoardVO vo) throws Exception;
	
	public int selectNBoardPw(BoardVO vo) throws Exception;
	
	public int deleteNBoard(BoardVO vo) throws Exception;

}
