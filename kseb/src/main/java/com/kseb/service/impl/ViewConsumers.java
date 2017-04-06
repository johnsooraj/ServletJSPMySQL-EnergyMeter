package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class ViewConsumers implements BillGeneratorService {

	@SuppressWarnings("unchecked")
	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Query query = session.createQuery("FROM LoginCredentials log WHERE log.loginType =:consumer");
		query.setParameter("consumer", "consumer");
		List<LoginCredentials> customerData = query.list();

		httpServletRequest.getSession().setAttribute("userdatas", customerData);
		for (LoginCredentials credentials : customerData) {
			System.out.println(credentials.getCustomerData().getFullName());
		}

		return "viewconsumers.jsp";
	}

}
