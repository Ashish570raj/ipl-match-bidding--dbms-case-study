/* Problem Statement:

The problem statement is to use the SQL queries to find the various insights from the above-given data. 
Also, write your insights based on the results that you will get from the queries that you will be using.

Example:
Let’s say You have written a complex query that showed you the results as 
“The XXX team won 8 matches out of 10 matches in XXX Stadium” and also it showed you that the majority of the teams that won the matches, 
won the toss as well and had chosen the fielding first.

Therefore, Your insight would be: 
The Stadium must be a fielding pitch, which means that it favors the bowling because of various reasons, 
so the chasing team could control the opponent team with their bowling. Hence the teams that had won the toss and chosen the fielding, 
It is more likely to win the matches as well.
*/


-- A few Questions have been provided to solve, Try to frame more questions if required.

-- 1.	Show the percentage of wins of each bidder in the order of highest to lowest percentage.

SELECT T2.BIDDER_NAME,
    -- Calculate the win percentage.
    -- We count the number of 'Won' bids and divide by the total number of bids.
    -- The multiplication by 100.0 ensures a floating-point result for the percentage.
    (COUNT(CASE WHEN T1.BID_STATUS = 'Won' THEN 1 END) * 100.0) / COUNT(T1.BID_STATUS) AS WinPercentage
FROM IPL_BIDDING_DETAILS AS T1
JOIN IPL_BIDDER_DETAILS AS T2 ON T1.BIDDER_ID = T2.BIDDER_ID
GROUP BY T2.BIDDER_NAME
ORDER BY WinPercentage DESC;

-- 2.	Display the number of matches conducted at each stadium with the stadium name and city.

select s.Stadium_name, s.city , count(ms.SCHEDULE_ID) as Number_of_matches 
from ipl_match_schedule as ms
join ipl_stadium as s on ms.STADIUM_ID = s.StadiumId
group by s.Stadium_name, s.city
order by Number_of_matches asc;

-- 3.	In a given stadium, what is the percentage of wins by a team that has won the toss?

select s.Stadium_name, 
(sum(case when m.TOSS_WINNER = m.MATCH_WINNER then 1 else 0 end )*100)/ count(m.MATCH_ID)  as toss_win_percentage
from ipl_match as m
join ipl_match_schedule as ms on m.MATCH_ID=ms.MATCH_ID
join ipl_stadium as s on ms.STADIUM_ID = s.StadiumId
group by s.StadiumId
order by toss_win_percentage desc;

-- 4.	Show the total bids along with the bid team and team name.

select b.Bid_Team, t.TEAM_NAME , count(b.BID_TEAM) as total_bids
from ipl_bidding_details as b
join ipl_team as t on b.BID_TEAM = t.TEAM_ID
group by b.Bid_Team,t.TEAM_NAME
order by total_bids asc;

-- 5. Show the team ID who won the match as per the win details.

select MATCH_WINNER as winningteamid , WIN_DETAILS 
from ipl_match;

-- 6.	Display the total matches played, total matches won and total matches lost by the team along with its team name.
SELECT
    T.TEAM_ID,
    T.TEAM_NAME,
    SUM(TS.MATCHES_PLAYED) AS TotalMatches,
    SUM(TS.MATCHES_WON) AS TotalWins,
    SUM(TS.MATCHES_LOST) AS TotalLosses
FROM IPL_TEAM_STANDINGS AS TS
JOIN IPL_TEAM AS T ON TS.TEAM_ID = T.TEAM_ID
GROUP BY T.TEAM_ID, T.TEAM_NAME
ORDER BY TotalWins DESC;

-- 7.	Display the bowlers for the Mumbai Indians team.

select t.TEAM_NAME ,p.PLAYER_NAME, tp.PLAYER_ROLE 
from ipl_team_players as tp 
join ipl_team as t on t.TEAM_ID=tp.TEAM_ID
join ipl_player as p on p.PLAYER_ID=tp.PLAYER_ID
where t.TEAM_NAME='Mumbai Indians' and tp.PLAYER_ROLE='Bowler';

-- 8.	How many all-rounders are there in each team, Display the teams with more than 4 
--      all-rounders in descending order.

select t.TEAM_NAME , count(tp.PLAYER_ROLE) as total_allrounders
from ipl_team_players as tp 
join ipl_team as t on t.TEAM_ID=tp.TEAM_ID
where total_allrounders >4
order by total_allrounders desc;















