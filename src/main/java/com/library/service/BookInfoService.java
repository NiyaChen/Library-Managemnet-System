package com.library.service;

import com.github.pagehelper.PageInfo;
import com.library.po.BookInfo;

import java.util.List;

public interface BookInfoService {
    /**
     * 分页查询图书记录信息
     */
    PageInfo<BookInfo> queryBookInfoAll(BookInfo bookInfo, int page, int limit);
    /**
     * 添加
     */
    void addBookSubmit(BookInfo bookInfo);
    /**
     * 修改
     */
    void updateBookSubmit(BookInfo bookInfo);
    /**
     * 根据id查询
     */
    BookInfo queryBookInfoById(Integer id);
    /**
     * 删除功能
     */
    void deleteBookInfoById(List<String> ids);

}
