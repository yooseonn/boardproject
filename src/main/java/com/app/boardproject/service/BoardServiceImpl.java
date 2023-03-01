package com.app.boardproject.service;

import com.app.boardproject.domain.Board;
import com.app.boardproject.mapper.BoardMapper;
import com.app.boardproject.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public void insertBoard(Board dto) throws Exception {
        try {
            boardMapper.insertBoard(dto);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int dataCount(Map<String, Object> map) {
        return 0;
    }
}
