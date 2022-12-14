USE [master]
GO
/****** Object:  Database [eCommerce]    Script Date: 12/12/2022 1:20:21 AM ******/
CREATE DATABASE [eCommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eCommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eCommerce.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eCommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\eCommerce_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eCommerce] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eCommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eCommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eCommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eCommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eCommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eCommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eCommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eCommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eCommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eCommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eCommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eCommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eCommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eCommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eCommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eCommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eCommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eCommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eCommerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [eCommerce] SET  MULTI_USER 
GO
ALTER DATABASE [eCommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eCommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eCommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eCommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [eCommerce] SET DELAYED_DURABILITY = DISABLED 
GO
USE [eCommerce]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[FavFlag] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Message] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Type] [nchar](10) NULL,
	[Percentage] [nchar](10) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_Offers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[Address] [nchar](10) NULL,
	[AddressDate] [nchar](10) NULL,
	[DeliveryDate] [date] NULL,
	[DeliveryInfo] [nchar](10) NULL,
	[Status] [nchar](10) NULL,
	[Payment] [float] NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Price] [float] NULL,
	[Stock] [int] NULL,
	[details] [text] NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/12/2022 1:20:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[Name] [nchar](10) NULL,
	[Password] [nchar](10) NULL,
	[Address_1] [text] NULL,
	[Address_2] [text] NULL,
	[Mobile] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[Privileges] [int] NULL,
	[OfferID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Orders]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Offers] FOREIGN KEY([OfferID])
REFERENCES [dbo].[Offers] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Offers]
GO
USE [master]
GO
ALTER DATABASE [eCommerce] SET  READ_WRITE 
GO
