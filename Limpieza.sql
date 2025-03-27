Select * from cellphone2;

-- Validacion valores Duplicados
With Duplicados as(
	Select *,
	ROW_NUMBER() 
	Over(Partition by company_name, Model_Name, RAM_GB, Processor, Battery_Capacity_mAh, Launched_Year order by Company_name) as Repetido
	from cellphone2
)
Delete from Duplicados where Repetido >1;
Select * from Duplicados where Repetido >1

-- Limpieza Columnas
-- Retirar la G de la columna Mobile_Weight.
-- Solo existen Valores Gramos
Select distinct right(mobile_weight_g,2) from cellphone2;

-- Retirar Valor G

With valor_correcto as(
Select company_name, Model_Name, Mobile_Weight_G, SUBSTRING(mobile_weight_g,1,LEN(mobile_weight_g)-1) as Peso_Corerecto
from cellphone2)
--Update valor_correcto set Mobile_Weight_G = Peso_Corerecto;

-- Retirar la palabra GB de la columna RAM para quedarnos con valores Enteros.
-- Solo existen Valores coin GB
Select distinct right(RAM_GB,2) from cellphone2;

-- Retirar Valor GB
With valor_correcto as(
Select company_name, Model_Name, RAM_GB, SUBSTRING(RAM_GB,1,LEN(RAM_GB)-2) as RAM_correcta
from cellphone2
)
--Select * from valor_correcto;
--Update valor_correcto set RAM_GB = RAM_correcta;

Select * from cellphone2;

-- Columna Camara Frontal, seria quedarnos solamente con la capacidad de los Megapixeles, es decir quitar todo el texto despues del primer MP
Select distinct right(Front_Camera_Mpx,2) from cellphone2;

With valores_correctos as (
Select company_name, model_name, Front_Camera_Mpx,--,isnumeric(LEFT(Front_Camera_Mpx,2))
case --Front_Camera_Mpx  
when isnumeric(LEFT(Front_Camera_Mpx,2)) = 1 then LEFT(Front_Camera_Mpx,2)
when isnumeric(LEFT(Front_Camera_Mpx,2)) = 0 then LEFT(Front_Camera_Mpx,1)
end as Camara_Correcta
from cellphone2)
--Update valores_correctos set Front_Camera_Mpx = Camara_Correcta;
--select * from valores_correctos; 

-- Columna Camara Trasera, seria quedarnos solamente con la capacidad de los Megapixeles, es decir quitar todo el texto despues del primer MP
Select company_name, model_name, back_Camera_Mpx from cellphone2 order by back_Camera_Mpx asc;

-- 1ERA PARTE
With valores_correctos as (
Select company_name, model_name, back_Camera_Mpx,--isnumeric(LEFT(back_Camera_Mpx,3)) AS PRUEBA,
case --Front_Camera_Mpx  
when isnumeric(LEFT(back_Camera_Mpx,3)) = 1 then LEFT(back_Camera_Mpx,3)
when isnumeric(LEFT(back_Camera_Mpx,3)) = 0 then LEFT(back_Camera_Mpx,2)
end as Camara_Correcta
from cellphone2)
--Update valores_correctos set back_Camera_Mpx = Camara_Correcta;
Select * from valores_correctos;

--2DA PARTE
With valores_correctos as (
Select company_name, model_name, back_Camera_Mpx,isnumeric(back_Camera_Mpx) AS PRUEBA,
case --Front_Camera_Mpx  
when isnumeric(back_Camera_Mpx) = 1 then back_Camera_Mpx
when isnumeric(back_Camera_Mpx) = 0 then LEFT(back_Camera_Mpx,1)
end as Camara_Correcta
from cellphone2)
--Update valores_correctos set back_Camera_Mpx = Camara_Correcta;
Select * from valores_correctos;

Select * from cellphone2;


-- Columna Bateria: Remover la palabra mAh
select distinct right(Battery_Capacity_mAh,3) from cellphone2;

With valor_correcto as(
Select company_name, Model_Name, Battery_Capacity_mAh, SUBSTRING(Battery_Capacity_mAh,1,LEN(Battery_Capacity_mAh)-3) as bateria_correcta
from cellphone2)
--Select * from valor_correcto;
--Update valor_correcto set Battery_Capacity_mAh = bateria_correcta;


Select * from cellphone2;
-- Columna Screen 
with valor_correcto as
(
Select company_name, Model_Name, Screen_Size_Inches, 
SUBSTRING(Screen_Size_Inches, 0, CHARINDEX('inches', Screen_Size_Inches)) AS Screen_correcto from cellphone2
) 
select * from valor_correcto;
--Update valor_correcto set Screen_Size_Inches = Screen_correcto;

-- Columna Price
Select * from cellphone2;

with valor_correcto as
(
Select company_name, Model_Name, Launched_Price_USA, CHARINDEX(' ', Launched_Price_USA) Prueba_Indicador,
trim(SUBSTRING(Launched_Price_USA, CHARINDEX('D', Launched_Price_USA)+1, len(Launched_Price_USA) )) AS Precio_Correcto 
from cellphone2
) 
select * from valor_correcto;
--Update valor_correcto set Launched_Price_USA = Precio_Correcto
;

Select * from cellphone2;

Select * from cellphone2;

Update cellphone2 set RAM_GB = TRIM(ram_gb), Front_Camera_Mpx = TRIM(Front_Camera_Mpx), Back_Camera_Mpx = TRIM(Back_Camera_Mpx), Battery_Capacity_mAh = TRIM(Battery_Capacity_mAh),
Screen_Size_Inches = TRIM(Screen_Size_Inches), Launched_Price_USA = TRIM(Launched_Price_USA) ;


alter table cellphone2 alter column mobile_weight_g float;

alter table cellphone2 alter column Front_Camera_Mpx int;

select *, replace(RAM_GB,'.',',') from cellphone2

Select *,SUBSTRING(RAM,1,LEN(RAM)-2) as RAM_correcta from cellphone where Company_Name = 'Huawei' and Model_Name in ( 'P60 Pro','P60 Art')
Update cellphone2 set Front_Camera_Mpx = 32 where Company_Name = 'Huawei' and Model_Name = 'Nova 9 Pro'