package com.app.boardproject.controller;

import com.app.boardproject.domain.Board;
import com.app.boardproject.domain.Member;;
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


    @RequestMapping(value = "list")
    public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
                       @RequestParam(defaultValue = "all") String condition,
                       @RequestParam(defaultValue = "") String keyword,
                       HttpServletRequest req,
                       Model model) throws Exception {
        List<Board> list = service.BoardList();

        int size=10; //한 화면에 보여주는 게시물 수
        int total_page=0;
        int dataCount=0;

        if(req.getMethod().equalsIgnoreCase("GET")) {
            keyword = URLDecoder.decode(keyword,"utf-8");

        }

        // 전체 페이지
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("condition",condition);
        map.put("keyword",keyword);

        dataCount = service.dataCount(map);

        String cp = req.getContextPath();
        String query = "";
        String listUrl = cp + "/board/list";
        String articleUrl = cp + "/board/article?page=" + current_page;

        if(keyword.length() != 0){
            query = "condition" + condition + "&keyword=" + URLDecoder.decode(keyword,"utf-8");
        }

        if (query.length() != 0) {
            listUrl = cp + "/localComm/list?" + query;
            articleUrl = cp + "/localComm/article?page=" + current_page + "&" + query;
        }


        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("size", size);
        model.addAttribute("total_page", total_page);
        model.addAttribute("articleUrl", articleUrl);

        model.addAttribute("condition", condition);
        model.addAttribute("keyword", keyword);

        model.addAttribute("list", list);

        return "board/list";
    }

    @RequestMapping (value = "article")
    public String article (@RequestParam long num,
                           @RequestParam String page,
                           @RequestParam (defaultValue = "all") String condition,
                           @RequestParam (defaultValue = "") String keyword,
                           HttpSession session, Model model) throws Exception {

        Member loginMember = (Member) session.getAttribute("loginMember");
        keyword = URLDecoder.decode(keyword, "utf-8");

        if (session == null) {
            return "redirect:/member/login";
    }

    String query = "page=" + page;
		if (keyword.length() != 0) {
        query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
    }

    //service.updateHitCount(num);

        System.out.println("oo");
    Board dto = service.readBoard(num);

    if(dto == null) {
        return "redirect:/board/list?"+query;

    }

    // int likeCount = service.BoardLikeCount(num);

    if(dto==null)

    {
        return "redirect:/board/list?" + query;
    }

   // int likeCount = service.BoardLikeCount(num);

    // int replyCount = service.BoardReplyCount(num);

    dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

    //이전글, 다음글
    Map<String, Object> map = new HashMap<String, Object>();

    map.put("num", num);
    map.put("condition", condition);
    map.put("keyword" , keyword);

    return "/board/article";

    }



}
