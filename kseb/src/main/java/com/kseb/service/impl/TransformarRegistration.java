package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.jboss.logging.Logger;

import com.kseb.model.ElectricityData;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class TransformarRegistration implements BillGeneratorService {

	private static final Logger logger = Logger.getLogger(LoginUser.class);

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		sessionFactory.openSession();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		ElectricityData data = new ElectricityData();
		data.setTransformerNumber(httpServletRequest.getParameter("transformarnumber"));
		data.setTrasformerSection(httpServletRequest.getParameter("transformarsection"));

		session.save(data);
		transaction.commit();

		logger.info(data);

		return "addtransformer.jsp";
	}

}
