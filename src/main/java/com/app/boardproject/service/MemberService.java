package com.app.boardproject.service;

import com.app.boardproject.dto.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

public interface MemberService {
    public void insertMember (Member dto) throws Exception; //회원가입
    public void updateMember (Member dto) throws Exception; //회원수정
    public void deleteMember (Map<String,Object> map) throws Exception; //회원탈퇴

    public Member loginMember(String userId);

    public Member readMember(String userId);

    public Member readMember(long memberIdx);

    public boolean isPasswordCheck(String userId, String userPwd);
    public void updatePwd(Member dto) throws Exception;



}
