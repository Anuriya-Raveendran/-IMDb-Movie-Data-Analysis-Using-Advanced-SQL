
# 🎬 Advanced SQL Project – IMDb Movie Database Analysis

**Author:** Anuriya Ravindran  
**Track:** Data Analytics & Data Science (DA-DS)  
**Project:** Advanced SQL Exploration of IMDb Dataset

---

## 📘 Introduction

This project involves deep exploration and querying of a simplified IMDb dataset using **Advanced SQL**. The dataset captures key aspects of movies including genres, actors, directors, ratings, durations, and production companies.

---

## 🎯 Objectives

- Perform complex SQL queries to uncover insights across multiple dimensions
- Use joins, aggregations, filtering, and subqueries to answer real-world questions
- Apply analytical thinking to assess movie industry trends, ratings, and performances

---

## 🗂️ Dataset Structure

The project uses six interrelated tables:

1. `Movie` – ID, title, year, date_published, duration, country, income, languages, production_company  
2. `Genre` – Movie_ID, Genre  
3. `Director Mapping` – Movie_ID, Name_ID  
4. `Role Mapping` – Movie_ID, Name_ID, Category  
5. `Names` – ID, Name, Height, Date_of_Birth, Known_for_Movies  
6. `Ratings` – Movie_ID, Avg_Rating, Total_Votes, Median_Rating

---

## 🔍 Key Analysis Questions (Sample)

- 📅 Total number of movies produced each year/month?
- 🌎 How many movies were made in the USA or India in 2019?
- 🎭 Most frequent genres and those with highest average durations?
- 🎬 Top 10 movies based on average ratings?
- 👩‍🎤 Actors/Actresses in >3 movies with average rating < 5?
- 🇩🇪 Do German movies get more votes than Italian ones?
- 🎥 Who are the top-rated directors and actors?
- 🏢 Which are the top 3 production companies by vote count?
- 🔠 Most common language in movie production?
- 📊 Summarize ratings grouped by median rating?

> 💡 The project includes over **25 advanced SQL queries** designed to explore these questions and more.

---

## 🧠 Insights & Conclusions

1. **Production Trends:**  
   USA and India lead movie production; however, production volume fluctuates annually.

2. **Genre Popularity:**  
   Action and Drama are the most frequently produced genres and among the most highly rated.

3. **Audience Engagement:**  
   Movies rated 8+ attract significantly higher vote counts.

4. **Language Diversity:**  
   English dominates, but regional films (e.g., Malayalam, Korean) show growing international traction.

5. **Talent Impact:**  
   Certain directors and actors consistently deliver high-rated films, making them industry benchmarks.

---

## 🛠️ Tools & Skills Used

- SQL (PostgreSQL / MySQL / SQLite)
- Joins, Aggregations, Window Functions
- Grouping, Filtering, Subqueries
- NULL Handling, CASE statements

---

## 📁 Repository Contents

- `SQL_Queries.sql` – Collection of advanced SQL queries used
- `ER_Diagram.png` – Entity-relationship diagram of the database (if applicable)
- `README.md` – Project documentation
- `Presentation.pptx` – Final report or presentation slides

---

## 🙌 Thank You

This project demonstrates my SQL proficiency as a Data Analyst/Data Science aspirant and reflects my ability to draw insights from relational databases with real-world complexity.

> _“In a world full of data, SQL is the language of stories waiting to be discovered.”_
