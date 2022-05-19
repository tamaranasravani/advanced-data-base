--@@ Creating Database
USE master;
GO
CREATE DATABASE YoungLives;





--@@ Creating Database table India_survey table1

USE YoungLives
GO
CREATE TABLE survey(
	[id] [varchar](50) not  NULL,
	[cohort] [varchar](50) NULL,
	[round_of_survey] [varchar](50)not NULL,
	[child present in survey] [varchar](50) NULL,
	[child in all rounds] [varchar](50) NULL,
	[child died] [varchar](50) NULL,
	[date of interview] [varchar](50) NULL,
	[clustid] [varchar](50) NULL,
	[commid] [varchar](50) NULL,
	 [country] [varchar](10) NULL 
	)




--@@ Inserting values  table survey from Ethiopia
USE YoungLives
GO
Insert into survey
SELECT [id],
	[cohort],
	[round_of_survey],
	[child present in survey],
	[child in all rounds],
	[child died],
	[ddate of interview],
	[clustid],
	[commid],
	[country] from dbo.ethiopia_constructed$


--@@ Inserting values  table survey from India
	Insert into survey
    SELECT [id],
	[cohort],
	[round_of_survey],
	[child present in survey],
	[child in all rounds],
	[child died] ,
	[date of interview],
	[clustid],
	[commid],
	 [country] from dbo.india_constructed


	 --@@ Creating Database table child_Ind table2
USE YoungLives
GO
CREATE TABLE childTable(
	[id] [varchar](50)not NULL,
	[round_of_survey] [varchar](50)not NULL,
	[typesite] [varchar](50) NULL,
	[childloc] [varchar](50) NULL,
	[chsex] [varchar](50) NULL);

--@@ Inserting values child_Ind
USE Task1_YoungLives
GO
Insert into childTable
SELECT [id],
    
    [round_of_survey],
	[typesite],
	[childloc],
	[chsex]
	  from dbo.india_constructed$;


Insert into childTable
SELECT [id],
    [round_of_survey],
	[typesite],
	[childloc],
	[chsex]
	  from dbo.ethiopia_constructed;



--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--@@ Creating  table 3
USE Task1_YoungLives
GO


CREATE TABLE child_helath(
	[id] [varchar](50) NULL,
	[round_of_survey] [varchar](50)not NULL,
	[agemon] [varchar](50) NULL,
	[chweight] [varchar](50) NULL,
	[chheight] [varchar](50) NULL,
	[bmi] [varchar](50) NULL,
	[chhealth] [varchar](50) NULL,
    [cladder] [varchar](50) NULL)

	--@@ Inserting values child_Ind

USE Task1_YoungLives
GO
Insert into child_helath
SELECT [id],
    [round_of_survey],
	[agemon],
	[chweight],
	[chheight],
	[bmi],
	[chhealth],
    [cladder]
	  from dbo.india_constructed

USE Task1_YoungLives
GO
Insert into child_helath
SELECT [id],
    [round_of_survey],
	[agemon],
	[chweight],
	[chheight],
	[bmi],
	[chhealth],
    [cladder]
	  from dbo.ethiopia_constructed

select count(*) from child_helath;
USE Task1_YoungLives;
GO



CREATE TABLE childWealth(
	[id] [varchar](50) NULL,
	[round_of_survey] [varchar](50)not NULL,
	[wi] [varchar](50) NULL
	);

USE Task1_YoungLives
GO
Insert into [dbo].[childWealth]
SELECT [id]
           ,[round_of_survey]
           ,[wi]
           
	  from dbo.india_constructed;
	  
USE Task1_YoungLives
GO
Insert into [dbo].[childWealth]
SELECT [id]
           ,[round_of_survey]
           ,[wi_new]
          
	  from dbo.ethiopia_constructed;


@@@@@
CREATE TABLE childEducation_work(
	[id] [varchar](50) NULL,
	[round_of_survey] [varchar](50)not NULL,
	[hwork] [varchar](50) NULL,
	[hschool] [varchar](50) NULL,
	[hstudy] [varchar](50) NULL,
	[hplay] [varchar](50) NULL,
	[engrade] [varchar](50) NULL,
	[hghgrade] [varchar](50) NULL,
	[levlread] [varchar](50) NULL,
	[levlwrit] [varchar](50) NULL,
	[literate] [varchar](50) NULL
	);

	select count(*) from childEducation_work;
