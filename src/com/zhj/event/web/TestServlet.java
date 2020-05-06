package com.zhj.event.web;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TestServlet",urlPatterns = "/TestServlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //一下三行代码的三行代码的作用request.getInputStream();获取请求体的全部内容
            //进行解析，获得分割线的内容，将其封装在FileItem对象中
            DiskFileItemFactory dff=new DiskFileItemFactory();
            ServletFileUpload sfu=new ServletFileUpload(dff);
            List<FileItem> list = sfu.parseRequest(request);
            //创建map集合，键存名字，值存值。
            Map<String ,String> map=new HashMap<String,String>();

            for (FileItem fi : list) {
                //判断该项是否是普通项
                if(fi.isFormField()) {
                    map.put(fi.getFieldName(), fi.getString("UTF-8"));
                }else {
                    //该项是文件项
                    //获取文件项输入流，放入输入流对象
                    InputStream is = fi.getInputStream();
                    //获取要存入的文件夹的绝对路径
                    String path = request.getSession().getServletContext().getRealPath("/aaa/aaa/");//文件路径
                    //创建文件，（路径，文件名12312.jpg）
                    File file=new File(path,fi.getName());
                    //判断文件是否已经存在，不存在就创建一次；
                    if(!file.exists()) {
                        file.createNewFile();
                    }
                    //将文件项放到输出流对象内
                    OutputStream os=new FileOutputStream(file);
                    //用工具，实现，输入输出流的对接
                    IOUtils.copy(is, os);
                    //释放资源
                    IOUtils.closeQuietly(is);
                    IOUtils.closeQuietly(os);
                    //存放键值对
                    map.put(fi.getFieldName(),"/aaa/aaa/"+fi.getFieldName());
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
