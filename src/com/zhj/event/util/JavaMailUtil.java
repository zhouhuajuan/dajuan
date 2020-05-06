package com.zhj.event.util;

import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.io.IOException;
import javax.mail.MessagingException;

/**
 * @program: dajuan4
 * @description: 定义邮箱发送配置接口
 * @author: 周华娟
 * @create: 2020-05-06 10:34
 **/
public class JavaMailUtil {
    // 发件人的邮箱-修改为自己的
    public static String emailAccount = "1247054987@qq.com";
    // 发件人邮箱授权码-修改为自己的
    public static String emailPassword = "krfarnbcyhtagjac";
    // 发件人邮箱服务地址-修改为自己的
    public static String emailSMTPHost = "smtp.qq.com";
    //  收件人邮箱
    public static String receiveMailAccount = "";


    /**
     *  创建一封邮件(发件人、收件人、邮件内容)
     * @param session 作用域
     * @param sendMail 发送邮件
     * @param receiveMail 接收邮件
     * @param text 邮件内容
     * @return message
     * @throws MessagingException 抛出异常
     * @throws IOException
     * cc:抄送
     * Bcc:密送
     * To:发送
     */
    public static MimeMessage creatMimeMessage(Session session, String sendMail, String receiveMail, String text) throws MessagingException, IOException {
        // 1、创建一封邮件对象
        MimeMessage message = new MimeMessage(session);
        // 2、From：发件人
        message.setFrom(new InternetAddress(sendMail, "大娟", "UTF-8"));
        // 3、To:收件人（可以增加多个收件人：抄送或者密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "张三", "UTF-8"));
        // 4、Subject:邮件主题
        message.setSubject("邮箱验证","UTF-8");
        // 5、Content:邮件正文（可以使用Html标签）
        message.setContent(text,"text/html;charset=UTF-8");
        // 6、设置发送时间
        message.setSentDate(new Date());
        // 7、保存设置
        message.saveChanges();
        // 8、将该邮件保存在本地
        //OutputStream out = new FileOutputStream("D://MyEmail" + UUID.randomUUID().toString() + ".eml");
        //message.writeTo(out);
        //out.flush();
        //out.close();
        return message;
    }
}
