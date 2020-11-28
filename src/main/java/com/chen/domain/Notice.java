package com.chen.domain;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {
    private String id;

    private String username;

    private String theme;

    private String title;

    private String remark;

    private String content;
    
    private Date create_time;
    
    

    public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    

    

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

	@Override
	public String toString() {
		return "Notice [id=" + id + ", username=" + username + ", theme=" + theme + ", title=" + title + ", remark="
				+ remark + ", content=" + content + ", create_time=" + create_time + "]";
	}

    
	
    
    
}