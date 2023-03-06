package com.app.boardproject.service;

import com.app.boardproject.mapper.MemberMapper;
import com.app.boardproject.domain.Member;
import com.app.boardproject.service.MemberService;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;
@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    private SqlSession sqlSession;
    private MemberService memberService;

    private final Logger logger = LoggerFactory.getLogger(getClass());


    @Override
    public void insertMember(Member dto) throws Exception {
        try {
            if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
                dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
            }

            memberMapper.insertMember(dto);


        } catch (Exception e) {
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
            int n = memberMapper.updateMember(dto);
            System.out.println(n+"n");

        } catch (Exception e) {
            e.printStackTrace();
            throw e;


        }

    }

    @Override
    public void deleteMember(Map<String, Object> map) throws Exception {

    }

    @Override
    public boolean login(Member dto, HttpSession session) {

        Member loginMember = memberMapper.login(dto);

        if (loginMember != null) {
            session.setAttribute("loginMember",loginMember);
            return true;
        } else {
        return false;
    }

}
    @Override
    public Member readMember(String userId) {
        return memberMapper.selectOne(userId);
    }


    @Override
    public List<Member> memberList() {
        return memberMapper.memberList();
    }

    @Override
    public <T> T selectOne(String userId, Object value) throws Exception {
        List<T> list = null;

        return null;
    }

    @Override
    public <T> T selectOne(String userId) throws Exception {
        return null;
    }
}
