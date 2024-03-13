package com.library.controller;
import com.github.pagehelper.PageInfo;
import com.library.po.ClassInfo;
import com.library.service.ClassInfoService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

@Controller
public class TypeController {
    @Autowired
    private ClassInfoService classService;
    @GetMapping("/typeIndex")
    public String typeIndex(){
        return"/type/typeIndex";
    }

    /*
    添加页面转化
     */
    @GetMapping("/typeAdd")
    public String typeAdd(){
        return "/type/addType";
    }

    /* 获取type数据信息 分页
     *
     */
    @RequestMapping("/typeAll")
    @ResponseBody
    public R typeAll(String name, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15")Integer limit){
        PageInfo<ClassInfo> pageInfo=classService.queryClassInfoAll(name, page, limit);

        return R.ok("successful", pageInfo.getTotal(), pageInfo.getList());
    }

    /*
    类型添加
     */
    @ResponseBody
    @RequestMapping("/addTypeSubmit")
    public R addTypeSubmit(ClassInfo info){
        classService.addTypeSubmit(info);
        return R.ok();
    }
    /*
    类型根据id查询
     */
    @GetMapping("/queryClassInfoById")
    public String queryClassInfoById(Integer id, Model model){
        ClassInfo info = classService.queryClassInfoById(id);
        model.addAttribute("info", info);
        return "/type/updateType";
    }
    /*
    修改提交功能
     */
    @ResponseBody
    @RequestMapping("/updateTypeSubmit")
    public R updateTypeSubmit(@RequestBody ClassInfo info){//@RequestBody以对象的格式
        classService.addTypeSubmit(info);
        return R.ok();
    }
    /*
    类型的删除
     */
    @ResponseBody
    @RequestMapping("/deleteType")
    public R deleteType(String ids){
        List list = Arrays.asList(ids.split(","));
        classService.deleteTypeByIds(list);
        return R.ok();
    }
    /**
     * 获取图书类型列表
     */
    @ResponseBody
    @RequestMapping("/findAllList")
    public List<ClassInfo> findAll(){
        PageInfo<ClassInfo>
                pageInfo=classService.queryClassInfoAll(null,1,100);
        List<ClassInfo> lists=pageInfo.getList();
        return lists;
    }
}

