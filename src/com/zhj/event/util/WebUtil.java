package com.zhj.event.util;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServlet;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @program: dajuan4
 * @description:
 * @author: 周华娟
 * @create: 2020-05-05 23:15
 **/
public class WebUtil {

    public static void copyParamToBean(Map value, Object bean){
        try {
            BeanUtils .populate(bean,value);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
