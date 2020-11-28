package com.chen.domain;

import java.io.Serializable;
import java.util.List;

public class PageBean4Employee implements Serializable {
	private int count;
    private int pageSize;
    private int totalPage;
    private int currentPage;
    
    private List<Employee> employee;

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

	public List<Employee> getEmployee() {
		return employee;
	}

	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "PageBean4Employee [count=" + count + ", pageSize=" + pageSize + ", totalPage=" + totalPage
				+ ", currentPage=" + currentPage + ", employee=" + employee + "]";
	}
    
    
    
}
