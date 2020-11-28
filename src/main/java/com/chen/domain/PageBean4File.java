package com.chen.domain;

import java.io.Serializable;
import java.util.List;

public class PageBean4File implements Serializable {
	private int count;
    private int pageSize;
    private int totalPage;
    private int currentPage;
    
    private String fromIndexDatetime;
    private String toIndexDatetime;
    private String uploadName;
    
    private List<Uploadfile> uploadfiles;
    
    
    
    
	public String getUploadName() {
		return uploadName;
	}
	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}
	public List<Uploadfile> getUploadfiles() {
		return uploadfiles;
	}
	public void setUploadfiles(List<Uploadfile> uploadfiles) {
		this.uploadfiles = uploadfiles;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public String getFromIndexDatetime() {
		return fromIndexDatetime;
	}
	public void setFromIndexDatetime(String fromIndexDatetime) {
		this.fromIndexDatetime = fromIndexDatetime;
	}
	public String getToIndexDatetime() {
		return toIndexDatetime;
	}
	public void setToIndexDatetime(String toIndexDatetime) {
		this.toIndexDatetime = toIndexDatetime;
	}
	@Override
	public String toString() {
		return "PageBean4File [count=" + count + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", currentPage=" + currentPage + ", fromIndexDatetime=" + fromIndexDatetime + ", toIndexDatetime="
				+ toIndexDatetime + ", uploadName=" + uploadName + ", uploadfiles=" + uploadfiles + "]";
	}
	
	
	
	

}
