package com.chen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.IUserDao;
import com.chen.domain.Dept;
import com.chen.domain.Employee;
import com.chen.domain.Job;
import com.chen.domain.Notice;
import com.chen.domain.PageBean4Employee;
import com.chen.domain.PageBean4File;
import com.chen.domain.PageBean4User;
import com.chen.domain.Role;
import com.chen.domain.Uploadfile;
import com.chen.domain.User;
import com.chen.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserDao userDao;
	@Override
	public int saveUser(User user) {
		return userDao.saveUser(user);
	}
	@Override
	public User findUser(String number, String password) {
		return userDao.findUser(number, password);
		
	}
	@Override
	public int getAllAccounts() {
		return userDao.getAllAccounts();
	}
	@Override
	public int addDepartment(Integer did, String dname, String dremark) {
		return userDao.addDepartment(did,dname, dremark);
	}
	@Override
	public int getAllDepartments() {
		return userDao.getAllDepartments();
	}
	
	@Override
	public List<Dept> findAllDepartments(String did, String dname) {
		return userDao.findAllDepartments(did, dname);
	}
	
	@Override
	public int getAllJob() {
		return userDao.getAllJob();
	}
	@Override
	public int addJob(Integer jid, String jname, String jremark) {
		return userDao.addJob(jid, jname, jremark);
	}
	
	
	@Override
	public List<Job> findAllJobs(String jid, String jname) {
		return userDao.findAllJobs(jid, jname);
	}
	
	@Override
	public Integer getAllRole() {
		return userDao.getAllRole();
	}
	
	@Override
	public int addRole(Integer rid, String rname, String rremark) {
		return userDao.addRole(rid, rname, rremark);
	}
	
	@Override
	public List<Role> findAllRoles(String rid, String rname) {
		return userDao.findAllRoles(rid, rname);
	}
	
	
	@Override
	public List<Dept> findDepts() {
		return userDao.findDepts();
	}
	@Override
	public List<Job> findJobs() {
		return userDao.findJobs();
	}
	
	@Override
	public int getAllEmployee() {
		return userDao.getAllEmployee();
	}
	@Override
	public int addEmployee(Employee employee) {
		return userDao.addEmployee(employee);
	}
	
	@Override
	public String getRoleNameByRoleId(int roleId) {
		return userDao.getRoleNameByRoleId(roleId);
	}
	@Override
	public PageBean4User splitPages4User(int currentPage, int pageSize) {
		int count = userDao.getAllAccounts();
		int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数
		List<User> user = userDao.splitPages4User(currentPage, pageSize);
		
		PageBean4User pbUser = new PageBean4User();
		pbUser.setUser(user);
		pbUser.setCount(count);
		pbUser.setCurrentPage(currentPage);
		pbUser.setPageSize(pageSize);
		pbUser.setTotalPage(totalPage);
		
		
		return pbUser;
	}
	
	@Override
	public List<Role> findRoles() {
		return userDao.findRoles();
	}
	@Override
	public PageBean4User splitPages4UserByCondition(String number, String username, String phone, String role_id,
			int currentPage, int pageSize) {
		int count = userDao.getAllAccountsByCondition(number, username, phone, role_id);
		int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数
		List<User> user = userDao.splitPages4UserByCondition(number, username, phone, role_id, currentPage, pageSize);
		PageBean4User pbUser = new PageBean4User();
		pbUser.setUser(user);
		pbUser.setCount(count);
		pbUser.setCurrentPage(currentPage);
		pbUser.setPageSize(pageSize);
		pbUser.setTotalPage(totalPage);
		
		
		return pbUser;
	}
	
	@Override
	public int delManyUsers(List<String> numbers) {
		return userDao.delManyUsers(numbers);
	}
	
	@Override
	public User returnUserInfo(String number) {
		return userDao.returnUserInfo(number);
	}
	@Override
	public int editUserInfo(User user) {
		return userDao.editUserInfo(user);
	}
	
	
	
	@Override
	public PageBean4Employee splitPages4EmployeeByCondition(String id, String name, String phone, String deptId,
			String jobId, int currentPage, int pageSize) {
		int count = userDao.getAllEmployeesByCondition(id, name, phone, deptId, jobId);
		int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数
		List<Employee> employees = userDao.splitPages4EmployeeByCondition(id, name, phone, deptId, jobId, currentPage, pageSize);
		
		PageBean4Employee pbEmployee = new PageBean4Employee();
		pbEmployee.setEmployee(employees);
		pbEmployee.setCount(count);
		pbEmployee.setCurrentPage(currentPage);
		pbEmployee.setPageSize(pageSize);
		pbEmployee.setTotalPage(totalPage);
		
		return pbEmployee;
	}
	
	
	
	
	
	@Override
	public String getDeptNameByDeptId(int dept_id) {
		return userDao.getDeptNameByDeptId(dept_id);
	}
	@Override
	public String getJobNameByJobId(int job_id) {
		return userDao.getJobNameByJobId(job_id);
	}
	@Override
	public int delManyEmployees(List<String> idz) {
		return userDao.delManyEmployees(idz);
	}
	
	@Override
	public Employee returnEmployeeInfo(String id) {
		return userDao.returnEmployeeInfo(id);
	}
	
	@Override
	public int editEmployeeInfo(Employee employee) {
		return userDao.editEmployeeInfo(employee);
	}
	
	
	@Override
	public int getAllFiles() {
		return userDao.getAllFiles();
	}
	
	
	@Override
	public int uploadFile(Uploadfile uploadfile) {
		return userDao.uploadFile(uploadfile);
	}
	
	@Override
	public int addNotice(Notice notice) {
		return userDao.addNotice(notice);
	}
	
	@Override
	public List<Notice> searchNoticeByCondition(String title, String theme, String username) {
		return userDao.searchNoticeByCondition(title, theme, username);
	}
	
	@Override
	public Notice findNoticeById(String id) {
		return userDao.findNoticeById(id);
	}
	
	
	@Override
	public int getAllNotices() {
		return userDao.getAllNotices();
	}
	@Override
	public List<Notice> findNoticesByOrder(int fromIndex, int toIndex) {
		return userDao.findNoticesByOrder(fromIndex, toIndex);
	}
	
	@Override
	public PageBean4File splitPages4FileByCondition(String uploadName, String fromIndexDatetime, String toIndexDatetime,
			int pageSize, int currentPage) {
		int count = userDao.getAllFilesByCondition(uploadName, fromIndexDatetime, toIndexDatetime);
		int totalPage = (int)Math.ceil(count*1.0/pageSize); //求出总页数
		List<Uploadfile> uploadfiles = userDao.splitPages4FileByCondition(uploadName, fromIndexDatetime, toIndexDatetime, pageSize, currentPage);
		
		PageBean4File pbFile = new PageBean4File();
		pbFile.setUploadfiles(uploadfiles);
		pbFile.setCount(count);
		pbFile.setCurrentPage(currentPage);
		pbFile.setPageSize(pageSize);
		pbFile.setTotalPage(totalPage);
		pbFile.setUploadName(uploadName);
		
		return pbFile;
	}
	
	
	@Override
	public Uploadfile getUploadFileById(String id) {
		return userDao.getUploadFileById(id);
	}
	
	
	
	
	@Override
	public List<Uploadfile> findUploadFilesByIds(List<String> idz) {
		return userDao.findUploadFilesByIds(idz);
	}
	@Override
	public int delManyUploadFiles(List<String> idz) {
		return userDao.delManyUploadFiles(idz);
	}
	
	
	@Override
	public int editLoginUserInfo(User user) {
		return userDao.editLoginUserInfo(user);
	}
	@Override
	public boolean checkUserName(String username) {
		int flag = userDao.checkUserName(username);
		if(flag>=1) {
			return false;
		}else {
			return true;
		}
	}
	
	
	
}
