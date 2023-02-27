package com.app.boardproject.serviceImpl;

import com.app.boardproject.dto.Member;
import com.app.boardproject.service.MemberService;

import java.util.Map;

public class MemberServiceImpl implements MemberService {

    @Override
    public void insertMember(Member dto) throws Exception {
        try {
            if (dto.getEmail().length() != 0 && dto.getEmail2().length() != 0) {
                dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
            }

            if (dto.get

            }

        catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

        @Override
    public void updateMember(Member dto) throws Exception {

    }

    @Override
    public void deleteMember(Map<String, Object> map) throws Exception {

    }
}
