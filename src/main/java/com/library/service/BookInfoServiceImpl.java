package com.library.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.library.dao.BookInfoMapper;
import com.library.po.BookInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("/bookInfoService")
public class BookInfoServiceImpl implements BookInfoService{
    @Autowired
    private BookInfoMapper bookInfoDao;

    @Override
    public PageInfo<BookInfo> queryBookInfoAll(BookInfo bookInfo, int page, int limit) {
        //设置当前页以及每页记录数
        PageHelper.startPage(page, limit);
        //获取所有记录信息
        List<BookInfo> list = bookInfoDao.queryBookInfoAll(bookInfo);
        PageInfo<BookInfo> pageInfo=new PageInfo<>(list);
        return pageInfo;

    }

    @Override
    public void addBookSubmit(BookInfo info) {
        bookInfoDao.insert(info);
    }

    @Override
    public void updateBookSubmit(BookInfo info) {
        bookInfoDao.updateByPrimaryKey(info);
    }

    @Override
    public BookInfo queryBookInfoById(Integer id) {
        return bookInfoDao.selectByPrimaryKey(id);
    }

    @Override
    public void deleteBookInfoById(List<String> ids) {
        for(String id:ids){
            bookInfoDao.deleteByPrimaryKey(Integer.valueOf(id));
        }
    }

    @Override
    public List<BookInfo> getBookCountByType() {
        return bookInfoDao.getBookCountByType();
    }
}
