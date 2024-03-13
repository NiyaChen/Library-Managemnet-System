package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.po.Notice;
import com.library.service.NoticeService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @GetMapping("/noticeIndex")
    public String noticeIndex(){
        return "/notice/noticeIndex";
    }

    /**
     * 查询所有的公告信息
     */
    @ResponseBody
    @RequestMapping("/noticeAll")
    public R noticeAll(String content, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15")Integer limit){
        PageInfo<Notice> pageInfo= noticeService.queryNoticeAll(content,page,limit);
        return R.ok("Successful",pageInfo.getTotal(),pageInfo.getList());
    }


}
