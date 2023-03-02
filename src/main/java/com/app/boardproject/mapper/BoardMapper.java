package com.app.boardproject.mapper;

import com.app.boardproject.domain.Board;
import com.app.boardproject.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    public int insertBoard(Board dto);

    public List <Board> ReadBoard();


}
