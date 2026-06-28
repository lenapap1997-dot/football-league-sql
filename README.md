# football-league-sql
MySQL project analysing a football league dataset

## This is a practice project using a fictional football league dataset,created to demonstrate SQL skills. 

### SQL concepts covered
- SELECT,WHERE,ORDER BY
- JOIN
- GROUP BY ,HAVING
- Aggregated functions : COUNT,SUM
- Filtering with conditions (>,=)

#### Dataset Schema
Teams : teams info ( team id PK, name, city, founded, coach)
Players :  player info (player id PK, name, position, age, nationality, team_id FK)
Macthes : match results (match id PK, home_team id FK, away_team id FK, match date,  stadium , home score, away score )
Goals : goal details ( goal id PK, match id FK, player ID FK, minute, goal type)

#####