USE Task1_YoungLives
GO
Insert into [dbo].[childEducation_work]
SELECT [id] ,
	[round_of_survey] ,
	[hwork],
	[hschool],
	[hstudy],
	[hplay] ,
	[engrade] ,
	[hghgrade],
	[levlread],
	[levlwrit] ,
	[literate] 	from dbo.india_constructed;
	  
USE Task1_YoungLives
GO
Insert into [dbo].[childEducation_work]
SELECT [id] ,
	[round_of_survey] ,
	[hwork],
	[hschool],
	[hstudy],
	[hplay] ,
	[engrade] ,
	[hghgrade],
	[levlread],
	[levlwrit] ,
	[literate]
	  from dbo.ethiopia_constructed;


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


	 

@ T-SQl Satatements

ALTER TABLE dbo.india_constructed 
            ADD country [varchar](10) NULL;
 
   UPDATE dbo.india_constructed SET [country] = 'India'  where [country] is null

   ALTER TABLE dbo.ethiopia_constructed 
            ADD country [varchar](10) NULL;
 
   UPDATE dbo.ethiopia_constructed SET [country] = 'Ethiopia'  where [country] is null	

    UPDATE survey SET Cohort = 'older' where Cohort='0'
    UPDATE survey SET Cohort = 'young' where Cohort='1'

	UPDATE survey SET [child present in survey] = 'yes' where [child present in survey]='1'
    UPDATE survey SET [child present in survey] = 'no' where [child present in survey]='0'

	UPDATE survey SET [child died] = 'yes' where [child died]='1'

	UPDATE survey SET [child in all rounds] = 'yes' where [child in all rounds]='1'
	UPDATE survey SET [child in all rounds] = 'no' where [child in all rounds]='0'
	
	


       select *  from survey;


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22



select count(*) from childTable;
  
 ----update column values  child_Ind;

	sp_RENAME 'childTable.typesite' , 'Area of residence', 'COLUMN';
	sp_RENAME 'childTable.childloc' , 'Child currently lives in household', 'COLUMN';
	sp_RENAME 'childTable.chsex' , 'child sex', 'COLUMN';
	
	UPDATE childTable SET [Area of residence] = 'urban' where [Area of residence]='1';
	UPDATE childTable SET [Area of residence] = 'rural' where [Area of residence]='2';
    UPDATE childTable SET [Area of residence] =  'unknown' where [Area of residence]='77';
    
	UPDATE childTable SET [Child currently lives in household] = 'Yes' 
	
	 where [Child currently lives in household]='1';
	UPDATE childTable SET [Child currently lives in household] = 'No'  where [Child currently lives in household]='0';
	 
	UPDATE childTable SET [child sex] = 'male'  where [child sex]='1';
	UPDATE childTable SET [child sex] = 'female'  where [child sex]='2';

	 select top 10 * from childTable;



--^^^^^^^child_helath


	sp_RENAME 'child_helath.chhealth' , 'child health in general', 'COLUMN'
	sp_RENAME 'child_helath.cladder' , 'Child well-being', 'COLUMN'
	UPDATE child_helath SET [child health in general] = 'very poor' 
	where [child health in general]='1'
	UPDATE child_helath SET [child health in general] = 'poor' 
	where [child health in general]='2'
    UPDATE child_helath SET [child health in general] =  'average'
	 where [child health in general]='3'
	
    UPDATE child_helath SET [child health in general] =  'good'
	
	 where [child health in general]='4'
    UPDATE child_helath SET [child health in general] =  'very good' where [child health in general]='5'

    SELECT top 10 * FROM child_helath




--@@@@@@@@@@@Child wealth@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	select count(*) from dbo.india_constructed;
	sp_RENAME 'childWealth.wi' , 'Wealth index', 'COLUMN';

	



