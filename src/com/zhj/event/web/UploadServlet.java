package com.zhj.event.web;

import com.zhj.event.bean.PlayerInformation;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

@MultipartConfig
@WebServlet(name = "UploadServlet",urlPatterns = "/UploadServlet")
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //设置编码为utf-8
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        //创建一个解析器工厂
        DiskFileItemFactory factory=new DiskFileItemFactory();

        //文件上传解析器
        ServletFileUpload upload=new ServletFileUpload(factory);
        //设置编码格式
        upload.setHeaderEncoding("UTF-8");

        try {
            //解析请求，将表单中每个输入项封装成一个FileItem对象
            List<FileItem> itemList=upload.parseRequest(request);
            if (itemList == null){
                request.getRequestDispatcher("player_register.jsp").forward(request,response);
            }else {
                for(FileItem item:itemList){
                    //判断输入的类型是 普通输入项 还是文件
                    if(item.isFormField()){
                        //普通输入项 ,得到input中的name属性的值
                        String name=item.getFieldName();
                        //得到输入项中的值
                        String value=item.getString("UTF-8");
                        System.out.println("name="+name+"  value="+value);
                    }else{
                        //上传的是文件，获得文件上传字段中的文件名
                        //注意IE或FireFox中获取的文件名是不一样的，IE中是绝对路径，FireFox中只是文件名。
                        //获得上传图片的名称
                        String fileName=item.getName();
                        System.out.println(fileName);
                        //返回表单标签name属性的值
                        String namede=item.getFieldName();
                        System.out.println(namede);

                        int index = fileName.lastIndexOf("\\");
                        fileName = fileName.substring(index + 1);
                        request.setAttribute("realFileName", fileName);
                        String basePath = request.getSession().getServletContext().getRealPath("/images");
                        System.out.println(basePath);//打印当前位置
                        File file = new File(basePath, fileName);
                        try {
                            item.write(file);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                request.getRequestDispatcher("register_success.jsp").forward(request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
