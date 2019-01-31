USE [master]
GO
/****** Object:  Database [TrialDB]    Script Date: 01/30/2019 7:34:54 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 01/30/2019 7:34:55 PM ******/
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
-----

GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 01/31/2019 7:23:09 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01/31/2019 7:23:10 PM ******/
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 01/31/2019 7:23:10 PM ******/
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
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (33, CAST(N'2018-07-23 17:23:16.300' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (34, NULL, NULL, NULL, NULL, NULL, NULL, N'3750 N.WOODFORD ST, APT. # 3309, DECATUR. IL 62526', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (36, NULL, NULL, NULL, NULL, NULL, NULL, N'9433 Geiser Rd., Holland OH 43528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (37, NULL, NULL, NULL, NULL, NULL, NULL, N'213 IL Hwy 242 P.O. Box 474 Wayne City IL 62895', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, N'4716 Hatz St. St. Louis MO 63121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (49, NULL, NULL, NULL, NULL, NULL, NULL, N'11337 Sword Rd. Williamsport MD 21795', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.34999999403953552, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (52, NULL, NULL, NULL, NULL, NULL, NULL, N'725 Wedgewood Ave Eau Claire, WI 54703 United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (54, NULL, NULL, NULL, NULL, NULL, NULL, N'531 Eastern Blvd. Essex MD 21221', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (55, NULL, NULL, NULL, NULL, NULL, NULL, N'3154 Princeton Rd. Greensburg PA 15601', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (57, NULL, NULL, NULL, NULL, NULL, NULL, N'113 N Benton Rd W Frankfort IL 62896', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (59, NULL, NULL, NULL, NULL, NULL, NULL, N'3445 Wilson  Ave #60 Plover WI 54468', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (60, NULL, NULL, NULL, NULL, NULL, NULL, N'15 Peckham St. Coldwater MI 49036', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.33000001311302185)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.34999999403953552, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.34999999403953552, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (76, NULL, NULL, NULL, NULL, NULL, NULL, N'28814 Blanchard Rd Defiance OH 43512', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.25)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (81, NULL, NULL, NULL, NULL, NULL, NULL, N'20 Devlin St Cohoes NY 12047', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (82, NULL, NULL, NULL, NULL, NULL, NULL, N'412 W 12th Ave Gary, IN 46408', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (84, NULL, NULL, NULL, NULL, NULL, NULL, N'41 Lincoln Ave Albany, NY 12206', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (85, NULL, NULL, NULL, NULL, NULL, NULL, N'5040 Jamieson ST, Apt R-6 Toledo, OH 43613', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.30000001192092896, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.34999999403953552, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (95, NULL, NULL, NULL, NULL, NULL, NULL, N'5320 WEST TAFT ROAD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (98, NULL, NULL, NULL, NULL, NULL, NULL, N'302 N Sheldon, Rantoul IL 61866', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (99, NULL, NULL, NULL, NULL, NULL, NULL, N'72 E La Salle St, Zanesville OH 43701', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (100, CAST(N'2018-07-23 17:23:16.300' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (101, NULL, NULL, NULL, NULL, NULL, NULL, N'8 Ellenwood Rd., Millbury MA 01527', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (102, NULL, NULL, NULL, NULL, NULL, NULL, N'1531 Olivesburg Rd, Mansfield OH 44905', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (103, NULL, NULL, NULL, NULL, NULL, NULL, N'816 Cameron Dr, Slippery Rock PA 16057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.25, 0.20000000298023224)
GO
INSERT [dbo].[UserDetails] ([Id], [DateOfBirth], [Gender], [CurCountry], [CurState], [CurCity], [CurZipCode], [CurAddress1], [CurAddress2], [PerCountry], [PerState], [PerCity], [PerZipCode], [PerAddress1], [PerAddress2], [CostPerMile], [CostPerMinute]) VALUES (104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.5, 0.33000001311302185)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (1, 1, N'DSB', N'Transport ', N'tochient@gmail.com', N'3154018187', NULL, NULL, NULL, N'dc06698f0e2e75751545455899adccc3', 0, CAST(N'2018-10-01 11:12:57.037' AS DateTime), 1, 1, NULL, NULL, CAST(N'2018-01-31 23:40:11.900' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (2, 2, N'DSB', N'Driver', N'driver@dsb.com', N'3154018187', NULL, NULL, NULL, N'e2d45d57c7e2941b65c6ccd64af4223e', 0, CAST(N'2018-08-07 19:03:50.097' AS DateTime), 1, 1, 1, 1, CAST(N'2018-01-31 23:42:06.370' AS DateTime), 1, CAST(N'2018-05-30 13:31:29.527' AS DateTime), 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (33, 3, N'Dispatcher', N'kumar', N'Dispatcher@dsb.com', N'3154018187', NULL, NULL, NULL, N'dbfcc2e96980bb87c34df3809193c62a', 0, CAST(N'2018-09-24 12:44:41.817' AS DateTime), 1, 1, 1, 1, CAST(N'2018-06-29 11:57:23.830' AS DateTime), 1, CAST(N'2018-06-29 15:19:08.197' AS DateTime), 1, 0, NULL, N'+1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (34, 2, N'Brandon', N'Bischoff', N'gg4515gg@gmail.com', N'2173299981', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-26 21:19:13.267' AS DateTime), 1, CAST(N'2018-07-31 14:47:39.743' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (35, 4, N'DataEntryOperator', N'driver', N'DO@dsb.com', N'3154018187', NULL, NULL, NULL, N'3d1761aa404aa65e5ceae547832b7afb', 0, CAST(N'2018-09-26 17:44:24.857' AS DateTime), 1, 1, 1, 1, CAST(N'2018-01-31 23:42:06.370' AS DateTime), 1, CAST(N'2018-05-30 13:31:29.527' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (36, 2, N'Brian', N'DeCair', N'briansback04@aol.com', N'4193602185', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 04:32:10.510' AS DateTime), 1, CAST(N'2018-08-22 02:42:27.027' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (37, 2, N'Bruce', N'Johnson', N'brucelee807@yahoo.com', N'6189191066', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 04:53:20.587' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (38, 2, N'Courtney', N'Hill-Bryant', N'courtlove145@gmail.com', N'3319801897', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 04:54:47.153' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (39, 2, N'Courtney', N'Jones', N'drivedriven2018@yahoo.com', N'3142679913', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 04:56:49.957' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (40, 2, N'David', N'Levine', N'david.executiverow@gmail.com', N'2672573093', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 04:58:39.437' AS DateTime), NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (41, 2, N'David', N'O''Shea', N'deos615@gmail.com', N'2177666147', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:01:44.593' AS DateTime), NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (42, 2, N'Debbie', N'Mummert', N'mummertdm@gmail.com', N'6185137220', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:03:14.403' AS DateTime), NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (43, 2, N'Douglas', N'Elkins', N'douglaselkins24@gmail.com', N'7153401976', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:06:00.433' AS DateTime), NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (44, 2, N'Elizabeth', N'Parrish', N'myredrose45@gmail.com', N'5402470927', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:06:53.660' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (45, 2, N'Jason', N'Lockard', N'yodabug2017@gmail.com', N'7174211696', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:07:50.303' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (46, 2, N'Joann', N'Rescelo', N'jrescelo@gmail.com', N'5189482314', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:08:36.123' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (47, 2, N'Joe', N'Walls', N'wallzofbaby06@gmail.com', N'2679811154', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:11:06.117' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (48, 2, N'John', N'Beverly', N'rashid103094@gmail.com', N'5182212547', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:11:47.207' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (49, 2, N'Jonathan', N'Bishop', N'jonny45bishop@gmail.com', N'3047025140', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:12:48.623' AS DateTime), 1, CAST(N'2018-07-31 14:47:14.720' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (50, 2, N'Journey', N'Red Brook', N'secede2succeed@gmail.com', N'2182212256', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:13:32.507' AS DateTime), 1, CAST(N'2018-07-31 14:43:20.317' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (51, 2, N'Joyce', N'Brown', N'joyceb6561@comcast.net', N'5409077984', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:14:10.867' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (52, 2, N'Kelli', N'Brooks', N'arrowbrook28@gmail.com', N'7154504131', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:14:48.790' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (53, 2, N'Ken', N'Osuji', N'azubuikeosuji@gmail.com', N'9733368092', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:15:26.217' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (54, 2, N'Kimberly', N'Lange', N'kimberly.lange1978@gmail.com', N'4438384200', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:16:23.717' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (55, 2, N'Kurt', N'Zitelli', N'kz809@comcast.net', N'7243095032', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:17:06.383' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (56, 2, N'Leo', N'Bartolotta', N'letitride731@yahoo.com', N'7166028491', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:17:49.907' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (57, 2, N'Mark', N'Crawford', N'plummetman25@gmail.com', N'6186948535', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:18:30.530' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (58, 2, N'Mikhail', N'Rabinovich', N'mikhail.rabinovich8@gmail.com', N'4439808580', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:19:07.080' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (59, 2, N'Natasha', N'Elliott', N'tashaelliott0817@icloud.com', N'7155449207', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:19:40.793' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (60, 2, N'Nathan', N'Hadfield', N'nat3r1975@gmail.com', N'5176773061', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:20:16.657' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (61, 2, N'Olivia', N'Eikenbary', N'sunlight_maggie@yahoo.com', N'5807292581', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:20:51.337' AS DateTime), 1, CAST(N'2018-07-31 14:40:39.837' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (62, 2, N'Omar', N'Scott', N'malotti2004@gmail.com', N'3023335201', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:21:27.137' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (63, 2, N'Parvinder', N'Minhas', N'gkm3241@gmail.com', N'2607975450', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:22:17.400' AS DateTime), 1, CAST(N'2018-07-31 14:39:53.117' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (64, 2, N'Patsy', N'Roberts', N'ooowitchywoman47@gmail.com', N'7246789128', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:22:57.820' AS DateTime), 1, CAST(N'2018-07-31 14:39:17.563' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (65, 2, N'Rich', N'Gillen', N'rdg28@hotmail.com', N'5184882478', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:23:25.993' AS DateTime), 1, CAST(N'2018-07-31 14:38:33.897' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (66, 2, N'Richard', N'Lane', N'richwlane@gmail.com', N'8142704362', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:23:52.640' AS DateTime), 1, CAST(N'2018-08-13 18:40:38.833' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (67, 2, N'Richard', N'Saunders', N'rjdsaunders@gmail.com', N'8149797295', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:24:23.823' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (68, 2, N'Rick', N'Martell', N'rmportraits82@gmail.com', N'2175613425', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:24:52.607' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (69, 2, N'Rita', N'Jimenez', N'jim21rose@gmail.com', N'2183418653', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:25:18.860' AS DateTime), 1, CAST(N'2018-07-31 14:37:42.857' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (70, 2, N'Rob', N'Galloway', N'gallowayrob1@yahoo.com', N'6144205736', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:25:51.807' AS DateTime), 1, CAST(N'2018-07-31 14:37:06.397' AS DateTime), 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (71, 2, N'Shevaun', N'Simpson', N'shevaun47@gmail.com', N'4432548566', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:26:28.343' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (72, 2, N'Stephanie', N'Myers', N'smyers245@gmail.com', N'3129189535', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:27:05.970' AS DateTime), 1, CAST(N'2018-07-31 16:51:42.843' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (73, 2, N'Steve', N'Barriteau', N'sbarriteau88@gmail.com', N'6679675132', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:27:35.627' AS DateTime), 1, CAST(N'2018-07-31 14:35:59.067' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (74, 2, N'Terressa', N'Hunter', N'terressa.hunter1@aol.com', N'4193706207', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:28:05.920' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (75, 2, N'Twanna', N'Brown', N'carterlokey@gmail.com', N'3147230257', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:28:34.220' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (76, 2, N'Vanessa', N'Fickel', N'preciousgifts@msn.com', N'4197897457', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:29:11.893' AS DateTime), NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (77, 2, N'Vicki', N'Fitzherbert', N'vickifitzherbert@gmail.com', N'2184099778', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:29:42.080' AS DateTime), 1, CAST(N'2018-07-31 14:34:49.633' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (78, 2, N'Walter', N'Heikes', N'681540straight@gmail.com', N'2174166308', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:30:06.977' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (79, 2, N'Wayne', N'Anderson', N'sporterhbara2@oh.rr.com', N'4403199977', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:30:35.667' AS DateTime), 1, CAST(N'2018-07-31 14:33:42.177' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (80, 2, N'Joe', N'Mucha', N'jmucha9844@gmail.com', N'2697442881', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 05:35:38.773' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (81, 2, N'Arthur', N'VanSteenburg', N'arthurvansteenburg@gmail.com', N'5183300026', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:06:03.573' AS DateTime), 1, CAST(N'2018-08-06 16:11:09.177' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (82, 2, N'Dana', N'Warmack', N'd.warmack34@yahoo.com', N'6025749384', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:08:11.820' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (83, 2, N'Gurdeep', N'Singh', N'gurdeepsra@gmail.com', N'3155596975', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:12:18.830' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (84, 2, N'Brandon', N'Schultheiss', N'brandonschultheis24@gmail.com', N'5183316521', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:48:35.220' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (85, 2, N'Mike', N'Kwasnik', N'vipmike14@outlook.com', N'4077640640', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:50:06.060' AS DateTime), 1, CAST(N'2018-07-28 12:34:27.843' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (86, 2, N'Michelle', N'Clement', N'queenoheartstaxillc@gmail.com', N'2182219079', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:51:12.797' AS DateTime), 1, CAST(N'2018-07-31 14:41:29.663' AS DateTime), 1, 1, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (87, 2, N'Tracy', N'Albertson', N'goofygirl10@yahoo.com', N'7158150763', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:52:01.673' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (88, 2, N'Bruce', N'Larock', N'larock_bruce@yahoo.com', N'2183240921', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:53:35.710' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (89, 2, N'Don', N'Trask', N'dontrask58@gmail.com', N'5185702071', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-28 06:54:30.450' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (90, 2, N'Roy', N'Smith', N'none@none.com', N'5183915378', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-31 11:52:42.640' AS DateTime), 1, CAST(N'2018-07-31 12:06:42.717' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (91, 2, N'Michelle', N'Clement', N'queenofheartstaxillc@gmail.com', N'2182219079', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-31 14:49:19.070' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (92, 2, N'Wayne', N'Hall', N'whall31754@yahoo.com', N'3157716765', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-31 14:52:14.630' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (93, 2, N'Patrick', N'Murphy', N'patrickjohnmurphy@charter.net', N'2183410088', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-31 14:55:17.153' AS DateTime), 1, CAST(N'2018-07-31 14:55:31.097' AS DateTime), 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (94, 2, N'Sudhar', N'Singh', N'sadharabrar@gmail.com', N'3159603620', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-07-31 16:35:34.550' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (95, 2, N'SURENDER', N'BHATTI', N'tochient@gmail.com', N'3154580269', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-08-04 11:00:23.640' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (96, 2, N'CHAD', N'HANZELY', N'chadhanzely@gmail.com', N'8147716214', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-08-11 11:26:27.247' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (97, 2, N'Vanessa', N'Fickle', N'preciousgifts@msn.com', N'4197897457', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-08-18 23:14:14.753' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (98, 2, N'Wayne', N'Miller', N'wgobears@yahoo.com', N'2173774051', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-09-05 06:24:17.953' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (99, 2, N'Chad', N'Van Wey', N'chadvanwey79@gmail.com', N'7402086957', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-09-05 06:41:52.453' AS DateTime), NULL, NULL, 1, 0, NULL, N'1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (100, 5, N'service', N'maintenance', N'servicemaintenance@DSBTransport.com', N'3154018187', NULL, NULL, NULL, N'4edb2b9c7c955d2bdf54a424b6ac9a5b', 0, CAST(N'2018-09-20 21:15:42.500' AS DateTime), 1, 1, 1, 1, CAST(N'2018-06-29 11:57:23.830' AS DateTime), 1, CAST(N'2018-06-29 15:19:08.197' AS DateTime), 1, 0, NULL, N'+1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (101, 2, N'Dan', N'Quarelli', N'dquarelli@yahoo.com', N'7742875139', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-09-05 23:48:08.967' AS DateTime), NULL, NULL, 1, 0, NULL, N'1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (102, 2, N'Gary', N'Stewart', N'stewarttrk@gmail.com', N'5015175475', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 100, 100, CAST(N'2018-09-11 01:13:36.717' AS DateTime), NULL, NULL, 1, 0, NULL, N'1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (103, 2, N'Michael', N'Durso', N'durso92@yahoo.com', N'7246517571', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 100, 100, CAST(N'2018-09-11 01:17:46.830' AS DateTime), NULL, NULL, 1, 0, NULL, N'1')
GO
INSERT [dbo].[Users] ([Id], [UserTypeId], [FirstName], [LastName], [Email], [PhoneNumber], [WorkPhone], [UserName], [SaltKey], [PasswordHash], [DefaultPassword], [LastLoginDate], [IsOnLine], [AccountStatus], [ReportingTo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [IsActive], [IsDeleted], [AssignedRegionId], [CountryCode]) VALUES (104, 9, N'Mohammed', N'furrakh', N'david_sakina@hotmail.com', N'4122658357', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 1, CAST(N'2018-09-20 12:39:48.040' AS DateTime), NULL, NULL, 1, 0, NULL, NULL)
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

---


GO
USE [master]
GO
ALTER DATABASE [TrialDB] SET  READ_WRITE 
GO
