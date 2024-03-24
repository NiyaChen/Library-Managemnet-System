package com.library.controller;

import com.github.pagehelper.PageInfo;
import com.library.po.BookInfo;
import com.library.po.LendList;
import com.library.po.ReaderCard;
import com.library.service.LendListService;
import com.library.util.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LendListController {
    @Autowired
    private LendListService lendListService;
    @GetMapping("/lendListIndex")
    public String lendListIndex(){
        return "/lend/lendListIndex";
    }
    /**
     * 查询所有图书
     */
    @ResponseBody
    @RequestMapping("/lendListAll")
    public R lendListAll(Integer type, String cardnumber, String name, Integer status,
                         @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15") Integer limit){
        LendList info = new LendList();
        info.setType(type);
        //创建读者对象
        ReaderCard reader = new ReaderCard();
        reader.setCardnumber(cardnumber);
        //把以上对象交给info
        info.setReader(reader);

       //图书对象
        BookInfo book = new BookInfo();
        book.setName(name);
        book.setStatus(status);
        info.setBookInfo(book);
        //分页查询所有记录信息
        PageInfo pageInfo = lendListService.queryLendListAll(info, page,limit);
        return R.ok("ok", pageInfo.getTotal(), pageInfo.getList());
    }
}
