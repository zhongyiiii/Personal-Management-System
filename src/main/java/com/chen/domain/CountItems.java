package com.chen.domain;

import java.io.Serializable;
import java.util.List;

public class CountItems implements Serializable {
	private Integer countUsers;
	private Integer countEmployees;
	private Integer countDepts;
	private Integer countJobs;
	private Integer countNotices;
	private Integer countFiles;
	
	private List<Notice> notices;

	public Integer getCountUsers() {
		return countUsers;
	}

	public void setCountUsers(Integer countUsers) {
		this.countUsers = countUsers;
	}

	public Integer getCountEmployees() {
		return countEmployees;
	}

	public void setCountEmployees(Integer countEmployees) {
		this.countEmployees = countEmployees;
	}

	public Integer getCountDepts() {
		return countDepts;
	}
	
	
	public Integer getCountJobs() {
		return countJobs;
	}

	public void setCountJobs(Integer countJobs) {
		this.countJobs = countJobs;
	}

	public void setCountDepts(Integer countDepts) {
		this.countDepts = countDepts;
	}

	public Integer getCountNotices() {
		return countNotices;
	}

	public void setCountNotices(Integer countNotices) {
		this.countNotices = countNotices;
	}

	public Integer getCountFiles() {
		return countFiles;
	}

	public void setCountFiles(Integer countFiles) {
		this.countFiles = countFiles;
	}

	public List<Notice> getNotices() {
		return notices;
	}

	public void setNotices(List<Notice> notices) {
		this.notices = notices;
	}

	@Override
	public String toString() {
		return "CountItems [countUsers=" + countUsers + ", countEmployees=" + countEmployees + ", countDepts="
				+ countDepts + ", countJobs=" + countJobs + ", countNotices=" + countNotices + ", countFiles="
				+ countFiles + ", notices=" + notices + "]";
	}

	
	
	
	
}
