--Number 1
SELECT MIN(yearid)
FROM appearances;

SELECT MAX(yearid)
FROM appearances;
--Answer: 1871 to 2016


--Number 2 
SELECT p.namelast, p.namefirst, p.height, a.G_all, a.teamid
FROM  people AS p
LEFT JOIN appearances AS a
ON p.playerid = a.playerid
GROUP BY p.namelast, p.namefirst, p.height, a.G_all, a.teamid
ORDER BY height;
--Answer: Eddie Gaedel at 43 inches. He played in 1 game and his team is SLA.

--Number 3 
SELECT p.namefirst, p.namelast, sc.schoolname, SUM(s.salary) AS total_salary
FROM people AS p
LEFT JOIN salaries AS s
ON p.playerid = s.playerid
LEFT JOIN collegeplaying AS c
ON p.playerid = c.playerid
LEFT JOIN schools AS sc
ON c.schoolid = sc.schoolid
WHERE sc.schoolname = 'Vanderbilt University' AND salary IS NOT NULL
GROUP BY p.namefirst, p.namelast, sc.schoolname
ORDER BY SUM(s.salary) DESC;
--Answer: David Price came in first at $245,553,888

--Number 4
SELECT SUM(po),
	CASE WHEN pos = 'OF' THEN 'Outfield'
		 WHEN pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
		 WHEN pos IN ('P', 'C') THEN 'Battery'
		 END AS position 
FROM fielding
WHERE yearid = 2016
GROUP BY position;
--Answer: Battery: 41,424 | Infield: 58,934 | Outfield: 29,560

--Number 5 -- Use teams table*************Still working on it
SELECT g, ROUND(AVG(soa), 2) AS avg_strikeout, ROUND(AVG(hra), 2) AS avg_homeruns,
		  CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
		       WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
		       WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
		       WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
		       WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
		       WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
		       WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
		       WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
		       WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
		       WHEN yearid BETWEEN 2010 AND 2016 THEN '2010s'
		       END AS decade
    FROM teams
	GROUP BY g, yearid;
	--Answer:
 
--Number 6
SELECT p.namefirst, p.namelast, b.sb AS stolen_bases, b.cs AS caught_stealing, b.sb + b.cs AS stealing_attempts,
CONCAT(ROUND(100.0 * b.sb/(b.sb+b.cs), 0), '%') AS success_stealing_perc
FROM people AS p
LEFT JOIN batting AS b
ON p.playerid = b.playerid
WHERE b.yearid = 2016 AND b.sb + b.cs > 20
ORDER by success_stealing_perc DESC;
--Answer: Chris Owings at 91%

   
--Number 7**************Working on it
SELECT
FROM
WHERE year BETWEEN 1970 AND 2016


--Number 8
SELECT team, park, (attendance/games) AS avg_attendance
FROM homegames
WHERE year = 2016 AND games >=10
GROUP BY team, park, games, attendance
ORDER BY avg_attendance DESC
LIMIT 5;
--Answer: LAN	LOS03	45719
----------SLN	STL10	42524
----------TOR	TOR02	41877
----------SFN	SFO03	41546
----------CHN	CHI11	39906


--Number 9**************Still working on it
SELECT p.namefirst, p.namelast, am.awardid, am.lgid
FROM awardsmanagers AS am
LEFT JOIN people AS p
ON am.playerid = p.playerid
WHERE awardid LIKE 'TSN%' ;
--Answer:

--Number 10 *******************In where, current date - debut date must be >= 10
SELECT p.namefirst, p.namelast, MAX(b.hr)
FROM people AS p
LEFT JOIN batting AS b
ON p.playerid = b.playerid
WHERE b.yearid = 2016 AND GETDATE()- p.debut >= 10 AND b.hr >= 1
GROUP BY p.namefirst, p.namelast;



SELECT * FROM batting;
SELECT * FROM appearances;
SELECT * FROM people;







  

