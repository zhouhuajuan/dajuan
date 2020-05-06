package com.zhj.event.test;

import com.zhj.event.util.JdbcUtil;
import org.junit.Test;

import java.sql.Connection;

/**
 * @program: dajuan3
 * @description:
 * @author: 周华娟
 * @create: 2020-04-29 15:37
 **/
public class JdbcUtilTest {

    @Test
    public void testJdbcUtil(){
        for(int i =0;i<100;i++){
            Connection connection = JdbcUtil.getConnection();
            System.out.println(connection);
            JdbcUtil.close(connection);
        }

    }
}
