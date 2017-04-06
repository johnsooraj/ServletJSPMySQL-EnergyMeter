package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.jboss.logging.Logger;

import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class LoginUser implements BillGeneratorService {

	private static final Logger logger = Logger.getLogger(LoginUser.class);

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		String username = httpServletRequest.getParameter("username");
		String password = httpServletRequest.getParameter("password");

		if (username.equals("admin") && password.equals("admin")) {
			return "adminhome.jsp";
		}

		logger.info("USERNAME-" + username);
		logger.info("PASSWORD-" + password);

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		LoginCredentials credentials = (LoginCredentials) session.createCriteria(LoginCredentials.class)
				.add(Restrictions.eqOrIsNull("username", username)).add(Restrictions.eq("password", password))
				.uniqueResult();

		httpServletRequest.getSession().setAttribute("userdata", credentials);

		if (credentials == null) {
			httpServletRequest.getSession().setAttribute("errorMessage", "invalid user");
			return "index.jsp";
		}
		if (credentials.getLoginType().equals("consumer")) {
			System.out.println("LOGGED IN AS USER");
			httpServletRequest.getSession().setAttribute("userdetails", credentials);
			return "userhome.jsp";
		}
		return "index.jsp";

	}

}
