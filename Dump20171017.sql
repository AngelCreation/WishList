CREATE DATABASE  IF NOT EXISTS `allevents` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `allevents`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 10.100.112.31    Database: allevents
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendees`
--

DROP TABLE IF EXISTS `attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendees` (
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Approved` int(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  KEY `EventID_attendees_event_idx` (`EventID`),
  KEY `UserID_attendees_user_idx` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `EventID` int(10) NOT NULL AUTO_INCREMENT,
  `EventCode` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `EventName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EventType` int(1) DEFAULT NULL,
  `EventCategoryID` int(10) DEFAULT NULL,
  `EventDescription` text CHARACTER SET utf8,
  `EventVenue` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EventCity` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  `EventTime` time DEFAULT NULL,
  `eventenddate` date DEFAULT NULL,
  `eventendtime` time DEFAULT NULL,
  `EventPoster` varchar(255) CHARACTER SET utf8 DEFAULT 'EventPosters/default.png',
  `UserID` int(10) DEFAULT NULL,
  `CreatedBy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `VisitCounter` int(255) DEFAULT '0',
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`EventID`),
  KEY `UserID_event_user_idx` (`UserID`),
  KEY `EventCategoryID_event_eventcategory_idx` (`EventCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `eventcategory`
--

DROP TABLE IF EXISTS `eventcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventcategory` (
  `EventCategoryID` int(10) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) DEFAULT NULL,
  `CategoryDescription` varchar(255) DEFAULT NULL,
  `CategoryPoster` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EventCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notifications_history`
--

DROP TABLE IF EXISTS `notifications_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_history` (
  `NotificationId` int(11) NOT NULL AUTO_INCREMENT,
  `NotificationTitle` varchar(45) DEFAULT NULL,
  `NotificationBody` varchar(255) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `EventId` int(10) DEFAULT NULL,
  PRIMARY KEY (`NotificationId`),
  KEY `UserId_notifications_history_user` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `PhotoID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`PhotoID`),
  KEY `EventID_photos_event_idx` (`EventID`),
  KEY `UserID_photos_user_idx` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `idProperties` int(11) NOT NULL AUTO_INCREMENT,
  `PropertiesName` varchar(255) DEFAULT NULL,
  `PropertiesValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idProperties`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportabuse`
--

DROP TABLE IF EXISTS `reportabuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportabuse` (
  `ReportID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `ReportDescription` varchar(255) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `EventID_reportabuse_event_idx` (`EventID`),
  KEY `UserID_reportabuse_user_idx` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `MobileNo` varchar(15) DEFAULT NULL,
  `UserPhoto` varchar(255) DEFAULT NULL,
  `UserTypeID` int(10) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  `LoginType` varchar(2) DEFAULT 'R',
  `Fcmtoken` varchar(300) DEFAULT NULL,
  `NotiStatus` int(1) DEFAULT '1',
  `UserCity` varchar(255) DEFAULT NULL,
  `IsAdminNotify` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserID`),
  KEY `UserTypeID_user_usertype_idx` (`UserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `UserTypeID` int(10) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `WishID` int(10) NOT NULL AUTO_INCREMENT,
  `EventID` int(10) DEFAULT NULL,
  `UserID` int(10) DEFAULT NULL,
  `WishName` varchar(45) DEFAULT NULL,
  `TimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`WishID`),
  KEY `EventID_wishlist_event_idx` (`EventID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'allevents'
--

--
-- Dumping routines for database 'allevents'
--
/*!50003 DROP PROCEDURE IF EXISTS `addDeleteEventPhotos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `addDeleteEventPhotos`(IN user_id INT(10), IN event_id INT(10), IN photo_path VARCHAR(255), IN time_stamp DATETIME,IN list_photo_id TEXT,IN get_mode VARCHAR(10), OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(get_mode = 'add') THEN
Insert Into photos (UserID,EventID,Photo,TimeStamp) 
values(user_id,event_id,photo_path,time_stamp);

IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Photo added successfully';
	ELSE
		SET success = false;
		SET message = 'Error while addning photo. Please try again';
	END IF;
    
ELSEIF(get_mode = 'delete') THEN
SET @q = concat('DELETE FROM photos WHERE  photoId IN (', list_photo_id ,')');

PREPARE stmt FROM @q;
EXECUTE stmt;
    
IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Photos are deleted successfully';
	ELSE
		SET success = false;
		SET message = 'Some error occured while deleting Photos';
	END IF;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRemoveItemFromWishList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `addRemoveItemFromWishList`(In wish_id Int(10),IN event_id INT(10),IN wish_name VARCHAR(45),IN time_stamp DATETIME,In get_mode VARCHAR(10),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(get_mode = 'add') THEN
INSERT INTO wishlist (EventID,WishName,TimeStamp) 
VALUES (event_id,wish_name,time_stamp);

	IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Wish added successfully';
	ELSE
		SET success = false;
		SET message = 'Error while adding wish. Please try again';
	END IF;
    
ELSEIF(get_mode = 'delete') THEN
DELETE FROM `wishlist` WHERE WishId = wish_id;
	IF(ROW_COUNT() > 0) THEN		
		SET success = true;
		SET message = 'Wish deleted successfully';
	ELSE
		SET success = false;
		SET message = 'Some error occured while deleting Wish';
	END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUpdateEventCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `addUpdateEventCategory`(IN cat_id INT(10),IN cat_name VARCHAR(45),IN cat_des TEXT,IN cat_poster TEXT,OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(cat_id > 0) THEN
	IF(cat_poster IS NOT NULL) THEN
		UPDATE `eventcategory` 
		SET `CategoryName` = cat_name,
		`CategoryDescription` = cat_des,
		`CategoryPoster` = cat_poster
		WHERE `EventCategoryID` = cat_id;
		
	ELSE
		UPDATE `eventcategory` 
		SET `CategoryName` = cat_name,
		`CategoryDescription` = cat_des
		WHERE `EventCategoryID` = cat_id;
		
	END IF;

	IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Event category is updated successfully';
		ELSE
			SET success = false;
			SET message = 'Some error while updating event category';
		END IF;
ELSE
	INSERT INTO `eventcategory` (`CategoryName`,`CategoryDescription`,`CategoryPoster`) 
    VALUES (cat_name,cat_des,cat_poster);
    
    IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Event category is added successfully';
		ELSE
			SET success = false;
			SET message = 'Some error while adding event category';
		END IF;
    
END IF;
    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bringWishItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `bringWishItems`(IN user_id INT(10) , IN list_wish_id TEXT,OUT message VARCHAR(255), OUT success Boolean)
BEGIN

SET @q = concat('UPDATE wishlist SET UserID =', user_id ,' WHERE WishID IN (', list_wish_id ,')');
    
PREPARE stmt FROM @q;
    EXECUTE stmt;
    
IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Success! You take this item';
	ELSE
		SET success = false;
		SET message = 'Failure!';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeAdminAndEventStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `changeAdminAndEventStatus`(IN admin_id INT(10),IN event_id INT(10),OUT message VARCHAR(255))
BEGIN

DECLARE curr_status INT(1);

IF(admin_id > 0) THEN
	SELECT Status INTO curr_status FROM user WHERE UserID = admin_id;
    
    UPDATE `user` SET Status = (CASE WHEN curr_status = 1 THEN 0 ELSE 1 END) WHERE UserID = admin_id;
        
ELSEIF(event_id > 0) THEN
	SELECT Status INTO curr_status FROM event WHERE EventID = event_id;
    
    UPDATE `event` SET Status = (CASE WHEN curr_status = 1 THEN 0 ELSE 1 END) WHERE EventID = event_id;
    
END IF;

IF(ROW_COUNT() > 0) THEN
		SET message = 'Success';
	ELSE
		SET message = 'Failure';
END IF;
		
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `changePassword`(IN user_id INT(10),IN curr_pass VARCHAR(30),IN new_pass VARCHAR(30),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

DECLARE count INT;
DECLARE curr_pass_db VARCHAR(30);

SELECT COUNT(1),Password INTO count,curr_pass_db FROM user WHERE UserID = user_id;

IF(count > 0) THEN
	IF(curr_pass = curr_pass_db) THEN
		IF(curr_pass = new_pass) THEN
			SET success = true;
            SET message = 'Can\'t update same password';
		ELSE
			UPDATE user SET Password = new_pass WHERE UserID = user_id;
            IF(ROW_COUNT() > 0) THEN 
				SET success = true;
				SET message = 'Password is updated successfully';
			ELSE
				SET success = false;
				SET message = 'Error while updating password';
			END IF;
		END IF;	
	ELSE
		SET success = false;
		SET message = 'Current password is wrong';
	END IF;	
    
END IF;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeUserStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `changeUserStatus`(IN user_id INT(10),IN get_mode VARCHAR(15),OUT message VARCHAR(255))
BEGIN

IF(get_mode = 'activate') THEN
	UPDATE user SET Status = 1 WHERE UserID = user_id;
    IF(ROW_COUNT() > 0) THEN
		SET message = 'User is activated';
	ELSE		
		SET message = 'Error in activating user';
	END IF;
    
ELSEIF(get_mode = 'deactivate') THEN
	UPDATE user SET Status = 0 WHERE UserID = user_id;
    IF(ROW_COUNT() > 0) THEN
		SET message = 'User is deactivated';
	ELSE		
		SET message = 'Error in deactivating user';
	END IF;
    
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contactSync` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `contactSync`(IN email_ids TEXT, IN mobile_nums TEXT)
BEGIN

SELECT Email,FirstName,LastName,UserID,UserPhoto,MobileNo FROM `user` WHERE UserTypeID = (SELECT UserTypeID FROM usertype WHERE UserType = 'User') 
AND ( Email IN (email_ids) OR MobileNo IN (mobile_nums));
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createUpdateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `createUpdateEvent`(IN event_id INT(10), IN eve_code VARCHAR(150),IN eve_name VARCHAR(255),IN eve_type INT(1), IN eve_cat_id INT(10),IN eve_des TEXT,IN eve_venue VARCHAR(255),IN eve_city VARCHAR(255),IN eve_date DATE,IN eve_time TIME,IN eve_end_date DATE,IN eve_end_time TIME,IN user_id INT(10),IN created_by VARCHAR(255),IN eve_status INT(1),IN time_stamp DATETIME,IN eve_poster VARCHAR(255),OUT eve_creator VARCHAR(100),OUT inserted_id INT(50), OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(event_id > 0) THEN
	UPDATE `event` 
	SET `EventName` = eve_name,
		`EventType` = eve_type,
		`EventCategoryID` = eve_cat_id,
		`EventDescription` = eve_des,
		`CreatedBy` = created_by,
		`EventVenue` = eve_venue,
		`EventCity` = eve_city,
		`EventDate` = eve_date,
		`EventTime` = eve_time,
		`EventEndDate` = eve_end_date,
		`EventEndTime` = eve_end_time
	WHERE `EventID` = event_id;

	IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Event details are updated successfully';
		ELSE
			SET success = false;
			SET message = 'Error while updating event details';
		END IF;
        
ELSE	
	INSERT INTO `event`(`EventCode`,`EventName`,`EventType`,`EventCategoryID`,`EventDescription`,`EventVenue`,`EventCity`,`EventDate`,`EventTime`,`eventenddate`,`eventendtime`,`UserID`,`CreatedBy`,`Status`,`TimeStamp`,`EventPoster`)
	VALUES(eve_code,eve_name,eve_type,eve_cat_id,eve_des,eve_venue,eve_city,eve_date,eve_time,eve_end_date,eve_end_time,user_id,created_by,eve_status,time_stamp,eve_poster);		

	IF(ROW_COUNT() > 0) THEN 
			SET inserted_id = LAST_INSERT_ID();
			SET success = true;
			SET message = 'Event is created successfully';
			
			SELECT Fcmtoken FROM user WHERE NotiStatus=1;
			
			SELECT (CASE WHEN CreatedBy IS NOT NULL THEN CreatedBy 
					ELSE  CONCAT(u.FirstName, ' ', u.LastName)
					END) INTO eve_creator FROM event e INNER JOIN user u ON e.UserID = u.UserID WHERE e.EventId = inserted_id;
		ELSE
			SET success = false;
			SET message = 'Error while creating an event';
		END IF;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteevent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `deleteevent`(in event_id INT(10))
BEGIN
DELETE FROM wishlist WHERE EventID=event_id ;
DELETE FROM attendees WHERE EventID=event_id ;
DELETE FROM photos WHERE EventID=event_id ;
DELETE FROM reportabuse WHERE EventID=event_id ;
DELETE FROM event WHERE EventID=event_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `forgotPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `forgotPassword`(In email_id VARCHAR(45),IN user_type VARCHAR(10),OUT pass VARCHAR(30),OUT first_name VARCHAR(45),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

DECLARE count,user_status INT;

SELECT COUNT(1),Password,FirstName,Status INTO count,pass,first_name,user_status FROM user 
WHERE Email = email_id and UserTypeID = (SELECT UserTypeID FROM usertype WHERE UserType = user_type) and loginType='R';

IF(count > 0) THEN 
	IF(user_status > 0) THEN 
		SET success = true;
		SET message = 'Your password has been sent to your email id. We recommand you to change password once you logged in.';
	ELSE
		SET success = false;
        SET message = 'Your Account is not activated';
	END IF;
ELSE
	SET success = false;
	SET message = CONCAT('No account found with email id : ', email_id);
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAbuseReports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAbuseReports`(IN abuser_name VARCHAR(100),IN email_id VARCHAR(45))
BEGIN

SELECT r.EventID,r.ReportDescription,u.Email,CONCAT(u.FirstName,' ',u.LastName) AS Abuser, r.TimeStamp
FROM reportabuse r 
INNER JOIN user u ON r.UserID = u.UserID 
WHERE CONCAT(u.FirstName,' ',u.LastName) like (CASE WHEN (abuser_name IS NOT NULL OR abuser_name <> '') THEN concat('%',abuser_name,'%') ELSE '%' END)
AND Email like (CASE WHEN (email_id IS NOT NULL OR email_id <> '') THEN concat('%',email_id,'%') ELSE '%' END);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdminDataFromIds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAdminDataFromIds`(IN cat_id INT(10),IN event_id INT(10),IN user_id INT(10),IN get_mode VARCHAR(25))
BEGIN
	
IF(get_mode = 'getAdminDetails') THEN
	SELECT FirstName,LastName,MobileNo,Email,Password 
    FROM `user` 
    WHERE UserID = user_id;
    
ELSEIF(get_mode = 'getUserDetails') THEN
	SELECT FirstName,LastName,MobileNo,Email,UserPhoto,loginType,TimeStamp,IsAdminNotify 
    FROM `user` 
    WHERE UserID = user_id;
    
ELSEIF(get_mode = 'getEventDetails') THEN
	SELECT EventName,e.EventCategoryID,ec.CategoryName,EventType,EventDescription,EventVenue,EventCity,EventDate,EventTime,EventEndDate,EventEndTime,e.Status,e.TimeStamp,CONCAT(u.FirstName,' ',u.LastName) as EventCreater,(SELECT count(1) from attendees WHERE EventID = event_id) as AttendeesCount
	FROM event e 
    INNER JOIN eventcategory ec on e.EventCategoryID = ec.EventCategoryID
	INNER JOIN user u on e.UserID = u.UserID where EventID = event_id;
    
ELSEIF(get_mode = 'getCategoryDetails') THEN
	SELECT EventCategoryID,CategoryName,CategoryDescription,CategoryPoster 
    FROM eventcategory 
    WHERE EventCategoryID = cat_id;
    
ELSEIF(get_mode = 'getAllAttendees') THEN
	SELECT a.UserID AS AtendeeId, u.FirstName,u.LastName,u.Email, u.MobileNo 
    FROM attendees a 
    INNER JOIN user u ON a.UserID = u.UserID WHERE EventID = event_id;
    
ELSEIF(get_mode = 'getAllAdmins') THEN
	SELECT UserID, FirstName, LastName, Email, MobileNo, Status, TimeStamp
    FROM `user` 
    WHERE UserTypeID = (SELECT UserTypeID FROM usertype WHERE UserType = 'Admin');

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAllEvents`(
	IN `user_id` INT(10),
	IN `user_city` VARCHAR(255),
	IN `get_event_type` VARCHAR(10)
)
BEGIN

declare date_timezone datetime;
#according to arizona timezone 12 hours 30 minutes added
set date_timezone = (select date_add(now(),INTERVAL 750 minute) from dual);

IF(get_event_type = 'public') THEN

	SELECT e.EventID,EventName,EventVenue,EventDate,
	EventPoster,e.UserID,ec.CategoryName,att.Approved,
	(SELECT count(1) FROM event 
	WHERE (CASE WHEN user_city IS NULL OR user_city = '' THEN
			date(TimeStamp) = date(date_timezone) and EventCategoryID = e.EventCategoryID and EventType = 0
			ELSE
			date(TimeStamp) = date(date_timezone) and EventCategoryID = e.EventCategoryID and EventType = 0 AND EventCity = user_city END)) as NewEventsCount
	FROM `event` e inner join `eventcategory` ec on e.EventCategoryID = ec.EventCategoryID
	left  join (select * from attendees where UserID = user_id) att on e.EventID=att.EventID
	WHERE EventType = 0 AND Status = 1 AND (CASE WHEN user_city IS NULL OR user_city = '' THEN
			concat(eventenddate,' ',eventendtime) >= date_timezone
			ELSE
			concat(eventenddate,' ',eventendtime) >= date_timezone AND EventCity = user_city END)	
	order by CategoryName,e.EventCategoryID,EventDate,EventTime;
    
ELSEIF(get_event_type = 'attending') THEN

    SELECT a.EventID,EventName,EventDate,EventTime,EventVenue,EventCode,EventType,EventPoster,e.UserID 
	FROM event e 
	RIGHT JOIN (select * from attendees where UserID = user_id AND Approved IN(1,2)) a on e.EventID = a.EventID 
	WHERE eventenddate >= date_sub(date_timezone, INTERVAL 7 DAY) AND e.Status = 1  
	ORDER BY EventDate, EventTime;
    
ELSEIF(get_event_type = 'posted') THEN

    SELECT EventID,EventName,EventCode,EventVenue,EventType,EventDate,EventTime,Status,EventPoster
	FROM `event` 
	WHERE  UserID = user_id AND Status = 1
	ORDER BY EventDate , EventTime;
    

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllEventsAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAllEventsAdmin`(IN from_date VARCHAR(15),IN to_date VARCHAR(15),IN cat_name VARCHAR(45),IN eve_type INT(1),IN eve_creator VARCHAR(100),In eve_status Boolean)
BEGIN

SET @query = 'SELECT distinct e.EventID,e.EventName,e.EventDate,e.EventTime,e.eventenddate,e.eventendtime,e.EventType,e.Status,e.TimeStamp,ec.CategoryName,e.UserID,CONCAT(u.FirstName,\' \',u.LastName) as EventCreater, e.VisitCounter,(SELECT count(*) FROM attendees where EventID = e.EventID) AS AttendeesCount
			  FROM event e LEFT JOIN attendees a on a.EventID = e.EventID inner join eventcategory ec on e.EventCategoryID = ec.EventCategoryID inner join user u on e.UserID = u.UserID WHERE 1 ';

IF (from_date IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND EventDate >= STR_TO_DATE(\'', from_date ,'\'\,\'%d/%m/%Y\') '); 
END IF;

IF (to_date IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND EventDate <= STR_TO_DATE(\'', to_date ,'\'\,\'%d/%m/%Y\') '); 
END IF;

IF (cat_name IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND CategoryName like \'%', cat_name ,'%\' '); 
END IF;

IF (eve_type IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND EventType = ', eve_type); 
END IF;

IF (eve_status IS NOT NULL)THEN
	IF(eve_status IS TRUE) THEN
		SET @query = CONCAT(@query,' AND e.Status = 1 '); 
    ELSE 
		SET @query = CONCAT(@query,' AND e.Status = 0 '); 
	END IF;
END IF;

IF (eve_creator IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND CONCAT(u.FirstName,\' \',u.LastName) like \'%', eve_creator ,'%\' '); 
END IF;

SET @query = CONCAT(@query,' ORDER BY EventDate DESC');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllPublicEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAllPublicEvents`(IN user_id INT(10),IN user_city VARCHAR(255))
BEGIN

declare date_timezone datetime;
#according to arizona timezone 12 hours 30 minutes added
set date_timezone = (select date_add(now(),INTERVAL 750 minute) from dual);

SELECT 
    e.EventID,
    EventCode,
    EventName,
    EventType,
    e.EventCategoryID,
    EventVenue,
    EventDate,
    eventenddate,
    EventTime,
    eventendtime,
    EventPoster,
    e.UserID,
    ec.CategoryName,
    att.Approved
FROM
    `event` e
        INNER JOIN
    `eventcategory` ec ON e.EventCategoryID = ec.EventCategoryID
        LEFT JOIN
    (SELECT 
        *
    FROM
        attendees
    WHERE
        UserID = user_id) att ON e.EventID = att.EventID
WHERE
    (CASE
        WHEN
            user_city IS NULL
                OR STRCMP(user_city, '') = 0
        THEN
            EventType = 0 AND Status = 1
                AND CONCAT(eventenddate, ' ', eventendtime) >= date_timezone
        ELSE EventType = 0 AND Status = 1
            AND CONCAT(eventenddate, ' ', eventendtime) >= date_timezone
            AND EventCity = user_city
    END)
ORDER BY CategoryName , EventCategoryID , EventDate , EventTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getAllUsers`(In first_name VARCHAR(45),In last_name VARCHAR(45),In email_id VARCHAR(45), In mobile_no VARCHAR(15),In user_status Boolean)
BEGIN

DECLARE user_type_id INT(10);

SET user_type_id = (SELECT UserTypeID FROM usertype WHERE UserType = 'User');

SET @query = concat('SELECT distinct u.UserID,FirstName,LastName,Email,MobileNo,u.Status,u.TimeStamp,(SELECT count(*) FROM event where UserID = u.UserID) AS EventsPosted FROM `user` u
LEFT JOIN event e ON u.UserID = e.UserID
WHERE UserTypeID = ',user_type_id);
#AND FirstName like (CASE WHEN (first_name IS NOT NULL OR first_name <> '') THEN concat('%',first_name,'%') ELSE '%' END)
#AND LastName like (CASE WHEN (last_name IS NOT NULL OR last_name <> '') THEN concat('%',last_name,'%') ELSE '%' END)
#AND Email like (CASE WHEN (email_id IS NOT NULL OR email_id <> '') THEN concat('%',email_id,'%') ELSE '%' END);

IF (first_name IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND FirstName like \'%', first_name ,'%\' '); 
END IF;

IF (last_name IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND LastName like \'%', last_name ,'%\' '); 
END IF;

IF (email_id IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND Email like \'%', email_id ,'%\' '); 
END IF;

IF (mobile_no IS NOT NULL)THEN
    SET @query = CONCAT(@query,' AND MobileNo like \'%', mobile_no ,'%\' '); 
END IF;

IF (user_status IS NOT NULL)THEN
	IF(user_status IS TRUE) THEN
		SET @query = CONCAT(@query,' AND u.Status = 1 '); 
    ELSE 
		SET @query = CONCAT(@query,' AND u.Status = 0 '); 
	END IF;
END IF;

SET @query = CONCAT(@query,' ORDER BY u.TimeStamp');

PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEventComponents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getEventComponents`(IN event_id INT(10),In user_id Int(10),IN `get_mode` VARCHAR(25))
BEGIN

IF(get_mode = 'getAllAttendees') THEN

	SELECT u.UserID, FirstName, LastName, Approved, UserPhoto 
	FROM user u 
	INNER JOIN attendees a ON u.UserID = a.UserID 
	WHERE EventID = event_id AND u.Status = 1;
    
ELSEIF(get_mode = 'getAllCategories') THEN
	SELECT EventCategoryID,CategoryName,CategoryDescription,CategoryPoster FROM eventcategory order by CategoryName ASC;
    
ELSEIF(get_mode = 'getAllEventPhotos') THEN
    SELECT PhotoID,Photo,UserID FROM `photos` where EventID = event_id;
    
ELSEIF(get_mode = 'getWholeWishList') THEN
	SELECT WishID,WishName,w.UserID,CONCAT(u.FirstName, ' ', u.LastName) AS UserName,UserPhoto
	FROM wishlist w
	LEFT OUTER JOIN user u ON w.UserID = u.UserID
	WHERE EventID = event_id;
    
ELSEIF(get_mode = 'getUpdatedWishList') THEN
	SELECT WishID,WishName,UserID FROM wishlist
	WHERE EventID = event_id AND (UserID IS NULL OR UserID = user_id);
    
ELSEIF(get_mode = 'getUserDetails') THEN
	SELECT FirstName, LastName, MobileNo, Email, UserPhoto, loginType
	FROM `user` WHERE UserID = user_id;
	
    
END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `geteventdetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `geteventdetails`(in event_id INT(10))
BEGIN

SELECT EventName,ec.CategoryName,e.EventPoster,EventType,EventDescription,EventVenue,EventCity,EventDate,EventTime,eventenddate,eventendtime,e.EventCode,
	(CASE WHEN CreatedBy IS NOT NULL 
        THEN CreatedBy 
    ELSE  CONCAT(u.FirstName, ' ', u.LastName)
    END) AS EventCreater,     
    e.UserID, (SELECT COUNT(*) FROM wishlist WHERE EventID = event_id) AS wishCount,
	(SELECT COUNT(*) FROM attendees WHERE EventID = event_id) AS AttendeesCount
FROM event e
INNER JOIN eventcategory ec ON e.EventCategoryID = ec.EventCategoryID
INNER JOIN user u ON e.UserID = u.UserID
WHERE EventID = event_id;
   
SELECT a.UserID AS AtendeeId,CONCAT(u.FirstName, ' ', u.LastName) AS AttendeeName,u.MobileNo
FROM attendees a
INNER JOIN user u ON a.UserID = u.UserID
WHERE EventID = event_id;
    
UPDATE event 
SET VisitCounter = VisitCounter + 1
WHERE EventID = event_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPropertyValue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `getPropertyValue`(IN prop_name varchar(255),OUT prop_value VARCHAR(255))
BEGIN

set prop_value = (select PropertiesValue from properties where PropertiesName=prop_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `joinLeaveEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `joinLeaveEvent`(IN event_id INT(10),IN user_id INT(10),IN approved_flag INT(1),IN time_stamp DATETIME,IN `get_mode` VARCHAR(10),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

DECLARE count INT; 

IF(get_mode = 'join') THEN

	SELECT COUNT(1) INTO count FROM `attendees` WHERE EventID = event_id and UserID = user_id;

	IF(count > 0) THEN
		SET success = true;
		SET message = 'Event Already Joined';    
	ELSE
		INSERT INTO `attendees` (`EventID`,`UserID`,`Approved`,`TimeStamp`) 
		VALUES (event_id,user_id,approved_flag,time_stamp);
		
		IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Event Joined Successfully';
		ELSE
			SET success = false;
			SET message = 'Error while joining event. Please try again';
		END IF;
	END IF;
    
ELSEIF(get_mode = 'status') THEN
	SELECT COUNT(1) INTO count FROM `attendees` WHERE EventID = event_id and UserID = user_id;

	IF(count > 0) THEN
		SET success = true;
		SET message = 'Event Already Joined';    
	ELSE
		SET success = false;
		SET message = 'Event Not joined';
	END IF;
    
ELSEIF(get_mode = 'leave') THEN
	DELETE FROM `attendees` WHERE EventID = event_id AND UserID = user_id;

	IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'You have left this event';
		ELSE
			SET success = false;
			SET message = 'Error while leaving event. Please try again';
		END IF;
        
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `login`(IN email_in VARCHAR(45), IN pass_in VARCHAR(30),IN user_type VARCHAR(10),OUT user_id INT(10),OUT first_name VARCHAR(45), OUT last_name VARCHAR(45), OUT email_id VARCHAR(45), OUT user_city VARCHAR(255),OUT user_status INT(1),OUT noti_status INT(1), OUT message VARCHAR(255), OUT success Boolean)
BEGIN

SELECT UserID,FirstName,LastName,Email,UserCity,Status,NotiStatus INTO user_id,first_name,last_name,email_id,user_city,user_status,noti_status 
FROM `user`
WHERE UserTypeID = (SELECT UserTypeID FROM usertype WHERE UserType = user_type) 
	AND Email = email_in AND Password = pass_in;

IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
        IF(user_status = 1) THEN
			SET message = 'Login successfully';
		ELSE 
			SET message = 'Your account is not activated';
		END IF;
	ELSE
		SET success = false;
		SET message = 'Invalid email or password';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sendreminder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `sendreminder`(IN event_date DATE)
BEGIN

SELECT e.EventId,EventName,e.EventType,EventVenue,EventCity,EventDate,EventTime,eventenddate,eventendtime,EventPoster,EventCode,e.UserID as EventCreatorId,Email,Fcmtoken,CONCAT(u.FirstName, ' ', u.LastName) AS EventCreator,notistatus
FROM event e
	INNER JOIN  attendees a on e.EventID = a.eventid
	INNER JOIN user u ON a.UserID = u.UserID
	WHERE (CASE WHEN e.EventType = 0 THEN a.Approved != 0 ELSE a.Approved = 1 END)
and EventDate = event_date  order by EventId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setAttendeeStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `setAttendeeStatus`(In approve_flag INT(1), In event_id INT(10),In user_id Int(10),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

UPDATE attendees 
SET Approved = approve_flag
WHERE EventID = event_id AND UserID = user_id;

IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Status is updated successfully';
	ELSE
		SET success = false;
		SET message = 'Some error while updating status';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `signUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `signUp`(In first_name VARCHAR(45),In last_name VARCHAR(45),In pass VARCHAR(30), In email_id VARCHAR(45), In mobile_no VARCHAR(15), In status_flag INT(1),In time_stamp DATETIME,IN user_type VARCHAR(10),OUT inserted_id INT(50), OUT message VARCHAR(255), OUT success Boolean)
BEGIN

DECLARE user_type_id,email_count INT(10);

SET user_type_id = (SELECT UserTypeID FROM usertype WHERE UserType = user_type);

SET email_count = (SELECT count(Email) FROM user WHERE Email = email_id AND UserTypeID = user_type_id);
            
IF(email_count > 0) THEN
	SET success = false;
	SET message = 'Email already exists';    
ELSE 	
	INSERT INTO user (FirstName, LastName, Password , Email , MobileNo , UserTypeID, Status, TimeStamp ) 
	VALUES (first_name,last_name,pass,email_id,mobile_no,user_type_id,status_flag,time_stamp);

	IF(user_type = 'USER') THEN
		IF(ROW_COUNT() > 0) THEN 
			SET inserted_id = LAST_INSERT_ID();
			SET success = true;
			SET message = 'SignUp successfully. You can now login to your account';
		ELSE
			SET success = false;
			SET message = 'Error while signing up. Please try after some time';
		END IF;
		
	ELSE
		IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Admin account is created successfully';
		ELSE
			SET success = false;
			SET message = 'Error while creating admin account. Please try after some time';
		END IF;
	END IF;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateAdminAndUserProfile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `updateAdminAndUserProfile`(In first_name VARCHAR(45),In last_name VARCHAR(45), In mobile_no VARCHAR(15), In email_id VARCHAR(45), In user_id INT(10),IN admin_notify TINYINT(4),IN get_mode VARCHAR(25),OUT message VARCHAR(255), OUT success Boolean)
BEGIN
	
IF(get_mode = 'updateUserDetails') THEN
	UPDATE `user` 
    SET `FirstName` = first_name,
    `LastName` = last_name,
    `Email` = email_id,
	`MobileNo` = mobile_no,
    `IsAdminNotify` = admin_notify 
    WHERE `UserID` = user_id;
    
    IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'User details are updated successfully';
	ELSE
		SET success = false;
		SET message = 'Error while updating user details';
	END IF;
    
ELSEIF(get_mode = 'updateAdminProfile') THEN
	UPDATE `user` 
    SET `FirstName` = first_name,
    `LastName` = last_name,
    `Email` = email_id,
	`MobileNo` = mobile_no
    WHERE `UserID` = user_id;
    
    IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Admin details are updated successfully';
	ELSE
		SET success = false;
		SET message = 'Error while updating admin details';
	END IF;

END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEventDetailsAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `updateEventDetailsAdmin`(IN event_id INT(10),IN eve_name VARCHAR(255),IN eve_type INT(1), IN eve_cat_id INT(10),IN eve_des TEXT,IN eve_date DATE,IN eve_time TIME,IN eve_end_date DATE,IN eve_end_time TIME,OUT message VARCHAR(255),OUT success Boolean)
BEGIN
	UPDATE `event` 
	SET `EventName` = eve_name,
		`EventType` = eve_type,
		`EventCategoryID` = eve_cat_id,
		`EventDescription` = eve_des,
		`EventDate` = eve_date,
		`EventTime` = eve_time,
		`EventEndDate` = eve_end_date,
		`EventEndTime` = eve_end_time
	WHERE `EventID` = event_id;
  
	IF(ROW_COUNT() > 0) THEN 		
			SET success = true;
			SET message = 'Event details are updated successfully';
		ELSE
			SET success = false;
			SET message = 'Error while updating event details';
		END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUserData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `updateUserData`(In first_name VARCHAR(45),In last_name VARCHAR(45), In mobile_no VARCHAR(15), In email_id VARCHAR(45), In user_id INT(10),In fcm_token VARCHAR(300),In noti_status INT(1),In user_city VARCHAR(255),IN get_mode VARCHAR(25),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(get_mode = 'updateUserDetails') THEN
	UPDATE `user` 
	SET `FirstName` = first_name,`LastName` = last_name,`MobileNo` = mobile_no,`Email` = email_id
	WHERE `UserID` = user_id;

	IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'User details are updated successfully';
	ELSE
		SET success = false;
		SET message = 'Error while updating user details';
	END IF;
    
ELSEIF(get_mode = 'updateFcmToken') THEN
	UPDATE `user` 
	SET Fcmtoken = fcm_token,NotiStatus = noti_status
	WHERE UserId = user_id;

	IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Token updated successfully';
	ELSE
		SET success = false;
		SET message = 'Error while updating token. Please try again';
	END IF;
    
ELSEIF(get_mode = 'updateUserCity') THEN
	UPDATE `user` 
	SET `UserCity` = user_city
	WHERE `UserID` = user_id;

	IF(ROW_COUNT() > 0) THEN 		
		SET success = true;		
        SET message = '';
	ELSE
		SET success = false;
		SET message = '';
	END IF;
    
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uploadAbuseReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `uploadAbuseReport`(IN event_id INT(10),IN user_id INT(10),IN report_des TEXT,IN time_stamp DATETIME,OUT inserted_id INT(50),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

INSERT INTO `reportabuse` (`EventID`,`UserID`,`ReportDescription`,`TimeStamp`)
VALUES(event_id,user_id,report_des,time_stamp);

IF(ROW_COUNT() > 0) THEN 	
		SET inserted_id = LAST_INSERT_ID();	
		SET success = true;
		SET message = 'Report is posted successfully';
	ELSE
		SET success = false;
		SET message = 'Error while submitting abuse report';
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uploadPhoto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `uploadPhoto`(IN path TEXT,IN event_id INT(10), IN user_id INT(10),OUT message VARCHAR(255), OUT success Boolean)
BEGIN

IF(event_id > 0) THEN
	UPDATE `event` SET `EventPoster`= path where EventID = event_id;
	IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Event Poster is updated successfully';
	ELSE
		SET success = false;
		SET message = 'Some Error in updating event poster';
	END IF;

ELSEIF(user_id > 0) THEN
	UPDATE `user` SET `UserPhoto`= path where UserID = user_id;
    IF(ROW_COUNT() > 0) THEN 		
		SET success = true;
		SET message = 'Your profile picture is updated successfully';
	ELSE
		SET success = false;
		SET message = 'Some Error in uploading profile picture';
	END IF;
    
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userSignUpLoginWithSocialMedia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`All_Events`@`%` PROCEDURE `userSignUpLoginWithSocialMedia`(
	IN `first_name` VARCHAR(45),
	IN `last_name` VARCHAR(45),
	IN `email_id` VARCHAR(45),
	IN `time_stamp` DATETIME,
	IN `login_type` VARCHAR(5),
	OUT `inserted_id` INT(50),
	OUT `user_id` INT(10),
	OUT `user_city` VARCHAR(255),
	OUT `noti_status` INT(1),
	OUT `message` VARCHAR(255),
	OUT `success` Boolean
)
BEGIN
DECLARE user_type_id,userstatus INT(1);

SET user_type_id = (SELECT UserTypeID FROM usertype WHERE UserType = 'User');

IF EXISTS (SELECT 1 FROM user WHERE Email = email_id AND UserTypeID = user_type_id AND LoginType != login_type) THEN
	SET success = false;
	SET message = 'User with this email already registered. Please use another email';  
ELSE
	IF EXISTS (SELECT 1 FROM user WHERE Email = email_id AND UserTypeID = user_type_id AND LoginType = login_type) THEN
	BEGIN  
		SELECT UserId,UserCity,NotiStatus,Status INTO user_id,user_city,noti_status,userstatus FROM user WHERE Email = email_id AND UserTypeID = user_type_id AND LoginType = login_type;        
		IF(userstatus = 1) THEN
			SET inserted_id = 0;
			SET success = true;
			SET message = 'Login successfully';
		ELSE
			SET success = false;
			SET message = 'Your account is not activated';
		END IF;
	END;
    ELSE
    BEGIN
		INSERT INTO user (FirstName,LastName,Email, UserTypeID, Status, TimeStamp,LoginType) 
        VALUES (first_name,last_name,email_id,user_type_id,1,time_stamp,login_type);
        
        IF(ROW_COUNT() > 0) THEN 
			SET inserted_id = LAST_INSERT_ID();
			SET success = true;
			SET message = 'SignUp successfully. You can now login to your account';
		ELSE
			SET success = false;
			SET message = 'Error while signing up. Please try after some time';
		END IF;
	END;
	END IF;
END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-17 13:29:59
