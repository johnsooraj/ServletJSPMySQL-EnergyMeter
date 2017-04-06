package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.kseb.model.BulbControlModel;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class BulbControl implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		String status = httpServletRequest.getParameter("status");

		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		@SuppressWarnings("unchecked")
		List<BulbControlModel> bulbControlModelList = session.createCriteria(BulbControlModel.class).list();
		if (bulbControlModelList.isEmpty()) {
			BulbControlModel bulbControlModel = new BulbControlModel();
			bulbControlModel.setStatus(status);
			session.save(bulbControlModel);
		} else {
			BulbControlModel bulbControlModel = session.get(BulbControlModel.class,
					bulbControlModelList.get(0).getId());
			bulbControlModel.setStatus(status);
			session.saveOrUpdate(bulbControlModel);
		}
		transaction.commit();

		return "status saved";
	}

}
