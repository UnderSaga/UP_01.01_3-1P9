
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/16/2023 14:41:23
-- Generated from EDMX file: C:\Users\Администратор\source\repos\UP_01.01_3-1P9\JournalApp\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [YP01013-1P9];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Group_Special]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Group] DROP CONSTRAINT [FK_Group_Special];
GO
IF OBJECT_ID(N'[dbo].[FK_Jurnal_Discipline]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Jurnal] DROP CONSTRAINT [FK_Jurnal_Discipline];
GO
IF OBJECT_ID(N'[dbo].[FK_Jurnal_Group]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Jurnal] DROP CONSTRAINT [FK_Jurnal_Group];
GO
IF OBJECT_ID(N'[dbo].[FK_Jurnal_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Jurnal] DROP CONSTRAINT [FK_Jurnal_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Lesson_Jurnal]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Lesson] DROP CONSTRAINT [FK_Lesson_Jurnal];
GO
IF OBJECT_ID(N'[dbo].[FK_Student_Group]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Group];
GO
IF OBJECT_ID(N'[Хранилище ModelContainer].[FK_StudentGrade_Grade]', 'F') IS NOT NULL
    ALTER TABLE [Хранилище ModelContainer].[StudentGrade] DROP CONSTRAINT [FK_StudentGrade_Grade];
GO
IF OBJECT_ID(N'[Хранилище ModelContainer].[FK_StudentGrade_Lesson]', 'F') IS NOT NULL
    ALTER TABLE [Хранилище ModelContainer].[StudentGrade] DROP CONSTRAINT [FK_StudentGrade_Lesson];
GO
IF OBJECT_ID(N'[Хранилище ModelContainer].[FK_StudentGrade_Student]', 'F') IS NOT NULL
    ALTER TABLE [Хранилище ModelContainer].[StudentGrade] DROP CONSTRAINT [FK_StudentGrade_Student];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Discipline]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Discipline];
GO
IF OBJECT_ID(N'[dbo].[Grade]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grade];
GO
IF OBJECT_ID(N'[dbo].[Group]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Group];
GO
IF OBJECT_ID(N'[dbo].[Jurnal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Jurnal];
GO
IF OBJECT_ID(N'[dbo].[Lesson]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Lesson];
GO
IF OBJECT_ID(N'[dbo].[Special]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Special];
GO
IF OBJECT_ID(N'[dbo].[Student]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Student];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[Хранилище ModelContainer].[StudentGrade]', 'U') IS NOT NULL
    DROP TABLE [Хранилище ModelContainer].[StudentGrade];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Discipline'
CREATE TABLE [dbo].[Discipline] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Ship] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'Group'
CREATE TABLE [dbo].[Group] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Special] int  NOT NULL,
    [SubGroup] int  NOT NULL,
    [ClassRoom] int  NOT NULL,
    [StartYear] int  NOT NULL,
    [Code] nvarchar(10)  NOT NULL
);
GO

-- Creating table 'Jurnal'
CREATE TABLE [dbo].[Jurnal] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Group] int  NOT NULL,
    [Teacher] int  NOT NULL,
    [Discipline] int  NOT NULL
);
GO

-- Creating table 'Special'
CREATE TABLE [dbo].[Special] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(1)  NOT NULL,
    [Name] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'User'
CREATE TABLE [dbo].[User] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(30)  NOT NULL,
    [Password] nvarchar(32)  NOT NULL
);
GO

-- Creating table 'Student'
CREATE TABLE [dbo].[Student] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(100)  NOT NULL,
    [LastName] nvarchar(100)  NOT NULL,
    [Patronomic] nvarchar(100)  NULL,
    [GroupID] int  NOT NULL
);
GO

-- Creating table 'Grade'
CREATE TABLE [dbo].[Grade] (
    [Value] nvarchar(5)  NOT NULL
);
GO

-- Creating table 'Lesson'
CREATE TABLE [dbo].[Lesson] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [JournalID] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [CountOfHours] int  NOT NULL,
    [TopicOfLesson] nvarchar(200)  NOT NULL,
    [HomeWork] nvarchar(200)  NOT NULL
);
GO

