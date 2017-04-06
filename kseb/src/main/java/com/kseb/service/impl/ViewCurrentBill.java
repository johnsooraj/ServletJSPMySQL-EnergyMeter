package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.kseb.model.ElectricityBill;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class ViewCurrentBill implements BillGeneratorService {

	@SuppressWarnings("unchecked")
	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		LoginCredentials credentials = (LoginCredentials) httpServletRequest.getSession().getAttribute("userdetails");
		Query query = session.createQuery("FROM ElectricityBill bill WHERE bill.consumerId =:consumerId");
		query.setString("consumerId", credentials.getMeterId());
		List<ElectricityBill> billsList = query.list();
		System.out.println("bill data of " + credentials.getMeterId());
		httpServletRequest.getSession().setAttribute("billDetails", billsList.get(billsList.size() - 1));
		return "viewcurrentbill.jsp";
	}

}
