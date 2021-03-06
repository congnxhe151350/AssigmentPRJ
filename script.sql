USE [XuatNhapHangHoa]
GO
/****** Object:  Table [dbo].[detailsPurchase]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailsPurchase](
	[detailsPurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[purchaseId] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_detailsPurchase] PRIMARY KEY CLUSTERED 
(
	[detailsPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[address] [nvarchar](50) NULL,
	[dateBuy] [nchar](10) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[totalkilos] [int] NULL,
	[imageUrl] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[purchaseId] [int] IDENTITY(1,1) NOT NULL,
	[supplierId] [int] NULL,
	[dateShipping] [datetime] NULL,
	[shippingCost] [decimal](18, 0) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_purchase] PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[supplierId] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[supplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/10/2022 2:48:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [int] NULL,
	[roleId] [int] NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[detailsPurchase] ON 

INSERT [dbo].[detailsPurchase] ([detailsPurchaseId], [productId], [purchaseId], [quantity], [price], [status]) VALUES (3, 3, 2, 100, CAST(9000 AS Decimal(18, 0)), 1)
INSERT [dbo].[detailsPurchase] ([detailsPurchaseId], [productId], [purchaseId], [quantity], [price], [status]) VALUES (4, 4, 2, 200, CAST(10000 AS Decimal(18, 0)), 1)
INSERT [dbo].[detailsPurchase] ([detailsPurchaseId], [productId], [purchaseId], [quantity], [price], [status]) VALUES (5, 5, 2, 100, CAST(11000 AS Decimal(18, 0)), 1)
INSERT [dbo].[detailsPurchase] ([detailsPurchaseId], [productId], [purchaseId], [quantity], [price], [status]) VALUES (6, 6, 3, 100, CAST(12000 AS Decimal(18, 0)), 1)
INSERT [dbo].[detailsPurchase] ([detailsPurchaseId], [productId], [purchaseId], [quantity], [price], [status]) VALUES (7, 7, 3, 200, CAST(10000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[detailsPurchase] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (1, 2, N'Thanh Xuan', N'2020-09-09', 1)
INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (2, 2, N'Tu Liem', N'2022-09-09', 1)
INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (9, 4, N'Ben Tre', N'2022-03-09', 1)
INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (10, 4, N'Ben Tre', N'2022-03-09', 1)
INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (11, 4, N'Ben Tre', N'2022-03-09', 1)
INSERT [dbo].[order] ([orderId], [userId], [address], [dateBuy], [status]) VALUES (12, 4, N'Ben Tre', N'2022-03-09', 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[orderDetails] ON 

INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (1, 3, CAST(10000 AS Decimal(18, 0)), 50, 1, 1)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (2, 4, CAST(30000 AS Decimal(18, 0)), 100, 1, 2)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (9, 3, CAST(10006 AS Decimal(18, 0)), 50, 1, 10)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (10, 7, CAST(23000 AS Decimal(18, 0)), 1, 1, 10)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (11, 4, CAST(30000 AS Decimal(18, 0)), 50, 1, 11)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (12, 7, CAST(23000 AS Decimal(18, 0)), 1, 1, 11)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (13, 4, CAST(30000 AS Decimal(18, 0)), 50, 1, 12)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (14, 7, CAST(23000 AS Decimal(18, 0)), 1, 1, 12)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (15, 3, CAST(10006 AS Decimal(18, 0)), 50, 1, 13)
INSERT [dbo].[orderDetails] ([orderDetailsId], [productId], [price], [quantity], [status], [orderId]) VALUES (16, 4, CAST(30000 AS Decimal(18, 0)), 1, 1, 13)
SET IDENTITY_INSERT [dbo].[orderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productId], [productName], [price], [totalkilos], [imageUrl], [status]) VALUES (3, N'Cu Sa', CAST(10006 AS Decimal(18, 0)), 123, N'cusa', N'1')
INSERT [dbo].[product] ([productId], [productName], [price], [totalkilos], [imageUrl], [status]) VALUES (4, N'Cu Rung', CAST(30000 AS Decimal(18, 0)), 200, N'rung', N'1')
INSERT [dbo].[product] ([productId], [productName], [price], [totalkilos], [imageUrl], [status]) VALUES (5, N'Cu Rieng', CAST(15000 AS Decimal(18, 0)), 400, N'curieng', N'1')
INSERT [dbo].[product] ([productId], [productName], [price], [totalkilos], [imageUrl], [status]) VALUES (6, N'Cu Nghe', CAST(20000 AS Decimal(18, 0)), 500, N'cunghe', N'1')
INSERT [dbo].[product] ([productId], [productName], [price], [totalkilos], [imageUrl], [status]) VALUES (7, N'Mang Tre', CAST(23000 AS Decimal(18, 0)), 140, N'mang', N'1')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[purchase] ON 

INSERT [dbo].[purchase] ([purchaseId], [supplierId], [dateShipping], [shippingCost], [status]) VALUES (2, 1, CAST(N'2020-03-09T00:00:00.000' AS DateTime), CAST(20000 AS Decimal(18, 0)), 1)
INSERT [dbo].[purchase] ([purchaseId], [supplierId], [dateShipping], [shippingCost], [status]) VALUES (3, 2, CAST(N'2022-02-19T00:00:00.000' AS DateTime), CAST(40000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[role] ([roleId], [roleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[supplier] ON 

INSERT [dbo].[supplier] ([supplierId], [fullname], [address], [phone], [status]) VALUES (1, N'Nghe Tuoi Ha Noi', N'Thanh Xuan', N'0329449555', 1)
INSERT [dbo].[supplier] ([supplierId], [fullname], [address], [phone], [status]) VALUES (2, N'Nong San Mien Bac', N'Tu Liem', N'0852600600', 1)
INSERT [dbo].[supplier] ([supplierId], [fullname], [address], [phone], [status]) VALUES (5, N'hao nguyen', N'Ben Tre', N'0337470726', 1)
SET IDENTITY_INSERT [dbo].[supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([UserID], [fullname], [address], [phone], [status], [roleId], [username], [password]) VALUES (1, N'Tran Van Admin', N'Thanh Xuan', N'0853677677', 1, 1, N'admin', N'admin')
INSERT [dbo].[user] ([UserID], [fullname], [address], [phone], [status], [roleId], [username], [password]) VALUES (2, N'Nguyen Van User', N'Hoa Lac', N'0939228999', 1, 2, N'user', N'user')
INSERT [dbo].[user] ([UserID], [fullname], [address], [phone], [status], [roleId], [username], [password]) VALUES (3, N'Tran Van Admin', N'Thanh Xuan', N'0853677677', 1, 1, N'2', N'2')
INSERT [dbo].[user] ([UserID], [fullname], [address], [phone], [status], [roleId], [username], [password]) VALUES (4, N'Nguyen Son Hao', N'Can Tho', N'0987654321', 1, 2, N'user1', N'123')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[detailsPurchase]  WITH CHECK ADD  CONSTRAINT [FK_detailsPurchase_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[detailsPurchase] CHECK CONSTRAINT [FK_detailsPurchase_product]
GO
ALTER TABLE [dbo].[detailsPurchase]  WITH CHECK ADD  CONSTRAINT [FK_detailsPurchase_purchase] FOREIGN KEY([purchaseId])
REFERENCES [dbo].[purchase] ([purchaseId])
GO
ALTER TABLE [dbo].[detailsPurchase] CHECK CONSTRAINT [FK_detailsPurchase_purchase]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_customer_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([roleId])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_customer_role]
GO
