use ipl_dataset;
select*
from  batting_summary

'Question.1...List all matches played in the year 2021****'
SELECT*
FROM match_summary 
WHERE year = 2021;

"Question.2 Find the details of matches where "CSK" was one of the teams."
SELECT * 
FROM match_summary
 WHERE team1 = 'CSK' OR team2 = 'CSK';
 
 "Question.3 Retrieve all batsmen who scored more than 50 runs in a match."

SELECT * FROM batting_summary WHERE runs > 50;

"Question.4 Find all players from the "CSK" team in the players dataset."

SELECT * FROM players WHERE team = 'CSK';

"Question.5 Get the names and roles of all players who are bowlers."

SELECT name, playingRole FROM players WHERE playingRole LIKE '%Bowler%';

"Question.6 Find the total runs scored by each team across all matches."

SELECT teamInnings, SUM(runs) AS total_runs FROM batting_summary GROUP BY teamInnings;

"Question.7 Get the total number of matches played by each team."

SELECT team, COUNT(*) AS matches_played FROM (
    SELECT team1 AS team FROM match_summary
    UNION ALL
    SELECT team2 AS team FROM match_summary
) AS all_teams GROUP BY team;

"Question.8 Find the average strike rate of all batsmen."

SELECT AVG(SR) AS average_strike_rate FROM batting_summary;

"Question.9 Determine the highest number of runs scored by a batsman in a single match."

SELECT MAX(runs) AS highest_runs FROM batting_summary;

"Question.10 Get the total number of fours hit across all matches."

SELECT SUM(4s) AS total_fours FROM batting_summary;


"Question.11 Find all matches won by "KKR" by wickets."

SELECT * FROM match_summary WHERE winner = 'KKR' AND won_by = 'wicket';

"Question.12 Retrieve the names of batsmen who were "not out" in any match."

SELECT DISTINCT batsmanName FROM batting_summary WHERE out/not_out = 'not_out';

"Question.13 List all left-handed batsmen".

SELECT name FROM players WHERE battingStyle = 'Left hand Bat';

"Question.14 Find all matches where the winning margin was greater than 50 runs."

SELECT * FROM match_summary WHERE won_by = 'run' AND margin > 50;

"Question.15 Get the details of players who are all-rounders."

SELECT * FROM players WHERE playingRole = 'All rounder';

"Question.16 List the names of players along with their teams and total runs scored in all matches."

SELECT p.name, p.team, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_summary b ON p.name = b.batsmanName
GROUP BY p.name, p.team;

"Question.17 Find the winner of each match along with the total runs scored by the winning team."

SELECT m.match_id, m.winner, SUM(b.runs) AS total_runs
FROM match_summary m
JOIN batting_summary b ON m.match_id = b.match_id
WHERE b.teamInnings = m.winner
GROUP BY m.match_id, m.winner;

"Question.18 Get the details of matches along with the number of fours hit by players in each match."

SELECT m.match_id, m.team1, m.team2, SUM(b.4s) AS total_fours
FROM match_summary m
JOIN batting_summary b ON m.match_id = b.match_id
GROUP BY m.match_id, m.team1, m.team2;

"Question.19 List the strike rates of all batsmen along with their teams."

SELECT b.batsmanName, p.team, b.SR
FROM batting_summary b
JOIN players p ON b.batsmanName = p.name;

"Question.20 Find the total runs scored by each team in matches they won."

SELECT m.winner AS team, SUM(b.runs) AS total_runs
FROM match_summary m
JOIN batting_summary b ON m.match_id = b.match_id
WHERE b.teamInnings = m.winner
GROUP BY m.winner;



"Question.21 Identify the player with the highest strike rate in the dataset."

SELECT batsmanName, MAX(SR) AS highest_strike_rate FROM batting_summary;

"Question.22 Find the match where the most sixes were hit."

SELECT match_id, SUM(6s) AS total_sixes
FROM batting_summary
GROUP BY match_id
ORDER BY total_sixes DESC
LIMIT 1;

"Question.23 Determine the number of players in each team."

SELECT team, COUNT(*) AS total_players FROM players GROUP BY team;

"Question.24 Get the list of matches where "CSK" scored more than 200 runs."

SELECT DISTINCT b.match_id, b.teamInnings
FROM batting_summary b
WHERE b.teamInnings = 'CSK' AND b.runs > 200;

"Question.25 List the players who hit more than 3 sixes in any match."

SELECT DISTINCT batsmanName FROM batting_summary WHERE 6s > 3;



"Question. 26 Find the top 3 batsmen with the highest total runs across all matches."

SELECT batsmanName, SUM(runs) AS total_runs
FROM batting_summary
GROUP BY batsmanName
ORDER BY total_runs DESC
LIMIT 3;

"Question.27 Retrieve the details of matches where "KKR" lost."

SELECT * FROM match_summary WHERE (team1 = 'KKR' OR team2 = 'KKR') AND winner != 'KKR';

"Question.28 Find the players who played for "CSK" and scored a total of over 100 runs."

SELECT p.name, SUM(b.runs) AS total_runs
FROM players p
JOIN batting_summary b ON p.name = b.batsmanName
WHERE p.team = 'CSK'
GROUP BY p.name
HAVING total_runs > 100;

"Question.29 List the top 5 matches with the highest combined team scores."

SELECT match_id, SUM(runs) AS total_score
FROM batting_summary
GROUP BY match_id
ORDER BY total_score DESC
LIMIT 5;

"Question.30 Find the winning margin for each match where "RCB" played."

SELECT match_id, winner, margin, won_by
FROM match_summary
WHERE team1 = 'RCB' OR team2 = 'RCB';