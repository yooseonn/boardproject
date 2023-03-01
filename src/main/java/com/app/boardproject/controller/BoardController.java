package com.app.boardproject.controller;

import com.app.boardproject.domain.Board;
import com.app.boardproject.domain.SessionInfo;
import com.app.boardproject.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpSession;
import java.io.File;


@Controller
@RequestMapping("/board/*")

public class BoardController {
    @Autowired
    private BoardService service;

    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeForm(Model model) throws Exception {

        model.addAttribute("mode", "write");

        return "board/write";

    }

    @RequestMapping(value = "write", method = RequestMethod.POST)
    public String writeSubmit(Board dto, HttpSession session) throws Exception {
            SessionInfo info = (SessionInfo) session.getAttribute("member");

        try {
            String root = session.getServletContext().getRealPath("/");
            String pathname = root + "uploads" + File.separator + "board";

            dto.setUserId (info.getUserId());

            service.insertBoard(dto);
        } catch (Exception e) {
        }

        return "redirect:/board/list";
    }



    @RequestMapping(value = "article")
    public String article (Model model) throws Exception {

        return "board/article";
    }

    @RequestMapping(value = "list")
    public String list (Model model) throws Exception {

        return "board/list";
    }

}
