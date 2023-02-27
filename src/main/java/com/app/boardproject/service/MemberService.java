package com.app.boardproject.service;

import com.app.boardproject.dto.Member;

import java.util.Map;

public interface MemberService {
    public void insertMember (Member dto) throws Exception;
    public void updateMember (Member dto) throws Exception;
    public void deleteMember (Map<String,Object> map) throws Exception;

}
