package com.chen.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.chen.domain.CountItems;
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
import com.chen.utils.FormatDatetime;

import cn.dsna.util.images.ValidateCode;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	/**
	 * 生成验证码，并将验证码存在session中
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */

	@RequestMapping("/getValidateCode")
	public void getValidateCode(HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 告诉客户端不使用缓存
		response.setHeader("param", "no-cache");
		response.setHeader("cache-control", "no-cache");
		response.setIntHeader("expires", 0);

		ValidateCode vc = new ValidateCode(110, 25, 4, 9);
		String code = vc.getCode();
		request.getSession().setAttribute("code", code);
		vc.write(response.getOutputStream());
	}

	/**
	 * 登录操作
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param number
	 * @param password
	 * @param validateCode
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(Model model, HttpServletRequest request, HttpServletResponse response, String number,
			String password, String validateCode) throws Exception {
		String realCode = (String) request.getSession().getAttribute("code");
		if (validateCode.toLowerCase().equalsIgnoreCase(realCode)) {
			User user = userService.findUser(number, password);

			if (user != null) {
				int role_id = user.getRole_id();
				String roleName = userService.getRoleNameByRoleId(role_id);

				// 再这一查询用户数、员工数、部门数、职位数、公告数、文件数 以及一个星期内的公告
				request.getSession().setAttribute("roleName", roleName);
				request.getSession().setAttribute("user", user);
				return "redirect:/user/initIndexInfo";
			} else {
				model.addAttribute("numberOrPasswordError", "账号或密码码错误");
				return "redirect:/login.jsp";
			}
		} else {
			model.addAttribute("validateCodeError", "验证码错误");
//			model.addFlashAttribute("validateCodeError", "验证码错误");
			return "redirect:/login.jsp";
		}

	}

	/**
	 * 注销
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}

	/**
	 * 初始化主页
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/initIndexInfo")
	public void initIndexInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 再这一查询用户数、员工数、部门数、职位数、公告数、文件数 以及一个星期内的公告
		int countUsers = userService.getAllAccounts();
		int countEmployees = userService.getAllEmployee();
		int countDepts = userService.getAllDepartments();
		int countJobs = userService.getAllJob();
		int countNotices = userService.getAllNotices();
		int countFiles = userService.getAllFiles();

		int fromIndex = 0;
		int toIndex = 5;
		List<Notice> noticez = userService.findNoticesByOrder(fromIndex, toIndex);
		CountItems countItems = new CountItems();
		countItems.setCountDepts(countDepts);
		countItems.setCountEmployees(countEmployees);
		countItems.setCountFiles(countFiles);
		countItems.setCountJobs(countJobs);
		countItems.setCountNotices(countNotices);
		countItems.setCountUsers(countUsers);
		countItems.setNotices(noticez);

		// request.getSession().setAttribute("countItems", countItems);
		request.setAttribute("countItems", countItems);
		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}
	
	@RequestMapping("/checkUserName")
	public void checkUserName(HttpServletRequest request, HttpServletResponse response, String username) throws IOException {
		boolean b = userService.checkUserName(username);
		 if (b){
	            response.getWriter().write("ok");
	        }else {
	            response.getWriter().write("no");
	        }
	}

	/**
	 * 注册
	 * 
	 * @param model
	 * @param request
	 * @param validateCode
	 * @param user
	 * @return
	 */

	@RequestMapping("/register")
	public String register(Model model, HttpServletRequest request, String validateCode, User user) {
		String realCode = (String) request.getSession().getAttribute("code");
		if (validateCode.toLowerCase().equalsIgnoreCase(realCode)) {
			int count = userService.getAllAccounts() + 1; // 查询数据表中的总记录数并加一，然后下面的代码时字符串拼接
			String number = "";
			if (count < 10) { // 使数据表的number字段是U00001格式的字符串
				number = "0000" + count;
			}
			if (count < 100 && count >= 10) {
				number = "000" + count;
			}
			if (count < 1000 && count >= 100) {
				number = "00" + count;
			}
			if (count < 10000 && count >= 1000) {
				number = "0" + count;
			}
			user.setNumber("U" + number);
			user.setRole_id(2);
			user.setCreatedate(new Date());
			int flag = userService.saveUser(user);
			if (flag == 1) {
				return "redirect:/pages/register_success.jsp";
			} else {
				model.addAttribute("registerError", "服务器繁忙");
				return "redirect:/register.jsp";
			}
		} else {
			model.addAttribute("validateCodeError", "验证码错误");
//			model.addFlashAttribute("validateCodeError", "验证码错误");
			return "redirect:/login.jsp";
		}

	}

	/**
	 * 添加部门
	 * 
	 * @param response
	 * @param dname
	 * @param dremark
	 * @throws IOException
	 */

	@RequestMapping("/addDepartment")
	public void addDepartment(HttpServletResponse response, String dname, String dremark) throws IOException {
		Integer did = userService.getAllDepartments() + 1; // 查询数据表中的总记录数并加一，然后下面的代码时字符串拼接
		int flag = userService.addDepartment(did, dname, dremark);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script> alert('添加部门成功'); </script>");
		} else {
			out.write("<script> alert('服务器繁忙'); </script>");
		}
		out.close();
	}

	/**
	 * 按条件查询dept
	 * 
	 * @param request
	 * @param response
	 * @param did
	 * @param dname
	 */
	@RequestMapping("/findAllDepartments")
	public void findAllDepartments(HttpServletRequest request, HttpServletResponse response, String did, String dname) {

		try {
			List<Dept> depts = userService.findAllDepartments(did, dname);
			request.setAttribute("departments", depts);
			request.getRequestDispatcher("/tabs/tabs_searchdepartments.jsp").forward(request, response);
			// response.sendRedirect(request.getContextPath()+"/tabs/tabs_searchdepartments.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加部门
	 * 
	 * @param response
	 * @param jname
	 * @param jremark
	 * @throws IOException
	 */
	@RequestMapping("/addPosition")
	public void addPosition(HttpServletResponse response, String jname, String jremark) throws IOException {
		Integer jid = userService.getAllJob() + 1; // 查询数据表中的总记录数并加一，然后下面的代码时字符串拼接
		int flag = userService.addJob(jid, jname, jremark);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script> alert('添加职位成功'); </script>");
		} else {
			out.write("<script> alert('服务器繁忙'); </script>");
		}
		out.close();
	}

	/**
	 * 按条件查询job
	 * 
	 * @param request
	 * @param response
	 * @param jid
	 * @param jname
	 */
	@RequestMapping("/findAllJobs")
	public void findAllJobs(HttpServletRequest request, HttpServletResponse response, String jid, String jname) {

		try {
			List<Job> jobs = userService.findAllJobs(jid, jname);
			request.setAttribute("jobs", jobs);
			request.getRequestDispatcher("/tabs/tabs_searchposition.jsp").forward(request, response);
			// response.sendRedirect(request.getContextPath()+"/tabs/tabs_searchdepartments.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加role
	 * 
	 * @param response
	 * @param rname
	 * @param rremark
	 * @throws IOException
	 */
	@RequestMapping("/addRole")
	public void addRole(HttpServletResponse response, String rname, String rremark) throws IOException {
		Integer rid = userService.getAllRole(); // 查询数据表中的总记录数并加一，然后下面的代码时字符串拼接
		int flag = userService.addRole(rid, rname, rremark);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script> alert('添加角色成功'); </script>");
		} else {
			out.write("<script> alert('服务器繁忙'); </script>");
		}
		out.close();
	}

	/**
	 * 按条件查询role
	 * 
	 * @param request
	 * @param response
	 * @param rid
	 * @param rname
	 */
	@RequestMapping("/findAllRoles")
	public void findAllRoles(HttpServletRequest request, HttpServletResponse response, String rid, String rname) {

		try {
			List<Role> roles = userService.findAllRoles(rid, rname);
			request.setAttribute("roles", roles);
			request.getRequestDispatcher("/tabs/tabs_searchrole.jsp").forward(request, response);
			// response.sendRedirect(request.getContextPath()+"/tabs/tabs_searchdepartments.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/returnRoleList")
	public void returnRoleList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Role> roles = userService.findRoles();
			request.setAttribute("roles", roles);
			request.getRequestDispatcher("/tabs/tabs_adduser.jsp").forward(request, response);
			// response.sendRedirect(request.getContextPath()+"/tabs/tabs_searchdepartments.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 添加用户
	 * 
	 * @param user
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addUser")
	public void addUser(User user, HttpServletResponse response) throws IOException {
		user.setCreatedate(new Date());
//		System.out.println(user);
		if (user.getRole_id() == null) {
			user.setRole_id(2);
		}
		int flag = userService.saveUser(user);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('添加用户成功');window.history.back(-1); </script>");
		} else {
			out.write("<script> alert('服务器繁忙'); </script>");
		}
		out.close();

	}

	/**
	 * 得到job和dept，转发到页面，使下拉框的内容能动态的变化
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getDeptAndJob")
	public void getDeptAndJob(HttpServletRequest request, HttpServletResponse response) {
		List<Dept> depts = userService.findDepts();
		List<Job> jobs = userService.findJobs();
		try {
			request.setAttribute("depts", depts);
			request.setAttribute("jobs", jobs);
			request.getRequestDispatcher("/tabs/tabs_addemployee.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 添加员工
	 * 
	 * @param response
	 * @param employee
	 * @throws IOException
	 */
	@RequestMapping("/addEmployee")
	public void addEmployee(HttpServletResponse response, Employee employee) throws IOException {
		Integer id = userService.getAllEmployee() + 1;
		employee.setId(id);
		employee.setCreate_date(new Date());
		int flag = userService.addEmployee(employee);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('添加员工成功');window.history.back(-1); </script>");
		} else {
			out.write("<script> alert('服务器繁忙'); </script>");
		}
		out.close();
	}

	/**
	 * 按页面要求的pageSize（一页显示多少条数据）来分页显示
	 * 
	 * @param pSize
	 * @param currPage
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	/**
	 * 在分页的情况下，按条件查询user，并分页展示
	 * 
	 * @param response
	 * @param request
	 * @param pSize
	 * @param currPage
	 * @param number
	 * @param username
	 * @param phone
	 * @param role_id
	 * @throws Exception
	 */

	@RequestMapping("/searchUserByCondition")
	public void searchUserByCondition(HttpServletResponse response, HttpServletRequest request, String pSize,
			String currPage, String number, String username, String phone, String role_id) throws Exception {
//		System.out.println("pSize="+pSize+".."+"currPage="+currPage+".."+"number="+number+".."+"username="+username+".."+"phone="+phone+".."+"role_id="+role_id);
//		int pageSize = Integer.parseInt(pSize);
//		int currentPage = Integer.parseInt(currPage);
		int pageSize = 5;
		int currentPage = 1;
		if (pSize != null) {
			pageSize = Integer.parseInt(pSize);
		}
		if (currPage != null) {
			currentPage = Integer.parseInt(currPage);
		}

		PageBean4User pbUser = userService.splitPages4UserByCondition(number, username, phone, role_id, currentPage,
				pageSize);
		List<User> users = pbUser.getUser();
		List<User> u = new ArrayList<User>();
		for (User user : users) {
			int roleId = user.getRole_id(); // 得到每一个user的role_id
			user.setRname(userService.getRoleNameByRoleId(roleId)); // 根据每一个user的role_id得到rname
			u.add(user); // 把新的user存入List<User> u中
		}
		pbUser.setUser(u);
		List<Role> roles = userService.findRoles();

		User user4search = new User();
		user4search.setNumber(number);
		user4search.setUsername(username);
		user4search.setPhone(phone);
		if (role_id == null || role_id == "") {
			role_id = null;
		}
		user4search.setRole_id(role_id == null ? null : Integer.parseInt(role_id));
		request.setAttribute("user4search", user4search);
		request.setAttribute("pbUser", pbUser);
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("/tabs/tabs_searchusers.jsp").forward(request, response);

	}

	/**
	 * 根据批量删除user
	 * 
	 * @param ids
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/delManyUsers")
	public void delManyUsers(String[] ids, HttpServletResponse response) throws Exception {
		List<String> numbers = new ArrayList<String>();
		for (String id : ids) {
			numbers.add(id);
		}
		int deletedCounts = userService.delManyUsers(numbers);
		PrintWriter out = response.getWriter();
		if (deletedCounts == numbers.size()) {
			out.write("<script>alert('删除用户成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1); </script>");
		}
		out.close();
	}

	/**
	 * 回显user数据
	 * 
	 * @param ids
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/returnUserInfo")
	public void editUser(String[] ids, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = ids[0];
		User user = userService.returnUserInfo(number);
		List<Role> roles = userService.findRoles();
		request.setAttribute("editUserInfo", user);
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("/tabs/userinfo.jsp").forward(request, response);

	}

	/**
	 * 修改user的信息
	 * 
	 * @param user
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/editUserInfo")
	public void editUserInfo(User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int flag = userService.editUserInfo(user);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('修改用户信息成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1);</script>");
		}
		out.close();
	}

	/**
	 * 按条件查询employee，条件可以为空，并分页显示
	 * 
	 * @param response
	 * @param request
	 * @param pSize
	 * @param currPage
	 * @param id
	 * @param name
	 * @param phone
	 * @param deptId
	 * @param jobId
	 * @throws Exception
	 */

	@RequestMapping("/searchEmployeeByCondition")
	public void searchEmployeeByCondition(HttpServletResponse response, HttpServletRequest request, String pSize,
			String currPage, String id, String name, String phone, String deptId, String jobId) throws Exception {

		int pageSize = 5;
		int currentPage = 1;
		if (pSize != null) {
			pageSize = Integer.parseInt(pSize);
		}
		if (currPage != null) {
			currentPage = Integer.parseInt(currPage);
		}

		PageBean4Employee pbEmployee = userService.splitPages4EmployeeByCondition(id, name, phone, deptId, jobId,
				currentPage, pageSize);
//		PageBean4User pbUser = userService.splitPages4UserByCondition(number, username, phone, role_id, currentPage, pageSize);
		List<Employee> employees = pbEmployee.getEmployee();
		List<Employee> e = new ArrayList<Employee>();
		for (Employee employee : employees) {								//遍历每一个冲数据库查询到的employee记录
			int dept_id = employee.getDept_id();							//取出每条记录队形的dept_id
			int job_id = employee.getJob_id();								//取出每条记录队形的job_id
			employee.setDeptName(userService.getDeptNameByDeptId(dept_id));	//根据id值查询到队形的名字
			employee.setJobName(userService.getJobNameByJobId(job_id));
			e.add(employee);
		}

		pbEmployee.setEmployee(e);
		List<Dept> depts = userService.findDepts();
		List<Job> jobs = userService.findJobs();

		Employee emp4search = new Employee();
		if (id == null || id == "") {
			id = null;
		}

		if (deptId == null || deptId == "") {
			deptId = null;
		}

		if (jobId == null || jobId == "") {
			jobId = null;
		}
		emp4search.setId(id == null ? null : Integer.parseInt(id));
		emp4search.setName(name);
		emp4search.setPhone(phone);
		emp4search.setDept_id(deptId == null ? null : Integer.parseInt(deptId));
		emp4search.setJob_id(jobId == null ? null : Integer.parseInt(jobId));

		request.setAttribute("pbEmployee", pbEmployee);
		request.setAttribute("depts", depts);
		request.setAttribute("jobs", jobs);
		request.setAttribute("emp4search", emp4search);
		request.getRequestDispatcher("/tabs/tabs_searchemployee.jsp").forward(request, response);

	}

	/**
	 * 根据id批量删除employee
	 * 
	 * @param ids
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/delManyEmployees")
	public void delManyEmployees(String[] ids, HttpServletResponse response) throws Exception {
		List<String> idz = new ArrayList<String>();
		for (String id : ids) {
			idz.add(id);
		}
		int deletedCounts = userService.delManyEmployees(idz);
		PrintWriter out = response.getWriter();
		if (deletedCounts == idz.size()) {
			out.write("<script>alert('删除员工成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1); </script>");
		}
		out.close();
	}

	/**
	 * 回显employee的数据
	 * 
	 * @param ids
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/returnEmployeeInfo")
	public void returnEmployeeInfo(String[] ids, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = ids[0];
		Employee employee = userService.returnEmployeeInfo(id);
		List<Dept> depts = userService.findDepts();
		List<Job> jobs = userService.findJobs();
		request.setAttribute("depts", depts);
		request.setAttribute("jobs", jobs);
		request.setAttribute("editEmployeeInfo", employee);
		request.getRequestDispatcher("/tabs/tabs_editEmployeeInfo.jsp").forward(request, response);

	}

	/**
	 * 修改employee信息
	 * 
	 * @param employee
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/editEmployee")
	public void editUserInfo(Employee employee, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		int flag = userService.editEmployeeInfo(employee);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('修改员工信息成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1);</script>");
		}
		out.close();
	}

	/**
	 * 上传文件
	 * 
	 * @param request
	 * @param response
	 * @param upload
	 * @param uploadfile
	 * @param number
	 * @throws Exception
	 */
	@RequestMapping("/uploadFile")
	public void uploadFile(HttpServletRequest request, HttpServletResponse response, MultipartFile upload,
			Uploadfile uploadfile, String number) throws Exception {
		String realpath = request.getSession().getServletContext().getRealPath("/"); // 得到项目的根目录
		String path = realpath.substring(0, realpath.lastIndexOf("\\"));
		path = path.substring(0, path.lastIndexOf("\\")); /* D:\\apache-tomcat-7.0.52\\webapps */
		String projectName = request.getContextPath().substring(1, request.getContextPath().length()); // 得到项目名:bighomework
		String needPath = path + File.separator + projectName
				+ "_upload"; /* D:\\apache-tomcat-7.0.52\\webapps\\bighomework_upload */

		File file = new File(needPath); // 没有这个文件夹，就创建一个
		if (!file.exists()) {
			file.mkdirs();
		}

		String childDirectory = number; // 得到上传人的number作为子文件夹
		String finallyPath = needPath + File.separator + childDirectory; // 拼接文件夹，得到D:\\apache-tomcat-7.0.52\\webapps\\bighomework_upload\\number

		File file2 = new File(finallyPath);
		if (!file2.exists()) {
			file2.mkdirs();
		}

		String fileName = upload.getOriginalFilename(); // 得到上传的文件名
		uploadfile.setFileName(fileName); // 把文件名放入uploadfile对象中

		fileName = UUID.randomUUID().toString().replace("-", "") + "_" + fileName;
		// fileName = fileName + "_"+UUID.randomUUID().toString().replace("-","");
		// //把文件名改成 文件名+"_"+UUID
		upload.transferTo(new File(finallyPath, fileName)); // 将文件上传到finallyName中

		// int count = userService.getAllFiles() + 1; // 查询数据表中的总记录数并加一，然后下面的代码时字符串拼接
		String id = "f" + FormatDatetime.datetimeUtils(new Date());

//		if (count < 10) { // 使数据表的number字段是U00001格式的字符串
//			id = "f0000" + count;
//		}
//		if (count < 100 && count >= 10) {
//			id = "f000" + count;
//		}
//		if (count < 1000 && count >= 100) {
//			id = "f00" + count;
//		}
//		if (count < 10000 && count >= 1000) {
//			id = "f0" + count;
//		}
//		if (count > 10000) {
//			id = "f" + count;
//		}	

		uploadfile.setId(id);
		uploadfile.setSavePath(finallyPath + File.separator + fileName);
		uploadfile.setUploadDate(new Date());

		int flag = userService.uploadFile(uploadfile);
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('上传文件成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1);</script>");
		}
	}

	/**
	 * 添加notice
	 * 
	 * @param notice
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addNotice")
	public void addNotice(Notice notice, HttpServletResponse response) throws IOException {
		String id = FormatDatetime.datetimeUtils(new Date());
		notice.setId(id);
		notice.setCreate_time(new Date());
		int flag = userService.addNotice(notice);

		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.write("<script>alert('添加公告成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1);</script>");
		}
	}

	/**
	 * 按条件查询notice
	 * 
	 * @param request
	 * @param response
	 * @param title
	 * @param theme
	 * @param username
	 * @throws Exception
	 */
	@RequestMapping("/searchNoticeByCondition")
	public void searchNoticeByCondition(HttpServletRequest request, HttpServletResponse response, String title,
			String theme, String username) throws Exception {
		List<Notice> notices = userService.searchNoticeByCondition(title, theme, username);
		request.setAttribute("notices", notices);
		request.getRequestDispatcher("/tabs/tabs_searchnotice.jsp").forward(request, response);
	}

	/**
	 * 显示notice
	 * 
	 * @param id
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/displayNotice")
	public void displayNotice(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Notice notice = userService.findNoticeById(id);
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("/tabs/tabs_displaynotice.jsp").forward(request, response);
	}

	/**
	 * 按条件查询uploadfile,并分页显示
	 * 
	 * @param request
	 * @param response
	 * @param pSize
	 * @param currPage
	 * @param uploadName
	 * @param fromIndexDatetime
	 * @param toIndexDatetime
	 * @throws Exception
	 */
	@RequestMapping("/searchFileByCondition")
	public void searchFileByCondition(HttpServletRequest request, HttpServletResponse response, String pSize,
			String currPage, String uploadName, String fromIndexDatetime, String toIndexDatetime) throws Exception {
		if (uploadName == "") {
			uploadName = null;
		}
		if (fromIndexDatetime == "") {
			fromIndexDatetime = null;
		}
		if (toIndexDatetime == "") {
			toIndexDatetime = null;
		}
		if (fromIndexDatetime != null) {

			fromIndexDatetime = FormatDatetime.formatDatetimeLocal(fromIndexDatetime);
		}
		if (toIndexDatetime != null) {
			toIndexDatetime = FormatDatetime.formatDatetimeLocal(toIndexDatetime);
		}
		if (fromIndexDatetime != null && (toIndexDatetime == null || toIndexDatetime == "")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			toIndexDatetime = sdf.format(new Date());
		}

		int pageSize = 5;
		int currentPage = 1;
		if (pSize != null) {
			pageSize = Integer.parseInt(pSize);
		}
		if (currPage != null) {
			currentPage = Integer.parseInt(currPage);
		}

		PageBean4File pbFile = userService.splitPages4FileByCondition(uploadName, fromIndexDatetime, toIndexDatetime,
				pageSize, currentPage);
		if (fromIndexDatetime != "" && fromIndexDatetime != null) {
			pbFile.setFromIndexDatetime(FormatDatetime.reverseFormatDatetimeLocal(fromIndexDatetime));
		}
		if (toIndexDatetime != "" && toIndexDatetime != null) {
			pbFile.setToIndexDatetime(FormatDatetime.reverseFormatDatetimeLocal(toIndexDatetime));
		}

		request.setAttribute("pbFile", pbFile);
		request.getRequestDispatcher("/tabs/tabs_downloadfile.jsp").forward(request, response);

	}
	
	/**
	 * 根据文件的路径下载文件
	 * @param ids
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/downloadFile")
	public ResponseEntity<byte[]> downloadFile(String[] ids, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id = ids[0];
		Uploadfile uploadFile = userService.getUploadFileById(id);

		String path = uploadFile.getSavePath();
		File file = new File(path);
		HttpHeaders headers = new HttpHeaders();
		String fileName = new String(uploadFile.getFileName().getBytes("UTF-8"), "iso-8859-1");// 为了解决中文名称乱码问题
		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);


	}
	
	/**
	 * 批量删除uploadfile
	 * @param ids
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/delManyUploadFiles")
	public void delManyUploadFiles(String[] ids, HttpServletResponse response) throws Exception {
		List<String> idz = new ArrayList<String>();
		for (String id : ids) {
			idz.add(id);
		}
		List<Uploadfile> uploadfiles = userService.findUploadFilesByIds(idz);		//根据id的集合查询uploadfile
		List<String> paths = new ArrayList<String>();			//将路径存取List中
		for (Uploadfile uploadfile : uploadfiles) {
			paths.add(uploadfile.getSavePath());
		}
		
		for (String path : paths) {				//根据file的路径删除文件
			File file = new File(path);
			if (file.exists()) {
				file.delete();					//删除文件
			}
		}
		int deletedCounts = userService.delManyUploadFiles(idz);
		PrintWriter out = response.getWriter();
		if (deletedCounts == idz.size()) {				//返回的值相等时，数据库的删除炒作成功
			out.write("<script>alert('删除成功');window.history.back(-1);</script>");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1); </script>");
		}
		out.close();
	}
	
	@RequestMapping("/editLoginUserInfo")
	public void editLoginUserInfo(User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
		int flag = userService.editLoginUserInfo(user);
		PrintWriter out = response.getWriter();
		if (flag == 1) {				//返回的值相等时，数据库的删除炒作成功
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		} else {
			out.write("<script> alert('服务器繁忙');window.history.back(-1); </script>");
		}
		out.close();
	}
}
