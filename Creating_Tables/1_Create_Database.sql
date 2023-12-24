USE master
go

IF Db_id('ssis_AdventureWorksDW2014') IS NOT NULL
  DROP DATABASE ssis_AdventureWorksDW2014;

CREATE DATABASE ssis_AdventureWorksDW2014
go 
