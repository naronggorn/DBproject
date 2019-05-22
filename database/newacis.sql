-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2019 at 04:39 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET GLOBAL time_zone = '+7:00';

CREATE DATABASE newacis
DEFAULT CHARACTER SET UTF8
DEFAULT COLLATE utf8_general_ci;

CREATE USER 'newacis'@'localhost' IDENTIFIED BY '12345678';

GRANT ALL PRIVILEGES ON newacis.* TO 'newacis'@'localhost';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newacis`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor_info`
--

use newacis;

CREATE TABLE `advisor_info` (
  `advisorID` varchar(11) NOT NULL,
  `advisor_name` varchar(20) NOT NULL,
  `advisor_faculty` varchar(60) NOT NULL,
  `advisor_department` varchar(70) NOT NULL,
  `student_year` int(1) NOT NULL,
  `advisor_tel` varchar(10) NOT NULL,
  `advisor_eamil` varchar(25) NOT NULL,
  `password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advisor_info`
--

INSERT INTO `advisor_info` (`advisorID`, `advisor_name`, `advisor_faculty`, `advisor_department`, `student_year`, `advisor_tel`, `advisor_eamil`, `password`) VALUES
('01225489', 'อาจารย์ หนึ่ง', 'คณะเทคโนโลยีสารสนเทศ', 'ภาควิชาเทคโนโลยีสารสนเทศ-เทคโนโลยีสารสนเทศ', 2, '0123456789', 'one@mail.com', '87654321'),
('01225490', 'อาจารย์ สอง', 'คณะวิศวกรรมศาสตร์', 'ภาควิชาวิศวกรรมคอมพิวเตอร์-วิศวกรรมคอมพิวเตอร์', 1, '0987654321', 'two@mail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` varchar(6) NOT NULL,
  `course_semester_year` varchar(6) NOT NULL,
  `course_name` varchar(70) NOT NULL,
  `course_credit` int(2) NOT NULL,
  `course_exam` varchar(30) NOT NULL,
  `course_exam_room` varchar(7) NOT NULL,
  `course_group` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `course_semester_year`, `course_name`, `course_credit`, `course_exam`, `course_exam_room`, `course_group`) VALUES
('CPE100', '1/2561', 'Computer Programming for Engineers', 3, 'Mon 1-April-2019 9.00-12.00', 'CB2999', 'วิชาบังคับ'),
('CPE111', '2/2561', 'Programming with Data Structure', 3, 'Tue 2-April-2019 9.00-12.00', 'CB3000', 'กลุ่มโครงสร้างพื้นฐานของระบบ');

-- --------------------------------------------------------

--
-- Table structure for table `course_category`
--

CREATE TABLE `course_category` (
  `categoryID` varchar(6) NOT NULL,
  `category_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_category`
--

INSERT INTO `course_category` (`categoryID`, `category_name`) VALUES
('GEN', 'หมวดวิชาศึกษาทั่วไป'),
('SPC', 'หมวดวิชาเฉพาะ');

-- --------------------------------------------------------

--
-- Table structure for table `course_group`
--

CREATE TABLE `course_group` (
  `categoryID` varchar(6) NOT NULL,
  `subjectID` varchar(6) NOT NULL,
  `courseID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_group`
--

INSERT INTO `course_group` (`categoryID`, `subjectID`, `courseID`) VALUES
('SPC', 'SPC001', 'CPE100'),
('SPC', 'SPC002', 'CPE111');

-- --------------------------------------------------------

--
-- Table structure for table `course_section`
--

CREATE TABLE `course_section` (
  `courseID` varchar(6) NOT NULL,
  `year_semester` varchar(6) NOT NULL,
  `course_section` int(2) NOT NULL,
  `course_seat` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_section`
--

INSERT INTO `course_section` (`courseID`, `year_semester`, `course_section`, `course_seat`) VALUES
('CPE100', '1/2561', 1, 45),
('CPE100', '1/2561', 2, 45),
('CPE111', '1/2561', 1, 90);

-- --------------------------------------------------------

--
-- Table structure for table `course_subject`
--

CREATE TABLE `course_subject` (
  `subjectID` varchar(6) NOT NULL,
  `subject_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_subject`
--

INSERT INTO `course_subject` (`subjectID`, `subject_name`) VALUES
('SPC001', 'วิชาแกนทางวิศวกรรม'),
('SPC002', 'วิชาเฉพาะด้าน');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculumID` varchar(10) NOT NULL,
  `curriculum_name` varchar(70) NOT NULL,
  `year_of_study` int(4) NOT NULL,
  `faculty` varchar(60) NOT NULL,
  `department` varchar(80) NOT NULL,
  `education_level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculumID`, `curriculum_name`, `year_of_study`, `faculty`, `department`, `education_level`) VALUES
('25540098', 'วิศวกรรมศาสตรบัณฑิต สาขาวิชาวิศวกรรมคอมพิวเตอร์ ปริญญาตรี 4 ปี', 2561, 'คณะวิศวกรรมศาสตร์', 'ภาควิชาวิศวกรรมคอมพิวเตอร์-วิศวกรรมคอมพิวเตอร์', 1),
('25570081', 'หลักสูตรวิทยาศาสตรบัณฑิต สาขาวิชาเทคโนโลยีสารสนเทศ ปริญญาตรี 4 ปี', 2561, 'คณะเทคโนโลยีสารสนเทศ', 'ภาควิชาเทคโนโลยีสารสนเทศ-เทคโนโลยีสารสนเทศ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `curriculum_course`
--

CREATE TABLE `curriculum_course` (
  `curriculumID` varchar(10) NOT NULL,
  `courseID` varchar(6) NOT NULL,
  `year` int(1) NOT NULL,
  `semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `curriculum_course`
--

INSERT INTO `curriculum_course` (`curriculumID`, `courseID`, `year`, `semester`) VALUES
('25540098', 'CPE100', 1, 1),
('25540098', 'CPE111', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `loggingID` int(10) NOT NULL,
  `user` varchar(15) NOT NULL,
  `events` varchar(25) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `parent_child`
--

CREATE TABLE `parent_child` (
  `studentID` varchar(11) NOT NULL,
  `parentID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parent_child`
--

INSERT INTO `parent_child` (`studentID`, `parentID`) VALUES
('60070501001', '03225490'),
('60070501002', '03225490');

-- --------------------------------------------------------

--
-- Table structure for table `parent_info`
--

CREATE TABLE `parent_info` (
  `parentID` varchar(10) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `mother_name` varchar(50) NOT NULL,
  `parent_name` varchar(50) NOT NULL,
  `parent_address` text NOT NULL,
  `parent_tel` varchar(10) NOT NULL,
  `parent_relation` varchar(5) NOT NULL,
  `password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parent_info`
--

INSERT INTO `parent_info` (`parentID`, `password`, `father_name`, `mother_name`, `parent_name`, `parent_address`, `parent_tel`, `parent_relation`) VALUES
('03225490', '12345678', 'บิดา หนึ่ง', 'มารดา หนึ่ง', 'ผู้ปกครอง หนึ่ง', '104 แขวงบางมด เขตทุ่งครุ กรุงเทพ 10140', '0123987456', 'บิดา');

-- --------------------------------------------------------

--
-- Table structure for table `pre_course`
--

CREATE TABLE `pre_course` (
  `courseID` varchar(6) NOT NULL,
  `precourseID` varchar(6) NOT NULL,
  `condition` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_course`
--

INSERT INTO `pre_course` (`courseID`, `precourseID`, `condition`) VALUES
('CPE111', 'CPE100', 'ไม่ติด F ในรายวิชา CPE100');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `studentID` varchar(11) NOT NULL,
  `courseID` varchar(6) NOT NULL,
  `section` int(2) NOT NULL,
  `registration_status` varchar(10) NOT NULL,
  `year_of_study` int(4) NOT NULL,
  `grade` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`studentID`, `courseID`, `section`, `registration_status`, `year_of_study`, `grade`) VALUES
('60070501001', 'CPE100', 1, 'ปกติ', 2561, NULL),
('60070501001', 'CPE111', 1, 'ปกติ', 2561, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `section_instructor`
--

CREATE TABLE `section_instructor` (
  `courseID` varchar(6) NOT NULL,
  `year_semester` varchar(6) NOT NULL,
  `instructor` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_instructor`
--

INSERT INTO `section_instructor` (`courseID`, `year_semester`, `instructor`) VALUES
('CPE100', '1/2561', '01225490'),
('CPE111', '1/2561', '01225490');

-- --------------------------------------------------------

--
-- Table structure for table `section_time`
--

CREATE TABLE `section_time` (
  `courseID` varchar(6) NOT NULL,
  `year_semester` varchar(6) NOT NULL,
  `day` varchar(3) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `room` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_time`
--

INSERT INTO `section_time` (`courseID`, `year_semester`, `day`, `start_time`, `end_time`, `room`) VALUES
('CPE100', '1/2561', '08:', '10:30:00', '00:00:00', '1113'),
('CPE111', '1/2561', '13:', '16:30:00', '00:00:00', '1112');

-- --------------------------------------------------------

--
-- Table structure for table `staff_info`
--

CREATE TABLE `staff_info` (
  `staffID` varchar(11) NOT NULL,
  `staff_name` varchar(20) NOT NULL,
  `staff_surname` varchar(20) NOT NULL,
  `password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staff_info`
--

INSERT INTO `staff_info` (`staffID`, `staff_name`, `staff_surname`, `password`) VALUES
('0881567', 'สตาฟ', 'หนึ่ง', '87654321'),
('0881568', 'สตาฟ', 'สอง', '87654321');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `studentID` varchar(11) NOT NULL,
  `curriculumID` varchar(10) NOT NULL,
  `name_title` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `year_of_study` int(4) NOT NULL,
  `student_status` varchar(10) NOT NULL,
  `password` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`studentID`, `curriculumID`, `name`, `surname`, `name_title`, `year_of_study`, `student_status`, `password`) VALUES
('60070501001', '25540098', 'ทดสอบ', 'หนึ่ง', 'นาย', 2561, 'ปกติ', '12345678'),
('60070501002', '25570081', 'ทดสอบ', 'สอง', 'นาย', 2561, 'ปกติ', '87654321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor_info`
--
ALTER TABLE `advisor_info`
  ADD PRIMARY KEY (`advisorID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`,`course_semester_year`);

--
-- Indexes for table `course_category`
--
ALTER TABLE `course_category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `course_group`
--
ALTER TABLE `course_group`
  ADD PRIMARY KEY (`categoryID`,`subjectID`,`courseID`),
  ADD KEY `COU_SUBJ_FK` (`subjectID`),
  ADD KEY `COU_ID_FK` (`courseID`);

--
-- Indexes for table `course_section`
--
ALTER TABLE `course_section`
  ADD PRIMARY KEY (`courseID`,`year_semester`,`course_section`);

--
-- Indexes for table `course_subject`
--
ALTER TABLE `course_subject`
  ADD PRIMARY KEY (`subjectID`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculumID`);

--
-- Indexes for table `curriculum_course`
--
ALTER TABLE `curriculum_course`
  ADD PRIMARY KEY (`curriculumID`,`courseID`),
  ADD KEY `CURR_COU_FK` (`courseID`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`loggingID`),
  ADD KEY `STAFF_FK` (`user`);

--
-- Indexes for table `parent_child`
--
ALTER TABLE `parent_child`
  ADD PRIMARY KEY (`studentID`,`parentID`),
  ADD KEY `PARENT_FK` (`parentID`);

--
-- Indexes for table `parent_info`
--
ALTER TABLE `parent_info`
  ADD PRIMARY KEY (`parentID`);

--
-- Indexes for table `pre_course`
--
ALTER TABLE `pre_course`
  ADD PRIMARY KEY (`courseID`,`precourseID`),
  ADD KEY `PRE_COU_2_FK` (`precourseID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`studentID`,`courseID`),
  ADD KEY `REG_COU_FK` (`courseID`);

--
-- Indexes for table `section_instructor`
--
ALTER TABLE `section_instructor`
  ADD PRIMARY KEY (`courseID`,`year_semester`,`instructor`),
  ADD KEY `AVD_INS_FK` (`instructor`);

--
-- Indexes for table `section_time`
--
ALTER TABLE `section_time`
  ADD PRIMARY KEY (`courseID`,`year_semester`,`day`);

--
-- Indexes for table `staff_info`
--
ALTER TABLE `staff_info`
  ADD PRIMARY KEY (`staffID`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `STU_CURR_FK` (`curriculumID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `loggingID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_group`
--
ALTER TABLE `course_group`
  ADD CONSTRAINT `COU_CATE_FK` FOREIGN KEY (`categoryID`) REFERENCES `course_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `COU_ID_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `COU_SUBJ_FK` FOREIGN KEY (`subjectID`) REFERENCES `course_subject` (`subjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_section`
--
ALTER TABLE `course_section`
  ADD CONSTRAINT `COU_SEC_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `curriculum_course`
--
ALTER TABLE `curriculum_course`
  ADD CONSTRAINT `CURR_COU_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CURR_FK` FOREIGN KEY (`curriculumID`) REFERENCES `curriculum` (`curriculumID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logging`
--
ALTER TABLE `logging`
  ADD CONSTRAINT `ADVISOR_FK` FOREIGN KEY (`user`) REFERENCES `advisor_info` (`advisorID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `STAFF_FK` FOREIGN KEY (`user`) REFERENCES `staff_info` (`staffID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `STUDENT_FK` FOREIGN KEY (`user`) REFERENCES `student_info` (`studentID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `parent_child`
--
ALTER TABLE `parent_child`
  ADD CONSTRAINT `CHILD_FK` FOREIGN KEY (`studentID`) REFERENCES `student_info` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PARENT_FK` FOREIGN KEY (`parentID`) REFERENCES `parent_info` (`parentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pre_course`
--
ALTER TABLE `pre_course`
  ADD CONSTRAINT `PRE_COU_2_FK` FOREIGN KEY (`precourseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PRE_COU_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `REG_COU_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `REG_STD_FK` FOREIGN KEY (`studentID`) REFERENCES `student_info` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `section_instructor`
--
ALTER TABLE `section_instructor`
  ADD CONSTRAINT `AVD_INS_FK` FOREIGN KEY (`instructor`) REFERENCES `advisor_info` (`advisorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SEC_INS_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `section_time`
--
ALTER TABLE `section_time`
  ADD CONSTRAINT `SEC_TIME_FK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_info`
--
ALTER TABLE `student_info`
  ADD CONSTRAINT `STU_CURR_FK` FOREIGN KEY (`curriculumID`) REFERENCES `curriculum` (`curriculumID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
