package com.library.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.dao.LendListMapper;
import com.library.po.LendList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("lendListService")
public class LendListServiceImpl implements LendListService{
    @Autowired
    private LendListMapper lendListDao;
    @Override
    public PageInfo<LendList> queryLendListAll(LendList lendList, int page, int limit) {
        PageHelper.startPage(page,limit);
        List<LendList> list = lendListDao.queryLendListAll(lendList);
        PageInfo<LendList> pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
