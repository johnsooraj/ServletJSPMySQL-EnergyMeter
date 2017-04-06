package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.kseb.model.CustomerData;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class UserExistenceChecker implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();

		String hql = "FROM CustomerData log WHERE log.fullName LIKE ?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "%" + httpServletRequest.getParameter("fullname") + "%");
		@SuppressWarnings("unchecked")
		List<CustomerData> userValidation = query.list();
		System.out.println(userValidation);
		for (CustomerData customerData : userValidation) {
			System.out.println("username is --" + customerData.getFullName());
		}

		System.out.println("VALIDATION of FULL NAME" + !userValidation.isEmpty());

		if (userValidation.isEmpty()) {
			System.out.println("No Existing User Found");
			return "Enter the full name";
		} else {
			return "user existing";
		}
	}
}
