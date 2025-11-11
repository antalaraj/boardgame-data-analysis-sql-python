# 🎲 Board Game Data Analysis using SQL Server & Python

## 🧠 Overview
This project analyzes data from **2,000 board games** sourced from *BoardGameGeek* using **SQL Server** and **Python (Pandas)**.  
It focuses on **data cleaning, transformation, and exploratory analysis** to uncover insights on **ratings, popularity, playtime, and complexity**.

The project demonstrates a **complete data analytics workflow** — from cleaning raw data in SQL to performing statistical analysis and generating insights using Python.

---

## ⚙️ Tech Stack

| Tool / Technology | Purpose |
|--------------------|----------|
| 🗄️ **SQL Server** | Data cleaning, transformation, and aggregation |
| 🐍 **Python (Pandas)** | Data analysis and trend detection |
| 📓 **Jupyter Notebook** | Interactive data exploration and reporting |
| 📊 **Dataset** | BoardGameGeek dataset (2,000 board games) |

---

## 🧹 Data Cleaning Summary

All data preprocessing was performed in **SQL Server** to ensure a clean, consistent, and reliable dataset.

### Key Steps
- Removed duplicate and invalid records  
- Fixed missing or zero values in `release_year`, `min_playtime`, and `max_playtime`  
- Replaced `NULL` values in `avg_rating` and `complexity` with calculated averages  
- Standardized numeric precision across all numeric fields  
- Replaced missing `description` values with meaningful text  
- Validated logical consistency in playtime and age limits  

✅ **Result:** A high-quality dataset with no missing or inconsistent records — ready for data analysis.

---

## 📊 Project Workflow

1. **Data Cleaning (SQL Server)** – Remove duplicates, fix invalid values, and prepare the dataset  
2. **Database Connection (Python)** – Connect SQL Server to Python using `pyodbc`  
3. **Exploratory Data Analysis (Pandas)** – Compute statistical summaries, correlations, and group-wise patterns  
4. **Insight Generation** – Identify meaningful trends and player behavior patterns

---

## 💡 Key Insights

| # | Insight |
|---|----------|
| 1️⃣ | Modern games (released after 2010) have higher ratings and engagement. |
| 2️⃣ | Games with **medium complexity (3.5–4.0)** achieve the best balance between depth and accessibility. |
| 3️⃣ | Games for **ages 14+** have the highest average rating (~8.3). |
| 4️⃣ | **Playtime of 60–120 minutes** provides the ideal experience and popularity. |
| 5️⃣ | Highly complex games (**>4.0**) attract fewer but more loyal players. |
| 6️⃣ | *Brass: Birmingham*, *Gloomhaven*, and *Terraforming Mars* dominate across most performance metrics. |
| 7️⃣ | Several “hidden gems” (highly rated but low visibility) were discovered. |

---

## 🗓️ Time-Based Trends

- The **average rating and total plays** increased consistently from **2005 to 2021**, reflecting better game design and engagement.  
- The years **2017–2018** marked a high point in board game releases, with several top-rated titles such as *Gloomhaven* and *Terraforming Mars*.  
- Modern board games outperform older ones in both **ratings** and **player activity**.

---

## ⚙️ Complexity & Popularity Insights

- **Medium complexity (2.5–3.5)** games have the **highest fan count and wishlists**, offering the best balance of fun and depth.  
- **High complexity (>4.0)** games are niche but deeply appreciated by dedicated players.  
- A moderate **positive correlation** exists between complexity and rating, showing that strategy-rich games earn higher appreciation.

---

## ⏱️ Playtime Insights

- **Games lasting 60–120 minutes** receive the highest ratings and ownership counts.  
- **Short games (<60 min)** are casual and family-oriented but rate slightly lower.  
- **Very long games (>240 min)** are rated highly but appeal to a smaller audience.

---

## 🧮 Age-Based Insights

- **Ages 14+** → Highest average ratings and complex gameplay  
- **Ages 10–13** → Family-friendly strategy games with moderate ratings  
- **Ages <10** → Simple games with high ownership but lower ratings  

---

## 🌍 Popularity & Engagement

- Games with **page_views > 5 million** are globally recognized hits.  
- Combining `owned + fans + total_plays` gives an **engagement score**, highlighting the most beloved games:
  - 🎯 *Brass: Birmingham* – Balanced across all metrics  
  - 🧩 *Gloomhaven* – Highest fan engagement  
  - 🪐 *Terraforming Mars* – Most wishlisted and accessible  

---

## 🏆 Highlighted Titles

| Game | Distinction |
|------|--------------|
| 🎯 **Brass: Birmingham** | Balanced across all engagement metrics |
| 🧩 **Gloomhaven** | Highest fan base and replay value |
| 🪐 **Terraforming Mars** | Most wishlisted and strategically deep |

---

## 🧩 Skills Demonstrated

- SQL Data Cleaning and Transformation  
- Python (Pandas) for Exploratory Data Analysis (EDA)  
- Data Validation and Quality Assurance  
- Statistical Summary and Grouping Analysis  
- Real-world Database Connectivity (SQL ↔ Python)  
- Analytical Storytelling and Insight Presentation  

---

## 🚀 Future Enhancements

- Build an **interactive dashboard** using Power BI or Streamlit  
- Use **Machine Learning** to predict game ratings or popularity  
- Apply **text analytics (NLP)** to study game descriptions and sentiment  

---

## 👨‍💻 Author

**Raj Antala**  
🎓 PGDM Student in **AI and Data Science**  
🏫 **Adani Institute of Digital Technology Management (AIDTM)**  
📍 Ahmedabad, India  
💡 Passionate about turning data into meaningful insights and building intelligent systems.  
📧 antalaraj214@gmail.com
🔗 [LinkedIn Profile](www.linkedin.com/in/antala-raj)

---

⭐ **If you found this project insightful, please star this repository on GitHub!**
