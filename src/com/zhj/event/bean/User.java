package com.zhj.event.bean;

/**
 * @program: dajuan3
 * @description: user的bean类
 * @author: 周华娟
 * @create: 2020-04-28 16:30
 **/
public class User {
    private Integer id;
    private String username;
    private String password;
    private String role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ",role='" + role +'\'' +
                '}';
    }

    /**
     * 无参构造方法
     */
    public User() {
    }

    public User(Integer id, String username, String password, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
    }
}
