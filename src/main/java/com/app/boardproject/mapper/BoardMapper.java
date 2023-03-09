package com.app.boardproject.mapper;

import com.app.boardproject.domain.Board;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Mapper
@Service
public interface BoardMapper {
    public int insertBoard(Board dto);

    public int updateBoard(Board dto);

    public int deleteBoard(Board dto);

    public int updateHitCount(long num);
    public int dataCount(Map <String,Object> map );
    public List <Board> listBoard();

    public Board readBoard (long num);


}
