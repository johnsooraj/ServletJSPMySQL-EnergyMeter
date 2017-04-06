package com.kseb.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.kseb.model.ElectricityBill;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class BillPayment implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		LoginCredentials consumerdata = (LoginCredentials) httpServletRequest.getSession().getAttribute("userdetails");
		ElectricityBill electricityBill = (ElectricityBill) session.createCriteria(ElectricityBill.class)
				.add(Restrictions.eq("consumerId", consumerdata.getMeterId())).addOrder(Order.desc("id"))
				.setMaxResults(1).uniqueResult();
		if (electricityBill != null) {
			ElectricityBill bill = session.get(ElectricityBill.class, electricityBill.getId());
			bill.setBillAmount(0.0);
			bill.setBillGenerationStatus(true);
			bill.setBillPaymentStatus(true);
			session.saveOrUpdate(bill);
			transaction.commit();
			System.err.println("bill payed");
			return "bill payed, please reload this page";
		} else {
			return "error - payment";
		}

	}

}
