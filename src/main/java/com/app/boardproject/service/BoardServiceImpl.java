package com.app.boardproject.service;

import com.app.boardproject.domain.Board;
import com.app.boardproject.mapper.BoardMapper;
import com.app.boardproject.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
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

    @Override
    public List<Board> BoardList() throws Exception {
        try {
            boardMapper.ReadBoard();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return boardMapper.ReadBoard();
    }
}