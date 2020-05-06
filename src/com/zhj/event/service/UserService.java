package com.zhj.event.service;

import com.zhj.event.bean.User;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 23:34
 **/
public interface UserService {


    /**
     * 注册用户
     * @param user 用户
     */
    public void registerUser(User user);

    /**
     * 登陆
     * @param user 用户
     * @return 如果返回null，说明登陆失败，返回有值，则登陆成功
     */
    public User login(User user);

    /**
     * 检查用户名是否可用
     * @param username 用户名
     * @param role 角色
     * @return 返回true表示用户名已存在，返回false表示用户名可用
     */
    public boolean existUsername(String username, String role);

    public boolean existUser(String username,String passsword,String role);

    public void updatePassword(User user);

}