-- Creating table 'StudentGrade'
CREATE TABLE [dbo].[StudentGrade] (
    [StudentID] int  NOT NULL,
    [GradeID] nvarchar(5)  NOT NULL,
    [LessonID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Discipline'
ALTER TABLE [dbo].[Discipline]
ADD CONSTRAINT [PK_Discipline]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Group'
ALTER TABLE [dbo].[Group]
ADD CONSTRAINT [PK_Group]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Jurnal'
ALTER TABLE [dbo].[Jurnal]
ADD CONSTRAINT [PK_Jurnal]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Special'
ALTER TABLE [dbo].[Special]
ADD CONSTRAINT [PK_Special]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'User'
ALTER TABLE [dbo].[User]
ADD CONSTRAINT [PK_User]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Student'
ALTER TABLE [dbo].[Student]
ADD CONSTRAINT [PK_Student]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [Value] in table 'Grade'
ALTER TABLE [dbo].[Grade]
ADD CONSTRAINT [PK_Grade]
    PRIMARY KEY CLUSTERED ([Value] ASC);
GO

-- Creating primary key on [ID] in table 'Lesson'
ALTER TABLE [dbo].[Lesson]
ADD CONSTRAINT [PK_Lesson]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [StudentID], [GradeID], [LessonID] in table 'StudentGrade'
ALTER TABLE [dbo].[StudentGrade]
ADD CONSTRAINT [PK_StudentGrade]
    PRIMARY KEY CLUSTERED ([StudentID], [GradeID], [LessonID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Discipline] in table 'Jurnal'
ALTER TABLE [dbo].[Jurnal]
ADD CONSTRAINT [FK_Jurnal_Discipline]
    FOREIGN KEY ([Discipline])
    REFERENCES [dbo].[Discipline]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Jurnal_Discipline'
CREATE INDEX [IX_FK_Jurnal_Discipline]
ON [dbo].[Jurnal]
    ([Discipline]);
GO

-- Creating foreign key on [Special] in table 'Group'
ALTER TABLE [dbo].[Group]
ADD CONSTRAINT [FK_Group_Special]
    FOREIGN KEY ([Special])
    REFERENCES [dbo].[Special]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Group_Special'
CREATE INDEX [IX_FK_Group_Special]
ON [dbo].[Group]
    ([Special]);
GO

-- Creating foreign key on [Group] in table 'Jurnal'
ALTER TABLE [dbo].[Jurnal]
ADD CONSTRAINT [FK_Jurnal_Group]
    FOREIGN KEY ([Group])
    REFERENCES [dbo].[Group]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Jurnal_Group'
CREATE INDEX [IX_FK_Jurnal_Group]
ON [dbo].[Jurnal]
    ([Group]);
GO

-- Creating foreign key on [Teacher] in table 'Jurnal'
ALTER TABLE [dbo].[Jurnal]
ADD CONSTRAINT [FK_Jurnal_User]
    FOREIGN KEY ([Teacher])
    REFERENCES [dbo].[User]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Jurnal_User'
CREATE INDEX [IX_FK_Jurnal_User]
ON [dbo].[Jurnal]
    ([Teacher]);
GO

-- Creating foreign key on [GroupID] in table 'Student'
ALTER TABLE [dbo].[Student]
ADD CONSTRAINT [FK_Student_Group]
    FOREIGN KEY ([GroupID])
    REFERENCES [dbo].[Group]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Student_Group'
CREATE INDEX [IX_FK_Student_Group]
ON [dbo].[Student]
    ([GroupID]);
GO

-- Creating foreign key on [GradeID] in table 'StudentGrade'
ALTER TABLE [dbo].[StudentGrade]
ADD CONSTRAINT [FK_StudentGrade_Grade]
    FOREIGN KEY ([GradeID])
    REFERENCES [dbo].[Grade]
        ([Value])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentGrade_Grade'
CREATE INDEX [IX_FK_StudentGrade_Grade]
ON [dbo].[StudentGrade]
    ([GradeID]);
GO

-- Creating foreign key on [JournalID] in table 'Lesson'
ALTER TABLE [dbo].[Lesson]
ADD CONSTRAINT [FK_Lesson_Jurnal]
    FOREIGN KEY ([JournalID])
    REFERENCES [dbo].[Jurnal]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Lesson_Jurnal'
CREATE INDEX [IX_FK_Lesson_Jurnal]
ON [dbo].[Lesson]
    ([JournalID]);
GO

-- Creating foreign key on [LessonID] in table 'StudentGrade'
ALTER TABLE [dbo].[StudentGrade]
ADD CONSTRAINT [FK_StudentGrade_Lesson]
    FOREIGN KEY ([LessonID])
    REFERENCES [dbo].[Lesson]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentGrade_Lesson'
CREATE INDEX [IX_FK_StudentGrade_Lesson]
ON [dbo].[StudentGrade]
    ([LessonID]);
GO

-- Creating foreign key on [StudentID] in table 'StudentGrade'
ALTER TABLE [dbo].[StudentGrade]
ADD CONSTRAINT [FK_StudentGrade_Student]
    FOREIGN KEY ([StudentID])
    REFERENCES [dbo].[Student]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------