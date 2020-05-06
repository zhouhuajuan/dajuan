package com.zhj.event.dao;

import com.zhj.event.bean.User;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 17:01
 **/
public interface UserDao {

    /**
     * 根据用户名查询用户信息
     * @param username 用户名
     * @return 如果返回null，说明没有这个用户，反之亦然
     */
    public User queryUserByUsernameAndRole(String username, String role);

    /**
     * 根据用户名和密码查询用户信息
     * @param username 用户名
     * @param password 密码
     * @return 如果返回null，说明用户名或密码错误，反之亦然
     */
    public User queryUserByUsernameAndPasswordAndRole(String username, String password, String role);

    /**
     * 保存用户信息
     * @param user 用户
     * @return 返回-1表示操作失败，其他是sql语句影响的行数
     */
    public int saveUser(User user);

    public int updatePassword(User user);
}
