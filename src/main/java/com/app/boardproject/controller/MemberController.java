package com.app.boardproject.controller;

import com.app.boardproject.dto.Member;
import com.app.boardproject.dto.SessionInfo;
import com.app.boardproject.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")

public class MemberController {
    @Autowired
    private MemberService service;

    @RequestMapping(value = "member/write", method = RequestMethod.GET)
    public String memberForm(Model model) {
        model.addAttribute("mode", "member");
        return "member/join";

    }

    @RequestMapping(value = "member", method = RequestMethod.POST)
    public String memberSubmit(Member dto,
                               final RedirectAttributes reAttr, Model model) {
        try {
            service.insertMember(dto);
        } catch (DuplicateKeyException e) {
            model.addAttribute("mode", "member");
            model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
            return "member/join";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("mode", "member");
            model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
            return "member/join";
        } catch (Exception e) {
            model.addAttribute("mode", "member");
            model.addAttribute("message", "회원가입이 실패했습니다.");
            return "member/join";
        }

        StringBuilder sb = new StringBuilder();
        sb.append(dto.getUserName() + " 님의 회원 가입이 정상적으로 처리되었습니다.<br>");

        return "redirect:/member/complete";
    }

    @RequestMapping(value = "member/update", method = RequestMethod.POST)
    public String updateSubmit() {
        return "redirect:/member/complete";
    }

    @RequestMapping(value = "member/complete")
    public String complete(@ModelAttribute("message") String message) throws Exception {

        if (message == null || message.length() == 0) // F5를 누른 경우
            return "redirect:/";

        return "/member/complete";
    }

    @RequestMapping(value = "login")
    public String loginForm() {
        return "/member/login";

    }

    @RequestMapping(value ="/member/userIdCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> idCheck(@RequestParam String userId) throws Exception {

        String p ="true";
        Member dto = service.readMember(userId);
        if (dto != null) {
            p = "false";
        }

        Map<String, Object> model = new HashMap<>();
        model.put("passed",p);
        return model;

        }

}

