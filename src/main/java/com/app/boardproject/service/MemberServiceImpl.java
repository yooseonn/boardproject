package com.app.boardproject.service;

import com.app.boardproject.mapper.MemberMapper;
import com.app.boardproject.domain.Member;
import com.app.boardproject.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void insertMember(Member dto) throws Exception {
        try {
            System.out.println("ㄹㄹㄹ"+dto.getEmail());
            if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
                dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
            }

            memberMapper.insertMember(dto);



            }

        catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

        @Override
    public void updateMember(Member dto) throws Exception {
        try {
            if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
                dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());

            }

        } catch (Exception e){
            e.printStackTrace();
            throw e;



        }

    }

    @Override
    public void deleteMember(Map<String, Object> map) throws Exception {

    }

    @Override
    public Member loginMember(String userId) {
        return null;
    }

    @Override
    public Member readMember(String userId) {
        return null;
    }

    @Override
    public Member readMember(long memberIdx) {
        return null;
    }

    @Override
    public boolean isPasswordCheck(String userId, String userPwd) {
        return false;
    }

    @Override
    public void updatePwd(Member dto) throws Exception {

    }

    @Override
    public List<Member> memberList() {
        return memberMapper.memberList();
    }
}
