# Blood-Bank-Management-System
The Blood Bank Management and Analytics System Using SQL is a structured database project designed to efficiently manage and analyze critical blood bank operations. Built using MySQL, the system handles donor records, blood donation tracking, request handling, and blood stock monitoring.

# 🩸 Blood Bank Management System

This project is a **SQL-based Blood Bank Management System** designed to manage and analyze blood donor records, donations, blood requests, and stock levels. It helps blood banks operate efficiently by providing structured data storage and insightful queries for data analysis.

---

## 📌 Features

- Store and manage donor information
- Track blood donations and their volumes
- Manage blood requests with statuses (Pending / Fulfilled)
- Monitor blood stock availability and safe levels
- Generate reports using advanced SQL queries

---

## 🛠️ Technologies Used

- **Database**: MySQL
- **Language**: SQL
- **Tools**: MySQL Workbench / phpMyAdmin / XAMPP (Optional)

---

## 🗃️ Database Schema

The system includes the following tables:

1. **donors** – Stores personal and blood group details of donors  
2. **donations** – Tracks donation volume and dates linked to donors  
3. **requests** – Blood request details, units, and status  
4. **stock** – Monitors blood stock availability and thresholds  

> ✅ All tables are normalized and linked using foreign keys for data consistency.

---

## 📊 Key SQL Queries

- Donors by blood group
- Recent donations (last 6 months)
- Blood group with highest demand
- Total volume donated by each donor
- Donors who have never donated
- Requests pending or fulfilled
- Blood stock below safe level
- Average gap between donor's donations

---

## 📈 Sample Insight

- Find donors who haven't donated in the last 6 months
- Check which blood group has the most requests
- Identify top donors by volume
- Monitor low stock alerts with a custom threshold

---

## 🧠 Future Scope

- Integration with a web-based dashboard (Django, React)
- Automated alerts to donors and admins
- Eligibility check for donations
- Visualization of reports using charts

---

## 🧾 Author

**Deena Ma**  
B.Tech in Artificial Intelligence  
Python Developer | Data Analyst | Full Stack Developer

---

## 📌 License

This project is open-source and available under the [MIT License](LICENSE).

