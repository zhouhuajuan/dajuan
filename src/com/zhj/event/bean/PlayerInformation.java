package com.zhj.event.bean;

/**
 * @program: dajuan4
 * @description: 选手信息实体类
 * @author: 周华娟
 * @create: 2020-05-06 23:30
 **/
public class PlayerInformation {
    private Integer id;
    private Integer userId;
    private String name;
    private Integer age;
    private String validity;
    private String lastTeam;
    private String date;
    private String path;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getValidity() {
        return validity;
    }

    public void setValidity(String validity) {
        this.validity = validity;
    }

    public String getLastTeam() {
        return lastTeam;
    }

    public void setLastTeam(String lastTeam) {
        this.lastTeam = lastTeam;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public String toString() {
        return "PlayerInformation{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", validity='" + validity + '\'' +
                ", lastTeam='" + lastTeam + '\'' +
                ", date='" + date + '\'' +
                ", path='" + path +'\'' +
                '}';
    }

    /**
     * 无参构造方法
     */
    public PlayerInformation() {
    }

    public PlayerInformation(Integer id,Integer userId,String name,Integer age,String validity,String lastTeam,
                             String date,String path) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.age = age;
        this.validity = validity;
        this.lastTeam = lastTeam;
        this.date = date;
        this.path = path;
    }
}