--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@







	  Select count(*) from  childEducation_work;


	    sp_RENAME 'childEducation_work.hwork' , 'workhours', 'COLUMN'
	    sp_RENAME 'childEducation_work.hschool' , 'school hours', 'COLUMN';
		sp_RENAME 'childEducation_work.hstudy' , 'Hours spen to study outside school', 'COLUMN';
		sp_RENAME 'childEducation_work.hplay' , 'play hours', 'COLUMN';
		sp_RENAME 'childEducation_work.engrade' , 'current grade', 'COLUMN';
		sp_RENAME 'childEducation_work.hghgrade' , 'highest grade', 'COLUMN';
		sp_RENAME 'childEducation_work.levlread' , 'read', 'COLUMN';
		sp_RENAME 'childEducation_work.levlwrit' , 'write', 'COLUMN';
		sp_RENAME 'childEducation_work.literate' , 'read&write with difficulty', 'COLUMN';

        UPDATE childEducation_work SET [read] =  'can not read' where [read]='1';
        UPDATE childEducation_work SET [read] =  'read letters' where [read]='2';
	    UPDATE childEducation_work SET [read] =  'read words' where [read]='3';
	    UPDATE childEducation_work SET [read] =  'read sentance' where [read]='4';
	    UPDATE childEducation_work SET [read] =  'n/a' where [read]=''
        UPDATE childEducation_work SET [write] =  'can not write' where [write]='1';
        UPDATE childEducation_work SET [write] =  'average' where [write]='2';
	    UPDATE childEducation_work SET [write] =  'good' where [write]='3';
	    UPDATE childEducation_work SET [write] =  'n/a' where [write]=''


	    UPDATE childEducation_work SET [read&write with difficulty] =  'no' where [read&write with difficulty]='0';
        UPDATE childEducation_work SET [read&write with difficulty] =  'yes' where [read&write with difficulty]='2';
	    UPDATE childEducation_work SET [read&write with difficulty] =  'n/a' where [read&write with difficulty]=''
	--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


 
select * from childTable;
select * from child_helath;
select *  from survey; 
select * from dbo.childWealth
Select * from  childEducation_work
select * from survey;

 



 CREATE VIEW Child_read_write_work AS
 select  [childEducation_work].[id], [childEducation_work].[round_of_survey], survey.country,
 [childEducation_work].[workhours],
 [childEducation_work].[read],
 [childEducation_work].[write],
 [childEducation_work].[highest grade],
 [childEducation_work].[read&write with difficulty],
 [childEducation_work].[play hours]
 from [childEducation_work] 
 inner join survey
 on
 [childEducation_work].[id]=[survey].[id] and [childEducation_work].[round_of_survey]=[survey].[round_of_survey];


 
 
 Select country, COUNT(*) from  Child_read_write_work 
  where workhours <= '0'  group by country 


 update Child_read_write_work set write= 'unknown' where write='79'

 CREATE VIEW Child_gender_locality AS
 select  [childTable].[id], [childTable].[round_of_survey], survey.country,
 [childTable].[Area of residence],
 [childTable].[Child currently lives in household],
 [childTable].[child sex]
 from [childTable] 
 inner join survey
 on
 [childTable].[id]=[survey].[id] and [childTable].[round_of_survey]=[survey].[round_of_survey];

 select distinct [Area of residence] from Child_gender_locality

 update Child_gender_locality set [Area of residence]= 'n/a' where [Area of residence]=''


 select count(*), [Area of residence] , country from Child_gender_locality
group by [Area of residence],  country  





 select * from dbo.childWealth
 select * from [Child_read_write_work]



 CREATE VIEW child_edu_wealth1 AS
 select  [Child_read_write_work].[id], [Child_read_write_work].[round_of_survey], [Child_read_write_work].country,
 [Child_read_write_work].[workhours],
 [Child_read_write_work].[read],
 [Child_read_write_work].[write],
 [Child_read_write_work].[highest grade],
 [Child_read_write_work].[read&write with difficulty],
 [Child_read_write_work].[play hours],
 [childWealth].[Wealth index]
 from [Child_read_write_work] 
 inner join childWealth
 on
 [Child_read_write_work].[id]=[childWealth].[id] and
  [Child_read_write_work].[round_of_survey]=[childWealth].[round_of_survey];

 select count(*) from child_edu_wealth
where  [write] ='good' and  country ='India' 


