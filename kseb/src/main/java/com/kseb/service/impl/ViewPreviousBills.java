package com.kseb.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.kseb.model.ElectricityBill;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class ViewPreviousBills implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		try {
			LoginCredentials credentials = (LoginCredentials) httpServletRequest.getSession()
					.getAttribute("userdetails");
			System.out.println(credentials);
			@SuppressWarnings("unchecked")
			List<ElectricityBill> bills = session.createCriteria(ElectricityBill.class)
					.add(Restrictions.eq("consumerId", credentials.getMeterId())).addOrder(Order.desc("id"))
					.setMaxResults(20).list();
			System.out.println(bills);
			httpServletRequest.getSession().setAttribute("previousbill", bills);
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return "viewpreviousbills.jsp";
	}

}
