package com.chen.service;

import java.util.List;

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

public interface IUserService {
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public int saveUser(User user);

	/**
	 * 登录
	 * @param number
	 * @param password
	 * @return
	 */
	public User findUser(String number, String password);

	/**
	 * 查询user所有记录的总条数
	 * @return
	 */
	public int getAllAccounts();
	

	/**
	 * 添加部门
	 * @param did
	 * @param dname
	 * @param dremark
	 * @return
	 */
	public int addDepartment(Integer did, String dname, String dremark);

	/**
	 * 查询dept所有记录的总条数
	 * @return
	 */
	public int getAllDepartments();

	/**
	 * 查询所有dept记录
	 * @param dept_id
	 * @param dname
	 * @return
	 */
	public List<Dept> findAllDepartments(String did, String dname);

	/**
	 * 查询job所有记录的总条数
	 * @return
	 */
	public int getAllJob();
	
	/**
	 * 添加job
	 * @param jid
	 * @param jname
	 * @param jremark
	 * @return
	 */
	public int addJob(Integer jid, String jname, String jremark);
	
	/**
	 * 查询所有job记录
	 * @param jid
	 * @param jname
	 * @return
	 */
	public List<Job> findAllJobs(String jid, String jname);
	
	
	/**
	 * 查询role所有记录的总条数
	 * @return
	 */
	public Integer getAllRole();
	
	/**
	 * 添加Role
	 * @param rid
	 * @param rname
	 * @param rremark
	 * @return
	 */
	public int addRole(Integer rid, String rname, String rremark);
	
	/**
	 * 查询所有role记录
	 * @param rid
	 * @param rname
	 * @return
	 */
	public List<Role> findAllRoles(String rid, String rname);
	
	/**
	 * 
	 * @return
	 */

	public List<Dept> findDepts();

	public List<Job> findJobs();
	
	/**
	 * 查询employee所有记录的总条数
	 * @return
	 */
	public int getAllEmployee();
	
	/**
	 * 添加employee
	 * @param employee
	 * @return
	 */
	public int addEmployee(Employee employee);
	
	
	/**
	 * 根据roleId查询roleName
	 * @param roleId
	 * @return
	 */
	public String getRoleNameByRoleId(int roleId);
	
	/**
	 * 根据一页显示多少内容pageSize，和当前页currentPage来分页
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean4User splitPages4User(int currentPage, int pageSize);
	
	/**
	 * 得到role，转发到页面，使下拉框的内容能动态的变化 
	 * @return
	 */
	public List<Role> findRoles();
	
	/**
	 * 根据输入的条件搜索，并根据一页显示多少内容pageSize，和当前页currentPage来分页
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean4User splitPages4UserByCondition(String number, String username, String phone, String role_id, int currentPage, int pageSize);
	
	/**
	 * 根据numbers，删除数据，批量操作
	 * @param numbers
	 * @return
	 */
	public int delManyUsers(List<String> numbers);
	
	/**
	 * 回显用户信息
	 * @param string
	 * @return
	 */
	public User returnUserInfo(String number);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public int editUserInfo(User user);
	
	
	
	/**
	 * 根据输入的条件搜索，并根据一页显示多少内容pageSize，和当前页currentPage来分页显示数据
	 * @param id
	 * @param name
	 * @param phone
	 * @param deptId
	 * @param jobId
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean4Employee splitPages4EmployeeByCondition(String id, String name, String phone, String deptId,
			String jobId, int currentPage, int pageSize);
	
	
	/**
	 * 根据deptId查询deptName
	 * @param dept_id
	 * @return
	 */
	public String getDeptNameByDeptId(int dept_id);
	
	/**
	 * 根据jobId来查询jobName
	 * @param job_id
	 * @return
	 */
	public String getJobNameByJobId(int job_id);
	
	/**
	 * 根据id，删除数据，批量操作
	 * @param idz
	 * @return
	 */
	public int delManyEmployees(List<String> idz);
	
	/**
	 * 回显employee数据
	 * @param id
	 * @return
	 */
	public Employee returnEmployeeInfo(String id);
	
	/**
	 * 修改employee信息
	 * @param employee
	 * @return
	 */
	public int editEmployeeInfo(Employee employee);
	
	/**
	 * 得到upload数据表的总记录数
	 * @return
	 */
	public int getAllFiles();
	
	/**
	 * 添加上传的文件
	 * @param uploadfile
	 * @return
	 */
	public int uploadFile(Uploadfile uploadfile);
	
	/**
	 * 添加公告
	 * @param notice
	 * @return
	 */
	public int addNotice(Notice notice);
	
	
	/**
	 * 按条件查询notice
	 * @param title
	 * @param theme
	 * @param username
	 * @return
	 */
	public List<Notice> searchNoticeByCondition(String title, String theme, String username);
	
	/**
	 * 根据id查询notice
	 * @param id
	 * @return
	 */
	public Notice findNoticeById(String id);
	
	/**
	 * 得到notice的总记录数
	 * @return
	 */
	public int getAllNotices();
	
	/**
	 * 根据条件查询notice
	 * @param fromIndex
	 * @param toIndex
	 * @return
	 */
	public List<Notice> findNoticesByOrder(int fromIndex, int toIndex);
	
	/**
	 * 根据条件查询并分页显示uploadFile
	 * @param uploadName
	 * @param fromIndexDatetime
	 * @param toIndexDatetime
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public PageBean4File splitPages4FileByCondition(String uploadName, String fromIndexDatetime, String toIndexDatetime,int pageSize, int currentPage);
	
	/**
	 * 根据id查到uploadFIle
	 * @param id
	 * @return
	 */
	public Uploadfile getUploadFileById(String id);
	
	/**
	 * 根据id集合查询uploadfile
	 * @param idz
	 * @return
	 */
	public List<Uploadfile> findUploadFilesByIds(List<String> idz);
	
	/**
	 * 根据id的集合删除uploadfile
	 * @param idz
	 * @return
	 */
	public int delManyUploadFiles(List<String> idz);
	
	/**
	 * 修改已经登录的用户信息
	 * @param user
	 * @return
	 */
	public int editLoginUserInfo(User user);
	
	/**
	 * 根据username查询user中是否已经存在
	 * @param userName
	 * @return
	 */
	public boolean checkUserName(String username);
	
	
}
