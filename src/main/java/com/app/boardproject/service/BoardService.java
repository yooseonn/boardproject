package com.app.boardproject.service;

import com.app.boardproject.domain.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {
    public void insertBoard (Board dto) throws Exception;
    public int dataCount(Map<String ,Object> map);

    public List<Board> BoardList() throws Exception;


}
