package com.app.boardproject.controller;

import com.app.boardproject.domain.SessionInfo;
import com.app.boardproject.service.BoardService;
import org.eclipse.jdt.internal.compiler.apt.util.EclipseFileManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

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
    public String writeSubmit(Model model) throws Exception {

        model.addAttribute("mode", "write");

        return "redirect:/board/list";

    }

    @RequestMapping(value = "article")
    public String article(@RequestParam long num,
                          @RequestParam String page,
                          @RequestParam(defaultValue = "all") String condition,
                          @RequestParam(defaultValue = "") String keyword,
                          HttpSession session,
                          Model model) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        keyword = URLDecoder.decode(keyword, "utf-8");

        if (info == null) {
            return "redirect:/member/login";
        }

        return "board/article";
    }
}
