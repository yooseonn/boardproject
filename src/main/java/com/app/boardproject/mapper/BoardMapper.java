package com.app.boardproject.mapper;

import com.app.boardproject.domain.Board;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
    public void insertBoard(Board dto);

}
