package com.chen.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee implements Serializable {
    private Integer id;

    private Integer dept_id;

    private Integer job_id;
    
    private String deptName;
    
    private String jobName;

    private String name;

    private String card_id;

    private String address;

    private String post_code;

    private String tel;

    private String phone;

    private String qq_num;

    private String email;

    private String sex;

    private String party;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date birthday;

    private String race;

    private String education;

    private String speciality;

    private String hobby;

    private String remark;

    
    private Date create_date;

    
    
    
    
    
    public Integer getDept_id() {
		return dept_id;
	}

	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}

	public Integer getJob_id() {
		return job_id;
	}

	public void setJob_id(Integer job_id) {
		this.job_id = job_id;
	}

	public String getCard_id() {
		return card_id;
	}

	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}

	public String getQq_num() {
		return qq_num;
	}

	public void setQq_num(String qq_num) {
		this.qq_num = qq_num;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

   

    public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party == null ? null : party.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getRace() {
        return race;
    }

    public void setRace(String race) {
        this.race = race == null ? null : race.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality == null ? null : speciality.trim();
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby == null ? null : hobby.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    
	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", dept_id=" + dept_id + ", job_id=" + job_id + ", deptName=" + deptName
				+ ", jobName=" + jobName + ", name=" + name + ", card_id=" + card_id + ", address=" + address
				+ ", post_code=" + post_code + ", tel=" + tel + ", phone=" + phone + ", qq_num=" + qq_num + ", email="
				+ email + ", sex=" + sex + ", party=" + party + ", birthday=" + birthday + ", race=" + race
				+ ", education=" + education + ", speciality=" + speciality + ", hobby=" + hobby + ", remark=" + remark
				+ ", create_date=" + create_date + "]";
	}

	
	

    
    
}