package com.app.boardproject.service;

import com.app.boardproject.domain.Board;
import com.app.boardproject.mapper.BoardMapper;
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

    @Override
    public void updateHitCount(Board dto) throws Exception {
        try {
            boardMapper.updateHitCount(dto);
        } catch (Exception e){
            throw e;
        }

    }

    @Override
    public void preReadBoard(Map<String, Object> map) {

    }

    @Override
    public void nextReadBoard(Map<String, Object> map) {

    }

    @Override
    public void insertBoardLike(Map<String, Object> map) throws Exception {
        try {
        } catch (Exception e){
            throw e;
        }
    }
    @Override
    public void deleteBoardLike(Map<String, Object> map) throws Exception {

    }

    @Override
    public int BoardLikeCount(long num) {
        return 2;
        // 수정해
    }

    @Override
    public boolean userBoardLiked(Map<String, Object> map) {
        return false;
    }
}