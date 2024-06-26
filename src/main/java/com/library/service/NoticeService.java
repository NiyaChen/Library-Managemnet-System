package com.library.service;


import com.github.pagehelper.PageInfo;
import com.library.po.Notice;

import java.util.List;

public interface NoticeService {
    PageInfo<Notice> queryNoticeAll(String content, int page, int limit);
    //添加公告
    void insertNoticeInfo (Notice notice);

    //查询根据id
    Notice queryNoticeById(Integer id);

    //删除
    void deleteNoticeByIds(List<String> ids);
}
