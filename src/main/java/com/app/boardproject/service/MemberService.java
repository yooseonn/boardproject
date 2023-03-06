package com.app.boardproject.service;

import com.app.boardproject.domain.Member;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface MemberService {
    public void insertMember(Member dto) throws Exception; //회원가입

    public void updateMember(Member dto) throws Exception; //회원수정

    public void deleteMember(Map<String, Object> map) throws Exception; //회원탈퇴

    public boolean login(Member dto, HttpSession session);

    public Member readMember(String userId);

    public List<Member> memberList();

    public <T> T selectOne (String userId,Object value) throws Exception;
    public <T> T selectOne (String userId) throws Exception;

}


