CREATE DATABASE `GTFSControlDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `GTFSBusPosCtrl` (
  `ReferenceID` varchar(45) DEFAULT NULL,
  `JobDate` datetime DEFAULT NULL,
  `BatchId` bigint(10) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  UNIQUE KEY `ReferenceID_UNIQUE` (`ReferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;