
USE master;
GO
CREATE DATABASE Task2_Vietnam_SchoolSurvey


select *from dbo.vietnam_wave_1;
select count(*) from dbo.vietnam_wave_2;

-----------Joining two data sets wave1 and wave2----------

create view wave1wave2
as
select  
  dbo.vietnam_wave_1.UNIQUEID,
  dbo.vietnam_wave_1.SCHOOLID,
  dbo.vietnam_wave_1.CLASSID,
  dbo.vietnam_wave_1.STUDENTID,
  dbo.vietnam_wave_1.PROVINCE,
  dbo.vietnam_wave_1.GENDER,
  dbo.vietnam_wave_1.AGE,
  dbo.vietnam_wave_1.STRPTCL1,
  dbo.vietnam_wave_1.STRPTCL6,
  dbo.vietnam_wave_1.STRPTCL10,
  dbo.vietnam_wave_1.LOCALITY,
  dbo.vietnam_wave_1.STITMOW1,
  dbo.vietnam_wave_1.STITMOW2,
  dbo.vietnam_wave_1.STITMOW5, --'Bags
  dbo.vietnam_wave_1.STBRWBK,  --'Books
  dbo.vietnam_wave_1.MATH_TEST,
  dbo.vietnam_wave_1.MATH_RAWSCORE as 'wave1 Math Score',
  dbo.vietnam_wave_2.MATH_RAWSCORE as 'wave2 Math Score',
   ((cast(dbo.vietnam_wave_1.MATH_RAWSCORE as int)) - (cast(dbo.vietnam_wave_2.MATH_RAWSCORE as int))) as 'Differnce of MATH score in W1 & W2',
  dbo.vietnam_wave_1.ENG_RAWSCORE as 'wave1 ENG Score',
  dbo.vietnam_wave_2.ENG_TEST,
  dbo.vietnam_wave_2.ENG_RAWSCORE as 'wave2 ENG Score',
   ((cast(dbo.vietnam_wave_1.ENG_RAWSCORE as int)) - (cast(dbo.vietnam_wave_2.ENG_RAWSCORE as int))) as 'Differnce of ENG score in W1 & W2'
 from  
   dbo.vietnam_wave_1 inner join
   dbo.vietnam_wave_2 on 
   dbo.vietnam_wave_1.UNIQUEID =dbo.vietnam_wave_2.UNIQUEID
where
  dbo.vietnam_wave_1.MATH_RAWSCORE <> dbo.vietnam_wave_2.MATH_RAWSCORE
or 
  dbo.vietnam_wave_1.MATH_RAWSCORE = dbo.vietnam_wave_2.MATH_RAWSCORE
or 
  dbo.vietnam_wave_1.ENG_RAWSCORE = dbo.vietnam_wave_2.ENG_RAWSCORE
or 
   dbo.vietnam_wave_1.ENG_RAWSCORE <> dbo.vietnam_wave_2.ENG_RAWSCORE ;


select distinct top 5 (AGE) from wave1wave2 order by (AGE) desc;


select * from wave1wave2 where Gender is not null;


--*****Update column names and values as per dcitionary tables******

---------------------------------------------------------------------
UPDATE wave1wave2 SET GENDER = 'Male' where GENDER = '1';
UPDATE wave1wave2 SET GENDER = 'Female' where GENDER = '2';
UPDATE wave1wave2 SET GENDER = 'Unknown' where GENDER = '';


-------------------------------------------------------------

UPDATE wave1wave2 SET PROVINCE = 'Ben Tre' where PROVINCE = '1';
UPDATE wave1wave2 SET PROVINCE = 'Da Nang' where PROVINCE = '2';
UPDATE wave1wave2 SET PROVINCE = 'Hung Yen' where PROVINCE = '3';
UPDATE wave1wave2 SET PROVINCE = 'Lao Cai' where PROVINCE = '4';
UPDATE wave1wave2 SET PROVINCE = 'Phu Yen' where PROVINCE = '5';
UPDATE wave1wave2 SET PROVINCE = 'Unknown' where PROVINCE = ' ';

----------------------------------------------------------------------
UPDATE wave1wave2 SET LOCALITY = 'Rural' where LOCALITY = '1';
UPDATE wave1wave2 SET LOCALITY = 'Urban' where LOCALITY = '2';
UPDATE wave1wave2 SET LOCALITY = 'Unknown' where LOCALITY = '';

-----------------------------------------------------------------------

sp_RENAME 'wave1wave2.STRPTCL1' , 'Grades 1-5', 'COLUMN';

UPDATE wave1wave2 SET [Grades 1-5] = 'No, never' where [Grades 1-5]= '0';
UPDATE wave1wave2 SET [Grades 1-5]= 'Yes, once' where [Grades 1-5] = '1';
UPDATE wave1wave2 SET [Grades 1-5]= 'Yes, twice or more' where [Grades 1-5] = '2';
UPDATE wave1wave2 SET [Grades 1-5]= 'Unknown' where [Grades 1-5] = '';

-------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STRPTCL6' , 'Grades 6-9', 'COLUMN';


UPDATE wave1wave2 SET [Grades 6-9] = 'No, never' where [Grades 6-9] = '0';
UPDATE wave1wave2 SET [Grades 6-9] = 'Yes, once' where [Grades 6-9] = '1';
UPDATE wave1wave2 SET [Grades 6-9] = 'Yes, twice or more' where [Grades 6-9] = '2';
UPDATE wave1wave2 SET [Grades 6-9] = 'Unknown' where [Grades 6-9] = ' ';

--------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STRPTCL10' , 'Grades 10', 'COLUMN';

