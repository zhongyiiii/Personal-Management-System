package bighomework;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chen.dao.IUserDao;
import com.chen.domain.User;
import com.chen.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class TestMyBatis {
	
	@Autowired
	private IUserService userService;
	
	@Test
	public void testSave() throws Exception {
	User user = new User();
	user.setNumber("00001");
	user.setUsername("Joe");
	InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
	SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
	SqlSession session= factory.openSession();
	IUserDao userDao = session.getMapper(IUserDao.class);
	userDao.saveUser(user);
	session.commit();
	session.close();
	in.close();
	}
	
	@Test
	public void testSave2() {
		User user = new User();
		user.setNumber("testNumber");
		user.setUsername("test");
		userService.saveUser(user);
	
	}
}
