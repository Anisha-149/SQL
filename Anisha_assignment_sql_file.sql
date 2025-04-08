-- create a database 
create database upload;
-- use database 
use upload;
-- create table olypics
create table olympics (
ID int,
Name varchar(400),
Sex varchar(400),
Age int,
Height int,
Weight int,
Team varchar(400),
NOC varchar(500),
Games varchar(500),
Year int,
Season varchar(500),
City varchar(500),
Sports varchar(500),
Events varchar(500),
Medal varchar(500)
);
-- view table
select * from olympics;
-- 1. Show how many medal counts present for entire data
Show variables like "secure_file_priv";
load data infile 'C:\ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Cleaned.csv'
into table olympics
fields terminated by ","
enclosed by'"'
lines terminated by '\r\n'
ignore 1 rows;
-- 1. Show how many medal counts present for entire data
select medal,count(medal)as medal_count from olympics where medal!='NOMedal' group by medal order by medal_count;
select * from olympics;

-- 2. Show count of unique sports present in Olympics
select count(distinct(sports)) from olympics;


-- select Sport,count(Sport) from olympics group by Sport;
select sports ,count(sports) from olympics group by sports;
-- 3. Show how many different medals won by team India
select medal,count(medal) from olympics where Team='India' and Medal!='NOMedal' group by medal;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select * from olympics;
select Events ,count(Medal) count_medal from olympics where Team='India' and Medal!='NOMedal' group by Events order by count_medal desc;
-- 5. Show event wise medals won by India in order of year
select Events ,count(Medal) count_medal,Year from olympics where Team='India' and Medal!='NOMedal' group by Events,year order by Year;

-- 6. show country who won maximum medals.
select Team,count(medal) as count_medal from olympics where medal!='NOMedal' group by Team order by count_medal desc limit 1;

-- 7.show top 10 countries who won gold
select Team ,count(medal),Medal as count_medal from  olympics where medal!='NOMedal' and medal='Gold' group by Team order by count_medal desc limit 10;

--  8. show in which year did United states won most gold medal
select * from olympics;
select Team, year,count(medal) as count_medal from olympics where medal!='NOMedal' and medal='Gold' and Team='United States' group by year order by count_medal desc limit 1;

-- 9. In which sports United States has most medals.
select  Team,Sports ,count(Medal) as count_medal from olympics where Team='United States' and medal!='NOMedal' group by Sports order by count_medal desc limit 1;


-- 10. Find top three players who won most medals along with their sports and country
select * from olympics;
select Sports,Team,Name,count(Medal) count_medal from olympics where medal!='NOMedal' group by Sports,Team,Name order by count_medal desc limit 3;


-- 11. Find player with most gold medals in cycling along with his country.
select * from olympics;
select Team,Name,Medal,count(Medal) as count_medal from olympics where medal!='NOMedal'and medal='Gold' and Sports='Cycling' group by Team,Name order by count_medal desc limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select Medal,Name,Team,count(Medal) count_medal  from olympics where medal!='NOMedal' and Sports='Basketball' group by Medal,Name,Team order by count_medal desc limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select Medal,Name,count(Medal) as count_Medal,Sports from  olympics where Name='Teresa Edwards' and Sports='Basketball' group by Medal order by count_Medal desc limit 3;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select * from olympics;
select Sex,Year,count(Medal) from olympics where Medal!='NOMedal' group by Sex,Year order by Sex,Year;
