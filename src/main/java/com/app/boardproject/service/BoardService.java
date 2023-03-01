package com.app.boardproject.service;

import com.app.boardproject.domain.Board;

import java.util.Map;

public interface BoardService {
    public void insertBoard (Board dto, String pathname) throws Exception;
    public int dataCount(Map<String ,Object> map);


}
