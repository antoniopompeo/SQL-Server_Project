-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ GRUPO ANONYMOUS --------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE [GD1C2021]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET NOCOUNT OFF
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ DROP -------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/****** Tabla STOCK ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[STOCK]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[STOCK]
GO

/****** Tabla ITEM_FACTURA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[ITEM_FACTURA]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[ITEM_FACTURA]
GO

/****** Tabla ITEM_COMPRA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[ITEM_COMPRA]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[ITEM_COMPRA]
GO

/****** Tabla COMPRA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[COMPRA]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[COMPRA]
GO

/****** Tabla FACTURA ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[FACTURA]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[FACTURA]
GO

/****** Tabla CLIENTE ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[CLIENTE]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[CLIENTE]
GO

/****** Tabla SUCURSAL ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[SUCURSAL]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[SUCURSAL]
GO

/****** Tabla CIUDAD ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[CIUDAD]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[CIUDAD]
GO

/****** Tabla PC ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[PC]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[PC]
GO

/****** Tabla COMPONENTE ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[COMPONENTE]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[COMPONENTE]
GO

/****** Tabla ACCESORIO ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[ACCESORIO]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[ACCESORIO]
GO

/****** Tabla PRODUCTO ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[PRODUCTO]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[PRODUCTO]
GO

/****** Tabla TIPO_PROD ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[TIPO_PROD]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[TIPO_PROD]
GO

/****** Tabla TIPO_COMPONENTE ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[TIPO_COMPONENTE]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[TIPO_COMPONENTE]
GO

/****** Tabla TIPO_ACCESORIO ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ANONIMOUS].[TIPO_ACCESORIO]') AND type in (N'U'))
	DROP TABLE [ANONIMOUS].[TIPO_ACCESORIO]
GO

/****** Trigger TR_INSERTAR_PRODUCTO_CARGA_INICIAL ******/
IF  EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'TR_INSERTAR_PRODUCTO_CARGA_INICIAL' AND TYPE = 'TR') 
	DROP TRIGGER [ANONIMOUS].TR_INSERTAR_PRODUCTO_CARGA_INICIAL
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ CREATE SCHEMA  ---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = 'ANONIMOUS')
	DROP SCHEMA [ANONIMOUS] 
GO

