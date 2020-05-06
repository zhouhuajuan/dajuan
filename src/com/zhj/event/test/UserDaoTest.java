package com.zhj.event.test;

import com.zhj.event.bean.User;
import com.zhj.event.dao.UserDao;
import com.zhj.event.dao.impl.UserDaoImpl;
import org.junit.Test;

public class UserDaoTest {

    UserDao userDao = new UserDaoImpl();

    @Test
    public void queryUserByUsernameAndRole() {
        if(userDao.queryUserByUsernameAndRole("1234","player") == null){
            System.out.println("用户名可用！");
        }else {
            System.out.println("用户名已存在！");
        }
    }

    @Test
    public void queryUserByUsernameAndPasswordAndRole() {
        if (userDao.queryUserByUsernameAndPasswordAndRole("1234","12","player") == null){
            System.out.println("用户名或密码错误，登陆失败！");
        }else {
            System.out.println("登陆成功！");
        }
    }

    @Test
    public void saveUser() {
        if (userDao.saveUser(new User(null,"123456","12","player")) == 1){
            System.out.println("注册成功！");
        }else {
            System.out.println("注册失败！");
        }
    }

   /*@Test
    public void saveUser() {
        System.out.println(userDao.saveUser(new User(null,"123","12","1247054987@qq.com")));
    }*/
}