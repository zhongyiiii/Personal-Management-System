package com.chen.domain;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable {
    private String number;

    private String password;

    private Integer role_id;

    private String phone;

    private Date createdate;

    private String username;

    private String remark;
    
//    添加一个属性，对应role_id的role_name
    private String rname;
    

    public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    
    
    public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "User [number=" + number + ", password=" + password + ", role_id=" + role_id + ", phone=" + phone
				+ ", createdate=" + createdate + ", username=" + username + ", remark=" + remark + ", rname=" + rname
				+ "]";
	}

    
}