EXEC('CREATE SCHEMA [ANONIMOUS]')
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ CREATE TABLES  ---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/****** Tabla CIUDAD ******/
CREATE TABLE [ANONIMOUS].[CIUDAD] (
	[CIUDAD_ID]     [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CIUDAD_NOMBRE] [nvarchar](255)  NOT NULL,
	CONSTRAINT [PK_Ciudad] PRIMARY KEY ([CIUDAD_ID] ASC)
);
GO
/****** Tabla SUCURSAL ******/
CREATE TABLE [ANONIMOUS].[SUCURSAL] (
	[SUC_ID]     [decimal](18, 0) IDENTITY(2,1) NOT NULL,
	[SUC_MAIL]   [nvarchar](255)  NOT NULL,
	[SUC_TEL]    [decimal](18, 0) NOT NULL,
	[SUC_DIR]    [nvarchar](255)  NOT NULL,
	[SUC_CIUDAD] [decimal](18, 0) NOT NULL,
	CONSTRAINT [PK_Sucursal] PRIMARY KEY ([SUC_ID] ASC)
);
GO
/****** Tabla CLIENTE ******/
CREATE TABLE [ANONIMOUS].[CLIENTE] (
	[CLI_ID]        [decimal](18, 0) IDENTITY(1,1) NOT NULL UNIQUE,
	[CLI_DNI]       [decimal](18, 0) NOT NULL,
	[CLI_APELLIDO]	[nvarchar](255)  NOT NULL,
	[CLI_NOMBRE]    [nvarchar](255)  NOT NULL,
	[CLI_DIR]       [nvarchar](255)  NOT NULL,
	[CLI_FEC_NAC]   [datetime2](3)   NOT NULL,
	[CLI_MAIL]      [nvarchar](255)  NOT NULL,
	[CLI_TEL]       [int]            NOT NULL,
	CONSTRAINT [PK_Cliente] PRIMARY KEY ([CLI_ID] ASC, 
	                                     [CLI_DNI] ASC)
);
GO
/****** Tabla COMPRA ******/
CREATE TABLE [ANONIMOUS].[COMPRA] (
	[COMPRA_NUM]		[decimal](18, 0) NOT NULL, 
	[COMPRA_PRECIO_TOT] [decimal](18, 2) NOT NULL, 
	[COMPRA_SUC]		[decimal](18, 0) NOT NULL, 
	[COMPRA_FECHA]		[datetime2](3)   NOT NULL, 
	CONSTRAINT [PK_Compra] PRIMARY KEY ([COMPRA_NUM] ASC)
);
GO
/****** Tabla ITEM_COMPRA ******/
CREATE TABLE [ANONIMOUS].[ITEM_COMPRA] (
	[ITEM_COM_NUM]    [decimal](18, 0) NOT NULL, 
	[ITEM_COM_PROD]   [decimal](18, 0) NOT NULL, 
	[ITEM_COM_PRECIO] [decimal](18, 2) NOT NULL, 
	[ITEM_COM_CANT]   [decimal](18, 0) NOT NULL, 
	CONSTRAINT [PK_Item_Compra] PRIMARY KEY ([ITEM_COM_NUM] ASC, 
	                                         [ITEM_COM_PROD] ASC)
);
GO
/****** Tabla TIPO_PROD ******/
CREATE TABLE [ANONIMOUS].[TIPO_PROD] (
	[T_PROD_ID]   [decimal](18, 0) NOT NULL IDENTITY, 
	[T_PROD_DESC] [nvarchar](255)  NOT NULL,
	CONSTRAINT [PK_Tipo_Prod] PRIMARY KEY ([T_PROD_ID] ASC)
);
GO
/****** Tabla TIPO_COMPONENTE ******/
CREATE TABLE [ANONIMOUS].[TIPO_COMPONENTE] (
	[T_COMP_ID]   [decimal](18, 0) NOT NULL IDENTITY, 
	[T_COMP_DESC] [nvarchar](255)  NOT NULL,
	CONSTRAINT [PK_Tipo_Componente] PRIMARY KEY ([T_COMP_ID] ASC)
);
GO
/****** Tabla TIPO_ACCESORIO ******/
CREATE TABLE [ANONIMOUS].[TIPO_ACCESORIO] (
	[T_ACC_ID]   [decimal](18, 0) IDENTITY(1001,1) NOT NULL, 
	[T_ACC_DESC] [nvarchar](255)  NOT NULL,
	CONSTRAINT [PK_Tipo_Accesorio] PRIMARY KEY ([T_ACC_ID] ASC)
);
GO
/****** Tabla FACTURA ******/
CREATE TABLE [ANONIMOUS].[FACTURA] (
	[FACT_NUM]        [decimal](18, 0) NOT NULL,
	[FACT_FECHA]      [datetime2](3)   NOT NULL,
	[FACT_SUC]        [decimal](18, 0) NOT NULL,
	[FACT_PRECIO_TOT] [decimal](18, 2) NOT NULL,
	[FACT_CLIENTE]    [decimal](18, 0) NOT NULL,
	CONSTRAINT [PK_Factura] PRIMARY KEY ([FACT_NUM] ASC)
);
GO
/****** Tabla ITEM_FACTURA ******/
CREATE TABLE [ANONIMOUS].[ITEM_FACTURA] (
	[ITEM_FACT_NUM]    [decimal](18, 0) NOT NULL, 
	[ITEM_FACT_PROD]   [decimal](18, 0) NOT NULL, 
	[ITEM_FACT_PRECIO] [decimal](18, 2) NOT NULL,
	[ITEM_FACT_CANT]   [decimal](18, 0) NOT NULL, 
	CONSTRAINT [PK_Item_Factura] PRIMARY KEY ([ITEM_FACT_NUM] ASC,
	                                          [ITEM_FACT_PROD] ASC)
);
GO
/****** Tabla COMPONENTE ******/
CREATE TABLE [ANONIMOUS].[COMPONENTE] (
	[COM_ID]               [decimal](18, 0) NOT NULL IDENTITY, 
	[COM_TIPO]             [decimal](18, 0) NOT NULL, 
	[COM_COD]              [nvarchar](255),
	[COM_TECNOLOGIA]       [nvarchar](255),
	[COM_CAPACIDAD]        [nvarchar](255),
	[COM_VELOCIDAD]        [nvarchar](255),
	[COM_FABRICANTE]       [nvarchar](255),
	[COM_MICRO_CANT_HILOS] [decimal](18, 0),
	[COM_MICRO_CACHE]	   [nvarchar](50),
	[COM_VIDEO_CHIPSET]    [nvarchar](50),
	[COM_VIDEO_MODELO]     [nvarchar](50),
	CONSTRAINT [PK_Componente] PRIMARY KEY ([COM_ID] ASC)	
);
GO
/****** Tabla PC ******/
CREATE TABLE [ANONIMOUS].[PC] (
	[PC_ID]         [decimal](18, 0) NOT NULL, 
	[PC_COMPONENTE] [decimal](18, 0) NOT NULL, 
	[PC_COD]        [nvarchar](50)   NOT NULL,
	[PC_ALTO]       [decimal](18, 2) NOT NULL,
	[PC_ANCHO]      [decimal](18, 2) NOT NULL,
	[PC_PROFUNDO]   [decimal](18, 2) NOT NULL,
    [PC_MOTHERBOARD] [nvarchar](255),
	CONSTRAINT [PK_PC] PRIMARY KEY ([PC_ID] ASC,
	                                [PC_COMPONENTE] ASC)
);
GO
/****** Tabla ACCESORIO ******/
CREATE TABLE [ANONIMOUS].[ACCESORIO] (
	[ACC_ID]         [decimal](18, 0) NOT NULL, 
	[ACC_CODIGO]     [decimal](18, 0) NOT NULL, 
	[ACC_DESC]       [nvarchar](255)  NOT NULL,
	[ACC_FABRICANTE] [nvarchar](255),
	CONSTRAINT [PK_Accesorio] PRIMARY KEY ([ACC_ID] ASC,
	                                       [ACC_CODIGO] ASC) 
);
GO
/****** Tabla PRODUCTO ******/
CREATE TABLE [ANONIMOUS].[PRODUCTO] (
	[PROD_ID]     [decimal](18, 0) NOT NULL IDENTITY UNIQUE, 
	[PROD_TIPO]   [decimal](18, 0) NOT NULL,
	[PROD_COD]    [nvarchar](50) NOT NULL, 
	[PROD_PRECIO] [decimal](18, 2) NOT NULL,
	CONSTRAINT [PK_Producto] PRIMARY KEY ([PROD_ID] ASC,
	                                      [PROD_TIPO] ASC)
);
GO
/****** Tabla STOCK ******/
CREATE TABLE [ANONIMOUS].[STOCK] (
	[STOCK_PROD]      [decimal](18, 0) NOT NULL,
	[STOCK_TIPO_PROD] [decimal](18, 0) NOT NULL,
	[STOCK_CANT]      [decimal](18, 0) NOT NULL,
	CONSTRAINT [PK_Stock] PRIMARY KEY ([STOCK_PROD] ASC,
	                                   [STOCK_TIPO_PROD] ASC)
);
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ FOREIGN KEYS -----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

