package com.chen.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chen.domain.Dept;
import com.chen.domain.Employee;
import com.chen.domain.Job;
import com.chen.domain.Notice;
import com.chen.domain.PageBean4File;
import com.chen.domain.PageBean4User;
import com.chen.domain.Role;
import com.chen.domain.Uploadfile;
import com.chen.domain.User;

public interface IUserDao {
	public int saveUser(User user);

	public User findUser(@Param("number")String number, @Param("password")String password);

	public int getAllAccounts();

	public int addDepartment(@Param("did")Integer did,@Param("dname")String dname,@Param("dremark") String dremark);

	public int getAllDepartments();

	public List<Dept> findAllDepartments(@Param("did") String did, @Param("dname")String dname);

	public List<Dept> findDepartments();

	public int getAllJob();

	public int addJob(@Param("jid")Integer jid, @Param("jname")String jname, @Param("jremark") String jremark);

	public List<Job> findAllJobs(@Param("jid")String jid, @Param("jname")String jname);

	public Integer getAllRole();

	public int addRole(@Param("rid")Integer rid, @Param("rname")String rname, @Param("rremark")String rremark);

	public List<Role> findAllRoles(@Param("rid")String rid, @Param("rname")String rname);


	public List<Dept> findDepts();

	public List<Job> findJobs();

	public int getAllEmployee();

	public int addEmployee(Employee employee);


	public String getRoleNameByRoleId(@Param("roleId")int roleId);

	public List<User> splitPages4User(@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);

	public List<Role> findRoles();

	public int getAllAccountsByCondition(@Param("number")String number, @Param("username")String username, @Param("phone")String phone, @Param("role_id")String role_id);

	public List<User> splitPages4UserByCondition(@Param("number")String number, @Param("username")String username, @Param("phone")String phone, @Param("role_id")String role_id,
			@Param("currentPage")int currentPage, @Param("pageSize")int pageSize);

	public int delManyUsers(@Param("numbers")List<String> numbers);

	public User returnUserInfo(@Param("number")String number);

	public int editUserInfo(User user);

	public int getAllEmployeesByCondition(@Param("id")String id, @Param("name")String name, @Param("phone")String phone, @Param("deptId")String deptId, @Param("jobId")String jobId);

	public List<Employee> splitPages4EmployeeByCondition(@Param("id")String id, @Param("name")String name, @Param("phone")String phone, @Param("deptId")String deptId,
			@Param("jobId")String jobId, @Param("currentPage")int currentPage, @Param("pageSize")int pageSize);

	public String getDeptNameByDeptId(@Param("dept_id")int dept_id);

	public String getJobNameByJobId(@Param("job_id")int job_id);

	public int delManyEmployees(@Param("idz")List<String> idz);

	public Employee returnEmployeeInfo(@Param("id")String id);

	public int editEmployeeInfo(Employee employee);

	public int getAllFiles();

	public int uploadFile(Uploadfile uploadfile);

	public int addNotice(Notice notice);

	public List<Notice> searchNoticeByCondition(@Param("title")String title, @Param("theme")String theme, @Param("username")String username);

	public Notice findNoticeById(@Param("id")String id);

	public int getAllNotices();
	
	
	public List<Notice> findNoticesByOrder(@Param("fromIndex")int fromIndex, @Param("toIndex")int toIndex);

	public int getAllFilesByCondition(@Param("uploadName")String uploadName, @Param("fromIndexDatetime")String fromIndexDatetime, @Param("toIndexDatetime")String toIndexDatetime);


	public List<Uploadfile> splitPages4FileByCondition(@Param("uploadName")String uploadName, @Param("fromIndexDatetime")String fromIndexDatetime,
			@Param("toIndexDatetime")String toIndexDatetime, @Param("pageSize")int pageSize, @Param("currentPage")int currentPage);

	public Uploadfile getUploadFileById(@Param("id")String id);

	public int delManyUploadFiles(@Param("idz")List<String> idz);

	public List<Uploadfile> findUploadFilesByIds(@Param("idz")List<String> idz);

	public int editLoginUserInfo(User user);

	public int checkUserName(@Param("username")String username);  
}
