USE [master]
GO
/****** Object:  Database [onlineshopping]    Script Date: 6/2/2021 1:27:06 PM ******/
CREATE DATABASE [onlineshopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineshopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\onlineshopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onlineshopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\onlineshopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [onlineshopping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineshopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineshopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineshopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineshopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineshopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineshopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineshopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineshopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineshopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineshopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineshopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineshopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineshopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineshopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineshopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineshopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [onlineshopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineshopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineshopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineshopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineshopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineshopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineshopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineshopping] SET RECOVERY FULL 
GO
ALTER DATABASE [onlineshopping] SET  MULTI_USER 
GO
ALTER DATABASE [onlineshopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineshopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineshopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineshopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onlineshopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [onlineshopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'onlineshopping', N'ON'
GO
ALTER DATABASE [onlineshopping] SET QUERY_STORE = OFF
GO
USE [onlineshopping]
GO
/****** Object:  User [sb]    Script Date: 6/2/2021 1:27:06 PM ******/
CREATE USER [sb] FOR LOGIN [sb] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[address]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[address_line_one] [varchar](100) NULL,
	[address_line_two] [varchar](100) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](20) NULL,
	[country] [varchar](20) NULL,
	[postal_code] [varchar](10) NULL,
	[is_billing] [bit] NULL,
	[is_shipping] [bit] NULL,
 CONSTRAINT [pk_address_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[grand_total] [decimal](10, 2) NULL,
	[cart_lines] [int] NULL,
 CONSTRAINT [pk_cart_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_line]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_line](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[total] [decimal](10, 2) NULL,
	[product_id] [int] NULL,
	[product_count] [int] NULL,
	[buying_price] [decimal](10, 2) NULL,
	[is_available] [bit] NULL,
 CONSTRAINT [pk_cartline_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[image_url] [varchar](50) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [pk_category_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_total] [decimal](10, 2) NULL,
	[order_count] [int] NULL,
	[shipping_id] [int] NULL,
	[billing_id] [int] NULL,
	[order_date] [date] NULL,
 CONSTRAINT [pk_order_detail_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[total] [decimal](10, 2) NULL,
	[product_id] [int] NULL,
	[product_count] [int] NULL,
	[buying_price] [decimal](10, 2) NULL,
 CONSTRAINT [pk_order_item_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](20) NULL,
	[name] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[description] [varchar](255) NULL,
	[unit_price] [decimal](10, 2) NULL,
	[quantity] [int] NULL,
	[is_active] [bit] NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
	[purchases] [int] NULL,
	[views] [int] NULL,
 CONSTRAINT [pk_product_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_detail]    Script Date: 6/2/2021 1:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[last_name] [varchar](50) NULL,
	[role] [varchar](50) NULL,
	[enabled] [bit] NULL,
	[password] [varchar](60) NULL,
	[email] [varchar](100) NULL,
	[contact_number] [varchar](15) NULL,
 CONSTRAINT [pk_user_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [purchases]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [fk_address_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_detail] ([id])
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [fk_address_user_id]
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD  CONSTRAINT [fk_cart_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_detail] ([id])
GO
ALTER TABLE [dbo].[cart] CHECK CONSTRAINT [fk_cart_user_id]
GO
ALTER TABLE [dbo].[cart_line]  WITH CHECK ADD  CONSTRAINT [fk_cartline_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart_line] CHECK CONSTRAINT [fk_cartline_product_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_billing_id] FOREIGN KEY([billing_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_order_detail_billing_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_shipping_id] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_order_detail_shipping_id]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [fk_order_detail_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[user_detail] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [fk_order_detail_user_id]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [fk_order_item_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[order_detail] ([id])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [fk_order_item_order_id]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [fk_order_item_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [fk_order_item_product_id]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_product_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_product_category_id]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_product_supplier_id] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[user_detail] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_product_supplier_id]
GO
USE [master]
GO
ALTER DATABASE [onlineshopping] SET  READ_WRITE 
GO