----- FK SUCURSAL - SUC_CIUDAD -> CIUDAD_ID -----
ALTER TABLE [ANONIMOUS].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_Sucural_Ciudad] FOREIGN KEY([SUC_CIUDAD]) REFERENCES [ANONIMOUS].[CIUDAD] ([CIUDAD_ID])
GO
----- FK COMPRA - COMPRA_SUC -> SUC_ID ----- 
ALTER TABLE [ANONIMOUS].[COMPRA] WITH CHECK ADD CONSTRAINT [FK_Compra_Suc] FOREIGN KEY([COMPRA_SUC]) REFERENCES [ANONIMOUS].[SUCURSAL] ([SUC_ID])
GO
----- FK ITEM_COMPRA - ITEM_COM_NUM -> COMPRA_NUM ----- 
ALTER TABLE [ANONIMOUS].[ITEM_COMPRA] WITH CHECK ADD CONSTRAINT [FK_Item_Com_Num] FOREIGN KEY([ITEM_COM_NUM]) REFERENCES [ANONIMOUS].[COMPRA] ([COMPRA_NUM])
GO
----- FK FACTURA - FACT_SUC -> SUC_ID -----
ALTER TABLE [ANONIMOUS].[FACTURA]  WITH CHECK ADD CONSTRAINT [FK_Factura_Sucursal] FOREIGN KEY([FACT_SUC]) REFERENCES [ANONIMOUS].[SUCURSAL] ([SUC_ID])
GO
----- FK FACTURA - FACT_CLIENTE -> CLI_ID -----
ALTER TABLE [ANONIMOUS].[FACTURA]  WITH CHECK ADD CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([FACT_CLIENTE]) REFERENCES [ANONIMOUS].[CLIENTE] ([CLI_ID])
GO
----- FK ITEM_FACTURA - ITEM_FACT_NUM -> FACT_NUM -----
ALTER TABLE [ANONIMOUS].[ITEM_FACTURA] WITH CHECK ADD CONSTRAINT [FK_Item_Fact_Num] FOREIGN KEY([ITEM_FACT_NUM]) REFERENCES [ANONIMOUS].[FACTURA] ([FACT_NUM])
GO
----- FK COMPONENTE - COM_TIPO -> T_COMP_ID -----
ALTER TABLE [ANONIMOUS].[COMPONENTE] WITH CHECK ADD CONSTRAINT [FK_Componente_Tipo] FOREIGN KEY([COM_TIPO]) REFERENCES [ANONIMOUS].[TIPO_COMPONENTE] ([T_COMP_ID])
GO
----- FK PC - PC_COMPONENTE -> COM_ID -----
ALTER TABLE [ANONIMOUS].[PC] WITH CHECK ADD CONSTRAINT [FK_PC_Componente] FOREIGN KEY([PC_COMPONENTE]) REFERENCES [ANONIMOUS].[COMPONENTE] ([COM_ID])
GO
----- FK ACCESORIO - ACC_CODIGO -> T_ACC_ID -----
ALTER TABLE [ANONIMOUS].[ACCESORIO] WITH CHECK ADD CONSTRAINT [FK_Accesorio_Tipo] FOREIGN KEY([ACC_CODIGO]) REFERENCES [ANONIMOUS].[TIPO_ACCESORIO] ([T_ACC_ID])
GO
----- FK PRODUCTO - PROD_TIPO -> T_PROD_ID -----
ALTER TABLE [ANONIMOUS].[PRODUCTO] WITH CHECK ADD CONSTRAINT [FK_Prod_Tipo] FOREIGN KEY([PROD_TIPO]) REFERENCES [ANONIMOUS].[TIPO_PROD] ([T_PROD_ID])
GO
----- FK ACCESORIO - ACC_ID -> PROD_ID -----
ALTER TABLE [ANONIMOUS].[ACCESORIO] WITH CHECK ADD CONSTRAINT [FK_Accesorio_Prod] FOREIGN KEY([ACC_ID]) REFERENCES [ANONIMOUS].[PRODUCTO] ([PROD_ID])
GO
----- FK PC - PC_ID -> PROD_ID -----
ALTER TABLE [ANONIMOUS].[PC] WITH CHECK ADD CONSTRAINT [FK_PC_Prod] FOREIGN KEY([PC_ID]) REFERENCES [ANONIMOUS].[PRODUCTO] ([PROD_ID])
GO
----- FK ITEM_COMPRA - ITEM_COM_PROD -> PROD_ID -----
ALTER TABLE [ANONIMOUS].[ITEM_COMPRA] WITH CHECK ADD CONSTRAINT [FK_Item_Com_Prod] FOREIGN KEY([ITEM_COM_PROD]) REFERENCES [ANONIMOUS].[PRODUCTO] ([PROD_ID])
GO
----- FK ITEM_FACTURA - ITEM_FACT_PROD -> PROD_ID -----
ALTER TABLE [ANONIMOUS].[ITEM_FACTURA] WITH CHECK ADD CONSTRAINT [FK_Item_Fact_Prod] FOREIGN KEY([ITEM_FACT_PROD]) REFERENCES [ANONIMOUS].[PRODUCTO] ([PROD_ID])
GO
----- FK STOCK - STOCK_PROD -> PROD_ID -----
ALTER TABLE [ANONIMOUS].[STOCK] WITH CHECK ADD CONSTRAINT [FK_StockI_ProdI] FOREIGN KEY([STOCK_PROD]) REFERENCES [ANONIMOUS].[PRODUCTO] ([PROD_ID])
GO
----- FK STOCK - STOCK_TIPO_PROD -> PROD_TIPO -----
ALTER TABLE [ANONIMOUS].[STOCK] WITH CHECK ADD CONSTRAINT [FK_StockT_ProdT] FOREIGN KEY([STOCK_TIPO_PROD]) REFERENCES [ANONIMOUS].[TIPO_PROD] ([T_PROD_ID])
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ CARGA DE DATOS ---------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/****** Load CIUDAD ******/
INSERT INTO [ANONIMOUS].[CIUDAD] 
SELECT DISTINCT [CIUDAD]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE [CIUDAD] IS NOT NULL
ORDER BY [CIUDAD];
GO

