USE [master]
GO
/****** Object:  Database [Staging_DB]    Script Date: 6/27/2024 1:42:07 PM ******/
CREATE DATABASE [Staging_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Staging_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Staging_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Staging_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Staging_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Staging_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staging_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staging_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staging_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staging_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staging_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staging_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staging_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staging_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staging_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staging_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staging_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staging_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staging_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staging_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staging_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staging_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staging_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staging_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staging_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staging_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staging_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staging_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staging_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staging_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Staging_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Staging_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staging_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staging_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staging_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Staging_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Staging_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Staging_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Staging_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Staging_DB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/27/2024 1:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_No] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Salary] [varchar](50) NULL,
	[LocationID] [varchar](50) NULL,
	[Company] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[RecordCreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 6/27/2024 1:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [varchar](50) NULL,
	[HotelName] [varchar](50) NULL,
	[HotelCategory] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Address] [varchar](255) NULL,
	[Coordinates] [varchar](255) NULL,
	[RecordCreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 6/27/2024 1:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogNumber] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[LogDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/27/2024 1:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](50) NULL,
	[PName] [varchar](50) NULL,
	[SID] [varchar](50) NULL,
	[RecordCreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/27/2024 1:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [varchar](50) NULL,
	[CompanyName] [varchar](50) NULL,
	[RecordCreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'100', N'Mahesh', N'12/1/1965', N'Male', N'30000', N'1', N'ABC Pvt. Ltd.', N'Noida', N'UP', N'abc.pqr@gmail.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'105', N'Sunita', N'12/1/1958', N'Female', N'60000', N'1', N'ABC Pvt. Ltd.', N'Noida', N'UP', N'abc.pqr@gmail.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'102', N'Anurag', N'12/21/1969', N'Male', N'38000', N'2', N'PQR Pvt. Ltd.', N'Dehradun', N'UK', N'pqr220@mycompany.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'103', N'AJAY', N'12/1/1961', N'Male', N'40000', N'3', N'TTT Solutons Ltd.', N'Shimla', N'HP', N'info@tttsolutions.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'104', N'Neha', N'12/1/1971', N'Female', N'19000', N'3', N'TTT Solutons Ltd.', N'Shimla', N'HP', N'info@tttsolutions.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'107', N'Anil', N'12/29/1963', N'Male', N'45000', N'3', N'TTT Solutons Ltd.', N'Shimla', N'HP', N'info@tttsolutions.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'101', N'Suresh', N'11/14/1963', N'Male', N'34000', N'4', N'AAA Solutons Ltd.', N'Bhopal', N'MP', N'info@aaasolutions.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
INSERT [dbo].[Employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [LocationID], [Company], [City], [State], [Email], [RecordCreatedDate]) VALUES (N'106', N'Amar', N'12/12/1978', N'Male', N'45000', N'4', N'AAA Solutons Ltd.', N'Bhopal', N'MP', N'info@aaasolutions.com', CAST(N'2024-06-27T13:20:42.893' AS DateTime))
GO
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'1', N'Good Night Hotel and Residence', N'4 Star', N'Toronto', N'Canada', N'1 ABC City Center', N'43.623409,-79.368683', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'2', N'Pink Hotel Toronto', N'3 Star', N'Toronto', N'Canada', N'999 Kingsway Road', N'43.623409,-79.368683', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'3', N'Tourist In', N'2 Star', N'Chicago', N'USA', N'ZZZ Broadway', N'41.881832,-87.623177', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'4', N'City Center Hotel', N'4 Star', N'New York', N'USA', N'SSS Avenue', N'40.73061,-73.935242', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'5', N'Venus  In', N'3 Star', N'Adelaide', N'Australia', N'XXX Lake Avenue', N'-34.92123,138.599503', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'6', N'Stoppage Inn Express & Suits', N'3 Star', N'Reno', N'USA', N'11 Knowledge Villa', N'39.530895,-119.814972', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'7', N'Beach Hotel', N'4 Star', N'Miami', N'USA', N'12 BroadWay Drive', N'25.778135,-80.1791', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'8', N'Traditional Hut Hotel', N'3 Star', N'Munnar', N'India', N'ZZZ Village Drive', N'10.089167,7.059723', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'9', N'Big Ocean Hotel', N'4 Star', N'Miami', N'USA', N'AAA Beach Street', N'25.778135,-80.1791', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
INSERT [dbo].[Hotel] ([HotelID], [HotelName], [HotelCategory], [City], [Country], [Address], [Coordinates], [RecordCreatedDate]) VALUES (N'10', N'Entertainment Hotel', N'5 Star', N'Los Angeles', N'USA', N'BBB WestWood', N'34.052235,-118.243683', CAST(N'2024-06-27T13:20:43.163' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([LogNumber], [Description], [LogDate]) VALUES (1, N'Sharing folder is empty today', CAST(N'2024-06-27T13:21:00.667' AS DateTime))
INSERT [dbo].[Logs] ([LogNumber], [Description], [LogDate]) VALUES (2, N'ProcessFolder is empty', CAST(N'2024-06-27T13:21:01.590' AS DateTime))
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'1', N'Keyboard', N'1', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'2', N'Monitor', N'2', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'3', N'AC', N'2', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'4', N'Bikes', N'3', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'5', N'Bulb', N'3', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
INSERT [dbo].[Product] ([ProductID], [PName], [SID], [RecordCreatedDate]) VALUES (N'6', N'Processor', N'7', CAST(N'2024-06-27T13:20:43.407' AS DateTime))
GO
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'1', N'TVSGold', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'2', N'LG', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'3', N'Bajaj', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'4', N'Maruti', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'5', N'Orient', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
INSERT [dbo].[Supplier] ([SupplierID], [CompanyName], [RecordCreatedDate]) VALUES (N'6', N'Tata', CAST(N'2024-06-27T13:20:43.640' AS DateTime))
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [RecordCreatedDate]
GO
ALTER TABLE [dbo].[Hotel] ADD  DEFAULT (getdate()) FOR [RecordCreatedDate]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [LogDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [RecordCreatedDate]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [RecordCreatedDate]
GO
USE [master]
GO
ALTER DATABASE [Staging_DB] SET  READ_WRITE 
GO
