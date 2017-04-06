package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.kseb.model.BulbControlModel;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class GetBulbStatus implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		BulbControlModel bulbControlModel = (BulbControlModel) session.createCriteria(BulbControlModel.class)
				.uniqueResult();
		
		transaction.commit();

		return bulbControlModel.getStatus();
	}

}