/****** Load SUCURSAL ******/
INSERT INTO [ANONIMOUS].[SUCURSAL] 
SELECT DISTINCT [SUCURSAL_MAIL],
                [SUCURSAL_TEL],
				[SUCURSAL_DIR],
				(SELECT [CIUDAD_ID] FROM [ANONIMOUS].[CIUDAD] WHERE [CIUDAD_NOMBRE] = [gd_esquema].[Maestra].[CIUDAD])
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE [SUCURSAL_MAIL] IS NOT NULL
ORDER BY [SUCURSAL_MAIL];
GO

/****** Load CLIENTE ******/
INSERT INTO [ANONIMOUS].[CLIENTE] 
SELECT DISTINCT [CLIENTE_DNI],
                [CLIENTE_APELLIDO],
				[CLIENTE_NOMBRE],
				[CLIENTE_DIRECCION],
				[CLIENTE_FECHA_NACIMIENTO],
				[CLIENTE_MAIL],
				[CLIENTE_TELEFONO]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE [CLIENTE_DNI] IS NOT NULL
ORDER BY [CLIENTE_DNI];
GO

/****** Load TIPO_PROD ******/
INSERT INTO [ANONIMOUS].[TIPO_PROD] ([T_PROD_DESC])
VALUES ('PC'),
	   ('ACCESORIO');
