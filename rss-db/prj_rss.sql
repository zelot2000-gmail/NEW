-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2020 at 07:16 AM
-- Server version: 5.7.24-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `prj_rss`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_rss`
--

CREATE TABLE IF NOT EXISTS `tb_rss` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `deptid` varchar(20) NOT NULL,
  `types` varchar(5) NOT NULL,
  `title` varchar(300) NOT NULL,
  `link` varchar(200) NOT NULL,
  `description` text,
  `sdate` date NOT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT '0',
  `lastupdate` datetime NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;
--) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `tb_rss`
--

INSERT INTO `tb_rss` (`link_id`, `deptid`, `types`, `title`, `link`, `description`, `sdate`, `confirm`, `lastupdate`) VALUES
(1, '0304', 'P0', 'การจ้างบริการรักษาความปลอดภัย', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(2, '0304', 'P0', 'จ้างบำรุงรักษาและซ่อมแซมแก้ไขเครื่องปรับอากาศ (แบบรวมอะไหล่) จำนวน 510 เครื่อง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(3, '0304', 'P0', 'จ้างทำความสะอาดอาคารกรมบัญชีกลาง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(4, '0304', 'P0', 'โครงการพัฒนาระบบการบริหารจัดการฐานข้อมูลขนาดใหญ่  (Big Data) และระบบการวิเคราะห์ข้อมูล (Data Analytics) สำหรับกรมบัญชีกลาง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(5, '0304', 'P0', 'โครงการจัดหาและทดแทนเครื่องไมโครคอมพิวเตอร์และอุปกรณ์ต่อพ่วงกรมบัญชีกลาง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(6, '0304', 'P0', 'โครงการเพิ่มประสิทธิภาพเครื่องคอมพิวเตอร์แม่ข่ายแบบเสมือน และพัฒนาระบบ Private Cloud กรมบัญชีกลาง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(7, '0304', 'P0', 'โครงการระบบรักษาความปลอดภัยสารสนเทศและวิเคราะห์ข้อมูล Log สำหรับศูนย์คอมพิวเตอร์หลัก (Data Center)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M63010030514&templatetypes=P0&temp_Announ=P&temp_itemNo=&seqNo=', '', '2020-01-28', 1, '2020-02-02 12:07:11'),
(8, '0304', '15', 'ประกวดราคาซื้อจัดซื้อรถโดยสาร ขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ จำนวน 1 คัน ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=63017389462&fileName=pricebuild_0300400068_63017389462.zip', '', '2020-01-30', 1, '2020-02-02 12:07:20'),
(9, '0304', '15', 'ประกวดราคาซื้อจัดซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=63017316276&fileName=pricebuild_0300400027_63017316276.zip', '', '2020-01-30', 1, '2020-02-02 12:07:20'),
(10, '0304', '15', 'ประกวดราคาจ้างก่อสร้างเทพื้นคอนกรีตบริเวณบ้านพักข้าราชการสำนักงานคลังจังหวัดสกลนครและบ้านพักคลังจังหวัดสกลนคร ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=63017472290&fileName=pricebuild_0300400066_63017472290.zip', '', '2020-01-29', 1, '2020-02-02 12:07:20'),
(11, '0304', '15', 'ประกวดราคาซื้อจัดซื้อครุภัณฑ์ยานพาหนะและขนส่ง รถโดยสารขนาด ๑๒ ที่นั่ง (ดีเซล) จำนวน ๑ คัน โดยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=63017371445&fileName=pricebuild_0300400031_63017371445.zip', '', '2020-01-28', 1, '2020-02-02 12:07:20'),
(12, '0304', 'B0', 'ประกวดราคาซื้อโครงการเพิ่มประสิทธิภาพเครื่องคอมพิวเตอร์แม่ข่ายแบบเสมือน และพัฒนาระบบ Private Cloud กรมบัญชีกลาง ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017511741&itemNo=0&fileName=63017511741_25630130200229_2.zip', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(13, '0304', 'B0', 'ประกวดราคาซื้อโครงการจัดหาและทดแทนเครื่องไมโครคอมพิวเตอร์และอุปกรณ์ต่อพ่วงกรมบัญชีกลาง ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017517317&itemNo=0&fileName=63017517317_25630130194229_2.zip', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(14, '0304', 'B0', 'ประกวดราคาซื้อสำหรับโครงการพัฒนาระบบการบริหารจัดการฐานข้อมูลขนาดใหญ่  (Big Data) และระบบการวิเคราะห์ข้อมูล (Data Analytics) สำหรับกรมบัญชีกลาง ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017504866&itemNo=0&fileName=63017504866_25630130194106_2.zip', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(15, '0304', 'B0', 'ประกวดราคาซื้อสำหรับโครงการระบบเครือข่ายและรักษาความปลอดภัยสารสนเทศสำหรับศูนย์คอมพิวเตอร์หลัก (Data Center) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017507522&itemNo=0&fileName=63017507522_25630130182214_2.zip', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(16, '0304', 'B0', 'ประกวดราคาซื้อสำหรับโครงการระบบรักษาความปลอดภัยสารสนเทศและวิเคราะห์ข้อมูล Log สำหรับศูนย์คอมพิวเตอร์หลัก (Data Center) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017512032&itemNo=0&fileName=63017512032_25630130182046_2.zip', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(17, '0304', 'B0', 'ประกวดราคาซื้อรถโดยสาร ขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ จำนวน 1 คัน ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=63017455352&itemNo=0&fileName=63017455352_25630129114240_2.zip', '', '2020-01-29', 1, '2020-02-02 12:07:21'),
(18, '0304', 'D0', 'ประกวดราคาซื้อจัดซื้อรถโดยสาร ขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ จำนวน 1 คัน ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017389462&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-30', 1, '2020-02-02 12:07:21'),
(19, '0304', 'D0', 'ประกวดราคาซื้อจัดซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017316276&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-30', 1, '2020-02-02 12:07:22'),
(20, '0304', 'D0', 'ประกวดราคาจ้างก่อสร้างเทพื้นคอนกรีตบริเวณบ้านพักข้าราชการสำนักงานคลังจังหวัดสกลนครและบ้านพักคลังจังหวัดสกลนคร ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017472290&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-29', 1, '2020-02-02 12:07:22'),
(21, '0304', 'D0', 'ประกวดราคาซื้อจัดซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017466343&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-28', 1, '2020-02-02 12:07:22'),
(22, '0304', 'D0', 'ประกวดราคาซื้อจัดซื้อครุภัณฑ์ยานพาหนะและขนส่ง รถโดยสารขนาด ๑๒ ที่นั่ง (ดีเซล) จำนวน ๑ คัน โดยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding) ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017371445&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-28', 1, '2020-02-02 12:07:22'),
(23, '0304', 'D0', 'ประกวดราคาซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017364238&templatetypes=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '', '2020-01-27', 1, '2020-02-02 12:07:22'),
(24, '0304', 'W0', 'จ้างเหมาบำรุงรักษาและซ่อมแซมเครื่องปรับอากาศ ประจำสำนักงานคลังจังหวัดนครสวรรค์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017553244&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-31', 1, '2020-02-02 12:07:23'),
(25, '0304', 'W0', 'ซื้อวัสดุสำนักงาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017458079&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-31', 1, '2020-02-02 12:07:23'),
(26, '0304', 'W0', 'จ้างทำป้ายประชาสัมพันธ์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017471198&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-30', 1, '2020-02-02 12:07:23'),
(27, '0304', 'W0', 'ซื้อหมึกปริ้นเตอร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017527337&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-30', 1, '2020-02-02 12:07:24'),
(28, '0304', 'W0', 'ซื้อวัสดุคอมพิวเตอร์สำนักงานคลังจังหวัดลำพูน จำนวน 13 รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017539536&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-30', 1, '2020-02-02 12:07:24'),
(29, '0304', 'W0', 'ซื้อวัสดุคอมพิวเตอร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017566981&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-30', 1, '2020-02-02 12:07:24'),
(30, '0304', 'W0', 'จ้างโครงการเพิ่มศักยภาพการดำเนินงานภายใต้ภารกิจของคณะผู้บริหารการคลังประจำจังหวัดภูเก็ต โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017471751&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(31, '0304', 'W0', 'ซื้อแอร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017498744&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(32, '0304', 'W0', 'ซื้อหมึกพิมพ์ จำนวน 3 รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017493646&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(33, '0304', 'W0', 'ซื้อหมึกเครื่องพิมพ์ SAMSUNG ๕๐๖L จำนวน ๓ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017538700&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(34, '0304', 'W0', 'ซื้อวัสดุคอมพิวเตอร์ จำนวน 13 รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017565647&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(35, '0304', 'W0', 'จ้างเหมาบริการถ่ายเอกสาร โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017518060&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(36, '0304', 'W0', 'จ้างเหมาติดตั้งโคมไฟในสำนักงานคลังจังหวัดสกลนครและจ้างเหมาซ่อมแซมท่อประปาบ้านพักข้าราชการสำนักงานคลังจังหวัดสกลนคร บ้านเลขที่ 129/11 โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017565629&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-29', 1, '2020-02-02 12:07:24'),
(37, '0304', 'W0', 'จ้างจ้างเหมาซ่อมบำรุงยานพาหนะ โดยวิธีเฉพาะเจาะจง โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017482367&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-28', 1, '2020-02-02 12:07:24'),
(38, '0304', 'W0', 'จ้างเหมาติดตั้งระบบไฟฟ้า โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017472730&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=3', '', '2020-01-28', 1, '2020-02-02 12:07:24'),
(39, '0304', 'W0', 'ซื้ออุปกรณ์หูฟังสำหรับเจ้าหน้าที่ให้บริการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017247282&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-28', 1, '2020-02-02 12:07:24'),
(40, '0304', 'W0', 'จ้างเหมากำจัดปลวก โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017432560&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-28', 1, '2020-02-02 12:07:24'),
(41, '0304', 'W0', 'จ้างจ้างเหมาบริการจัดทำป้าย  คบจ.เลย โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017475816&templatetypes=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '', '2020-01-27', 1, '2020-02-02 12:07:24'),
(42, '0304', 'D1', 'ประกวดราคาซื้อจัดซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017466343&templatetypes=D2&temp_Announ=D&temp_itemNo=1&seqNo=1', '', '2020-01-30', 1, '2020-02-02 12:07:24'),
(43, '0304', 'D1', 'ประกวดราคาซื้อรถโดยสารขนาด 12 ที่นั่ง (ดีเซล) ปริมาตรกระบอกสูบไม่ต่ำกว่า 2,400 ซีซี หรือกำลังเครื่องยนต์สูงสุดไม่ต่ำกว่า 90 กิโลวัตต์ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017364238&templatetypes=D2&temp_Announ=D&temp_itemNo=1&seqNo=1', '', '2020-01-27', 1, '2020-02-02 12:07:24'),
(44, '0304', 'W1', 'ซื้อวัสดุคอมพิวเตอร์สำนักงานคลังจังหวัดลำพูน จำนวน 13 รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017539536&templatetypes=W2&temp_Announ=D&temp_itemNo=1&seqNo=2', '', '2020-01-31', 1, '2020-02-02 12:07:25'),
(45, '0304', 'W1', 'จ้างเหมาติดตั้งระบบไฟฟ้า โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017472730&templatetypes=W2&temp_Announ=D&temp_itemNo=1&seqNo=2', '', '2020-01-29', 1, '2020-02-02 12:07:26'),
(46, '0304', 'W1', 'จ้างจ้างเหมาซ่อมบำรุงยานพาหนะ โดยวิธีเฉพาะเจาะจง โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=63017482367&templatetypes=W2&temp_Announ=D&temp_itemNo=1&seqNo=2', '', '2020-01-29', 1, '2020-02-02 12:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `tb_setting`
--

CREATE TABLE IF NOT EXISTS `tb_setting` (
  `set_id` int(11) NOT NULL AUTO_INCREMENT,
  `time8` date NOT NULL,
  `time12` date NOT NULL,
  `time17` date NOT NULL,
  `time20` date NOT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;
-- ) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tb_setting`
--

INSERT INTO `tb_setting` (`set_id`, `time8`, `time12`, `time17`, `time20`) VALUES
(1, '0000-00-00', '2020-02-02', '0000-00-00', '0000-00-00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
