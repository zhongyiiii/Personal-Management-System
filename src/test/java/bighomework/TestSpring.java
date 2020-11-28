package bighomework;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.chen.domain.User;
import com.chen.service.IUserService;

public class TestSpring {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		IUserService us = (IUserService) ac.getBean("userService");
		User user = new User();
		user.setUsername("уехЩ");
		us.saveUser(user);
	}

}