GO

/****** Load TIPO_COMPONENTE ******/
INSERT INTO [ANONIMOUS].[TIPO_COMPONENTE] ([T_COMP_DESC])
VALUES ('DISCO RIGIDO'),
	   ('MEMORIA RAM'),
	   ('MICROPROCESADOR'),
	   ('PLACA VIDEO');
GO

/****** Load TIPO_ACCESORIO ******/
INSERT INTO [ANONIMOUS].[TIPO_ACCESORIO] 
VALUES ('MOUSE'),
	   ('TECLADO'),
	   ('PARLANTES'),
	   ('MICROFONO');
GO


/****** Load COMPONENTE ******/
--DISCO RIGIDO
INSERT INTO [ANONIMOUS].[COMPONENTE] ([COM_COD], [COM_TIPO], [COM_TECNOLOGIA], [COM_CAPACIDAD], [COM_VELOCIDAD], [COM_FABRICANTE] )
SELECT DISTINCT 
[DISCO_RIGIDO_CODIGO], 
1,
[DISCO_RIGIDO_TIPO], 
[DISCO_RIGIDO_CAPACIDAD],
[DISCO_RIGIDO_VELOCIDAD],
[DISCO_RIGIDO_FABRICANTE]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE DISCO_RIGIDO_CODIGO IS NOT NULL
GO

--MEMORIA RAM
INSERT INTO [ANONIMOUS].[COMPONENTE] ([COM_COD], [COM_TIPO], [COM_TECNOLOGIA], [COM_CAPACIDAD], [COM_VELOCIDAD], [COM_FABRICANTE] )
SELECT DISTINCT 
[MEMORIA_RAM_CODIGO], 
2,
[MEMORIA_RAM_TIPO], 
[MEMORIA_RAM_CAPACIDAD],
[MEMORIA_RAM_VELOCIDAD],
[MEMORIA_RAM_FABRICANTE]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE MEMORIA_RAM_CODIGO IS NOT NULL
GO

--MICROPROCESADOR
INSERT INTO [ANONIMOUS].[COMPONENTE] ([COM_COD], [COM_TIPO], [COM_MICRO_CACHE], [COM_MICRO_CANT_HILOS], [COM_VELOCIDAD], [COM_FABRICANTE] )
SELECT DISTINCT 
[MICROPROCESADOR_CODIGO], 
3,
[MICROPROCESADOR_CACHE], 
[MICROPROCESADOR_CANT_HILOS],
[MICROPROCESADOR_VELOCIDAD],
[MICROPROCESADOR_FABRICANTE]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE MICROPROCESADOR_CODIGO IS NOT NULL
GO

--PLACA VIDEO
INSERT INTO [ANONIMOUS].[COMPONENTE] ([COM_VIDEO_MODELO], [COM_TIPO], [COM_VIDEO_CHIPSET], [COM_VELOCIDAD], [COM_CAPACIDAD], [COM_FABRICANTE] )
SELECT DISTINCT 
[PLACA_VIDEO_MODELO], 
4,
[PLACA_VIDEO_CHIPSET], 
[PLACA_VIDEO_VELOCIDAD],
[PLACA_VIDEO_CAPACIDAD],
[PLACA_VIDEO_FABRICANTE]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE PLACA_VIDEO_MODELO IS NOT NULL
GO

