package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.po.BookInfo;
import com.library.service.BookInfoService;
import com.library.service.ClassInfoService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookInfoService bookInfoService;
    /**
     * 图书首页
     */
    @GetMapping("/bookIndex")
    public String bookIndex(){
        return "/book/bookIndex";
    }
    /**
     * 添加图书
     */
    @GetMapping("/addBook")
    public String addBook(){
        return "/book/addBook";
    }
    /**
     * 实现添加功能
     */
    @ResponseBody
    @RequestMapping("/addBookSubmit")
    public R addBookSubmit(@RequestBody BookInfo bookInfo){
        bookInfoService.addBookSubmit(bookInfo);
        return R.ok();
    }

    /**
     * 获取图书信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/bookAll")
    public R bookAll(BookInfo info, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15") int limit ){
        PageInfo<BookInfo> pageInfo = bookInfoService.queryBookInfoAll(info, page, limit);

        return R.ok("successful", pageInfo.getTotal(), pageInfo.getList());
    }
/**
 * 删除功能
 */
@ResponseBody
@RequestMapping("/deleteBookByIds")
public R deleteBookById(String ids){
    List list = Arrays.asList(ids.split(","));
    bookInfoService.deleteBookInfoById(list);
    return R.ok();
}
    /**
     * 根据id查询记录信息
     */
    @GetMapping("/queryBookInfoById")
    public String queryBookInfoById(Model model, Integer id){
//根据id获取对象
        BookInfo info= bookInfoService.queryBookInfoById(id);
        model.addAttribute("info",info);
        return "/book/updateBook";
    }
    /**
     * 修改实现功能
     */
    @ResponseBody
    @RequestMapping("/updateBookInfoSubmit")
    public R updateBookInfoSubmit(@RequestBody BookInfo info){
        System.out.println(info+"************************");
        bookInfoService.updateBookSubmit(info);
        return R.ok();
    }



}
