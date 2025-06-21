/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.0.67-community-nt : Database - ebank
*********************************************************************
Server version : 5.0.67-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ebank`;

USE `ebank`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `acct_reg` */

DROP TABLE IF EXISTS `acct_reg`;

CREATE TABLE `acct_reg` (
  `acct_id` int(11) NOT NULL,
  `pwd` varchar(15) default NULL,
  `type_acct` int(11) default NULL,
  `cust_id` int(11) default NULL,
  `min_bal` int(11) default NULL,
  `amount` int(11) default NULL,
  PRIMARY KEY  (`acct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `acct_reg` */

/*Table structure for table `acct_type` */

DROP TABLE IF EXISTS `acct_type`;

CREATE TABLE `acct_type` (
  `type_id` int(11) NOT NULL,
  `acct_name` varchar(20) default NULL,
  `descr` varchar(50) default NULL,
  `min_bal` int(11) default NULL,
  PRIMARY KEY  (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `acct_type` */

/*Table structure for table `clientlogin` */

DROP TABLE IF EXISTS `clientlogin`;

CREATE TABLE `clientlogin` (
  `userid` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `transid` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientlogin` */

insert  into `clientlogin`(`userid`,`password`,`transid`) values ('client','client','client01');

/*Table structure for table `cust_det` */

DROP TABLE IF EXISTS `cust_det`;

CREATE TABLE `cust_det` (
  `cust_id` int(8) NOT NULL,
  `cust_name` varchar(40) default NULL,
  `age` int(8) default NULL,
  `gender` varchar(10) default NULL,
  `address` varchar(100) default NULL,
  `pincode` int(8) default NULL,
  `phno` int(10) default NULL,
  `qual` varchar(15) default NULL,
  `occup` varchar(20) default NULL,
  `anul_in` int(8) default NULL,
  `pwd` varchar(15) default NULL,
  `email` varchar(20) default NULL,
  PRIMARY KEY  (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cust_det` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `empno` int(11) NOT NULL,
  `ename` varchar(30) default NULL,
  `pwd` varchar(20) default NULL,
  `designation` varchar(20) default NULL,
  `age` varchar(10) default NULL,
  `gender` varchar(10) default NULL,
  `dob` date default NULL,
  `address` varchar(100) default NULL,
  `pincode` varchar(8) default NULL,
  `phno` varchar(15) default NULL,
  `qual` varchar(20) default NULL,
  `doj` date default NULL,
  PRIMARY KEY  (`empno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

/*Table structure for table `issue_dd` */

DROP TABLE IF EXISTS `issue_dd`;

CREATE TABLE `issue_dd` (
  `ddno` int(11) NOT NULL,
  `pay_at` varchar(200) default NULL,
  `bank` varchar(30) default NULL,
  `amt` int(11) default NULL,
  `exchange` int(11) default NULL,
  `frm` varchar(30) default NULL,
  `addr` varchar(100) default NULL,
  `issue_date` date default NULL,
  PRIMARY KEY  (`ddno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `issue_dd` */

/*Table structure for table `loan_infr` */

DROP TABLE IF EXISTS `loan_infr`;

CREATE TABLE `loan_infr` (
  `slno` int(11) NOT NULL,
  `loan_type` varchar(40) default NULL,
  `loan_desc` varchar(200) default NULL,
  `no_installments` int(11) default NULL,
  `interest_Rate` varchar(10) default NULL,
  PRIMARY KEY  (`slno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_infr` */

/*Table structure for table `loan_payments` */

DROP TABLE IF EXISTS `loan_payments`;

CREATE TABLE `loan_payments` (
  `billno` int(11) NOT NULL,
  `loan_id` int(11) default NULL,
  `amount` int(11) default NULL,
  `type_loan` varchar(20) default NULL,
  `pay_date` date default NULL,
  PRIMARY KEY  (`billno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_payments` */

/*Table structure for table `loan_trans` */

DROP TABLE IF EXISTS `loan_trans`;

CREATE TABLE `loan_trans` (
  `loan_id` int(11) NOT NULL,
  `cust_id` int(11) default NULL,
  `type_loan` varchar(20) default NULL,
  `loan_amt` decimal(12,0) default NULL,
  `int_rate` varchar(10) default NULL,
  `no_inst` decimal(3,0) default NULL,
  `month_amt` varchar(20) default NULL,
  `qual` varchar(20) default NULL,
  `Colg_name` varchar(30) default NULL,
  `surity` varchar(30) default NULL,
  `propertyvalue` int(11) default NULL,
  `issue_date` date default NULL,
  PRIMARY KEY  (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `loan_trans` */

/*Table structure for table `locker_det` */

DROP TABLE IF EXISTS `locker_det`;

CREATE TABLE `locker_det` (
  `locker_no` int(11) default NULL,
  `acct_id` int(11) default NULL,
  `type` varchar(20) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `locker_det` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` varchar(20) default NULL,
  `pwd` varchar(15) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`userid`,`pwd`) values ('ebank','admin');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `trans_id` int(11) NOT NULL,
  `acct_id` int(11) default NULL,
  `type_acct` int(11) default NULL,
  `amt` int(11) default NULL,
  `type_trans` varchar(10) default NULL,
  `mode_pay` varchar(10) default NULL,
  `Ch_DD_No` varchar(12) default NULL,
  `Bank_name` varchar(20) default NULL,
  `branch` varchar(20) default NULL,
  `issue_date` date default NULL,
  `date_trans` date default NULL,
  PRIMARY KEY  (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transactions` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