/****** CREACION DE TRIGGER PRODUCTO ******/
CREATE TRIGGER [ANONIMOUS].[TR_INSERTAR_PRODUCTO_CARGA_INICIAL]
ON [ANONIMOUS].[PRODUCTO] 
AFTER INSERT
AS 
SET NOCOUNT ON
BEGIN	
	--ACCESORIO
	INSERT INTO [ANONIMOUS].[ACCESORIO]
	SELECT [I].[PROD_ID], 
	       [I].[PROD_COD], 
		   [M].[AC_DESCRIPCION], 
		   NULL
	FROM [INSERTED] [I]
	JOIN [GD_ESQUEMA].[MAESTRA] [M] ON [I].[PROD_COD] = [M].[ACCESORIO_CODIGO]	
	WHERE [PROD_TIPO] = 2
	GROUP BY [I].[PROD_ID], 
	         [M].[AC_DESCRIPCION], 
			 [I].[PROD_COD]

    --PC - DISCO RIGIDO
	INSERT INTO [ANONIMOUS].[PC]
	SELECT  [I].[PROD_ID], 
	       (SELECT [COM_ID] FROM [COMPONENTE] WHERE [COM_COD] = [M].[DISCO_RIGIDO_CODIGO]), 
	        [M].[PC_CODIGO],
			[M].[PC_ALTO],
			[M].[PC_ANCHO],
			[M].[PC_PROFUNDIDAD], 
			NULL
	FROM [INSERTED] [I]
	JOIN [GD_ESQUEMA].[MAESTRA] [M] ON [I].[PROD_COD] = [M].[PC_CODIGO]	
	WHERE [PROD_TIPO] = 1
	GROUP BY [I].[PROD_ID], 
	         [M].[PC_CODIGO], 
			 [M].[PC_ALTO], 
			 [M].[PC_ANCHO], 
			 [M].[PC_PROFUNDIDAD], 
			 [M].[DISCO_RIGIDO_CODIGO]

    --PC - MEMORIA RAM
	INSERT INTO [ANONIMOUS].[PC]
	SELECT  [I].[PROD_ID],
	       (SELECT [COM_ID] FROM [COMPONENTE] WHERE [COM_COD] = [M].[MEMORIA_RAM_CODIGO]), 
	        [M].[PC_CODIGO],
			[M].[PC_ALTO],
			[M].[PC_ANCHO],
			[M].[PC_PROFUNDIDAD], 
			NULL
	FROM [INSERTED] [I]
	JOIN [GD_ESQUEMA].[MAESTRA] [M] ON [I].[PROD_COD] = [M].[PC_CODIGO]	
	WHERE [PROD_TIPO] = 1
	GROUP BY [I].[PROD_ID], 
	         [M].[PC_CODIGO], 
			 [M].[PC_ALTO], 
			 [M].[PC_ANCHO], 
			 [M].[PC_PROFUNDIDAD], 
			 [M].[MEMORIA_RAM_CODIGO]

    --PC - MICROPROCESADOR
	INSERT INTO [ANONIMOUS].[PC]
	SELECT  [I].[PROD_ID],
	       (SELECT [COM_ID] FROM [COMPONENTE] WHERE [COM_COD] = [M].[MICROPROCESADOR_CODIGO]), 
	        [M].[PC_CODIGO],
			[M].[PC_ALTO],
			[M].[PC_ANCHO],
			[M].[PC_PROFUNDIDAD], 
			NULL
	FROM [INSERTED] [I]
	JOIN [GD_ESQUEMA].[MAESTRA] M ON [I].[PROD_COD] = [M].[PC_CODIGO]	
	WHERE [PROD_TIPO] = 1
	GROUP BY [I].[PROD_ID], 
	         [M].[PC_CODIGO], 
			 [M].[PC_ALTO], 
			 [M].[PC_ANCHO], 
			 [M].[PC_PROFUNDIDAD], 
			 [M].[MICROPROCESADOR_CODIGO]

    --PC - PLACA VIDEO
	INSERT INTO [ANONIMOUS].[PC]
	SELECT  [I].[PROD_ID],
	       (SELECT [COM_ID] FROM [COMPONENTE] WHERE [COM_VIDEO_CHIPSET] = [M].[PLACA_VIDEO_CHIPSET]), 
	        [M].[PC_CODIGO],
			[M].[PC_ALTO],
			[M].[PC_ANCHO],
			[M].[PC_PROFUNDIDAD], 
			NULL
	FROM [INSERTED] [I]
	JOIN [GD_ESQUEMA].[MAESTRA] M ON [I].[PROD_COD] = [M].[PC_CODIGO]	
	WHERE [PROD_TIPO] = 1
	GROUP BY [I].[PROD_ID], 
	         [M].[PC_CODIGO], 
			 [M].[PC_ALTO], 
			 [M].[PC_ANCHO], 
			 [M].[PC_PROFUNDIDAD], 
			 [M].[PLACA_VIDEO_CHIPSET]
END
GO

/****** Load PRODUCTO  ******/
INSERT INTO [ANONIMOUS].[PRODUCTO] 
--PRODUCTO - PC
SELECT (CASE WHEN [PC_CODIGO] IS NOT NULL THEN 1 ELSE 2 END) [PROD_TIPO],
       [PC_CODIGO] PROD_COD,
       [COMPRA_PRECIO]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE [COMPRA_NUMERO] IS NOT NULL
  AND [PC_CODIGO]     IS NOT NULL
GROUP BY [PC_CODIGO], 
         [COMPRA_PRECIO]
