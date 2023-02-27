package com.app.boardproject.controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MemberController {
    @RequestMapping (value="/member", method= RequestMethod.GET)

    public String memberForm(){
        return "member/join";

    }


}
