USE [webservice]
GO
/****** Object:  StoredProcedure [dbo].[uspConsultarProduto]    Script Date: 11/02/2016 22:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspConsultarProduto]
@INintProdutoID INT = NULL,
@INvchDescricao VARCHAR(50) = NULL,
@INintProdutoCategoriaID INT = NULL

AS
BEGIN

SELECT 
Pro.ProdutoId,
Pro.Descricao AS DescProduto,
Pro.DataCadastro,
Pro.ProdutoCategoriaId,
ProCat.Descricao AS DescProdutoCategoria
FROM
Produto AS Pro
JOIN
ProdutoCategoria AS ProCat ON (Pro.ProdutoCategoriaId = ProCat.ProdutoCategoriaId)
WHERE
((Pro.ProdutoId = @INintProdutoID) OR (@INintProdutoID IS NULL)) AND
((Pro.Descricao LIKE '%'+@INvchDescricao+'%') OR (@INvchDescricao IS NULL)) AND
((Pro.ProdutoCategoriaId = @INintProdutoCategoriaID) OR (@INintProdutoCategoriaID IS NULL))
ORDER BY
Pro.Descricao
END

GO
/****** Object:  Table [dbo].[Produto]    Script Date: 11/02/2016 22:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[ProdutoId] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[ProdutoCategoriaId] [int] NULL,
	[DataCadastro] [datetime] NULL CONSTRAINT [DF_Produto_DataCadastro]  DEFAULT (getdate()),
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProdutoCategoria]    Script Date: 11/02/2016 22:55:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProdutoCategoria](
	[ProdutoCategoriaId] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
 CONSTRAINT [PK_ProdutoCategoria] PRIMARY KEY CLUSTERED 
(
	[ProdutoCategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Produto] ON 

INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (1, N'DELL VOSTRO', 1, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (2, N'HP ENVY', 1, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (3, N'MICROSOFT', 2, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (4, N'LOGITEC', 2, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (5, N'HP OFFICEJET', 3, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
INSERT [dbo].[Produto] ([ProdutoId], [Descricao], [ProdutoCategoriaId], [DataCadastro]) VALUES (6, N'HP LASERJET', 3, CAST(N'2016-01-24 14:26:55.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[Produto] OFF
SET IDENTITY_INSERT [dbo].[ProdutoCategoria] ON 

INSERT [dbo].[ProdutoCategoria] ([ProdutoCategoriaId], [Descricao]) VALUES (1, N'NOTEBOOKS')
INSERT [dbo].[ProdutoCategoria] ([ProdutoCategoriaId], [Descricao]) VALUES (2, N'TECLADOS')
INSERT [dbo].[ProdutoCategoria] ([ProdutoCategoriaId], [Descricao]) VALUES (3, N'IMPRESSORAS')
SET IDENTITY_INSERT [dbo].[ProdutoCategoria] OFF
ALTER TABLE [dbo].[Produto]  WITH CHECK ADD  CONSTRAINT [FK_Produto_ProdutoCategoria] FOREIGN KEY([ProdutoCategoriaId])
REFERENCES [dbo].[ProdutoCategoria] ([ProdutoCategoriaId])
GO
ALTER TABLE [dbo].[Produto] CHECK CONSTRAINT [FK_Produto_ProdutoCategoria]
GO
