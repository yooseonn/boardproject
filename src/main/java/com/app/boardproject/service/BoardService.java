package com.app.boardproject.service;

import com.app.boardproject.domain.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public void insertBoard (Board dto) throws Exception;
    public void updateBoard(Board dto) throws Exception;
    public void deleteBoard(Board dto) throws Exception;

    public int dataCount(Map<String ,Object> map);

    public void updateHitCount(long num) throws Exception;
    public List<Board> BoardList() throws Exception;
    public Board readBoard (long num);
    //좋아요 기능


}
