USE [master]
GO
/****** Object:  Database [TrialDB]    Script Date: 02/01/2019 1:56:00 PM ******/
CREATE DATABASE [TrialDB]

GO
ALTER DATABASE [TrialDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrialDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrialDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrialDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrialDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrialDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrialDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrialDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrialDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrialDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrialDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrialDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrialDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrialDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrialDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrialDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrialDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrialDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrialDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrialDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrialDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrialDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrialDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrialDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrialDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrialDB] SET  MULTI_USER 
GO
ALTER DATABASE [TrialDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrialDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrialDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrialDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrialDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TrialDB]
GO
/****** Object:  UserDefinedTableType [dbo].[SearchFilter]    Script Date: 02/01/2019 1:56:00 PM ******/
CREATE TYPE [dbo].[SearchFilter] AS TABLE(
	[LogId] [bigint] NULL,
	[UserTypeCode] [varchar](10) NULL,
	[UserId] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Name] [varchar](500) NULL,
	[Email] [varchar](50) NULL,
	[Status] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[VINNumber] [varchar](50) NULL,
	[MaintenanceCode] [varchar](20) NULL,
	[VehicleNo] [int] NULL,
	[PickUpDate] [datetime] NULL,
	[RRNumber] [varchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UserFilter]    Script Date: 02/01/2019 1:56:00 PM ******/
CREATE TYPE [dbo].[UserFilter] AS TABLE(
	[Id] [bigint] NOT NULL,
	[UserTypeId] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[WorkPhone] [varchar](50) NULL,
	[Gender] [int] NULL,
	[AccountStatus] [int] NULL,
	[AssignedRegionId] [bigint] NULL,
	[Createdby] [bigint] NULL,
	[UserTypeCode] [varchar](10) NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Users]    Script Date: 02/01/2019 1:56:00 PM ******/
CREATE TYPE [dbo].[Users] AS TABLE(
	[Id] [bigint] NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[WorkPhone] [varchar](50) NULL,
	[UserName] [nvarchar](100) NULL,
	[SaltKey] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[DefaultPassword] [bit] NULL,
	[LastLoginDate] [datetime] NULL,
	[IsOnLine] [bit] NULL,
	[AccountStatus] [int] NULL,
	[ReportingTo] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AssignedRegionId] [bigint] NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsNullOrWhiteSpace]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create FUNCTION [dbo].[fnIsNullOrWhiteSpace]
(
	@value nvarchar(max)
)
RETURNS bit
AS
BEGIN
Declare @status bit;
	
	if (@value IS NULL) 
		SET @status = 1;
	ELSE if (rtrim(ltrim(@value))='')
		SET @status = 1;
	ELSE 
		SET @status = 0;
	RETURN @status;
END



GO
/****** Object:  Table [dbo].[Course]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [bigint] NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
	[CurCountry] [int] NULL,
	[CurState] [int] NULL,
	[CurCity] [int] NULL,
	[CurZipCode] [varchar](50) NULL,
	[CurAddress1] [varchar](700) NULL,
	[CurAddress2] [varchar](700) NULL,
	[PerCountry] [int] NULL,
	[PerState] [int] NULL,
	[PerCity] [int] NULL,
	[PerZipCode] [varchar](50) NULL,
	[PerAddress1] [varchar](700) NULL,
	[PerAddress2] [varchar](700) NULL,
	[CostPerMile] [float] NULL,
	[CostPerMinute] [float] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserTypeId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[WorkPhone] [varchar](50) NULL,
	[UserName] [nvarchar](100) NULL,
	[SaltKey] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[DefaultPassword] [bit] NULL,
	[LastLoginDate] [datetime] NULL,
	[IsOnLine] [bit] NULL,
	[AccountStatus] [int] NULL,
	[ReportingTo] [bigint] NULL,
	[CreatedBy] [bigint] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AssignedRegionId] [bigint] NULL,
	[CountryCode] [varchar](10) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription]) VALUES (1, N'Hello', N'Hello')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription]) VALUES (4, N'Brajesh', N'Brajesh')
GO
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseDescription]) VALUES (6, N'Demo', N'Demo')
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (1, 1, N'DSB', N'Transport ', N'admin@admin.com', N'3154018187', NULL, NULL, NULL, N'64e1b8d34f425d19e1ee2ea7236d3028', 0, CAST(N'2019-02-01 11:24:59.083' AS DateTime), 1, 1, NULL, NULL, CAST(N'2018-01-31 23:40:11.900' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (2, 2, N'DSB', N'Driver', N'admin@admin1.com', N'3154018187', NULL, NULL, NULL, N'64e1b8d34f425d19e1ee2ea7236d3028', 0, CAST(N'2018-08-07 19:03:50.097' AS DateTime), 1, 1, 1, 1, CAST(N'2018-01-31 23:42:06.370' AS DateTime), 1, CAST(N'2018-05-30 13:31:29.527' AS DateTime), 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (1, N'Admin', N'Admin', CAST(N'2018-01-31 23:40:11.807' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (2, N'Driver', N'Driver', CAST(N'2018-01-31 23:40:11.883' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (3, N'Dispatcher', N'Dispatcher', CAST(N'2018-01-31 23:40:11.883' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (4, N'DataEntryOperator', N'DEO', CAST(N'2018-07-26 23:08:41.003' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (5, N'servicemaintenance', N'SM', CAST(N'2018-07-26 23:08:41.003' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (6, N'Assistant', N'Assistant', CAST(N'2018-07-26 23:08:41.003' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (7, N'Manager', N'Manager', CAST(N'2018-07-26 23:08:41.003' AS DateTime), 1)
GO
INSERT [dbo].[UserTypes] ([Id], [Name], [Code], [CreatedOn], [IsActive]) VALUES (9, N'ExternalDriver', N'ED', CAST(N'2018-09-13 23:08:41.003' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK__UserDetails__Users__Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK__UserDetails__Users__Id]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK__UserTypeId__UserType__Id] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK__UserTypeId__UserType__Id]
GO
/****** Object:  StoredProcedure [dbo].[spGetUsers]    Script Date: 02/01/2019 1:56:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spGetUsers]    
	@userFilters [dbo].[UserFilter] ReadOnly
    
AS 
    BEGIN
		--getting filter parameters
		Declare @Id [bigint]
		Declare @UserTypeId [nvarchar](100) = NULL
		Declare @Name [nvarchar](50)  = NULL
		Declare @Email [nvarchar](50)  = NULL
		Declare @WorkPhone [varchar](50) = NULL
		Declare @Gender [int]  = NULL
		Declare @AccountStatus [int]  = NULL
		Declare @AssignedRegionId [bigint]  = NULL
		Declare @Createdby [bigint]  = NULL
		Declare @loggedUserTypeCode [varchar](10)

		Select	@Id= [Id],
				@UserTypeId= [UserTypeId],
				@Name = [Name], 
				@Email = [Email],
				@WorkPhone = [WorkPhone],
				@Gender = [Gender],
				@AccountStatus = [AccountStatus],
				@AssignedRegionId = [AssignedRegionId] ,
				@Createdby = [Createdby],
				@loggedUserTypeCode = [UserTypeCode] 
		from @userFilters;


If ([dbo].[fnIsNullOrWhiteSpace](@Email) = 1)
	SET @Email = null;
If ([dbo].[fnIsNullOrWhiteSpace](@WorkPhone) = 1)
	SET @WorkPhone = null;
If ([dbo].[fnIsNullOrWhiteSpace](@UserTypeId) = 1)
	SET @UserTypeId = null;
If ([dbo].[fnIsNullOrWhiteSpace](@Name) = 1)
	SET @Name = null;


/* Build the Transact-SQL String with the input parameters */ 
Declare @temptable [Users]

