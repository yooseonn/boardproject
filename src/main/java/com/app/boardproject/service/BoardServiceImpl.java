package com.app.boardproject.service;

import com.app.boardproject.domain.Board;
import com.app.boardproject.mapper.BoardMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardMapper boardMapper;
    private SqlSession sqlSession;
    private BoardService boardService;


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
    public void updateBoard(Board dto) throws Exception {
        try {
            boardMapper.updateBoard(dto);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public void deleteBoard(Board dto) throws Exception {
        try {
            boardMapper.deleteBoard(dto);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    @Override
    public int dataCount(Map<String, Object> map) {
        try {
            boardMapper.dataCount(map);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return boardMapper.dataCount(map);
    }

    @Override
    public void updateHitCount(long num) throws Exception {
        try {
            boardMapper.updateHitCount(num);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
    @Override
    public List<Board> BoardList() throws Exception {
        try {
            boardMapper.listBoard();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return boardMapper.listBoard();
    }

    @Override
    public Board readBoard(long num) {
        try {
            boardMapper.readBoard(num);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        return boardMapper.readBoard(num);
    }

}