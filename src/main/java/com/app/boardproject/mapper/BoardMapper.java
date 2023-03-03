package com.app.boardproject.mapper;

import com.app.boardproject.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public int insertBoard(Board dto);

    public int updateBoard(Board dto);

    public int deleteBoard(Board dto);

    public int insertBoardLike(Board dto);

    public int updateHitCount(Board dto);

    public List <Board> listBoard();

    public Board readBoard (long num);

    public List<Board> PreReadBoard(long num);

    public List<Board> nextReadBoard(long num);



}
