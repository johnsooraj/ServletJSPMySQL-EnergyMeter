package com.kseb.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.kseb.model.CustomerUsage;
import com.kseb.model.ElectricityBill;
import com.kseb.model.LoginCredentials;
import com.kseb.service.BillGeneratorService;
import com.kseb.util.HibernateUtil;

public class ContinuesMeterReading implements BillGeneratorService {

	@Override
	public String excute(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {

		// http://localhosts:8080/kseb/BillController?hidden=meterreading&meterid=METER1&meterreading=4&voltage=230

		String hidden = httpServletRequest.getParameter("hidden");
		String receivedConsumerId = httpServletRequest.getParameter("meterid");
		String receivedmeterreading = httpServletRequest.getParameter("meterreading");
		String voltage = httpServletRequest.getParameter("voltage");
		System.err.println(receivedConsumerId + " : Receving reading..... : " + receivedmeterreading);

		httpServletRequest.getSession().setAttribute("voltageValue", voltage);

		if (hidden.equals("") | receivedConsumerId.equals("") | receivedmeterreading.equals("")) {
			return "error in readings";
		} else {
			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			LoginCredentials credentials = (LoginCredentials) session.createCriteria(LoginCredentials.class)
					.add(Restrictions.eq("meterId", receivedConsumerId)).uniqueResult();

			if (credentials != null) {
				CustomerUsage customerUsage2 = (CustomerUsage) session.createCriteria(CustomerUsage.class)
						.add(Restrictions.eq("cousumerId", receivedConsumerId)).uniqueResult();
				if (customerUsage2 != null) {
					Double newReading = customerUsage2.getTotalReading() + Double.parseDouble(receivedmeterreading);
					CustomerUsage customerUsage = session.get(CustomerUsage.class, customerUsage2.getId());
					customerUsage.setCurrentReading(Double.parseDouble(receivedmeterreading));
					customerUsage.setTotalReading(Math.abs(newReading));
					customerUsage.setDateTime(LocalDateTime.now());
					session.update(customerUsage);
					transaction.commit();

					@SuppressWarnings("unchecked")
					List<ElectricityBill> billList = (List<ElectricityBill>) session
							.createCriteria(ElectricityBill.class)
							.add(Restrictions.eq("consumerId", credentials.getMeterId())).addOrder(Order.desc("id"))
							.setMaxResults(1).list();
					ElectricityBill bill = billList.get(0);
					System.out.println(bill);

					if (bill != null) {
						System.err.println(bill.getBillPaymentStatus() == true ? "Bill Payed .." : "Bill Not Payed ..");
						if (bill.getBillPaymentStatus()) {
							return "$c";
						} else {
							return "$d";
						}
					} else {
						return "$c";
					}
				} else {

					ElectricityBill bill = new ElectricityBill();
					bill.setConsumerId(receivedConsumerId);
					bill.setDateTime(LocalDateTime.now());
					bill.setBillAmount(3.12 * Double.parseDouble(receivedmeterreading));
					bill.setBillPaymentStatus(false);
					bill.setBillGenerationStatus(false);
					bill.setReadingAtLastBill(Double.parseDouble(receivedmeterreading));
					CustomerUsage customerUsage = new CustomerUsage();
					customerUsage.setCousumerId(receivedConsumerId);
					customerUsage.setCurrentReading(Double.parseDouble(receivedmeterreading));
					customerUsage.setTotalReading(Double.parseDouble(receivedmeterreading));
					customerUsage.setDateTime(LocalDateTime.now());
					session.save(customerUsage);
					session.save(bill);
					transaction.commit();
					return "$c";
				}
			} else {
				return "the consumer id is invalid";
			}
		}
	}
}