UNION 
--PRODUCTO - ACCESORIO
SELECT (CASE WHEN [ACCESORIO_CODIGO] IS NOT NULL THEN 2 ELSE 1 END) [PROD_TIPO],
        CAST([ACCESORIO_CODIGO] AS [nvarchar](255)) [PROD_COD],
        [COMPRA_PRECIO]
FROM [GD1C2021].[gd_esquema].[Maestra]
WHERE [COMPRA_NUMERO]    IS NOT NULL
  AND [ACCESORIO_CODIGO] IS NOT NULL
GROUP BY [ACCESORIO_CODIGO], 
         [COMPRA_PRECIO],
		 [AC_DESCRIPCION]
GO

/****** Load COMPRA ******/
INSERT INTO [ANONIMOUS].[COMPRA]
SELECT [COMPRAS].[COMPRA_NUMERO],
       SUM([COMPRAS].[COMPRA_CANTIDAD] * [COMPRAS].[COMPRA_PRECIO]), --COMPRA_PRECIO_TOT
	   SUBSTRING([COMPRAS].[SUCURSAL_MAIL], 12, 1), --COMPRA_SUC
	   [COMPRAS].[COMPRA_FECHA]
FROM
 (SELECT DISTINCT [COMPRA_NUMERO],
                  [COMPRA_CANTIDAD],
				  [COMPRA_PRECIO],
				  [SUCURSAL_MAIL],
				  [COMPRA_FECHA]
    FROM [GD_ESQUEMA].[MAESTRA]
   WHERE [COMPRA_NUMERO] IS NOT NULL) AS [COMPRAS] -- TODAS LAS PC COMPRADAS
GROUP BY [COMPRAS].[COMPRA_NUMERO],
         SUBSTRING([COMPRAS].[SUCURSAL_MAIL], 12, 1),
	     [COMPRAS].[COMPRA_FECHA]
ORDER BY [COMPRAS].[COMPRA_NUMERO];
GO

/****** Load ITEM_COMPRA ******/
INSERT INTO [ANONIMOUS].[ITEM_COMPRA]
--COMPRA - ACCESORIO
SELECT [ACC2].[COMPRA_NUMERO],
       (SELECT [ACC_ID] FROM [ANONIMOUS].[ACCESORIO] WHERE [ACC_CODIGO] = [ACC2].[ACCESORIO_CODIGO]), --ITEM_COMP_PROD
	   [ACC2].[COMPRA_PRECIO],
	   [ACC2].[CANTIDAD]
FROM
(SELECT [ACC1].[COMPRA_NUMERO],
        [ACC1].[ACCESORIO_CODIGO],
	    [ACC1].[COMPRA_PRECIO],
	    SUM([ACC1].[COMPRA_CANTIDAD]) AS [CANTIDAD]
FROM
(SELECT DISTINCT [COMPRA_NUMERO],
                 [ACCESORIO_CODIGO],
				 [COMPRA_PRECIO],
				 [COMPRA_CANTIDAD]
            FROM [gd_esquema].[Maestra]
           WHERE [COMPRA_NUMERO]    IS NOT NULL
             AND [ACCESORIO_CODIGO] IS NOT NULL) AS [ACC1] --> TODOS LOS ACCESORIOS COMPRADOS
GROUP BY [ACC1].[COMPRA_NUMERO],
         [ACC1].[ACCESORIO_CODIGO],
         [ACC1].[COMPRA_PRECIO]) AS [ACC2] --> TODOS LOS ACCESORIOS COMPRADOS MAS SUMA DE CANTIDAD
UNION
--COMPRA - PC
SELECT DISTINCT [COMPRA_NUMERO],
               (SELECT [PROD_ID] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = [PC_CODIGO]),  --ITEM_COMP_PROD
				[COMPRA_PRECIO],
				[COMPRA_CANTIDAD]
           FROM [gd_esquema].[Maestra]
          WHERE [COMPRA_NUMERO] IS NOT NULL
            AND [PC_CODIGO]     IS NOT NULL
ORDER BY 1;
GO

