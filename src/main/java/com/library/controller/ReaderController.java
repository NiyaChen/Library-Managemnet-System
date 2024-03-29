package com.library.controller;
import com.github.pagehelper.PageInfo;
import com.library.po.ReaderCard;
import com.library.service.ReaderService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class ReaderController {
    @Autowired
    private ReaderService readerService;
    /**
     * 查询菜单的映射
     */

    @GetMapping("/readerIndex")
    public String readerIndex(){
        return "/reader/readerIndex";
    }
    @GetMapping("/addReader")

    public String addReader(){
        return "/reader/addReader";
    }
    /**
     * 读者端个人信息管理部门页面渲染
     */
    @GetMapping("/readerIndex2")
    public String readerIndex2(){
        return "/reader/readerIndex2";
    }

    @GetMapping("/queryReaderById")
    public String queryReaderById(Integer id, Model model){
        model.addAttribute("id",id);
        return "/reader/updatePwd";
    }

    /**
     * 查询所有读者信息
     */
    @ResponseBody
    @RequestMapping("/queryReaderAll")
    public R queryReaderAll(ReaderCard info, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15") Integer limit){

        PageInfo<ReaderCard>  pageInfo=readerService.queryReaderAll(info,page,limit);
        return R.ok("successful",pageInfo.getTotal(),pageInfo.getList());
    }
    /**
     * 查询所有的读者信息
     */
    @ResponseBody
    @RequestMapping("/queryReaderAll2")
    public R queryReaderAll(ReaderCard info, HttpServletRequest req){
        //获取登录用户
        HttpSession session= req.getSession();
        ReaderCard readerCard= (ReaderCard) session.getAttribute("user");
        info.setId(readerCard.getId());
        PageInfo<ReaderCard>  pageInfo=readerService.queryReaderAll(info,1,1);
        return R.ok("successful",pageInfo.getTotal(),pageInfo.getList());
    }
    /**
     * 提交监听功能
     */
    @ResponseBody
    @RequestMapping("/addReaderSubmit")
    public R addReaderSubmit(@RequestBody ReaderCard info){
        //设置默认密码
        info.setPassword("123456");
        readerService.addReaderInfoSubmit(info);
        return R.ok();
    }
    @ResponseBody
    @RequestMapping("/deleteReader")
    public R deleteReader(String ids){
        List list = Arrays.asList(ids.split(","));
        readerService.deleteReaderByIds(list);
        return R.ok();
    }
    /**
     * 根据id查询详细读者信息
     */
    @GetMapping("/queryReaderInfoById")
    public String queryReaderInfoById(Integer id, Model model){
        ReaderCard readerCard = readerService.queryReaderById(id);
        model.addAttribute("info", readerCard);
        return "/reader/updateReader";

    }
    /**
     * 修改提交功能
     */
    @ResponseBody
    @RequestMapping("/updateReaderSubmit")
    public R updateReaderSubmit(@RequestBody ReaderCard readerCard){
        readerService.updateReaderInfoSubmit(readerCard);
        return R.ok();
    }
    @ResponseBody
    @RequestMapping("/updateReaderPwdSubmit")
    public R updateReaderPwdSubmit(Integer id,String oldPwd,String newPwd){
        //根据id查询对象
        ReaderCard info=readerService.queryReaderById(id);
        info.setPassword(newPwd);
        readerService.updateReaderInfoSubmit(info);
        return R.ok("Password changed successfully");
    }
}
