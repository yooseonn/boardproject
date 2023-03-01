package com.app.boardproject.mapper;

import com.app.boardproject.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    public List<Member> memberList();
    public int insertMember(Member dto);

    public Member login(Member dto);

}

