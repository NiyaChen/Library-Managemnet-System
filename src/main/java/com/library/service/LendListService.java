package com.library.service;

import com.github.pagehelper.PageInfo;
import com.library.po.LendList;

public interface LendListService {
    //分页查询
    PageInfo<LendList> queryLendListAll(LendList lendList, int page, int limit);

}
