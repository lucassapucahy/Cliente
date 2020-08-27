IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'db_Estudo')
	DROP DATABASE [db_Estudo]
GO

CREATE DATABASE [db_Estudo]  COLLATE SQL_Latin1_General_CP1_CI_AS
GO

use [db_Estudo]
GO

CREATE TABLE [dbo].[TB_BAIRRO] (
	[cod_bairro] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_bairro] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[cod_cidade] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_CIDADE] (
	[cod_cidade] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_cidade] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[cod_uf] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_CLIENTE] (
	[cod_cliente] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_cliente] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[dt_cadastramento] [datetime] NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[des_observacao] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_ENDERECO_CLIENTE] (
	[cod_cliente] [int] NOT NULL ,
	[cod_tipo_endereco] [int] NOT NULL ,
	[des_endereco] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_complemento] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[idt_caixa_postal] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[idt_cep] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NULL ,
	[des_observacao] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cod_bairro] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_GRUPO_ITEM] (
	[cod_grupo_item] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_grupo_item] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_grupo_item] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_ITEM] (
	[cod_item] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_item] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[cod_tipo_item] [int] NOT NULL ,
	[qtd_item] [decimal](10, 2) NOT NULL ,
	[qtd_minima_item] [decimal](10, 2) NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[cod_grupo_item] [int] NULL ,
	[dt_cadastramento] [datetime] NOT NULL ,
	[vlr_item] [decimal](10, 2) NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_STATUS_VENDA] (
	[cod_status_venda] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_status_venda] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_status_venda] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_TELEFONE_CLIENTE] (
	[cod_telefone_cliente] [int] IDENTITY (1, 1) NOT NULL ,
	[idt_num_telefone] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[idt_codigo_area] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[des_observacao] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cod_cliente] [int] NOT NULL ,
	[cod_tipo_telefone] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_TIPO_ENDERECO] (
	[cod_tipo_endereco] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_tipo_endereco] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_tipo_endereco] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_TIPO_ITEM] (
	[cod_tipo_item] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_tipo_item] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_tipo_item] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_TIPO_TELEFONE] (
	[cod_tipo_telefone] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_tipo_telefone] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_TIPO_VENDA] (
	[cod_tipo_venda] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_tipo_venda] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[des_tipo_venda] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_UF] (
	[cod_uf] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_uf] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[sgl_uf] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_VENDA] (
	[cod_venda] [int] IDENTITY (1, 1) NOT NULL ,
	[dt_cadastramento] [datetime] NULL ,
	[dt_venda] [datetime] NOT NULL ,
	[cod_status_venda] [int] NOT NULL ,
	[cod_tipo_venda] [int] NOT NULL ,
	[cod_vendedor] [int] NOT NULL ,
	[vlr_total_item] [decimal](10, 2) NOT NULL ,
	[vlr_total_desconto] [decimal](10, 2) NOT NULL ,
	[vlr_total_venda] [decimal](10, 2) NOT NULL ,
	[des_observacao] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cod_cliente] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_VENDA_ITEM] (
	[cod_venda_item] [int] IDENTITY (1, 1) NOT NULL ,
	[qtd_item] [decimal](10, 2) NULL ,
	[vlr_item] [decimal](10, 2) NULL ,
	[vlr_desconto] [decimal](10, 2) NULL ,
	[vlr_total_item] [decimal](10, 2) NULL ,
	[cod_item] [int] NOT NULL ,
	[cod_venda] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TB_VENDEDOR] (
	[cod_vendedor] [int] IDENTITY (1, 1) NOT NULL ,
	[nom_vendedor] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[fl_ativo] [bit] NOT NULL ,
	[dt_cadastramento] [datetime] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_BAIRRO] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_BAIRRO] PRIMARY KEY  CLUSTERED 
	(
		[cod_bairro]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_CIDADE] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_CIDADE] PRIMARY KEY  CLUSTERED 
	(
		[cod_cidade]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_CLIENTE] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_CLIENTE] PRIMARY KEY  CLUSTERED 
	(
		[cod_cliente]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_ENDERECO_CLIENTE] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_ENDERECO_CLIENTE] PRIMARY KEY  CLUSTERED 
	(
		[cod_cliente],
		[cod_tipo_endereco]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_GRUPO_ITEM] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_GRUPO_ITEM] PRIMARY KEY  CLUSTERED 
	(
		[cod_grupo_item]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_ITEM] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_ITEM] PRIMARY KEY  CLUSTERED 
	(
		[cod_item]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_STATUS_VENDA] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_STATUS_VENDA] PRIMARY KEY  CLUSTERED 
	(
		[cod_status_venda]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TELEFONE_CLIENTE] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_TELEFONE_CLIENTE] PRIMARY KEY  CLUSTERED 
	(
		[cod_telefone_cliente]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TIPO_ENDERECO] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_TIPO_ENDERECO] PRIMARY KEY  CLUSTERED 
	(
		[cod_tipo_endereco]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TIPO_ITEM] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_TIPO_ITEM] PRIMARY KEY  CLUSTERED 
	(
		[cod_tipo_item]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TIPO_TELEFONE] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_TIPO_TELEFONE] PRIMARY KEY  CLUSTERED 
	(
		[cod_tipo_telefone]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_TIPO_VENDA] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_TIPO_VENDA] PRIMARY KEY  CLUSTERED 
	(
		[cod_tipo_venda]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_UF] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_UF] PRIMARY KEY  CLUSTERED 
	(
		[cod_uf]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_VENDA] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_VENDA] PRIMARY KEY  CLUSTERED 
	(
		[cod_venda]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_VENDA_ITEM] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_VENDA_ITEM] PRIMARY KEY  CLUSTERED 
	(
		[cod_venda_item]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_VENDEDOR] WITH NOCHECK ADD 
	CONSTRAINT [XPKTB_VENDEDOR] PRIMARY KEY  CLUSTERED 
	(
		[cod_vendedor]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[TB_BAIRRO] ADD 
	CONSTRAINT [R_114] FOREIGN KEY 
	(
		[cod_cidade]
	) REFERENCES [dbo].[TB_CIDADE] (
		[cod_cidade]
	)
GO

ALTER TABLE [dbo].[TB_CIDADE] ADD 
	CONSTRAINT [R_113] FOREIGN KEY 
	(
		[cod_uf]
	) REFERENCES [dbo].[TB_UF] (
		[cod_uf]
	)
GO

ALTER TABLE [dbo].[TB_ENDERECO_CLIENTE] ADD 
	CONSTRAINT [R_116] FOREIGN KEY 
	(
		[cod_cliente]
	) REFERENCES [dbo].[TB_CLIENTE] (
		[cod_cliente]
	),
	CONSTRAINT [R_117] FOREIGN KEY 
	(
		[cod_tipo_endereco]
	) REFERENCES [dbo].[TB_TIPO_ENDERECO] (
		[cod_tipo_endereco]
	),
	CONSTRAINT [R_120] FOREIGN KEY 
	(
		[cod_bairro]
	) REFERENCES [dbo].[TB_BAIRRO] (
		[cod_bairro]
	)
GO

ALTER TABLE [dbo].[TB_ITEM] ADD 
	CONSTRAINT [R_125] FOREIGN KEY 
	(
		[cod_tipo_item]
	) REFERENCES [dbo].[TB_TIPO_ITEM] (
		[cod_tipo_item]
	),
	CONSTRAINT [R_126] FOREIGN KEY 
	(
		[cod_grupo_item]
	) REFERENCES [dbo].[TB_GRUPO_ITEM] (
		[cod_grupo_item]
	)
GO

ALTER TABLE [dbo].[TB_TELEFONE_CLIENTE] ADD 
	CONSTRAINT [R_118] FOREIGN KEY 
	(
		[cod_cliente]
	) REFERENCES [dbo].[TB_CLIENTE] (
		[cod_cliente]
	),
	CONSTRAINT [R_119] FOREIGN KEY 
	(
		[cod_tipo_telefone]
	) REFERENCES [dbo].[TB_TIPO_TELEFONE] (
		[cod_tipo_telefone]
	)
GO

ALTER TABLE [dbo].[TB_VENDA] ADD 
	CONSTRAINT [R_121] FOREIGN KEY 
	(
		[cod_status_venda]
	) REFERENCES [dbo].[TB_STATUS_VENDA] (
		[cod_status_venda]
	),
	CONSTRAINT [R_122] FOREIGN KEY 
	(
		[cod_tipo_venda]
	) REFERENCES [dbo].[TB_TIPO_VENDA] (
		[cod_tipo_venda]
	),
	CONSTRAINT [R_123] FOREIGN KEY 
	(
		[cod_vendedor]
	) REFERENCES [dbo].[TB_VENDEDOR] (
		[cod_vendedor]
	),
	CONSTRAINT [R_130] FOREIGN KEY 
	(
		[cod_cliente]
	) REFERENCES [dbo].[TB_CLIENTE] (
		[cod_cliente]
	)
GO

ALTER TABLE [dbo].[TB_VENDA_ITEM] ADD 
	CONSTRAINT [R_128] FOREIGN KEY 
	(
		[cod_item]
	) REFERENCES [dbo].[TB_ITEM] (
		[cod_item]
	),
	CONSTRAINT [R_129] FOREIGN KEY 
	(
		[cod_venda]
	) REFERENCES [dbo].[TB_VENDA] (
		[cod_venda]
	)
GO



--## stored procedures


USE [db_Estudo]
GO

/****** Object:  StoredProcedure [dbo].[Listar]    Script Date: 27/08/2020 03:34:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Listar]
AS
BEGIN
	SET NOCOUNT ON;
	select * from TB_CLIENTE
END
GO

/****** Object:  StoredProcedure [dbo].[InsereCliente]    Script Date: 27/08/2020 03:34:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsereCliente] 
	@nom_cliente varchar(255),
	@dt_cadastramento datetime,
	@fl_ativo bit,
	@des_observacao varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	insert into TB_CLIENTE (nom_cliente,dt_cadastramento,fl_ativo,des_observacao) values (@nom_cliente,@dt_cadastramento,@fl_ativo,@des_observacao);
END
GO


/****** Object:  StoredProcedure [dbo].[ExcluirCliente]    Script Date: 27/08/2020 03:34:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ExcluirCliente]
	@cod_cliente int
AS
BEGIN
	SET NOCOUNT ON;
	delete from TB_CLIENTE where cod_cliente = @cod_cliente
END
GO


/****** Object:  StoredProcedure [dbo].[BuscarPorId]    Script Date: 27/08/2020 03:34:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BuscarPorId]
	@cod_cliente int
AS
BEGIN
	SET NOCOUNT ON;
	select * from TB_CLIENTE where cod_cliente = @cod_cliente
END
GO


/****** Object:  StoredProcedure [dbo].[AtualizaCliente]    Script Date: 27/08/2020 03:34:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AtualizaCliente]
	@cod_cliente int,
	@nom_cliente varchar(255),
	@dt_cadastramento datetime,
	@fl_ativo bit,
	@des_observacao varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE 
		TB_CLIENTE 
	SET 
		nom_cliente = @nom_cliente,
		dt_cadastramento = @dt_cadastramento,
		fl_ativo = @fl_ativo,
		des_observacao = @des_observacao
	WHERE 
		COD_CLIENTE = @COD_CLIENTE
END
GO
