IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Positions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OpenPositions]') AND type in (N'U'))
ALTER TABLE [dbo].[OpenPositions] DROP CONSTRAINT IF EXISTS [FK_OpenPositions_Locations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Locations]') AND type in (N'U'))
ALTER TABLE [dbo].[Locations] DROP CONSTRAINT IF EXISTS [FK_Locations_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_UserDetails]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_OpenPositions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Applications]') AND type in (N'U'))
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT IF EXISTS [FK_Applications_ApplicationStatuses]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[Positions]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[OpenPositions]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[Locations]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[ApplicationStatuses]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[Applications]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/26/2021 5:22:04 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[OpenPositionId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[ManagerNotes] [varchar](2000) NULL,
	[ApplicationStatus] [int] NOT NULL,
	[ResumeFilename] [varchar](75) NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStatuses]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatuses](
	[ApplicationStatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
 CONSTRAINT [PK_ApplicationStatus] PRIMARY KEY CLUSTERED 
(
	[ApplicationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [varchar](10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ManagerId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpenPositions]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpenPositions](
	[OpenPositionId] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
 CONSTRAINT [PK_OpenPositions] PRIMARY KEY CLUSTERED 
(
	[OpenPositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[JobDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 1/26/2021 5:22:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [nvarchar](128) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[ResumeFilename] [varchar](75) NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202101252134126_InitialCreate', N'StarMed.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E2FB0FF41D0D36E915AB9EC0C6603BB45EA246DB0930BC6C960DF06B4443BC248942A516982A2BFAC0FFD49FD0B7B2851B278D3C5566CA72850C422F99DC3C38FE4E1E1E1FCF5C79FE31F9EC3C07AC249EA4764621F8D0E6D0B1337F27CB29CD8195D7CF7C1FEE1FB7F7C33BEF0C267EB7359EF84D58396249DD88F94C6A78E93BA8F3844E928F4DD244AA3051DB951E8202F728E0F0FFFE31C1D3918206CC0B2ACF1A78C503FC4F90FF8398D888B639AA1E03AF27090F2EF5032CB51AD1B14E234462E9ED8338A926BEC8D1EAE46D79FA7A3A2816D9D053E0265663858D8162224A28882AAA70F299ED12422CB590C1F5070FF1263A8B740418A79174E57D5BBF6E6F098F5C659352CA1DC2CA551D813F0E8849BC7919BAF6564BB321F18F0020C4D5F58AF73234EEC2B0FE79F3E4501184016783A0D125679625F5722CED2F806D351D97054405E2600F76B947C1DD5110FACCEED0E2A3A1D8F0ED97F07D6340B6896E009C1194D507060DD65F3C077FF8B5FEEA3AF984C4E8EE68B930FEFDE23EFE4FDBFF1C9BB7A4FA1AF504FF8009FEE9228C609E8861755FF6DCB11DB3972C3AA59AD4D6115E012CC0CDBBA46CF1F3159D2479833C71F6CEBD27FC65EF98593EB81F83091A0114D32F8799305019A07B82A771A65B2FF37483D7EF77E10A937E8C95FE6432FC9878993C0BCFA8483BC347DF4E3627A09E3FD8557BB4CA290FD16F955947E994559E2B2CE44C62AF72859622A6A377656E4ED446906353CAD4BD4FDA736D354A5B7B62AEBD03A33A114B1EDD950EAFBBA723B33EE2C8E61F0726A318B34114EBB5F8D2480034BACB622D051570211E8D8DF793DBC08911F0CB020769002EEC8C24F425CF5F2C708E887486F9DEF509AC27AE0FD8CD2C706D5E1CF01549F61374B80A6C0A4307E7569778F11C137593867ECDF9EACC186E6FED7E812B9344A2E086BB531DEC7C8FD1A65F48278E788E207EA9680ECE7BD1F760718449D33D7C5697A0964C6DE34026FBB04BC22F4E4B8371C5BA376ED904C03E4877A8F445A4DBF9455575E89BE86E29918AAE9BC9326553F464B9F7453B5AC6A56B5A8D1AA2AAFD6575506D64D535ED3AC685EA155CFA2D660FE5E3E42C33B7C39ECFE7B7C9B6DDEA6B5A066C619AC90F8274C7002CB98778728C509598D4097756317CE423E7C4CE8ABEF4DB9A4CF28C88616B5D66CC81781E167430EBBFFB32157133E3FF91EF34A3A1C83CACA00DFA9BEFE84D53EE724CDB63D1D846E6E5BF876D600D374394BD3C8F5F359A00980F1F085A83FF870567B2CA3E88D1C0F818E01D17DB6E5C117E89B2D93EA969CE300536C9DB94580708A521779AA19A1435E0FC5CA1D55A3D82A2E222AF7AD2213988E13D608B143500A33D527549D163E71FD1805AD56925A76DCC258DF2B1972C9398E3161025B2DD145B83E0CC214A8E44883D266A1B153635C33110D5EAB69CCDB5CD8D5B82BD189AD70B2C57736F092FB6FAF42CC668B6D819CCD26E9A28031A4B70B82F2B34A5702C807977D23A87462321094BB545B21A868B11D105434C99B23687144ED3AFED27975DFE8291E94B7BFAD379A6B07DC14ECB167D42C7C4F6843A1054E547A9ECF59217EA69AC319E8C9CF67297775658A30F019A662C866E5EF6AFD50A71944265113E08A682DA0FC3250015226540FE5CA585EA376DC8BE8015BC6DD1A61F9DA2FC1D638A062D72F456B15CD57A732393B9D3EAA9E556C5048DEE9B050C3D110425EBCC48E77308A292EAB1AA68B2FDCC71BAE758C0F4683815A3C578391CACE0C6EA5929AED56D239647D5CB28DAC24B94F062B959D19DC4A9CA3ED46D238053DDC828D4C246EE1034DB632D251ED3655D9D829D2A5F887B163C8AB1A5FA338F6C9B29667C5BF58B322C96AFADDAC7FEA515860386EAAC940AAB4AD24D128414B2C958268D0F4D24F527A8E289A2316E7997AA1524DBBB71A96FF52647DFB5407B1DC07CADAEC6F7EB3AABDC217B65BD51FE13097D0C990393579245D43017D738BA5BEA100259AE0FD340AB290987D2C73EBE20AAFDEBEF8A2228C1D497FC587520CA678BAA2F53B8D8D3A2F861BA7CA8B597FACCC10268B973E68DDE626BFD48C5286A9EA28A6D0D5CEC6CEE4CEF41D2FD959EC3F5CAD08AF33BB78864A1D807FEA89514B7250C06A65DD51C53C943AA658D21D514A36A9434A453DB4ACA794084AD60BD6C23358545FA3BB043589A48EAE967647D6A493D4A135C56B606B7496CBBAA36A324EEAC09AE2EED8ABF413791DDDE3FDCB7884D964032B0EBA9BED60068CD7591487D9006BF7F975A0DAE79E58FCC65E01E3DFF79250C6D3DE26842A421C9B11CA80615E7F84CB7071F969BCC137630A37DCC212DF74C36FC6EB47DB57258772DE93AB54D2AB739F74BE1BF3B356FBE31AE5F05554B1ADD28C40A99794E270C42A8C66BF04D3C0C76C312F2B5C23E22F704A8BAC0EFBF8F0E8587A9CB33F0F659C34F502CD59D5F45A461CB32D2468912794B88F2851D32536784CB2025522D157C4C3CF13FBB7BCD5691ED4607FE59F0FACABF481F8BF6450709F64D8FA5D4DFF1C26B9BEC3738E4AD1DFDFC43B89EE26BFFADF97A2E981759BC0743AB50E2543AF33FCE2EB895EDA144D37D066ED37156F77B6094F15B4A8D26C59FF65C2DCA783BC4A28B5FC67889EFFD55735EDCB838D1035AF0B86C21BC484A6D703EB60195F0E78F093E62F07FA7556FF92601DD58CAF087CD21F4C7E43D07D192A5BEE701FD29C99B6B124E5766ECDC1DE282173D77B9392AABDD14457D3B17BC00D9A72BD998BF2C6529907DB3A3599CA8361EF92F7AF9E9EBC2F19C92BA77DB789C8DBCC3D6EB859FA5BA51CEF41929C26E967F789C5DBE69A2908BCE7D999FDD287F78C6C7C9BDF7D92F0B6C9660A10EF39D97AA502EF19D776B57FEE98699DB7D09D27F6AA394A86CB1C5D14B92D71B708B9C3F17F1E01090A8FB2786FA9CF146BCA726D11B8AA62166A4E5193052B134791ABD46816DBAFAF7CC36FEC2CAFD32CD690D8D9249BAFFF8DB2799D66D98674C95DA41C6B13167569E02DEB58531ED55B4A31167AD292D1DEE6B336DECCBFA58CE2418C22CC1EC3EDF2DB49201EC424434E9D1E09C3EA4531EC9DB57FAB11F6EFD45FAE20D8BFDC48B02BEC9A559D2BB288CACD5BD2A8AC224568AE31451E6CA96709F517C8A550CC02D0F983F13CA8C7AE41E6D8BB22B7198D330A5DC6E13C10025ECC0968929F67458B3A8F6F63F62B1DA20BA0A6CF02F7B7E4C7CC0FBC4AEF4B4D4CC800C1BC0B1EEE65634959D877F95221DD44A42310375FE514DDE3300E002CBD2533F484D7D10DE8F7112F91FBB28A009A40DA074234FBF8DC47CB048529C758B5879FC0612F7CFEFEFFB27E427BB2540000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] ON 

INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (1, N'Completed', N'Application process competed')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (2, N'Incomplete', N'Application process incomplete')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (3, N'PendingApproval', N'Application is pending approval')
INSERT [dbo].[ApplicationStatuses] ([ApplicationStatusId], [StatusName], [StatusDescription]) VALUES (4, N'InReview', N'Application is in review')
SET IDENTITY_INSERT [dbo].[ApplicationStatuses] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ddc75518-0ced-4b58-af01-28d320dea935', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9dbc6fd5-5c5b-44fb-bd7c-a5a03390ee7c', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8162511a-6bab-4274-9e54-f7aa853ecbbf', N'Manager')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4301dae2-f268-4fb6-946a-a1507e3af019', N'8162511a-6bab-4274-9e54-f7aa853ecbbf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'979d757a-93b2-46e9-b85e-a45e8bc997d6', N'8162511a-6bab-4274-9e54-f7aa853ecbbf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db5f58e5-be32-4b4f-abd2-da5e99c45829', N'8162511a-6bab-4274-9e54-f7aa853ecbbf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f4417907-8807-4d09-bf05-c4be0456eb43', N'8162511a-6bab-4274-9e54-f7aa853ecbbf')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ee7b2a0-3a6f-4411-aa6b-fa5185365050', N'9dbc6fd5-5c5b-44fb-bd7c-a5a03390ee7c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8cd426f1-dea4-44a8-8b9c-e848136aec21', N'9dbc6fd5-5c5b-44fb-bd7c-a5a03390ee7c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b96977ef-657e-44aa-bef8-04c0f2cf7c1c', N'9dbc6fd5-5c5b-44fb-bd7c-a5a03390ee7c')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'235acbc8-141c-485e-9078-5019f7d674c7', N'ddc75518-0ced-4b58-af01-28d320dea935')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ee7b2a0-3a6f-4411-aa6b-fa5185365050', N'EmployeeTwo@StarMed.com', 0, N'AEK/lMOOOFt9c3056tbtHlqtMNVMg5M7+aQrsaxCc1HHc2G9pL8dmrSNNl3K4Yll7Q==', N'f796cb89-67fa-41d5-9391-748c50063a88', NULL, 0, 0, NULL, 1, 0, N'EmployeeTwo@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'235acbc8-141c-485e-9078-5019f7d674c7', N'engr317@gmail.com', 0, N'AFGKOQYZknbqzcSsZiQpV2bXUvqhI06GNdit/4oWg4XlHIAcD10YFCi7wdeVCnyPEg==', N'bc531487-2d34-41fc-97c7-f7f19d2b91bc', NULL, 0, 0, NULL, 1, 0, N'engr317@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4301dae2-f268-4fb6-946a-a1507e3af019', N'ManagerOne@StarMed.com', 0, N'AKzMEEhmDFymRc2dRx8gnM5/+oVoYBQeZk+rneUSHKJcCmqlwKRz0J+rhY6q4rIXmg==', N'6cbbe5ed-7e3b-416d-8636-015ab3d04a11', NULL, 0, 0, NULL, 1, 0, N'ManagerOne@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8cd426f1-dea4-44a8-8b9c-e848136aec21', N'EmployeeOne@StarMed.com', 0, N'ANN3J3KmTzVVV59eHmWvtlPLhLxB+wpYakvqtjXi3vpzdLr6GLB/kQdPhVmkhmW9ig==', N'2b67a40d-2972-4a00-9b61-73f27fb5410d', NULL, 0, 0, NULL, 1, 0, N'EmployeeOne@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'979d757a-93b2-46e9-b85e-a45e8bc997d6', N'ManagerTwo@StarMed.com', 0, N'AAF2wWwUfamkQ79KN/w3Mvmad56EVPYMtx21oPrfza5HDFxpnAsoOdevTKiMDCjcyw==', N'db7dc340-928f-420e-a179-1845e58d1c91', NULL, 0, 0, NULL, 1, 0, N'ManagerTwo@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b96977ef-657e-44aa-bef8-04c0f2cf7c1c', N'EmployeeThree@StarMed.com', 0, N'AJ0uHmH8Fj501SAyABGwowhnWmESk288P+QtkSONlGdQ1Fd1BJbdAO0hWRvzfDNPOg==', N'4a465e88-a77e-4043-9171-83b9678876e8', NULL, 0, 0, NULL, 1, 0, N'EmployeeThree@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'db5f58e5-be32-4b4f-abd2-da5e99c45829', N'ManagerThree@StarMed.com', 0, N'ANtrgXkDR+ek8EUBpgna+4Tea1Et5yMept6Ketco1UUiisBLKx96pN5Hm9MxIZ2N6g==', N'757e56e1-8cde-4e68-b021-988431d59ce6', NULL, 0, 0, NULL, 1, 0, N'ManagerThree@StarMed.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f4417907-8807-4d09-bf05-c4be0456eb43', N'ManagerFour@StarMed.com', 0, N'AASUeMFAU/wlDVDDwZamNVLrne+G9WtJGGpAw6/LtQk+uRQ6wHpoTqAqhxJglNfirg==', N'5e7c0fa2-2580-44c0-ba08-17cf52e4612c', NULL, 0, 0, NULL, 1, 0, N'ManagerFour@StarMed.com')
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (10, N'1', N'Manitou Springs', N'CO', N'4301dae2-f268-4fb6-946a-a1507e3af019')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (12, N'2', N'Widefield', N'CO', N'979d757a-93b2-46e9-b85e-a45e8bc997d6')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (13, N'3', N'Black Forest', N'CO', N'db5f58e5-be32-4b4f-abd2-da5e99c45829')
INSERT [dbo].[Locations] ([LocationId], [StoreNumber], [City], [State], [ManagerId]) VALUES (14, N'4', N'Fountain', N'CO', N'f4417907-8807-4d09-bf05-c4be0456eb43')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (1, N'Nurse, Caregivers', N'gives care to someone who needs help taking care of themselves. The person who needs help may be a child, an adult, or an older adult. They may need help because of an injury or disability.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (2, N'Certified Nursing Assistant (CNA)', N'performs many basic care tasks for patients, like grooming, dressing, bathing, eating and exercising. They also assist the nursing staff with medical tasks like taking blood, monitoring vitals with medical equipment and reporting patient behavior and wellbeing.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (3, N'Medical Assistant', N'responsible for performing a variety of clinical tasks: Recording patients'' vital signs, documenting physicians'' notes and changes in medical conditions, 
 Taking tissue and fluid samples and sending them in for laboratory analysis.  Prepping exam rooms for clinical procedures and assisting practitioners with patient care, and assisting physicians during routine checkups, outpatient procedures and other physical exams')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (4, N'Licensed Practical Nurse (LPN)', N'Monitors basic patient health such as vital signs and overall conditions, changes dressings or inserting catheters, assists with tests and procedures and provide personal care, such as helping with bathing and toileting.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (5, N'Sitter, Nanny', N' responsible for assisting medical needs under the supervision of an attending physician, registered nurses, and other health professionals. Sitters monitor the patients'' daily activities and perform medical duties such as taking the patient''s temperature, administering medications, monitoring food intake, helping with bathing needs, and responding to the patients'' inquiries, concerns, and requests.')
INSERT [dbo].[Positions] ([PositionId], [Title], [JobDescription]) VALUES (6, N'Therapist', N'Diagnoses and treats mental health disorders. Creates individualized treatment plans according to patient needs and circumstances. Meets with patients regularly to provide counseling, treatment and adjust treatment plans as necessary. Conducts ongoing assessments of patient progress.')
SET IDENTITY_INSERT [dbo].[Positions] OFF
GO
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'1ee7b2a0-3a6f-4411-aa6b-fa5185365050', N'Kaitlyn', N'See', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'235acbc8-141c-485e-9078-5019f7d674c7', N'Dave', N'See', NULL)
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'32604a96-c9a4-4129-a1f9-ae45052cda9a', N'Manager', N'ManagerNbrOne', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'4301dae2-f268-4fb6-946a-a1507e3af019', N'Aspen', N'Retriever', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'49ca8fcd-2f5c-4835-a6f5-ae0f6ea5aaa7', N'Kaitlyn', N'See', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'8cd426f1-dea4-44a8-8b9c-e848136aec21', N'Meredith', N'See', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'979d757a-93b2-46e9-b85e-a45e8bc997d6', N'Bianca', N'Schnauzer', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'b96977ef-657e-44aa-bef8-04c0f2cf7c1c', N'Isaiah', N'Martinez', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'd1252788-c13b-4e5c-bfc2-a348feba577e', N'Employee', N'NumberOne', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'db5f58e5-be32-4b4f-abd2-da5e99c45829', N'Bella', N'Cat', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'f3e406ed-4d12-4bc2-bd74-2fa99744dd1a', N'Meredith', N'Rae', N'noFile.pdf')
INSERT [dbo].[UserDetails] ([UserId], [FirstName], [LastName], [ResumeFilename]) VALUES (N'f4417907-8807-4d09-bf05-c4be0456eb43', N'Ollie', N'Cat', N'noFile.pdf')
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_ApplicationStatuses] FOREIGN KEY([ApplicationStatus])
REFERENCES [dbo].[ApplicationStatuses] ([ApplicationStatusId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_ApplicationStatuses]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_OpenPositions] FOREIGN KEY([OpenPositionId])
REFERENCES [dbo].[OpenPositions] ([OpenPositionId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_OpenPositions]
GO
ALTER TABLE [dbo].[Applications]  WITH CHECK ADD  CONSTRAINT [FK_Applications_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Applications] CHECK CONSTRAINT [FK_Applications_UserDetails]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_UserDetails] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[UserDetails] ([UserId])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_UserDetails]
GO
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Locations]
GO
ALTER TABLE [dbo].[OpenPositions]  WITH CHECK ADD  CONSTRAINT [FK_OpenPositions_Positions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([PositionId])
GO
ALTER TABLE [dbo].[OpenPositions] CHECK CONSTRAINT [FK_OpenPositions_Positions]
GO
