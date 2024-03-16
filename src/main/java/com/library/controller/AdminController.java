package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.po.Admin;
import com.library.service.AdminService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    /**
     * 查询管理员的首页
     */
    @GetMapping("/adminIndex")
    public String adminIndex(){
        return "/admin/adminIndex";
    }

    @GetMapping("/addAdmin")
    public String addAdmin(){
        return "/admin/addAdmin";
    }
    /**
     * 提交管理员添加功能
     */
    @ResponseBody
    @RequestMapping("/addAdminSubmit")
    public R addAdminSubmit(Admin admin){
        int num = adminService.addAdminSubmit(admin);
        if (num>0){
            return R.ok();
        }
        else {
            return R.fail("add failed");
        }
    }
    /**
     * 实现删除功能
     */
    @ResponseBody
    @RequestMapping("/deleteAdmin")
    public R deleteAdmin(String ids){
        List<String> list = Arrays.asList(ids.split(","));
        int num = adminService.deleteAdminByIds(list);
        if(num>0){
            return R.ok();
        }
        else {
            return R.fail("delete failed");
        }
    }
    /**
     * 查询所有的管理员信息
     */
    @ResponseBody
    @RequestMapping("/adminAll")
    public R adminAll(Admin admin, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "15") int limit){
        //查询所有的记录信息
        PageInfo<Admin> pageInfo=adminService.queryAdminInfoAll(admin,page,limit);
        return R.ok("successful",pageInfo.getTotal(),pageInfo.getList());
    }
}
