package com.chen.domain;

import java.io.Serializable;
import java.util.Date;

public class Uploadfile implements Serializable {
    private String id;

    private String uploadName;

    private String fileName;

    private Date uploadDate;
    
    private String title;
    
    private String savePath;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUploadName() {
		return uploadName;
	}

	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	@Override
	public String toString() {
		return "Uploadfile [id=" + id + ", uploadName=" + uploadName + ", fileName=" + fileName + ", uploadDate="
				+ uploadDate + ", title=" + title + ", savePath=" + savePath + "]";
	}
    
    
    
    
    


	
    
    
}