UPDATE wave1wave2 SET [Grades 10] = 'No, never' where [Grades 10] = '0';
UPDATE wave1wave2 SET [Grades 10] = 'Yes, once' where [Grades 10] = '1';
UPDATE wave1wave2 SET [Grades 10] = 'Yes, twice or more' where [Grades 10] = '2';
UPDATE wave1wave2 SET [Grades 10] = 'Unknown' where [Grades 10] = ' ';

---------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STITMOW1' , 'Grades10_MathTextBooks', 'COLUMN';

UPDATE wave1wave2 SET Grades10_MathTextBooks = 'No' where [Grades10_MathTextBooks] = '0';
UPDATE wave1wave2 SET [Grades10_MathTextBooks] = 'Yes' where [Grades10_MathTextBooks] = '1';
UPDATE wave1wave2 SET [Grades10_MathTextBooks] = 'Unknown' where [Grades10_MathTextBooks] = ' ';

-------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STITMOW2' , 'Grades10_ENGTextBooks', 'COLUMN';

UPDATE wave1wave2 SET Grades10_ENGTextBooks = 'No' where [Grades10_ENGTextBooks] = '0';
UPDATE wave1wave2 SET [Grades10_ENGTextBooks] = 'Yes' where [Grades10_ENGTextBooks] = '1';
UPDATE wave1wave2 SET [Grades10_ENGTextBooks] = 'Unknown' where [Grades10_ENGTextBooks] = ' ';
-------------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STITMOW2' , 'Grades10_ENGTextBooks', 'COLUMN';

UPDATE wave1wave2 SET Grades10_ENGTextBooks = 'No' where [Grades10_ENGTextBooks] = '0';
UPDATE wave1wave2 SET [Grades10_ENGTextBooks] = 'Yes' where [Grades10_ENGTextBooks] = '1';
UPDATE wave1wave2 SET [Grades10_ENGTextBooks] = 'Unknown' where [Grades10_ENGTextBooks] = ' ';
--------------------------------------------------------------------------------------------------

sp_RENAME 'wave1wave2.STITMOW5' , 'SchoolBag', 'COLUMN';

UPDATE wave1wave2 SET SchoolBag = 'No' where SchoolBag = '0';
UPDATE wave1wave2 SET SchoolBag = 'Yes' where SchoolBag = '1';
UPDATE wave1wave2 SET SchoolBag = 'Unknown' where SchoolBag = ' ';
----------------------------------------------------------------------------------
sp_RENAME 'wave1wave2.STBRWBK' , 'Library or BooksStore available', 'COLUMN';

UPDATE wave1wave2 SET [Library or BooksStore available] = 'Yes' where [Library or BooksStore available] = '0';
UPDATE wave1wave2 SET [Library or BooksStore available] = 'No' where [Library or BooksStore available] = '2';
UPDATE wave1wave2 SET [Library or BooksStore available] = 'Borrow books' where [Library or BooksStore available] = '1';
UPDATE wave1wave2 SET [Library or BooksStore available] = 'Unknown' where [Library or BooksStore available] = ' ';
----------------------------------------------------------------------------------------------------

CREATE PROCEDURE RetriveView
As
select * from wave1wave2;
 

---Procedure to view table wave1wave2--

Exec RetriveView;




select PROVINCE, count(*)UNIQUEID from wave1wave2
group by PROVINCE;








---Report on Gender Inequality attending school as per Province--

create view Gender_Inequality1
as
select PROVINCE,  GENDER, count(UNIQUEID) as 'No of students' from wave1wave2
group by PROVINCE,GENDER;

select *from Gender_Inequality1 where GENDER = 'Female';


---Report on Rural & Urban Inequality attending school as per Locality --
create view Rural_Urban_Inequality1
as
select Locality, count(UNIQUEID)as 'No of students', GENDER from wave1wave2
group by  Locality, GENDER;

select *from Rural_Urban_Inequality1; 






----Report on Students Rural & Urban Inequality with no books, bag and library--
select Locality, count(UNIQUEID)as 'No of students' from wave1wave2
where [Grades10_ENGTextBooks] ='No' or 
      [Grades10_MathTextBooks] ='No' or 
	  [SchoolBag] ='No' or
	  [Library or BooksStore available] ='No'
group by  Locality;



-------------------------------------------------------------------------------------------
create view Repated_Grade10_withtbooks1
as 
select UNIQUEID, [Grades10_ENGTextBooks],  [Grades10_MathTextBooks],[SchoolBag], 
         [Library or BooksStore available], [Grades 10]
   from wave1wave2	
   where [Grades10_ENGTextBooks] ='Yes' and  
      [Grades10_MathTextBooks] ='Yes' and 
	  [SchoolBag] ='Yes' and 
	  [Library or BooksStore available] In ('Yes', 'Borrow books') and 
	  [Grades 10] In ('Yes, twice or more', 'Yes, once')



  create view studenets_Repeated_Grades1
as 
  select UNIQUEID, [Grades 1-5], [Grades 6-9], [Grades 10]
   from wave1wave2	
   where [Grades 1-5] In ('Yes, twice or more', 'Yes, once') or  
         [Grades 6-9] In ('Yes, twice or more', 'Yes, once') or 
		 [Grades 10]  In ('Yes, twice or more', 'Yes, once')
	  
select top 10 * from studenets_Repeated_Grades1 ;

	  
  create view studenets_not_Repeated_Grades1
as 
  select UNIQUEID, [Grades 1-5], [Grades 6-9], [Grades 10]
   from wave1wave2	
   where [Grades 1-5] like '%No%' and 
         [Grades 6-9] like '%No%' and 
		 [Grades 10]  like '%No%';

 select top 10 * from studenets_not_Repeated_Grades1 ;

-----------------
  