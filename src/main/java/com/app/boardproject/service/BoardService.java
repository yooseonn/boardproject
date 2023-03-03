package com.app.boardproject.service;

import com.app.boardproject.domain.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public void insertBoard (Board dto) throws Exception;
    public int dataCount(Map<String ,Object> map);
    public List<Board> BoardList() throws Exception;
    public Board readBoard (long num);
    public void updateHitCount(Board dto) throws Exception;
    public void preReadBoard(Map<String, Object> map);
    public void nextReadBoard(Map<String, Object> map);
    //좋아요 기능
    public void insertBoardLike(Map<String, Object> map) throws Exception;
    public void deleteBoardLike(Map<String, Object> map) throws Exception;
    public int BoardLikeCount(long num);
    public boolean userBoardLiked(Map<String, Object> map); //좋아요 중복제거


}
