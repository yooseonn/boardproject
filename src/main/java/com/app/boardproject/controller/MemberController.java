package com.app.boardproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")

public class MemberController {

    @RequestMapping (value="member/write", method= RequestMethod.GET)
    public String memberForm(Model model){
        model.addAttribute("mode", "member");
        return "member/join";

    }

    @RequestMapping (value="member", method= RequestMethod.POST)
    public String memberSubmit(Member dto, final RedirectAttributes reAttr, Model model)
        }

        return null;
    }

    @RequestMapping(value = "member/update", method = RequestMethod.POST)
    public String updateSubmit(){
        return "redirect:/member/complete";
    }


}
