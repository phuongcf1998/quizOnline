USE [master]
GO
/****** Object:  Database [QuizOnline]    Script Date: 6/4/2020 8:32:39 PM ******/
CREATE DATABASE [QuizOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizOnline', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuizOnline.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuizOnline_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuizOnline_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuizOnline] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizOnline] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnline] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizOnline] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuizOnline]
GO
/****** Object:  Table [dbo].[tbl_Question]    Script Date: 6/4/2020 8:32:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Question](
	[id] [nvarchar](10) NOT NULL,
	[question_content] [nvarchar](max) NULL,
	[answer_1] [nvarchar](max) NULL,
	[answer_2] [nvarchar](max) NULL,
	[answer_3] [nvarchar](max) NULL,
	[answer_4] [nvarchar](max) NULL,
	[answer_correct] [nvarchar](max) NULL,
	[createDate] [date] NULL,
	[subjectID] [nvarchar](10) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_QuizHistory]    Script Date: 6/4/2020 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userEmail] [nvarchar](50) NULL,
	[subjectID] [nvarchar](10) NOT NULL,
	[point] [float] NOT NULL,
	[num_of_correct_answer] [int] NOT NULL,
	[time] [time](7) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_QuizHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 6/4/2020 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[role] [int] NOT NULL,
	[description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Status]    Script Date: 6/4/2020 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Status](
	[status] [int] NOT NULL,
	[description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_StatusUser] PRIMARY KEY CLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Subject]    Script Date: 6/4/2020 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subject](
	[subjectID] [nvarchar](10) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
	[quizTime] [int] NOT NULL,
	[numberQuestion] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 6/4/2020 8:32:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[role] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q1', N'What does HTML stand for?', N'Hyper Text Markup ', N'Hyper Text Markup Language', N'Hyper Text Language', N'Home Text Language', N'Hyper Text Markup Language', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q10', N'............. indicator of high-quality data ensures value for a data attribute is actually stored as the data type defined for that attribute.', N'Accuracy', N'Domain Integrity', N'Data Type  ', N'Consistency', N'Domain Integrity', CAST(N'2020-05-25' AS Date), N'PRJ311', 3)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q100', N'Which security mechanism limits access to the availability of resources to permitted groups of users or programs?', N'a. Data integrity', N'b. MD5 encryption', N'c. Authorization', N'd. Authentication', N'c. Authorization', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q101', N'Java Security Mechanism will be activated when ........', N'a. All of the others.', N'b. a protected resource is accessed by clients.', N'c. the login page is accessed by clients.', N'd. The page for registration is accessed by clients.', N'a. All of the others.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q109', N'EC applications are supported by infrastructure and by each of the following support areas EXCEPT:', N'a. People', N'b. Public policy', N'c. Marketing and advertisement', N'd. Mobile devices', N'b. Public policy', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q11', N'In a table, there is only one ............. index.', N'Bitmap', N'Clustered', N'non-clustered', N'Tree', N'Clustered', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q110', N'The ways in which EC is done include:', N'a. the Internet and extranets', N'b. the Internet and private networks', N'c. the Internet, extranets, and private networks', N'd. the Internet, value-added networks, on local area networks using intranets, or on a single computerized machine', N'd. the Internet, value-added networks, on local area networks using intranets, or on a single computerized machine', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q112', N'According to the _____ revenue model, companies receive commissions for referring customers to others'' EC Web sites.', N'a. subscription fees', N'b. advertising fees', N'c. affiliate fees', N'd. transaction fees', N'c. affiliate fees', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q113', N'Which of the following is not a characteristic of the Digital Revolution ?', N'a. Many business processes are expedited by up to 50 percent.', N'b. Intelligent search agents to help manage information overload.', N'c. A high rate of obsolescence.', N'd. Fraud and other cybercons carried out via the Internet.', N'a. Many business processes are expedited by up to 50 percent.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q119', N'_____are online markets owned and operated by a single company and may be either sell-side or buy-side.', N'a. Private e-marketplaces', N'b. Commercial portals', N'c. E-malls', N'd. 13213 marketplaces', N'a. Private e-marketplaces', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q12', N'In data quality, which is (are) the Sources of Data Pollution? ', N'System Conversions', N'Poor Database Design', N'Heterogeneous System Integration', N'All the others', N'All the others', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q120', N'Finding relevant and accurate information is often time-consuming and requires access to multiple systems causing organizations to lose a lot of productive employee time. One solution to this problem is the use of:', N'a. portals.', N'b. intermediaries.', N'c. browsers.', N'd. intranets.', N'a. portals.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q125', N'Human or electronic intermediaries attempt to address each of the following limitations of direct interaction EXCEPT:', N'a. search costs.', N'b. lack of privacy for those wanting to remain anonymous.', N'c. contract risk.', N'd. product distribution.', N'd. product distribution.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q126', N'provides customers with exactly what they want, when and where
they want it. Effective communication between the supply chain and the factory floor is needed to make it happen', N'a. Virtual manufacturing', N'b. Demand-driven manufacturing', N'c. Build-to-order manufacturing', N'd. Real-time manufacturing', N'b. Demand-driven manufacturing', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q128', N'The business forces that are driving the transition from traditional education to online learning are all of the following EXCEPT:', N'a. technological change.', N'b. competition and cost pressures.', N'c. network connectivity.', N'd. limited supply of faculty with specialized expertise.', N'd. limited supply of faculty with specialized expertise.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q145', N'When membership fees are the basis for revenue generation in an e-exchange, it has been shown that:', N'a. there should be a fee for every service provided; there should be no free services for members.', N'b. the higher the fees charged, the greater the total profit.', N'c. low membership fees often result in losses to the exchange,; however, high fees discourage participation.', N'd. when fees are very low, the exchange sees greater utilization which leads to greater revenue and profit.', N'c. low membership fees often result in losses to the exchange,; however, high fees discourage participation.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q152', N'Chem Connect is an example of a successful e-exchange with:', N'a. many buyers and many sellers', N'b. many buyers and few sellers', N'c. many buyers and one sellers', N'd. few buyers and few sellers', N'a. many buyers and many sellers', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q157', N'In dealing with exchange members, the management of the exchange should:', N'a. make certain that the exchange is neutral in its dealings with all members.', N'b. leave the management of day-to-day operations of the exchange to the members.', N'c. strive to maximize exchange revenues through charging the highest possible fees.', N'd. take special care of the companies that share ownership in the exchange.', N'a. make certain that the exchange is neutral in its dealings with all members.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q158', N'A is a form of business alliance composed of several business partners that share the costs and resources for the development or production of a product or service.', N'a. temporary corporation', N'b. supply chain', N'c. virtual corporation', N'd. co-opetition', N'c. virtual corporation', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q18', N'For sample size 1, the sampling distribution of the mean will be normally distributed', N'a. regardless of the shape of the population.', N'b. only if the population is normally distributed.', N'c. only if the population values are positive.', N'd. only if the shape of the population is symmetrical', N'b. only if the population is normally distributed.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q181', N'The inability to deliver products on time is a typical problem:', N'a. in traditional logistics only because the problem has been solved in e-commerce.', N'b. in both off-line and e-commerce.
', N'c. unique to e-commerce.', N'd. in global operations, but it is rarely a problem in domestic operations.', N'b. in both off-line and e-commerce.
', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q182', N'The second most often cited reason for customers not buying on the Web is:', N'a. the lack of a good return mechanism.', N'b. concern that ordered products won''t be delivered on time.', N'c. concerns about fraud.', N'd. not being able to see or try on a product before buying it.', N'a. the lack of a good return mechanism.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q19', N'When an ordered set of data is divided into four equal parts, the division point is called:', N'a. median', N'b. percentile', N'c. quartile', N'd. mean', N'c. quartile', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q192', N'Use a _________ to place code in the generated servlet outside of the _jspService() method', N'a. expression', N'b. comment', N'c. declaration', N'd. scriptlet', N'd. scriptlet', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q199', N'Which of the following is true of virtual banks?', N'a. Virtual banks have no physical location.', N'b. Virtual banks combine online and traditional branch banking services.', N'c. Stringent regulations have eliminated fraud risk in virtual banks.', N'd. Virtual banks have proven very successful and profitable.', N'a. Virtual banks have no physical location.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q2', N'Project scope differs from product scope in that', N'A. Product scope is the work that needs to be accomplished to deliver a product, service, or result.', N'B. Product scope completion is measured against the project management plan including all subsidiary plans', N'C. Project scope is the work that needs to be accomplished to deliver a product, service, or result.', N'D. Project scope completion is measured against the features, functions, and product requirements.', N'C. Project scope is the work that needs to be accomplished to deliver a product, service, or result.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q20', N'In which type of graphs the data set of the observations are recorded in the order in which they occur?', N'a. Time sequence plot', N'b. Histogram', N'c. Boxplot', N'd. Stem and leaf', N'a. Time sequence plot', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q21', N'A Type I error occurs when we', N'a. correctly reject a false null hypothesis', N'b. correctly fail to reject a false null hypothesis.', N'c. incorrectly reject a true null hypothesis.', N'd. incorrectly reject a false null hypothesis.', N'c. incorrectly reject a true null hypothesis.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q22', N'Two team members disagree on how to solve a project issue. They express their disagreement and then engage in a professional debate. This is an example of:', N'A. Unhealthy conflict.', N'B. Unrealistic conflict.', N'C. Unproductive conflict.', N'D. Healthy conflict.', N'D. Healthy conflict.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q229', N'All of the following are examples of e-government EXCEPT:', N'a. a company sells army and navy surplus supplies at auction over the Internet.', N'b. a contractor submits an application for a building permit using a city hall Web site.', N'c. an unemployed worker consults a Web site operated by the state employment department to learn about job openings in his city.', N'd. a state purchasing officer places an online order for office supplies from an e-catalog sent to her by a national office supply store.', N'a. a company sells army and navy surplus supplies at auction over the Internet.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q23', N'The collection and summarization of the socioeconomic and physical characteristics of the employees of a particular firm is an example of', N'a parameter.', N'inferential statistics.', N'a statistic.', N'descriptive statistics.', N'descriptive statistics.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q231', N'A business such as Apple Computers making online transactions with its trading partners is an example of:', N'a. B2B', N'b. B2C', N'c. e-CRM', N'd. EDI', N'a. B2B', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q238', N'A type of broker that helps consumers compare different stores is a:', N'a. virtual mall.', N'b. search agent.', N'c. shopping facilitator.', N'd. metamediary.', N'c. shopping facilitator.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q24', N'What does RAM stand for:', N'A. Responsibility Ambiguity Matrix', N'B. Responsibility Assignment Matrix', N'C. Responsibility Activity Matrix', N'D. Responsibility Action Matrix', N'B. Responsibility Assignment Matrix', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q256', N'- A large retail company gives an employment screening test to all prospective employees. Frankin Gilman recently took the test and it was reported back to him that his score placed him at the 80th percentile. Therefore:', N'80 people who took the test scored below Franklin.', N'Frankin was in the bottom 20 percent of those that have taken the test.', N'None of the other choices is correct', N'Frankin scored as high or higher than 80 percent of the people who took the test.', N'Frankin scored as high or higher than 80 percent of the people who took the test.', CAST(N'2020-05-25' AS Date), N'PRJ311', 3)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q26', N'What are the 5 approaches to conflict discussed in the Project Human Resources Management Lesson?', N'A. Confronting, Challenging, Smoothing, Forcing, Avoiding.', N'B. Confronting, Compromising, Smoothing, Forcing, Avoiding.', N'C. Confronting, Compromising, Smoothing, Uninterested, Challenging.', N'D. Communicating, Compromising, Smoothing, Forcing, Avoiding.', N'B. Confronting, Compromising, Smoothing, Forcing, Avoiding.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q265', N'A corporation uses the Internal Revenue Service''s Web site to learn how to pay its estimated quarterly income taxes. This is an example of:', N'a. G2G', N'b. G2B', N'c. G2C', N'd. E2E', N'b. G2B', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q266', N'Many companies employ a(n) _____ , which is a gateway for customers, employees, and partners to reach corporate information and to communicate with the company.', N'a. corporate portal', N'b. intranet', N'c. extranet', N'd. social network', N'a. corporate portal', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q27', N'The five project management process groups as described in the PMBOKÂ® Guide and discussed in the preceding lesson are:', N'A. Initiating, planning, executing, monitoring and controlling, closing', N'B. Define, measure, analyze, improve, control', N'C. Kickoff, requirements, plan, schedule, control', N'D. Requirements, design, development, testing, implementation', N'A. Initiating, planning, executing, monitoring and controlling, closing', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q275', N'A suite of network protocols designed to enable different kinds of wireless devices is called:', N'a. Wireless Application Protocol.', N'b. a mobile operating system.', N'c. a mobile application user interface.', N'd. wireless middleware.', N'a. Wireless Application Protocol.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q278', N'The portion of an e-seller''s business processes through which customers interact, including the seller''s portal, electronic catalogs, a shopping cart, a search engine, and a payment gateway is referred to as the of the business.', N'a. front end', N'b. back end', N'c. infrastructure', N'd. intermediary', N'a. front end', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q29', N'_______ are small pieces of information that are deposited on the client by the server.', N'a. Session', N'b. Cookie', N'c. Scriptlet', N'd. Directive', N'b. Cookie', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q293', N'A _____ is a company''s method of doing business to generate revenue to sustain itself.', N'a. marketing strategy', N'b. business model', N'c. value chain', N'd. business plan', N'b. business model', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q299', N'Public key infrastructure (PKI) is an authentication method', N'a. that has become the cornerstone for secure e-payments and intranet applications.', N'b. that is based on the Data Encryption Standard, which is the standard symmetric encryption algorithm supported by U.S. government agencies.', N'c. that encrypts and decrypts large amounts of data effectively.', N'd. that uses encryption keys ranging from 64 bits to 128 bits.', N'a. that has become the cornerstone for secure e-payments and intranet applications.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q3', N'The three components of the triple constraint are:', N'Scope, Performance, Time', N'Scope, Quality, Cost', N'Scope, Performance, Cost', N'Scope, Cost, Time', N'Scope, Performance, Time', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q311', N'Marketing that takes place without the help of intermediaries is called:
', N'a. direct marketing.', N'b. disintermediation', N'c. pure-play e-tailing', N'd. e-malls.', N'a. direct marketing.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q32', N'Which chat protocol that Android 1.0 didn''t support?', N'a. Yahoo! Messenger', N'b. Paltalk', N'c. Windows Live Messenger', N'd. Google Talk', N'b. Paltalk', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q321', N'If a stakeholder has high interest and high power then as the project manager you:', N'A. Can try to move them to be high interest and low power so they do not get in your way.', N'B. Focus your time and attention on them, they are very impactful to your project and you want to keep them engaged and positive.', N'C. Can try to move them to be low interest and low power so that they do not take up too much of your time.', N'D. Can ignore them, they are as you need them to be.', N'B. Focus your time and attention on them, they are very impactful to your project and you want to keep them engaged and positive.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q323', N'As in e-commerce, m-commerce B2C applications are concentrated in each of the following areas EXCEPT:', N'a. a. retail shopping for products and services', N'b. b. targeted advertising', N'c. c. telecommunications', N'd. d. providing content for a fee through mobile portals', N'c. c. telecommunications', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q332', N'A market maker bills a buyer for reviewing several seller contracts and making a recommendation on what to buy and from whom. The revenue model being used in this example is the:', N'a. fee for service model.', N'b. transaction fee model.', N'c. advertising fee model.', N'd. membership fee model.', N'c. advertising fee model.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q333', N'An online seller of travel services that generates revenue by charging fees for its
services is an example of a(n):', N'a. market maker.', N'b. transaction broker.', N'c. content disseminator.', N'd. viral marketer.', N'b. transaction broker.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q334', N'The exchange of updated information with other computing devices is called:', N'a. docking', N'b. data transferring', N'c. synchronization', N'd. marking', N'c. synchronization', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q34', N'A summary measure that is computed to describe a characteristic from only a sample of the
population is called ...', N'a. a statistic', N'b. a summary table', N'c. an ordered array', N'd. a parameter', N'a. a statistic', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q341', N'The ________ method returns a string containing the value of the named initialisation parameter', N'a. getInitParameter()', N'b. getServletConfig()', N'c. init()', N'd. jspInit', N'a. getInitParameter()', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q345', N'Software testing activities should start', N'a. as soon as the code is written', N'b. during the design stage', N'c. when the requirements have been formally documented', N'd. as soon as possible in the development life cycle', N'd. as soon as possible in the development life cycle', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q36', N'Who developed the Android 2.1 gallery?', N'a. Google', N'b. The Astonishing Tribe', N'c. Cooliris', N'd. ATAP', N'd. ATAP', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q37', N'The ________ method returns an array containing all the Cookie objects the client sent along with the request', N'a. getHeader()', N'b. getCookie()', N'c. getCookies()', N'd. getHeaders()', N'c. getCookies()', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q378', N'Brand building is important in B2B exchanges because:', N'a. exchange members typically buy only the best brands of product.', N'b. information flow is poor in most exchanges, making trust of suppliers very important.', N'c. it is easy for exchange members to change to another exchange.', N'd. exchange members typically buy products at the lowest cost unless branded.', N'c. it is easy for exchange members to change to another exchange.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q389', N'Mobile access supports the two functions of sales force mobilization and field service, which extends the reach of to both employees and business partners on a 24/7 basis to any place where recipients are located.', N'a. supply chain management', N'b. inventory management', N'c. customer relationship management', N'd. vendor management', N'c. customer relationship management', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q391', N'The protection of information systems against unauthorized access to or modification of information that is stored, processed, or being sent over a network is referred to as', N'a. Information assurance.', N'b. Information defense.', N'c. Information security triad.', N'd. Information integrity.', N'a. Information assurance.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q398', N'According to data from eMarketer, approximately shop online
and/or research offline-sales online', N'a. two in five Internet users age 18 and over.', N'b. three in four Internet users age 14 and over', N'c. three in four Internet users age 25 and over', N'd. two in five Internet users age 30 and over', N'b. three in four Internet users age 14 and over', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q4', N'When you report project status you compare actual performance to:', N'The planned performance or baseline.', N'The performance of previous projects.', N'The performance of your competitors', N'The performance of other similar projects.', N'The planned performance or baseline.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q427', N'The growth in electronic meeting systems has been driven by all of the following EXCEPT:', N'a. Shorter cycle times.', N'b. Improvements in supporting technology.', N'c. Reductions in the price of the technology.', N'd. Acceptance of virtual meetings as a respected way of doing business.', N'a. Shorter cycle times.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q43', N'What does the time often denote in Android product shots?', N'a. The build number', N'b. The release date', N'c. The Android version number', N'd. Nothing', N'd. Nothing', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q432', N'Identify the five engagement levels of stakeholders:', N'A. Unaware, resistant, neutral, supportive, oblivious', N'B. Unaware, resistant, strong-willed,', N'C. Unaware, resistant, neutral, supportive, leading', N'D. Unaware, resistant, strong-willed, supportive, leading', N'C. Unaware, resistant, neutral, supportive, leading', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q434', N'Boeing designing a product together with a business partner is this type of interaction:', N'a. Collaborative Commerce', N'b. Nonbusiness EC', N'c. B2B2C', N'd. B2B.', N'a. Collaborative Commerce', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q435', N'A ________has a name, a single value, and optional attributes such as a comment, path and domain qualifiers, a maximum age, and a version number.', N'a. session', N'b. response', N'c. cookie', N'd. request', N'c. cookie', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q44', N'Before Google and Nestle teamed up to call Android 4.4 "KitKat," what was it referred to as internally?', N'a. Kandy Korn', N'b. Key Lime Pie', N'c. Kaiser roll', N'd. Kiwi', N'b. Key Lime Pie', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q45', N'Before its release, what device was known as the "Nexus Prime"?', N'a. Galaxy Nexus', N'b. Nexus S', N'c. Nexus 10', N'd. Nexus 4', N'a. Galaxy Nexus', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q458', N'The TRUSTe seal is an example of:', N'a. a business rating.', N'b. an intermediary.', N'c. a B2B exchange.', N'd. a trustmark.', N'd. a trustmark.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q467', N'Which of the following does not correctly describe what firewalls protect against?', N'a. Some programs have bugs or special features that create application backdoors, which allowing for remote access.', N'b. Spammers often use SMTP session hijacking to redirect e-mail through the SMTP server of an unsuspecting host, which helps hide their identity.', N'c. Macros are the electronic equivalent of junk mail.', N'd. Remote logins occur when an unauthorized users connects to a PC and gains control of', N'c. Macros are the electronic equivalent of junk mail.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q47', N'What was the first Android version to have turn-by-turn GPS navigation?', N'a. Froyo', N'b. Gingerbread', N'c. Eclair', N'd. Ice Cream Sandwich', N'c. Eclair', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q48', N'What is Content Provider?', N'a. Content Providers are a separate league of components that expose a specific sets of data to applications', N'b. All of these', N'c. Content Providers store and retrieve data thus making it accessible to all', N'd. Content Providers are the only way to share data across Android applications', N'b. All of these', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q49', N'What is broadcast receiver?', N'a. Intercept the events from a user''s interaction with your application', N'b. The interactive components in your app''s user interface', N'c. Represents a behavior or a portion of user interface in an activity', N'd. A component that does thing but receive and react to broadcast announcements', N'd. A component that does thing but receive and react to broadcast announcements', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q5', N'A useful tool in identifying risks is the SWOT analysis. What does SWOT stand for?', N'A. Strengths, opportunities, winners, and threats', N'B. Strengths, obstacles, weaknesses, and threats', N'C. Scope, opportunities, weaknesses, and time', N'D. Strengths, opportunities, weaknesses, and threats', N'D. Strengths, opportunities, weaknesses, and threats', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q500', N'he original click-and-mortar strategy used by Toys R Us failed, as did the original toy venture of Amazon.com. Afterwards, Toys R Us sold toys online through Amazon.com. This is an example of:', N'a. disintermediation.', N'b. an alliance of a pure-player with a traditional retailer.', N'c. channel conflict.', N'd. reintermediation.', N'b. an alliance of a pure-player with a traditional retailer.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q511', N'The single factor that will determine which intermediaries continue to exist and which
are replaced is:', N'a. the ability of the intermediary to match up buyers and sellers', N'b. the profitability of the intermediary', N'c. the addition of value-added services by the intermediary', N'd. the length of the relationship between the intermediary and its customers', N'c. the addition of value-added services by the intermediary', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q512', N'According to the EC consumer behavior model, personal characteristics and
environmental characteristics are classified as:', N'a. independent variables', N'b. dependent variables', N'c. intervening variables', N'd. decision variables', N'a. independent variables', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q522', N'Online group purchasing organizations are known as:', N'a. SMEs', N'b. e-co-ops', N'c. exchanges', N'd. barters', N'b. e-co-ops', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q539', N'All of the following categories have already been selling well online EXCEPT:', N'a. new cars', N'b. travel', N'c. computer hardware and software', N'd. pet supplies', N'a. new cars', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q54', N'Popular search engines include all of the following EXCEPT:', N'a. Google', N'b. MSN', N'c. AltaVista', N'd. Lycos', N'c. AltaVista', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q546', N'According to the Business Environment Impact Model, _____ provide support to organizations'' activities and to actual performance, countering business pressures.', N'a. EC and IT', N'b. missions and strategies', N'c. core competencies and critical response activities', N'd. markets and government', N'a. EC and IT', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q548', N'Which of these is true about deployment descriptors (web.xml)?', N'a. The web-app element must include the servlet element.', N'b. The elements of deployment descriptor are case sensitive.', N'c. None of the others.', N'd. The servlet-mapping element, if defined, must be included within the servlet element.', N'b. The elements of deployment descriptor are case sensitive.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q555', N'...is suitable for mobile users who need to make very short-range device
to-device wireless connections within a small space, such as a single room, and most commonly with Bluetooth.', N'a. personal area network', N'b. local area network', N'c. wireless area network', N'd. Wi-Fi area network', N'a. personal area network', CAST(N'2020-05-25' AS Date), N'PRJ311', 3)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q56', N'After understanding of the problem space, the next step in design process is', N'a. None of the others.', N'b. Developing a conceptual model', N'c. Implement the product.', N'd. Design user interface:', N'b. Developing a conceptual model', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q566', N'Access to a network ought to be based on:', N'a. the policy of least privilege where access to network resources are blocked and permitted only when needed to conduct business.', N'b. the policy of acceptable use where access is restricted by the firewall.', N'c. role-specific security protocols where access is limited by a user''s level of trust.', N'd. the policy of need-to-know where access by all non-employees is blocked.', N'a. the policy of least privilege where access to network resources are blocked and permitted only when needed to conduct business.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q567', N'Which of the following commands will successfully build a WAR file?', N'a. jar -war myfile.war .', N'b. jar -cfv myfile.war *.class', N'c. jar -cvf myfile.war .', N'd. jar -tvf myfile.war .', N'c. jar -cvf myfile.war .', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q569', N'Digital products have different cost curves than those of regular products because:', N'a. in digitization, most of the costs are variable and fixed costs are low.', N'b. in digitization, most of the costs are fixed, and variable costs are very low.', N'c. in digitization, most of the costs are fixed, but variable costs are high.', N'd. in digitization, all of the costs are variable.', N'b. in digitization, most of the costs are fixed, and variable costs are very low.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q57', N'What company built the first Nexus device?', N'a. HTC', N'b. Google', N'c. Motorola', N'd. Foxconn', N'a. HTC', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q58', N'All of the following are the weaknesses of Waterfall Model except', N'a. Poor reflection of how designer work', N'b. The visibility of the process is not good', N'c. Has "system" or "technology" focus', N'd. Poor model of interactive system design:', N'b. The visibility of the process is not good', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q589', N'Which method is required for using the URL rewriting mechanism of implementing session support?', N'a.HttpServletRequest.encodeURL()', N'b.HttpServletResponse.encodeURL()', N'c.HttpServletResponse.decodeURL()', N'd.HttpServletRequest.rewriteURL()', N'b.HttpServletResponse.encodeURL()', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q6', N'Upward communication is communication to/from: updated', N'Your peers.', N'Your senior management.', N'Your direct reports.', N'Your social groups.', N'Your senior management.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q60', N'What is the main reason for testing software before releasing it?', N'a. to show that system will work after release', N'b. to decide when the software is of sufficient quality to release', N'c. to find as many bugs as possible before release', N'd. to give information for a risk based decision about release', N'd. to give information for a risk based decision about release', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q61', N'What is a type of notification that is not supported in android', N'a. Dialog notification', N'b. Toast notification', N'c. Status bar notification', N'd. Permission notification', N'd. Permission notification', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q612', N'Challenges that Boeing faced with its global collaboration for the design and assembly process of its new Dreamliner passenger plane included each of the following EXCEPT:', N'a. Data management', N'b. Information security', N'c. Teams working across various time zones', N'd. Lag time', N'd. Lag time', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q623', N'Android uses:', N'a. Java Virtual Machine.', N'b. Dalvik Virtual Machine.', N'c. Windows Virtual Machine.', N'd. Oracle Virtual Machine.', N'b. Dalvik Virtual Machine.', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q63', N'What is an Activity?', N'a. A single screen in an application, with supporting Java code.', N'b. A multiple screen in an application, with supporting Java code.', N'c. A single screen in an application, with supporting C++ code.', N'd. A multiple screen in an application, with supporting C++ code.', N'a. A single screen in an application, with supporting Java code.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q65', N'What year was Android founded?', N'a. 2005', N'b. 2003', N'c. 2001', N'd. 2008', N'b. 2003', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q654', N'In a projectized organization:', N'A. A project manager is not assigned to the team.', N'B. The functional manager has all of the power.', N'C. Team members are never assigned to the project full time.', N'D. The project manager acts as manager of the team.', N'D. The project manager acts as manager of the team.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q66', N'What is the "brand" of the clock widget in Android 1.0?', N'a. MIMO', N'b. Malmo', N'c. Clock', N'd. Google Clock', N'b. Malmo', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
GO
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q67', N'What was Android''s first packed-in music store?', N'a. Napster', N'b. Google Music', N'c. MP3.com', N'd. Amazon MP3', N'c. MP3.com', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q678', N'A servlet can contain instance variables but the developer can not create the servlet based on its constructors and parameters. A way to assign parameters to these variables is ......', N'a. getting parameters from the request''s query string.', N'b. getting parameters from the deployment descriptor file.', N'c. All of the others.', N'd. getting parameters from the cookies attached in the request.', N'c. All of the others.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q679', N'....are those who are young and comfortable with technology.', N'a. Leading edgers', N'b. Time-starved customers', N'c. New technologists', N'd. Shopping avoiders', N'c. New technologists', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q68', N'What was the first version to be updated with multitouch gestures like pinch zoom?', N'a. 4.0', N'b. 2.1', N'c. 2.3', N'd. 2.0', N'b. 2.1', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q69', N'A component that does nothing but receive and react to broadcast announcements', N'a. Broadcast', N'b. BroadcastReceiver', N'c. AbstractBroadcast', N'd. Broadcaster
', N'b. BroadcastReceiver', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q7', N'In case of identifying new opportunities of new technology, which approach should be used?', N'Analytical evaluation', N'All of the others', N'Usability testing', N'Field studies', N'Field studies', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q70', N'Represents a behavior or a portion of user interface in an activity', N'a. Fragment', N'b. Activity', N'c. Layout', N'd. View', N'a. Fragment', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q741', N'Software tools that scout the Web for stores that sell similar items at low prices are called:', N'a. Shopping portals.', N'b. Shopbots.', N'c. Shopping browsers.', N'd. Intelligent search engines.', N'b. Shopbots.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q756', N'The major attributes that enable development of new applications that are possible only in a mobile environment include all of the following EXCEPT:', N'a. Ubiquity', N'b. Security', N'c. Localization', N'd. Personalization', N'b. Security', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q76', N'What is fundamental building blocks / components of Android ?', N'a. Activities, Services, Broadcast Readers, Content Providers', N'b. Activities, Services, Broadcast Writers, Content Providers', N'c. Activities, Services, Broadcast Senders, Content Providers', N'd. Activities, Services, Broadcast Receivers, Content Providers', N'd. Activities, Services, Broadcast Receivers, Content Providers', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q79', N'______ allows designs to be refined based on feedbacks.', N'a. Construction', N'b. Iteration', N'c. Development', N'd. Interaction:', N'b. Iteration', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q8', N'Where is the usability testing conducted?', N'All of the others', N'controlled environment', N'user''s environment', N'In laboratory and natura', N'controlled environment', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q80', N'The best way to ensure that developments continues to take users'' activities into account is to involve real _____throughout
development', N'a. stakeholders', N'b. users', N'c. clients', N'd. customers:', N'b. users', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q81', N'In request dispatcher, both ______ and _______ methods are used for servlet communication', N'a. include/ forward', N'b. forward/ sendRedirect', N'c. forward/ response', N'd. include/ sendRedirect', N'a. include/ forward', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q82', N'Which of these characteristics of a filter is true?', N'a. A filter optimises the time it takes to send back a response from your Web server', N'b. A logging and auditing filter allow users to log in to a Web application', N'c. An authentication filter tracks the activities of users of a Web application', N'd. All of the others.', N'a. A filter optimises the time it takes to send back a response from your Web server', CAST(N'2020-05-25' AS Date), N'PRJ311', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q89', N'What does the FilterChain do?', N'a. It does nothing.', N'b. It invokes the next filter in the chain, or if the calling filter is the last filter in the chain, it invokes the resource at the end of the chain.', N'c. It invokes the first filter in the chain.', N'd. None of the others.', N'b. It invokes the next filter in the chain, or if the calling filter is the last filter in the chain, it invokes the resource at the end of the chain.', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q9', N'Which is the challenge of ETL?', N'A. Historical data on changes in values are not preserved in source operational systems.', N'B. Difficulties in finding the historical data.', N'C. Historical data mixed with current data.', N'D. None of the others', N'D. None of the others', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q907', N'PRJ321 stand for ?', N'a.Java Web', N'b.Java Desktop', N'c.Java OOP', N'd.XML', N'a.Java Web', CAST(N'2020-05-29' AS Date), N'PRJ321', 3)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q912', N'The _____ directory contains the archive files requires for Web Application such as database drivers', N'a. lib', N'b. tlds', N'c. classes', N'd. tags', N'a. lib', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q987', N'Which of the following interfaces or classes is used to retrieve the session associated with a user?', N'a. HttpServletRequest', N'b. ServletConfig', N'c. HttpServletResponse', N'd. ServletContext', N'a. HttpServletRequest', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q99', N'Which security mechanism proves that data has not been tampered with during its transit through the network?', N'a. Authorization', N'b. Data integrity', N'c. Data validation', N'd. Data privacy', N'b. Data integrity', CAST(N'2020-05-25' AS Date), N'PRJ321', 2)
INSERT [dbo].[tbl_Question] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q999', N'The presence of ...........diagrams in the requirements definition document is the major and significant difference between operational systems and data warehouse systems.', N'A. information package', N'B. organization', N'C. top leader', N'D. data sources', N'A. information package', CAST(N'2020-05-27' AS Date), N'PRJ311', 2)
SET IDENTITY_INSERT [dbo].[tbl_QuizHistory] ON 

INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (1, N'stu', N'PRJ311', 0, 0, CAST(N'00:00:04' AS Time), CAST(N'2020-06-01 12:53:06.940' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (2, N'stu', N'PRJ311', 1, 4, CAST(N'00:00:26' AS Time), CAST(N'2020-06-01 13:03:32.530' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (3, N'stu', N'PRJ321', 1.4, 7, CAST(N'00:00:41' AS Time), CAST(N'2020-06-01 13:07:56.617' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (4, N'stu', N'PRJ321', 0.4, 2, CAST(N'00:00:36' AS Time), CAST(N'2020-06-01 13:16:03.650' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (5, N'stu', N'PRJ311', 0, 0, CAST(N'00:00:04' AS Time), CAST(N'2020-06-01 20:04:38.703' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (6, N'stu', N'PRJ311', 0.25, 1, CAST(N'00:00:59' AS Time), CAST(N'2020-06-01 20:07:18.260' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (7, N'stu', N'PRJ321', 0.4, 2, CAST(N'00:01:44' AS Time), CAST(N'2020-06-01 20:22:01.047' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (8, N'stu', N'PRJ311', 0.25, 1, CAST(N'00:00:59' AS Time), CAST(N'2020-06-01 22:20:12.610' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (9, N'stu', N'PRJ311', 0.25, 1, CAST(N'00:00:07' AS Time), CAST(N'2020-06-01 22:21:44.740' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (10, N'stu', N'PRJ311', 0, 0, CAST(N'00:00:59' AS Time), CAST(N'2020-06-01 22:22:48.893' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (11, N'stu', N'PRJ311', 0.25, 1, CAST(N'00:00:13' AS Time), CAST(N'2020-06-01 22:26:08.867' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (12, N'stu', N'PRJ311', 1, 4, CAST(N'00:00:59' AS Time), CAST(N'2020-06-02 10:51:26.603' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (13, N'phuong123@gmail.com', N'PRJ311', 0.25, 1, CAST(N'00:00:59' AS Time), CAST(N'2020-06-04 09:05:37.527' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (14, N'phuong18@gmail.com', N'PRJ311', 0.25, 1, CAST(N'00:00:03' AS Time), CAST(N'2020-06-04 09:34:09.387' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (15, N'phuong18@gmail.com', N'PRJ311', 0, 0, CAST(N'00:00:02' AS Time), CAST(N'2020-06-04 09:34:18.633' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (16, N'phuong18@gmail.com', N'PRJ311', 0, 0, CAST(N'00:00:03' AS Time), CAST(N'2020-06-04 09:34:25.727' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (20, N'stu', N'PRJ321', 0.2, 1, CAST(N'00:00:02' AS Time), CAST(N'2020-06-04 10:37:37.507' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (23, N'stu', N'PRJ311', 0.25, 1, CAST(N'00:00:30' AS Time), CAST(N'2020-06-04 10:41:55.170' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (24, N'stu', N'PRJ311', 0.75, 3, CAST(N'00:00:59' AS Time), CAST(N'2020-06-04 11:27:53.573' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (25, N'stu', N'PRJ311', 0.5, 2, CAST(N'00:00:18' AS Time), CAST(N'2020-06-04 20:02:10.567' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (26, N'stu', N'PRJ311', 0, 0, CAST(N'00:00:09' AS Time), CAST(N'2020-06-04 20:03:01.327' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (27, N'stu', N'PRJ321', 0.2, 1, CAST(N'00:00:05' AS Time), CAST(N'2020-06-04 20:15:48.430' AS DateTime))
INSERT [dbo].[tbl_QuizHistory] ([id], [userEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (28, N'stu', N'PRJ311', 0.5, 2, CAST(N'00:00:10' AS Time), CAST(N'2020-06-04 20:28:04.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_QuizHistory] OFF
INSERT [dbo].[tbl_Role] ([role], [description]) VALUES (1, N'Admin     ')
INSERT [dbo].[tbl_Role] ([role], [description]) VALUES (2, N'Student   ')
INSERT [dbo].[tbl_Status] ([status], [description]) VALUES (1, N'New       ')
INSERT [dbo].[tbl_Status] ([status], [description]) VALUES (2, N'Active    ')
INSERT [dbo].[tbl_Status] ([status], [description]) VALUES (3, N'deActive  ')
INSERT [dbo].[tbl_Subject] ([subjectID], [subjectName], [quizTime], [numberQuestion], [status]) VALUES (N'PRJ311', N'Java Desktop', 50, 40, 2)
INSERT [dbo].[tbl_Subject] ([subjectID], [subjectName], [quizTime], [numberQuestion], [status]) VALUES (N'PRJ321', N'Java Web', 80, 50, 2)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong@fm.com', N'phuong', N'3ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 1)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong@fpt.com', N'phuong', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 1)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong1@fm.com', N'asss', N'462cec7ef82bc2d63e7625b0288d5de28468d75e66fd8bc28d228c0081b6d0a7', 2, 1)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong12@gmail.com', N'Phuong nguyen', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 2)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong123@gmail.com', N'phuong', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 2)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'phuong18@gmail.com', N'phuong', N'3a4722b37caef5d31f6874bfece74f634efc3a577ac4332ab5ff2095dd92d961', 2, 2)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'sa', N'admin', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1, 2)
INSERT [dbo].[tbl_User] ([email], [name], [password], [role], [status]) VALUES (N'stu', N'Phuong Nguyen', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2, 2)
ALTER TABLE [dbo].[tbl_Question]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Question_tbl_Status] FOREIGN KEY([status])
REFERENCES [dbo].[tbl_Status] ([status])
GO
ALTER TABLE [dbo].[tbl_Question] CHECK CONSTRAINT [FK_tbl_Question_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_Question]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Question_tbl_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tbl_Subject] ([subjectID])
GO
ALTER TABLE [dbo].[tbl_Question] CHECK CONSTRAINT [FK_tbl_Question_tbl_Subject]
GO
ALTER TABLE [dbo].[tbl_QuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_QuizHistory_tbl_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tbl_Subject] ([subjectID])
GO
ALTER TABLE [dbo].[tbl_QuizHistory] CHECK CONSTRAINT [FK_tbl_QuizHistory_tbl_Subject]
GO
ALTER TABLE [dbo].[tbl_QuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_QuizHistory_tbl_User] FOREIGN KEY([userEmail])
REFERENCES [dbo].[tbl_User] ([email])
GO
ALTER TABLE [dbo].[tbl_QuizHistory] CHECK CONSTRAINT [FK_tbl_QuizHistory_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Subject]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Subject_tbl_Status] FOREIGN KEY([status])
REFERENCES [dbo].[tbl_Status] ([status])
GO
ALTER TABLE [dbo].[tbl_Subject] CHECK CONSTRAINT [FK_tbl_Subject_tbl_Status]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_Role] FOREIGN KEY([role])
REFERENCES [dbo].[tbl_Role] ([role])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_Role]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_StatusUser] FOREIGN KEY([status])
REFERENCES [dbo].[tbl_Status] ([status])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_StatusUser]
GO
USE [master]
GO
ALTER DATABASE [QuizOnline] SET  READ_WRITE 
GO