---------------------------------------------------------------------------------- 
/****** Load FACTURA ******/
INSERT INTO [ANONIMOUS].[FACTURA]
 SELECT [VENTAS].[FACTURA_NUMERO],
        [VENTAS].[FACTURA_FECHA],
		CAST([VENTAS].[SUC] AS decimal(18,0)),
		SUM([VENTAS].[PRECIO]),  --FACT_PRECIO_TOT
		[VENTAS].[CLIENTE]
 FROM
 (SELECT DISTINCT [FACTURA_NUMERO],
                  [FACTURA_FECHA],
				  [SUCURSAL_MAIL],
				  SUBSTRING([SUCURSAL_MAIL], 12, 1) SUC,
				  CASE WHEN [PC_CODIGO] IS NULL THEN (SELECT [PROD_PRECIO] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = CAST([ACCESORIO_CODIGO] AS VARCHAR(50))) * 1.2
				                                ELSE (SELECT [PROD_PRECIO] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = [PC_CODIGO]) * 1.2 
					   END AS [PRECIO], --PRECIO UNITARIO
				  (SELECT [CLI_ID] FROM [ANONIMOUS].[CLIENTE] WHERE [CLIENTE_DNI] = [CLI_DNI] AND [CLIENTE_FECHA_NACIMIENTO] = [CLI_FEC_NAC]) AS [CLIENTE],
				  [CLIENTE_DNI],
				  [CLIENTE_FECHA_NACIMIENTO]
    FROM [GD_ESQUEMA].[MAESTRA]
   WHERE [FACTURA_NUMERO] IS NOT NULL ) AS [VENTAS]  --TODAS LAS VENTAS REALIZADAS
GROUP BY [VENTAS].[FACTURA_NUMERO],
        [VENTAS].[FACTURA_FECHA],
		[VENTAS].[SUC],
		[VENTAS].[CLIENTE]
ORDER BY [VENTAS].[FACTURA_NUMERO],
         [VENTAS].[FACTURA_FECHA];
GO

---------------------------------------------------------------------------------- 
/****** Load ITEM_FACTURA ******/
INSERT INTO [ANONIMOUS].[ITEM_FACTURA]
 SELECT [VENTAS].[FACTURA_NUMERO],
		[VENTAS].[PRODUCTO],
		[VENTAS].[PRECIO],
		COUNT(*)  --ITEM_FACT_CANT
 FROM
(SELECT DISTINCT [FACTURA_NUMERO],
				  CASE WHEN [PC_CODIGO] IS NULL THEN (SELECT [PROD_ID] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = CAST([ACCESORIO_CODIGO] AS VARCHAR(50)))
				                                ELSE (SELECT [PROD_ID] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = [PC_CODIGO])
					   END AS [PRODUCTO],  --ITEM_FACT_PROD
				  CASE WHEN [PC_CODIGO] IS NULL THEN (SELECT [PROD_PRECIO] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = CAST([ACCESORIO_CODIGO] AS VARCHAR(50))) * 1.2
				                                ELSE (SELECT [PROD_PRECIO] FROM [ANONIMOUS].[PRODUCTO] WHERE [PROD_COD] = [PC_CODIGO]) * 1.2 
					   END AS [PRECIO]     --ITEM_FACT_PRECIO
    FROM [GD_ESQUEMA].[MAESTRA]
   WHERE [FACTURA_NUMERO] IS NOT NULL) AS [VENTAS] --TODAS LAS VENTAS REALIZADAS
GROUP BY [VENTAS].[FACTURA_NUMERO],
		 [VENTAS].[PRODUCTO],
		 [VENTAS].[PRECIO]
ORDER BY [VENTAS].[FACTURA_NUMERO],
		 [VENTAS].[PRODUCTO];
GO

-------------------------------------------------------------------
/****** Load STOCK ******/
INSERT INTO [ANONIMOUS].[STOCK]
SELECT [SVENT].[PROD_ID],
       [SVENT].[PROD_TIPO],
	   [SCOMP].[STOCK] - [SVENT].[STOCK] --STOCK_CANT
FROM
(SELECT [PROD_ID],
        [PROD_TIPO],
        SUM(ITEM_COM_CANT) STOCK
   FROM [ANONIMOUS].[PRODUCTO], 
        [ANONIMOUS].[ITEM_COMPRA]
  WHERE [PROD_ID] = [ITEM_COM_PROD]
  GROUP BY [PROD_ID],
           [PROD_TIPO]) AS [SCOMP] --STOCK DE COMPRAS
,
(SELECT [PROD_ID],
        [PROD_TIPO],
		SUM(ITEM_FACT_CANT) STOCK
   FROM [ANONIMOUS].[PRODUCTO], 
        [ANONIMOUS].[ITEM_FACTURA]
  WHERE [PROD_ID] = [ITEM_FACT_PROD]
  GROUP BY [PROD_ID],
           [PROD_TIPO]) AS [SVENT] --STOCK DE VENTAS
WHERE [SCOMP].[PROD_ID]   = [SVENT].[PROD_ID]
  AND [SCOMP].[PROD_TIPO] = [SVENT].[PROD_TIPO]
ORDER BY [SVENT].[PROD_ID],
       [SVENT].[PROD_TIPO];
GO