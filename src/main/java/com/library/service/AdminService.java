package com.library.service;

import com.github.pagehelper.PageInfo;
import com.library.po.Admin;

import java.util.List;

public interface AdminService {
    //分页查询

    PageInfo<Admin> queryAdminInfoAll(Admin admin, int page , int limit);

    //添加
    int addAdminSubmit(Admin admin);

    //修改
    int updateAdminSubmit(Admin admin);

    //删除
    int deleteAdminByIds(List<String> ids);

    //根据id查询详细信息
    Admin queryAdminById(Integer id);


    Admin queryUserByNameAndPassword(String username, String password);
}
