USE CELULARES;

--SELECT * FROM cellphone2;
alter table cellphone2 add AlmacenamientoGB nvarchar(50)
with NC as (
SELECT MODEL_NAME,
case
when CHARINDEX('GB', Model_Name) > 0 then trim(SUBSTRING(model_name,CHARINDEX('GB', Model_Name)-3,3))
when CHARINDEX('GB', Model_Name) = 0 then Model_Name
end as Almacenamiento, AlmacenamientoGB
--SUBSTRING(model_name,CHARINDEX('GB', Model_Name)-3,3),
--CHARINDEX('GB', Model_Name), LEN(model_name), left(Model_Name,5) 
FROM cellphone2)
Select * from nc where isnumeric(almacenamientoGB) = 0;
--Update nc set AlmacenamientoGB = Almacenamiento;

-- Resto Valores
With tb as(
SELECT Model_Name, ALMACENAMIENTOGB,
case
when CHARINDEX('TB', Model_Name) > 0 then trim(SUBSTRING(model_name,CHARINDEX('TB', Model_Name)-1,1))
when CHARINDEX('TB', Model_Name) = 0 then Model_Name
end as Almacenamiento

--SUBSTRING(model_name,CHARINDEX('TB', Model_Name)-1,1) AS UNO,
--CHARINDEX('TB', Model_Name), LEN(model_name), left(Model_Name,5) AS DOS
FROM cellphone2 WHERE isnumeric(almacenamientoGB) = 0)
--Select * from TB; --where isnumeric(almacenamientoGB) = 0;
UPDATE tb SET Almacenamientogb = Almacenamiento;

Update cellphone2 set AlmacenamientoGB = 0 where ISNUMERIC(almacenamientogb) = 0;

Select * from cellphone2 WHERE Model_Name = 'Mate XT 512GB' ORDER BY Launched_Price_USA DESC;
1,499
396,22