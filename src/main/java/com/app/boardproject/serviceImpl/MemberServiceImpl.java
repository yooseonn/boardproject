package com.app.boardproject.serviceImpl;

import com.app.boardproject.dto.Member;
import com.app.boardproject.service.MemberService;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service("service.memberService")
public class MemberServiceImpl implements MemberService {

    @Override
    public void insertMember(Member dto) throws Exception {
        try {
            if (dto.getEmail().length() != 0 && dto.getEmail2().length() != 0) {
                dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
            }


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
         /*
            boolean bPwdUpdate = !isPasswordCheck(dto.getUserId(), dto.getUserpwd());
            if (bPwdUpdate) {
                String encPassword = brcypt.encode(dto.getUserpwd());
                dto.setUserpwd(encPassword);

                dao.updateData("member.updateMember1", dto);

            }

                dao.updateData("member.updateMember2", dto);
            */
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
}