CREATE table #UserTemp(
	[Id] [bigint] NOT NULL,
	[UserTypeId] bigint NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[UserName] [nvarchar](100)  NULL,
	[AccountStatus] int NULL,
	 [VINNumber] [nvarchar](100)  NULL,
	[Year][nvarchar](100)  NULL,
	[Model] [nvarchar](100)  NULL,
	[Make] [nvarchar](100)  NULL,
	[VehicleId] bigint null
	--[RegistrationNo] [nvarchar](50) NULL,
	--[InsuranceNo] [nvarchar](50) NULL,
)

if (@loggedUserTypeCode = 'Admin')
		  BEGIN

		  insert into #UserTemp ([Id],
											[UserTypeId],
											[FirstName],
											[LastName],
											[Email],
											[PhoneNumber],
											[UserName],
											[AccountStatus]
											)
		    select u.[Id],
											u.[UserTypeId],
											u.[FirstName],
											u.[LastName],
											u.[Email],
											u.[PhoneNumber],
											u.[UserName],
											u.[AccountStatus]
											--vehicle.[RegistrationNo],
											--vehicle.[InsuranceNo]
											 from Users u
		
			WHERE u.IsActive= 1 AND u.IsDeleted <> 1


		  END
	  ELSE
		  BEGIN
			if(@loggedUserTypeCode = 'Admin')
				BEGIN
						  insert into #UserTemp ([Id],
											[UserTypeId],
											[FirstName],
											[LastName],
											[Email],
											[PhoneNumber],
											[UserName],
											[AccountStatus]
											
											)
		    select u.[Id],
											u.[UserTypeId],
											u.[FirstName],
											u.[LastName],
											u.[Email],
											u.[PhoneNumber],
											u.[UserName],
										u.[AccountStatus]
											--vehicle.[RegistrationNo],
											--vehicle.[InsuranceNo]
											 from Users u
		
			WHERE u.IsActive= 1 AND u.IsDeleted <> 1

				END
			ELSE
				BEGIN
						  insert into #UserTemp ([Id],
											[UserTypeId],
											[FirstName],
											[LastName],
											[Email],
											[PhoneNumber],
											[UserName],
											[AccountStatus]
										
											)
		    select u.[Id],
											u.[UserTypeId],
											u.[FirstName],
											u.[LastName],
											u.[Email],
											u.[PhoneNumber],
											u.[UserName],
											u.[AccountStatus]
											--vehicle.[RegistrationNo],
											--vehicle.[InsuranceNo]
											 from Users u 
		
			WHERE u.IsActive= 1 AND u.IsDeleted <> 1
		
				END
			  
		
			END



Select * from #UserTemp As userData Where 1=1
AND (ISNULL(@Email,space(0)) = space(0) OR  userData.Email  = @Email )
AND (ISNULL(@AccountStatus,0) = 0 OR  userData.AccountStatus  = @AccountStatus)
AND (ISNULL(@UserTypeId,Space(0)) = Space(0) )--OR  userData.UserTypeId in(SELECT Id FROM [dbo].[fnSplitValues](@UserTypeId)))
AND (ISNULL(@Name,space(0)) = space(0) OR  (rtrim(ltrim(userData.FirstName)) like '%' + @Name + '%' or rtrim(ltrim(userData.LastName)) like '%' + @Name + '%' or rtrim(ltrim(userData.FirstName)) + SPACE(1) + rtrim(ltrim(userData.LastName)) like '%' + @name
 + '%' ) )

		--/* check for the condition and build the WHERE clause accordingly */	
		
END








GO
USE [master]
GO
ALTER DATABASE [TrialDB] SET  READ_WRITE 
GO
