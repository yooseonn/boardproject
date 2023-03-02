package com.app.boardproject.controller;

import com.app.boardproject.DAO.MyUtil;
import com.app.boardproject.domain.Board;
import com.app.boardproject.domain.Member;
import com.app.boardproject.domain.SessionInfo;
import com.app.boardproject.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/board/*")

public class BoardController {
    @Autowired
    private BoardService service;

    private MyUtil myUtil;

    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeForm(Model model) throws Exception {

        model.addAttribute("mode", "write");

        return "board/write";

    }

    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String writeSubmit(Board dto, HttpSession session) throws Exception {
          System.out.println("dto.getContent"+dto.getContent());
            Member loginMember = (Member) session.getAttribute("loginMember");
        try {
            String root = session.getServletContext().getRealPath("/");

            dto.setUserId (loginMember.getUserId());

            service.insertBoard(dto);

            System.out.println("dto.getContent"+dto.getContent());

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }

        return "redirect:/board/list";
    }



    @RequestMapping(value = "article")
    public String article (Model model) throws Exception {


        return "board/article";
    }


    @RequestMapping(value = "list")
    public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
                       @RequestParam(defaultValue = "all") String condition,
                       @RequestParam(defaultValue = "") String keyword,
                       HttpServletRequest req,
                       Model model) throws Exception {
        List<Board> list = service.BoardList();

        System.out.println(list);

        model.addAttribute("list", list);

        return "board/list";
    }


}
