




USE Task3_CrimesData
GO

CREATE TABLE [dbo].[Crimes1]
(
[Crime ID] [nvarchar](255) NULL,
[Month] [nvarchar](50) NULL,
[Reported by] [nvarchar](150) NULL,
[Falls within] [nvarchar](150) NULL,
[Longitude] [float] NULL,
[Latitude] [float] NULL,
[Location] [nvarchar](255) NULL,
[LSOA code] [nvarchar](150) NULL,
[LSOA name] [nvarchar](150) NULL,
[Crime type] [nvarchar](150) NULL,
[Last outcome category] [nvarchar](500) NULL,
[Context] [nvarchar](500) NULL,);
Insert into [dbo].[Crimes1]
SELECT [Crime ID]
      ,[Month]
      ,[Reported by]
      ,[Falls within]
      ,[Longitude]
      ,[Latitude]
      ,[Location]
      ,[LSOA code]
      ,[LSOA name]
      ,[Crime type]
      ,[Last outcome category]
      ,[Context] from dbo.Crimes_Manchester$;

select * from  [dbo].[Crimes1]

	 
ALTER TABLE [dbo].[Crimes1]
ADD ID INT IDENTITY;

ALTER TABLE [dbo].[Crimes1]
DROP CONSTRAINT PK_Id ;

ALTER TABLE [dbo].[Crimes1] ALTER COLUMN [LSOA code] [nvarchar](150) NOT NULL;


select * from  [dbo].[Crimes1];

ALTER TABLE [dbo].[Crimes1]
ADD [GeoLocation] GEOGRAPHY

UPDATE [dbo].[Crimes1]
SET [GeoLocation] = geography::Point([Latitude], [Longitude], 4326)
WHERE [Longitude] IS NOT NULL and [Latitude] IS NOT NULL

select [GeoLocation] from [dbo].[Crimes1] ;

------------------------------------------------------------------------------------------------------

--LSOA Data

select *  from LSOAdata;

Update [dbo].[LSOAdata] 
SET LSOA = concat(County, 'Total')  where LSOA is null;
------------------------------------------------------------------------------->


DELETE FROM [dbo].[LSOAdata] WHERE "All Ages" is null;

Create Table LSOA 
(
[Area Codes] [nvarchar](255) NULL,
[County] [nvarchar](50) NULL,
[LSOA] [nvarchar](150) NULL,
[All Ages] [int] NULL);



Insert into LSOA
SELECT  [Area Codes],
            [County],
              [LSOA],
             [All Ages]  from [dbo].[LSOAdata]

select * from  LSOA;




--


select * from [LSOA];


 CREATE VIEW GreaterManchester_LSOA AS
 Select * from  LSOA
     where 
	     LSOA like 'Bolton%' or
         LSOA like 'Bury%'  or
		 LSOA like 'Oldham%'  or
		 LSOA like 'Stockport%'  or
		 LSOA like 'Tameside%'  or
		 LSOA like 'Trafford%'  or
		 LSOA like 'Wigan%'  or
		 LSOA like 'Manchester%'  or
		 LSOA like 'Salford%'  or
		 LSOA like 'Rochdale%' ;

select *  from GreaterManchester_LSOA;





CREATE VIEW Crimedata_LSOA AS
SELECT [GreaterManchester_LSOA].[LSOA],[GreaterManchester_LSOA].[All Ages],[GreaterManchester_LSOA].[Area Codes],
[Crimes1].[Crime ID],[Crimes1].[Month],[Crimes1].[Reported by],[Crimes1].[Falls within],[Crimes1].[Longitude],
[Crimes1].[Latitude], [Crimes1].[Location],[Crimes1].[Crime type], [Crimes1].[Last outcome category],
[Crimes1].[GeoLocation]
FROM [Crimes1]
inner JOIN GreaterManchester_LSOA  ON [Crimes1].[LSOA code]=[GreaterManchester_LSOA].[Area Codes];


;



  
--------------------------------------------------------------------------
select distinct [Crime type] from Crimedata_LSOA;



Create view  GreaterManchester_salford_AntiSocialbehaviour
as
select * from Crimedata_LSOA 
     where [Crime type]='Anti-social behaviour'
	 and Crimedata_LSOA.LSOA like 'Salford%'
	 and  [GeoLocation] IS NOT NULL;

select * from GreaterManchester_AntiSocialbehaviour ;


---------------------------------------------------------------------------------------------------------------

Create view  GreaterManchester_Vehicle_crime 
as
select * from Crimedata_LSOA 
     where [Crime type]='Vehicle crime'
	 and  [GeoLocation] IS NOT NULL;

	 select * from GreaterManchester_Vehicle_crime  ; 



	 select count(*)  from GreaterManchester_Vehicle_crime 



----------------------------------------------------------------------------------------------------------------------

Create view  GreaterManchester_Drugs
as
select * from Crimedata_LSOA 
     where [Crime type]='Drugs'
	 and  [GeoLocation] IS NOT NULL;

select * from GreaterManchester_Drugs;


-