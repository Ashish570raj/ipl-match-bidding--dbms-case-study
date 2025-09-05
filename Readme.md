# Pie-in-the-Sky 🏏  
### IPL Match Bidding App – DBMS Case Study  

![DBMS](https://img.shields.io/badge/Database-DBMS-blue)  
![SQL](https://img.shields.io/badge/Language-SQL-green)  
![MySQL](https://img.shields.io/badge/Database-MySQL-orange)  
![ERD](https://img.shields.io/badge/Model-ER_Diagram-red)  
<!-- ![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blueviolet)   -->

---

## 📌 Project Overview  

**Pie-in-the-Sky** is a database-backed mobile application concept designed for **legal bidding on IPL matches**.  
It allows registered users (bidders) to place bids on IPL matches, track live match updates, predict winners, earn points based on predictions, and view their leaderboard standings.  

The project implements a **Database Management System (DBMS)** to handle user registrations, match scheduling, bidding details, team statistics, and leaderboard rankings.  

---

## 🎯 Objectives  

- Design and implement a **relational database** for IPL match bidding.  
- Enable **bidders** to place, update, or cancel bids dynamically.  
- Track **team standings** and update results automatically.  
- Generate **leaderboards** for top-performing bidders.  
- Provide **SQL query insights** for analytics on matches, players, teams, and bidders.  

---

## ⚙️ Features  

### 👤 Bidder Features  
- Register and log in to the app.  
- View all match schedules (teams, time, venue).  
- Place bids and predict winners before the toss.  
- Change/cancel bids before match start.  
- Earn dynamic points based on bidding system.  
- View personal standings and top 3 leaderboard positions.  
- Track team standings and tournament progress.  

### 🛠️ Admin Features  
- Manage tournaments, teams, and players.  
- Schedule and reschedule matches.  
- Update match results, toss winners, and team standings.  
- Maintain stadium details.  
- Monitor bidder activity and bidding trends.  

---

## 🗄️ Database Design  

The project follows a **normalized relational schema**.  

### Key Tables:  
- `IPL_User` – Stores user (admin/bidder) details.  
- `IPL_Stadium` – Stadium information.  
- `IPL_Team` – Team details.  
- `IPL_Player` – Player details and performance stats.  
- `IPL_Team_Players` – Mapping of players to teams.  
- `IPL_Tournament` – Tournament details.  
- `IPL_Match` – Match details with results.  
- `IPL_Match_Schedule` – Match scheduling.  
- `IPL_Bidder_Details` – Bidders’ profiles.  
- `IPL_Bidding_Details` – Match bids placed by users.  
- `IPL_Bidder_Points` – Points earned by bidders.  
- `IPL_Team_Standings` – Team performance tracking.  

📌 **ER Diagram and Table Structures** are included in the project document.  

---

## 🧮 Point System  

- **Base Rule:** Correct prediction = Points earned, wrong prediction = No points lost.  
- If both teams have **equal points (start of tournament):** +2 points for correct prediction.  
- If **points difference ≤ 6:**  
  - Predict higher team wins → +2 points  
  - Predict lower team wins → +3 points  
- If **points difference > 6:**  
  - Predict higher team wins → +2 points  
  - Predict lower team wins → +5 points  

---

## 📊 SQL Query Insights  

Some example analytical queries implemented:  
- Percentage of wins for each bidder (ranked highest to lowest).  
- Matches conducted at each stadium.  
- Percentage of wins by teams winning the toss.  
- Top 3 and bottom 3 bidders in a bidding season.  
- Bowlers & all-rounders with maximum wickets.  
- Month-wise and year-wise bidder performance.  
- IPL season with maximum duration.  

(Full set of queries is included in the project script).  

---

## 🛠️ Tech Stack  

- **Database:** Oracle / MySQL / PostgreSQL (any RDBMS)  
- **Language:** SQL, PL/SQL  
- **Frontend (conceptual):** Mobile app design idea  
- **Tools Used:** ER diagramming tools, DBMS client  

---

## 🚀 How to Run  

1. Clone this repository:  
   ```bash
   git clone https://github.com/your-username/pie-in-the-sky-ipl.git
   cd pie-in-the-sky-ipl
   ```
---

2. Execute the provided SQL script in your DBMS.

3. Verify table creation using:
 ```bash
SELECT * FROM IPL_User;
SELECT * FROM IPL_Team;
```

4. Run the queries from **queries.sql** to generate insights.

## 🏆 Learning Outcomes

- Hands-on experience in Database Design & Normalization.

- Writing complex SQL queries for real-world insights.

- Understanding of sports analytics use cases.

- Implementation of leaderboard & dynamic point system.