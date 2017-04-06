package com.kseb.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.kseb.model.CustomerUsage;
import com.kseb.model.ElectricityBill;
import com.kseb.util.HibernateUtil;

public class AutoGenerationBill {

	private static AutoGenerationBill autoGenerationBill = null;

	private int count = 0;

	private AutoGenerationBill() {

		new java.lang.Thread(new Runnable() {

			SessionFactory factory = HibernateUtil.getSessionFactory();

			@SuppressWarnings("unchecked")
			@Override
			public void run() {
				while (true) {
					try {
						Session session = factory.openSession();
						Transaction transaction = session.beginTransaction();
						List<CustomerUsage> customerUsagesList = session.createCriteria(CustomerUsage.class).list();
						for (CustomerUsage customerUsage : customerUsagesList) {
							Query query = session.createQuery(
									"FROM ElectricityBill bill WHERE bill.consumerId=:consumerid ORDER BY id DESC");
							query.setString("consumerid", customerUsage.getCousumerId());
							List<ElectricityBill> previousStatus = query.setMaxResults(1).list();
							ElectricityBill newBillDatas = new ElectricityBill();
							for (ElectricityBill bill : previousStatus) {
								System.out.println(bill);
								Double currentUsage, lastBillUsage, newUsage, newBillAmount = 0.0;
								currentUsage = customerUsage.getTotalReading();
								if (bill.getBillGenerationStatus()) {
									
									lastBillUsage = bill.getReadingAtLastBill();
									newUsage = currentUsage - lastBillUsage;
									newBillAmount = 3.12 * newUsage;
									newBillDatas.setConsumerId(customerUsage.getCousumerId());
									newBillDatas.setReadingAtLastBill(currentUsage);
									newBillDatas.setDateTime(LocalDateTime.now());
									newBillDatas.setBillPaymentStatus(bill.getBillPaymentStatus());
									newBillDatas.setBillAmount(newBillAmount);
									newBillDatas.setBillGenerationStatus(false);
									session.save(newBillDatas);
									System.out.println("New Bill "+bill.getBillPaymentStatus());
								} else {
									lastBillUsage = bill.getReadingAtLastBill();
									newUsage = currentUsage - lastBillUsage;
									newBillAmount = newBillAmount + (bill.getBillAmount() + (3.12 * newUsage));
									newBillDatas.setConsumerId(customerUsage.getCousumerId());
									newBillDatas.setReadingAtLastBill(currentUsage);
									newBillDatas.setDateTime(LocalDateTime.now());
									newBillDatas.setBillPaymentStatus(false);
									newBillDatas.setBillAmount(newBillAmount);
									newBillDatas.setBillGenerationStatus(false);
									session.save(newBillDatas);
									System.out.println("Added To Old Bill"+bill.getBillPaymentStatus());
									ElectricityBill bill2 = session.get(ElectricityBill.class, bill.getId());
									bill2.setBillGenerationStatus(true);
									session.save(bill2);
								}
							}

						}
						transaction.commit();
						System.out.println("INSIDE WHILE LOOP - COUNT IS " + count);
						count++;
						try {
							Thread.sleep(50000);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

			}
		}).start();
	}

	public static AutoGenerationBill getInstance() {
		if (autoGenerationBill == null) {
			autoGenerationBill = new AutoGenerationBill();
			return autoGenerationBill;
		} else {
			return null;
		}
	}
}
