-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ljcaprpjfccozaolpbmtwazgqorucfsvhdgn` (`primaryOwnerId`),
  CONSTRAINT `fk_gbviosyppibbseizopfgyqpwpuvruisaqsrl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ljcaprpjfccozaolpbmtwazgqorucfsvhdgn` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qmgrxjxswdhpntroprpesfhbeokggaawiuih` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_lslwrdqygcdvhvklwgmhlvpzjxxuzdaizrbv` (`dateRead`),
  KEY `fk_lcqvuexukwehuzgahabqweexmuniuhchvodg` (`pluginId`),
  CONSTRAINT `fk_lcqvuexukwehuzgahabqweexmuniuhchvodg` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_setiqklzeoiqffsnabmpkphxxxqmftjzqndo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tugrnhxbzrzoiptzlhvwgipckvqhokybhxzv` (`sessionId`,`volumeId`),
  KEY `idx_gcyujxvmwnrudrvwvvlkflhigjwkkqdgypdi` (`volumeId`),
  CONSTRAINT `fk_xoamulkgpfjrwmassbxhcldohqqujznvlgbm` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyvmzlqmxkdfkaljtkotfmotpjmoxguwvdyq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cilwdfrspthlovnbivlcmhdhjeivksreraqh` (`filename`,`folderId`),
  KEY `idx_gvepxkxinyejevtymnlolbpfflpyfckxkuib` (`folderId`),
  KEY `idx_nybkqtzdcnmwbvsiafwewobmduwpzletsegc` (`volumeId`),
  KEY `fk_wximstkdcszjmgfjqxhgsmkgwjwqsougunya` (`uploaderId`),
  CONSTRAINT `fk_adibqtsbnwiplfrhenevmzhrqcjbxthfsxyv` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dfigukyzthfhhvysmtstqrelxdqgtrvqtitt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dspryqbgjwmkdyfhyijyspixqevimxikjlig` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wximstkdcszjmgfjqxhgsmkgwjwqsougunya` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_iltfcgdsvgtdftcuczhfeymejuenrbrbruwh` (`siteId`),
  CONSTRAINT `fk_iltfcgdsvgtdftcuczhfeymejuenrbrbruwh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_libakwboqcycromoygsyqnfrqnwjddrbwhng` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_naavidvjjpmodqgwiywdmwdebyqcslapmzgq` (`userId`),
  CONSTRAINT `fk_naavidvjjpmodqgwiywdmwdebyqcslapmzgq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_hwgzhjfpvwkxgugaveefpkckqaxirvwdkxxg` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kowcclhyotnzfumgntahmneixvseofgimigf` (`groupId`),
  KEY `fk_ywvqlmsktklbceizspnhveawbcpmoamzoshw` (`parentId`),
  CONSTRAINT `fk_feacbncnjbnmtcfjhvqxifwstaieeeydmolf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ssxokquscphoeauwlcmdzojzylncxaefodnj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ywvqlmsktklbceizspnhveawbcpmoamzoshw` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mizahaetjfshlcqrzlprixjzkmvwaysffmxv` (`name`),
  KEY `idx_iirgxhrlljlnwtdwifykoqgfgiwkwdiswjqs` (`handle`),
  KEY `idx_nlpnkxakbfntcabkugjtqlyxedwhbzsutnwg` (`structureId`),
  KEY `idx_gypxlgfuenemxunfwdrjzmjyvldlqqvyittz` (`fieldLayoutId`),
  KEY `idx_lspvekigwzvguslrtemhllnicewqvmwoydfd` (`dateDeleted`),
  CONSTRAINT `fk_pryezyerfqemdcfidleupyadflfidprrkxkq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qpxtkvthqpqoyatdvldjbzggzkqwftlumiva` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_utnqwdytxutgpwqglenqqnjyemzotycxaoha` (`groupId`,`siteId`),
  KEY `idx_lzvbfxturzrgrsxmlrfjbocxrleqnfwbdhuy` (`siteId`),
  CONSTRAINT `fk_bqbpvvcckujrxgrtgeeqgdibaborrmfodmvk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_chkcnnedscvfusxakuesxulcjoxxcvxctnms` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_wzsweiwwpxvxxsembxdysdrwwvfkqqtgooco` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dljfarrhbqdxdojxcxulmpcleziamnfvlphj` (`siteId`),
  KEY `fk_upqdefkvebaxxmmygtpaeznihentxfojncug` (`userId`),
  CONSTRAINT `fk_bzbyjseznzhhjyctktukjnocdwjptudwzowx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dljfarrhbqdxdojxcxulmpcleziamnfvlphj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_upqdefkvebaxxmmygtpaeznihentxfojncug` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_hvatnwbdrpehkwjifkgzgclrafgmaiteivun` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_rxidxiwmpjxcbhroygopaeboewscdfdwbans` (`siteId`),
  KEY `fk_efpudmeowqqcpkqazkrmdbeqkguwjmmffunk` (`fieldId`),
  KEY `fk_muogyhsiuqxhlkffublmjiovojnjahvvltjf` (`userId`),
  CONSTRAINT `fk_efpudmeowqqcpkqazkrmdbeqkguwjmmffunk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_muogyhsiuqxhlkffublmjiovojnjahvvltjf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_rxidxiwmpjxcbhroygopaeboewscdfdwbans` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uellfpwofmtsezcdkvyzdjoqrtlzlzzwoaat` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qlmlklilfjgiwfqppybhtwngjmtysoybgjip` (`primaryOwnerId`),
  KEY `idx_uadcobthaaomunelyxtlcltyvmsodevxzhjy` (`fieldId`),
  CONSTRAINT `fk_mqevfbnfyqmqoqzpzekbpqrkmerzsndytfbr` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uhdohcjxskhrvxxgcasvhpwfwtyyixpobndv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yyyapavwmiywlqqdodpelpstoycjhsnahtcb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ahlmgqlywhxwpcxpqmvlnrxufxijssqlazvq` (`userId`),
  CONSTRAINT `fk_ahlmgqlywhxwpcxpqmvlnrxufxijssqlazvq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mkppsyeqmbtgmgxvicrxmmoxhfxtwgpvqhvp` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_zolrofjloriwylmmknpwbpwqdelyptcmbjzy` (`creatorId`,`provisional`),
  KEY `idx_gygyzkhhxjjoreonhjyunqoadrlkhriyysfa` (`saved`),
  KEY `fk_flhganaytuyouyaosljwamueupragzqocjdh` (`canonicalId`),
  CONSTRAINT `fk_flhganaytuyouyaosljwamueupragzqocjdh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ziizwjesmbouyolexnkzsvgpkpicqyxxcwqh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_wkptlsaouikbhqbalaksgqvoavxvhjokwgqq` (`elementId`,`timestamp`,`userId`),
  KEY `fk_sbkrqpdvaedqvbdkfwnynxrguozifvbhxijl` (`userId`),
  KEY `fk_hbybvmlyjmiqplezznuiouproqswwvvabuuh` (`siteId`),
  KEY `fk_flywtihugmulvbycqirvczbsefgbqwjwfika` (`draftId`),
  CONSTRAINT `fk_cajvljupppxdqksfmhioxyhrxnnbeioqfjmf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_flywtihugmulvbycqirvczbsefgbqwjwfika` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hbybvmlyjmiqplezznuiouproqswwvvabuuh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sbkrqpdvaedqvbdkfwnynxrguozifvbhxijl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ocqddcmtgixclaklmrgjbrekzhhbghzefgbs` (`dateDeleted`),
  KEY `idx_ohsotaglxdztonrweewluhpxcdxtwbwadwgw` (`fieldLayoutId`),
  KEY `idx_yfccdzxjxigisqjpodekiqxxnyeuqwodurun` (`type`),
  KEY `idx_cegnfldwsijytoktaeqfxsayvezeywtwbfpz` (`enabled`),
  KEY `idx_bohrkdnvcubgebbklvfvtsltfhdwihszhbpy` (`canonicalId`),
  KEY `idx_mowpypnttwrqnlubpsiwzrmhrwkislcancid` (`archived`,`dateCreated`),
  KEY `idx_sfygbacryxxhzizefbhfonoxdcburuipcxwj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ubttrgedauthlfsymmmrecvcdcepgpxbpijb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_jhwykozwbzfwnwzgukzmkojhmusvtmseatab` (`draftId`),
  KEY `fk_bictlweqyhalgdigcizgmohbkvaihrrzatiy` (`revisionId`),
  CONSTRAINT `fk_bictlweqyhalgdigcizgmohbkvaihrrzatiy` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jhwykozwbzfwnwzgukzmkojhmusvtmseatab` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzgeywfdqpdkzhgoeakpzfuosnfsevqmnvyn` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pkysmgbrmcnsewqnymxwryibdtvmibunbzpy` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_ddgdoyhnxsbkdkouplcytsigymshjesgbrzs` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_gamoijyatspgqepdxsyvgwuzfwaynqfvdcuz` (`ownerId`),
  CONSTRAINT `fk_gamoijyatspgqepdxsyvgwuzfwaynqfvdcuz` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ododuephypddwvyrugvkxpergvtjztxwqdxm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uymhwgjkkqrlmxjpgneqynyvfhwhubmixpmo` (`elementId`,`siteId`),
  KEY `idx_fwlzyhcsnklqhbdjnqwovnzlyjyssdchyqwp` (`siteId`),
  KEY `idx_pflmtztdxexttxgygvpetfpkkvviopxcmrff` (`title`,`siteId`),
  KEY `idx_oothmbqwxoimforusaehtzfovquagwnjchkz` (`slug`,`siteId`),
  KEY `idx_sulmowchtszjlmowrmorwvkjoacrgzibsxgv` (`enabled`),
  KEY `idx_ujqzllltcchvzvlpspqzhdwleszgvkdtbzgm` (`uri`,`siteId`),
  CONSTRAINT `fk_lhjzesayxerlahlqbosufyfsaxogyrzunsvn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xylcnduckzibstswnuboxbzkarddwpryolko` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_untfszikhbaorrjuizpykckhtqbvuwtehckc` (`postDate`),
  KEY `idx_wlgnhutgssdoveiguuyxxzyyyejlpcdmeqbm` (`expiryDate`),
  KEY `idx_ghgrebsllxzlvgauzvckktiqqttttnnobioq` (`status`),
  KEY `idx_neghvxvuwugamfjvxlzhqgbkduejmhairxii` (`sectionId`),
  KEY `idx_nhvlzbrqiqyznenfqipgenbuiksswaegvaem` (`typeId`),
  KEY `idx_kjipbiqbzwvptqejwwcabophxtsqkcuupvga` (`primaryOwnerId`),
  KEY `idx_amlxaqvwpfffskovbbuhftrorsortewchlnq` (`fieldId`),
  KEY `fk_vuqkaeaygplijyvtuljtlbifbcewghksknjo` (`parentId`),
  CONSTRAINT `fk_djdeqhpqqlllevqplywibmsywershzjnlnra` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_icemylxdcvubfhwtzaboxpzrvxqepktiznvc` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kydlpzkzvqwyluukjzkceswqgxbozibjsalb` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vuqkaeaygplijyvtuljtlbifbcewghksknjo` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xsigpyawkjojdalnmvkrbwstgbeuiwgebjhe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yizkmeruagqgpolxuoeoxqoflpzaiuksyezn` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_amwgmpqbfzeuxnqngyfkwawpxudussnirrhs` (`authorId`),
  KEY `idx_bmbrbkaovbtepkfqqdrboaghscfakwoxkgpb` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_anyhyfaxwofbnqwmcgyurcwnnpwjlujvvlcl` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_bqupnifmutdjorcsgejgbtigmquivnoomswr` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_psqjojdkprqhdkhrxnxguhgoxzxpvctxihrk` (`fieldLayoutId`),
  KEY `idx_kuneaxjtwwykycdcyhhxbybgzdbyswzodndk` (`dateDeleted`),
  CONSTRAINT `fk_vacjiafxujirkpscwzuwyxeqvalpvdwkwzsf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qbrpjcoqirbmtezmdmqebqmnsbycugzvpahq` (`dateDeleted`),
  KEY `idx_ibavugzazzhuzeocrwbsygfrclruzfazzjds` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hnslvpxsefstgkrujbyjbllhdniadqtdrzwk` (`handle`,`context`),
  KEY `idx_sjmfabjedteqvinxwawtymtmwiolvujznqrm` (`context`),
  KEY `idx_wzxnzhxoouwbivwlpubflalsrfzhowjmvnwk` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_biarkymnlwvtlijrzzazztnbtzmiitgjvoet` (`name`),
  KEY `idx_oblkomxtwvgehethchctdfsflbkupfpkjwmi` (`handle`),
  KEY `idx_eqonwgtitvgoajvqswjatigktvwanyhetjkw` (`fieldLayoutId`),
  KEY `idx_wibhoenbpcjsizvjnwksqeotlgexphiwbwzb` (`sortOrder`),
  CONSTRAINT `fk_nljbjcrncwydshjjxcirktjcawpywnrynjwu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vgtxtuofzaszscyqzxlntvynerepjvzstfut` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_soinivaeqabcwbhjhwvwsazxgwowfhcgtbrk` (`accessToken`),
  UNIQUE KEY `idx_hndsonhqqsvmqgdqrzruznfndvrrnjbbpitl` (`name`),
  KEY `fk_izwsfgaymemmmcckfpkafxxinnjkcyobevdc` (`schemaId`),
  CONSTRAINT `fk_izwsfgaymemmmcckfpkafxxinnjkcyobevdc` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dfowgzdvepqfhuibfqlnkcwkogjfzirhdkta` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pyvhjtspzmhytbuahvwibigzcngosswjebog` (`name`),
  KEY `idx_jbmrbeemwmxdulemmwpyekatmjcnzcfqchcy` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jrwigrgnwmfzpcuzzkweesihedggijsxgarg` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_haynrhysnirlzjkxhonnfjkkvfealqktlows` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_vwqmzblbdahhpnccnffjohjlecrwogshjhyi` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_cmbajchelgraswyrhafbmqguyznsnqbkrmtc` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tbcesfexyzyczgfoccanbadepecfyswuvuev` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_rlmdebeaehxikoagjdzvtklmviewnhywqnjb` (`sourceId`),
  KEY `idx_pgxnhhorulhlokpdrbigqvqsoaoluhnnovxn` (`targetId`),
  KEY `idx_iuparsufpmfaeujqcubrxpxrgztmbnbyfcew` (`sourceSiteId`),
  CONSTRAINT `fk_dwtnpdxeuutlpujzuxaezikxipxbogkhdgue` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kkggpszfvmozcgtwnbpschzpwpktlnpyqjiv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oatoqyvkctorsftnzlnqfhysaabhdrhtvyhx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yfinaopiqlnwgxodcxufainxagdjxyjeufsj` (`canonicalId`,`num`),
  KEY `fk_eqksscxoddxqlacrfrbfsxmqlumirhlkqhur` (`creatorId`),
  CONSTRAINT `fk_eqksscxoddxqlacrfrbfsxmqlumirhlkqhur` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gdnhpjxhxzapypyjnhgyfvmxkdomohtputap` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_nkvtazvsxfyzgmvhuanqskdhwervazhsbklg` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zvsuqbjzoddwevgvwiwvafuuvsrryhptecko` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_anfycgzbdpuhfnnrrhsegxsfyizkftdznmpz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_pejxeprzntxwjimiwfuarkdpmmbjbfcaltzs` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_lcngsyyclljwukubbfnapcnufypsjaehspxp` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sjdsigwhesloexbcafiiuztmybuddgmtjzfz` (`handle`),
  KEY `idx_wtlfsoqnqagfvokzadztvpailgzjvawsvfxa` (`name`),
  KEY `idx_fkpgcyztsgrqukfzojmqmbpzfwozdpzppmnk` (`structureId`),
  KEY `idx_zmnspifdylhegplonsukhawxhmlayaeadxwl` (`dateDeleted`),
  CONSTRAINT `fk_tjmjonjdsstwhdhcecpbmwvyjhxcfslhzycb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_rygieuhglbvwttttkjktpbegdrzyffxibkru` (`typeId`),
  CONSTRAINT `fk_rygieuhglbvwttttkjktpbegdrzyffxibkru` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wjymxewxqdvnmkjierkvxmcwnbarzqyixhrx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_glayquxafpjqxfmymydzuwbyszwmfzclerje` (`sectionId`,`siteId`),
  KEY `idx_cldoisrvkjspdqatwiujnymefpgexvevfkxs` (`siteId`),
  CONSTRAINT `fk_oijredxrucnztqordhvndyciuhusvxebagew` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xabdqtpanbvdxlimgutqwonlmeylzwwfqrdj` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vgqmgzqpugmsznixmbdqrusbdgjttbvryhoj` (`uid`),
  KEY `idx_tfsjitshlybmmjbhjpzenspyltbejcwfjynt` (`token`),
  KEY `idx_ptukgqersggileppvvilqrkxsuwammrpklse` (`dateUpdated`),
  KEY `idx_tdizsjkzbnkuafmzttzisnjcgozkdzgoemit` (`userId`),
  CONSTRAINT `fk_hpeimijiyigsyjmbchiliphxclqcswjaedme` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_enuajmxtmahicwamabtgouikajujafhfaarq` (`userId`,`message`),
  CONSTRAINT `fk_roqhbvgjxeqazdcxfzdtcofkmvrxthlyhkbo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_haupoeuuiscgnozzpzhdvzjicbtyzwgjzrrc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oxkbaapabootwyxwemjqkrsjkmhwvceqmexu` (`dateDeleted`),
  KEY `idx_bnxxyorekistdhxdeewqpqoawuyixeguyove` (`handle`),
  KEY `idx_fswxchiaqnxkbkvkrpwqvdnfzzfkirbvigta` (`sortOrder`),
  KEY `fk_gloenvwwswopnlpukanvxgklatniqcfthtin` (`groupId`),
  CONSTRAINT `fk_gloenvwwswopnlpukanvxgklatniqcfthtin` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_fucbskkugbfceanjijedipkcrtlwavdehcep` (`userId`),
  CONSTRAINT `fk_fucbskkugbfceanjijedipkcrtlwavdehcep` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hyxxbiynccciuvnzhiwlvbmqydlclolizpru` (`structureId`,`elementId`),
  KEY `idx_wbafshogavqyggwqqwzurvyhvdgdzyuwjyuf` (`root`),
  KEY `idx_bgykojqudkadsxlrvpuzligmwcndbdiwvhub` (`lft`),
  KEY `idx_xcgktxfbmufoirbzpabxmmowflfsuklqmumv` (`rgt`),
  KEY `idx_thzdasvjmebnerjdumzqjfkpuucwptezmahs` (`level`),
  KEY `idx_yrcadugmqxlugdtumslyzhhwztmkgnwjqqiu` (`elementId`),
  CONSTRAINT `fk_vxmygdkurzlnzaqgvwlcplluacfeopvinfdk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ndlkvmhbakjtjldxwdoordoqtbvnshhhfede` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fjibwhuyjfyzgczzogufhmvudobmgxvvsiqq` (`key`,`language`),
  KEY `idx_xudqpwfpedxhtstncupqfyuwijvmghbvvrxt` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wwqzlcibdxdkdzwqoiaophrsutthjpeijkbb` (`name`),
  KEY `idx_rhljvbqdikgxwirgftxycvlighuhosibxnsn` (`handle`),
  KEY `idx_rnyrxdcdndyhvmliuethaehgzbfrijtyodjz` (`dateDeleted`),
  KEY `fk_ndzlkphiaddeqzannueyjtrcrlnhatuyircb` (`fieldLayoutId`),
  CONSTRAINT `fk_ndzlkphiaddeqzannueyjtrcrlnhatuyircb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_znbmebkuxsbfjtkoelxmwxtjiipbdsjbknqi` (`groupId`),
  CONSTRAINT `fk_eeghlntoihdwrnghxhmvjjuvgrdhsocqryeo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rlxrruhsujkvnjknutqnbsuknobchabtjcil` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lptgbegcnuoqwnuagaquemxsiydmhijtfdvt` (`token`),
  KEY `idx_vzrwbunmxkwekypqbizzmyzuzeemrppsnefh` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_upqgrsfinfsbtttznjwbcsczmgqiuddvktjd` (`handle`),
  KEY `idx_slrxhuiqmucbkhzfoqasgvwkhpmlzwyllfiq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lhqxxpnedakpgbaukkhekqjmgidmlnychaaz` (`groupId`,`userId`),
  KEY `idx_ncloezitwiunvcpuvzomtmjykqboccyklovt` (`userId`),
  CONSTRAINT `fk_cgalscfhohleqvcmyjrhbcgrazqigvnjebmu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pdhiovsimvttyrcwxrsihchfkgkiqnwkmilq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lrhqbejytlxrkmzxmfpkjxndsuedwikftjkd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xkyuqmtukwvpyfkljqicmoaoiywydpxonfvt` (`permissionId`,`groupId`),
  KEY `idx_cznsijyjkjzdougtbbghbpxjjinbovtrhzhi` (`groupId`),
  CONSTRAINT `fk_jpycjmcpckosjgirieochrnyjrmelwvpilrq` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lhnuxpyrpuhsrvmntolifyhjkwhrhnpdggwc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hywxadunegglfjrmfqrjpjwtuhephwihtxqj` (`permissionId`,`userId`),
  KEY `idx_bwpbxbgoagowonnnewxyjphfeaisdqglbdol` (`userId`),
  CONSTRAINT `fk_buuvvniatxpfkwcqqqnzajuakxofaogcgbsl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhtvwfyubjdgarqjvbwyxfajvqfzbhgauqfw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_pjrgngwycujnhokurmpqphpavqaxzhmjdcul` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zdaipevqjtzgsflxvfpdktyksykytxfyhbly` (`active`),
  KEY `idx_isatbzkhtuskzrmtxcbnriqlgifrqwgyhriz` (`locked`),
  KEY `idx_ofrczllsjdlqvvtxzcfklxhdtaorwytirkqm` (`pending`),
  KEY `idx_mjehtuerxwmkjwmvmfpdzxkcsfxxqldlkfpa` (`suspended`),
  KEY `idx_jwzqictstofqlljjrtseyzpvenljewjfslmk` (`verificationCode`),
  KEY `idx_gxddtbtjvaffqcjyrzppuuuexqtufttxgyvz` (`email`),
  KEY `idx_racorzwspbhraosxftqsidudjofuwjrnymgi` (`username`),
  KEY `fk_lkmwfdzpijlvcjjdtnuhbplspowhjqbtkhlm` (`photoId`),
  KEY `fk_bqicudcfxbsljdwjrfzozqieabpentepwzyt` (`affiliatedSiteId`),
  CONSTRAINT `fk_bqicudcfxbsljdwjrfzozqieabpentepwzyt` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ijrkgpnxhrwiuspogokbphpzlixvtlgdiubs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lkmwfdzpijlvcjjdtnuhbplspowhjqbtkhlm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rtaddhzcrzyarxydalwlaplmfwkvvtmgzulq` (`name`,`parentId`,`volumeId`),
  KEY `idx_jprzfvrtdazsrtjpcnpprhitseuuxutdygsk` (`parentId`),
  KEY `idx_wgnalfwffwlclwmqswjtoakwtpibiykjvsop` (`volumeId`),
  CONSTRAINT `fk_dhlenrqyewnzgezoduacgmxchpuohkpufbei` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ilvffrilvopakbldcqhjigbscfuhxrrwqmeq` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_igcnzndvmplrgbskovjmlbpmbmiastrxoiws` (`name`),
  KEY `idx_jempvvkjvgayksdudhcftrtlzipbolmigvow` (`handle`),
  KEY `idx_nbakpmckdzuaolkfxlbkcncrxkhmjlxrdsch` (`fieldLayoutId`),
  KEY `idx_ycmksnoumylxgbtipuxqnohlmvfcpkkzfxyg` (`dateDeleted`),
  CONSTRAINT `fk_suwclhrbyoioocecsqflfrquihsrqndfrmcc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xjlcaufnwkipjsmhebnlbmoidxqgyjwkddol` (`userId`),
  CONSTRAINT `fk_xjlcaufnwkipjsmhebnlbmoidxqgyjwkddol` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mbyuwntiilbrmkkvrosbvvofbwhwnbahwbdd` (`userId`),
  CONSTRAINT `fk_kgiwxcxnyfrhqefbmknfsbucqzpgwnfptdge` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06 12:37:35
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (2,1,'postDate','2025-12-05 17:42:17',0,1),(2,1,'slug','2025-12-05 17:42:17',0,1),(2,1,'title','2025-12-05 17:42:17',0,1),(2,1,'uri','2025-12-05 17:42:17',0,1),(4,1,'fieldLayoutId','2025-12-05 17:42:25',0,1),(4,1,'postDate','2025-12-05 17:42:32',0,1),(4,1,'slug','2025-12-05 17:42:32',0,1),(4,1,'title','2025-12-05 17:42:32',0,1),(4,1,'typeId','2025-12-05 17:42:25',0,1),(4,1,'uri','2025-12-05 17:42:32',0,1),(6,1,'postDate','2025-12-05 17:43:01',0,1),(6,1,'slug','2025-12-05 17:43:01',0,1),(6,1,'title','2025-12-05 17:43:01',0,1),(6,1,'uri','2025-12-05 17:43:01',0,1),(8,1,'fieldLayoutId','2025-12-05 17:49:56',0,1),(8,1,'postDate','2025-12-05 17:50:05',0,1),(8,1,'slug','2025-12-05 17:50:02',0,1),(8,1,'title','2025-12-05 17:50:02',0,1),(8,1,'typeId','2025-12-05 17:49:56',0,1),(8,1,'uri','2025-12-05 17:50:02',0,1),(10,1,'fieldLayoutId','2025-12-05 17:55:21',0,1),(10,1,'postDate','2025-12-05 17:55:28',0,1),(10,1,'slug','2025-12-05 17:55:26',0,1),(10,1,'title','2025-12-05 17:55:26',0,1),(10,1,'typeId','2025-12-05 17:55:21',0,1),(10,1,'uri','2025-12-05 17:55:26',0,1),(12,1,'postDate','2025-12-05 17:56:38',0,1),(12,1,'slug','2025-12-05 17:56:36',0,1),(12,1,'title','2025-12-05 17:56:36',0,1),(12,1,'uri','2025-12-05 17:56:36',0,1),(14,1,'fieldLayoutId','2025-12-05 17:56:45',0,1),(14,1,'postDate','2025-12-05 17:56:50',0,1),(14,1,'slug','2025-12-05 17:56:50',0,1),(14,1,'title','2025-12-05 17:56:50',0,1),(14,1,'typeId','2025-12-05 17:56:45',0,1),(14,1,'uri','2025-12-05 17:56:50',0,1),(16,1,'fieldLayoutId','2025-12-05 17:56:59',0,1),(16,1,'postDate','2025-12-05 17:57:06',0,1),(16,1,'slug','2025-12-05 17:57:06',0,1),(16,1,'title','2025-12-05 17:57:06',0,1),(16,1,'typeId','2025-12-05 17:56:59',0,1),(16,1,'uri','2025-12-05 17:57:06',0,1),(20,1,'fieldLayoutId','2025-12-05 18:17:26',0,1),(20,1,'postDate','2025-12-05 18:17:34',0,1),(20,1,'slug','2025-12-05 18:17:23',0,1),(20,1,'title','2025-12-05 18:17:33',0,1),(20,1,'typeId','2025-12-05 18:17:26',0,1),(20,1,'uri','2025-12-05 18:17:23',0,1),(22,1,'fieldLayoutId','2025-12-05 18:29:50',0,1),(22,1,'postDate','2025-12-05 18:29:58',0,1),(22,1,'slug','2025-12-05 18:29:57',0,1),(22,1,'title','2025-12-05 18:29:57',0,1),(22,1,'typeId','2025-12-05 18:29:50',0,1),(22,1,'uri','2025-12-05 18:29:57',0,1),(24,1,'postDate','2025-12-05 18:30:28',0,1),(24,1,'slug','2025-12-05 18:30:28',0,1),(24,1,'title','2025-12-05 18:30:28',0,1),(24,1,'uri','2025-12-05 18:30:28',0,1),(26,1,'fieldLayoutId','2025-12-05 18:30:40',0,1),(26,1,'postDate','2025-12-05 18:30:42',0,1),(26,1,'slug','2025-12-05 18:30:37',0,1),(26,1,'title','2025-12-05 18:30:37',0,1),(26,1,'typeId','2025-12-05 18:30:40',0,1),(26,1,'uri','2025-12-05 18:30:37',0,1),(28,1,'fieldLayoutId','2025-12-05 18:30:55',0,1),(28,1,'postDate','2025-12-05 18:30:56',0,1),(28,1,'slug','2025-12-05 18:30:53',0,1),(28,1,'title','2025-12-05 18:30:53',0,1),(28,1,'typeId','2025-12-05 18:30:55',0,1),(28,1,'uri','2025-12-05 18:30:53',0,1),(30,1,'fieldLayoutId','2025-12-05 18:31:08',0,1),(30,1,'slug','2025-12-05 18:31:06',0,1),(30,1,'title','2025-12-05 18:31:06',0,1),(30,1,'typeId','2025-12-05 18:31:08',0,1),(30,1,'uri','2025-12-05 18:31:06',0,1),(32,1,'fieldLayoutId','2025-12-05 18:31:26',0,1),(32,1,'postDate','2025-12-05 18:31:27',0,1),(32,1,'slug','2025-12-05 18:31:23',0,1),(32,1,'title','2025-12-05 18:31:23',0,1),(32,1,'typeId','2025-12-05 18:31:26',0,1),(32,1,'uri','2025-12-05 18:31:23',0,1),(34,1,'postDate','2025-12-05 18:33:00',0,1),(34,1,'slug','2025-12-05 18:32:58',0,1),(34,1,'title','2025-12-05 18:32:58',0,1),(34,1,'uri','2025-12-05 18:32:58',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `drafts` VALUES (9,NULL,1,0,'First draft',NULL,0,NULL,1),(10,NULL,1,0,'First draft',NULL,0,NULL,1),(19,NULL,1,0,'First draft',NULL,0,NULL,1);
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'save','2025-12-05 17:42:17'),(4,1,1,NULL,'save','2025-12-05 17:42:32'),(6,1,1,NULL,'save','2025-12-05 17:43:01'),(8,1,1,NULL,'save','2025-12-05 17:50:05'),(10,1,1,NULL,'save','2025-12-05 17:55:28'),(12,1,1,NULL,'save','2025-12-05 17:56:38'),(14,1,1,NULL,'save','2025-12-05 17:56:50'),(16,1,1,NULL,'save','2025-12-05 17:57:06'),(20,1,1,NULL,'save','2025-12-05 18:17:34'),(22,1,1,NULL,'save','2025-12-05 18:29:58'),(24,1,1,NULL,'save','2025-12-05 18:30:29'),(26,1,1,NULL,'save','2025-12-05 18:30:42'),(28,1,1,NULL,'save','2025-12-05 18:30:57'),(30,1,1,NULL,'save','2025-12-05 18:31:09'),(32,1,1,NULL,'save','2025-12-05 18:31:27'),(34,1,1,NULL,'save','2025-12-05 18:33:00');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-12-05 16:50:37','2025-12-05 16:50:37',NULL,NULL,NULL,'b916d277-d76d-446b-bce6-972746242a7c'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:42:04','2025-12-05 17:56:25',NULL,'2025-12-05 17:56:25',NULL,'0d508f0d-8a9e-44a3-a0a2-72a7227c2770'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:42:17','2025-12-05 17:42:17',NULL,'2025-12-05 17:56:25',NULL,'6ea22577-95e0-44d8-93bb-4d8b6a6cabda'),(4,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:42:21','2025-12-05 17:56:25',NULL,'2025-12-05 17:56:25',NULL,'07a92a42-9533-4f28-a651-c058b1c58ee8'),(5,4,NULL,2,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:42:32','2025-12-05 17:42:32',NULL,'2025-12-05 17:56:25',NULL,'b7ff19f5-866e-406d-bd58-423571e0529d'),(6,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:42:55','2025-12-05 17:56:25',NULL,'2025-12-05 17:56:25',NULL,'dd7b4f4c-5f9b-4ac2-a31a-6ae104952b26'),(7,6,NULL,3,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:43:01','2025-12-05 17:43:01',NULL,'2025-12-05 17:56:25',NULL,'7ca1ec0f-4f39-4d63-aec9-4c4b19b3b113'),(8,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:49:53','2025-12-05 17:56:25',NULL,'2025-12-05 17:56:25',NULL,'5209ddd0-7d51-4545-be81-7bc2fb4b24c0'),(9,8,NULL,4,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:50:05','2025-12-05 17:50:05',NULL,'2025-12-05 17:56:25',NULL,'f443f346-77f7-4b49-b8dd-3b5c6c6ae3fc'),(10,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:55:18','2025-12-05 17:56:25',NULL,'2025-12-05 17:56:25',NULL,'c9fe0bb1-bb3e-47bc-b2f5-dab405a6b75d'),(11,10,NULL,5,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:55:28','2025-12-05 17:55:28',NULL,'2025-12-05 17:56:25',NULL,'86716b52-80b3-4dc0-a50d-3f1dea24637f'),(12,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:56:28','2025-12-05 18:30:17',NULL,'2025-12-05 18:30:17',NULL,'cf365e48-580f-4f32-87f6-9414386bfdda'),(13,12,NULL,6,1,'craft\\elements\\Entry',1,0,'2025-12-05 17:56:38','2025-12-05 17:56:38',NULL,'2025-12-05 18:30:17',NULL,'dcf4fd6b-2887-468f-afef-9c8134fcb21d'),(14,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:56:42','2025-12-05 18:30:17',NULL,'2025-12-05 18:30:17',NULL,'61cd5bd6-5dea-450b-9ad5-214b6fcba877'),(15,14,NULL,7,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:56:50','2025-12-05 17:56:50',NULL,'2025-12-05 18:30:17',NULL,'d1fe67cf-3a80-45fd-af18-736a88b8c32f'),(16,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:56:56','2025-12-05 18:30:17',NULL,'2025-12-05 18:30:17',NULL,'c3aa4ddf-20ba-4940-88be-1da0cf88df01'),(17,16,NULL,8,2,'craft\\elements\\Entry',1,0,'2025-12-05 17:57:06','2025-12-05 17:57:06',NULL,'2025-12-05 18:30:17',NULL,'a3f7ace9-6134-4d22-af9f-f707b7217631'),(18,NULL,9,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 18:14:39','2025-12-05 18:14:39',NULL,NULL,NULL,'6b215f86-8417-4e70-ac2b-aa9c89d6cb98'),(19,NULL,10,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 18:15:25','2025-12-05 18:15:25',NULL,NULL,NULL,'72cf9c61-1779-4e0a-9efa-fb82c5314b70'),(20,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-12-05 18:17:13','2025-12-05 18:30:17',NULL,'2025-12-05 18:30:17',NULL,'646ac61f-c290-42b9-b9aa-4fe8f6d3019f'),(21,20,NULL,9,3,'craft\\elements\\Entry',1,0,'2025-12-05 18:17:34','2025-12-05 18:17:34',NULL,'2025-12-05 18:30:17',NULL,'acf53f1e-b846-4653-a764-9d1da042133e'),(22,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-12-05 18:29:47','2025-12-05 18:30:17',NULL,'2025-12-05 18:30:17',NULL,'ae2be2dd-a8ba-4e65-9d32-87fa13712ae9'),(23,22,NULL,10,4,'craft\\elements\\Entry',1,0,'2025-12-05 18:29:58','2025-12-05 18:29:58',NULL,'2025-12-05 18:30:17',NULL,'c998b43b-a7c6-4ab2-a029-68e5f9c9a1dd'),(24,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:20','2025-12-05 18:30:28',NULL,NULL,NULL,'cd3247dc-c63a-4530-8316-fe2ce729dae4'),(25,24,NULL,11,1,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:28','2025-12-05 18:30:29',NULL,NULL,NULL,'3d7a9007-b3ac-4215-a9b4-5d7a0518df94'),(26,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:31','2025-12-05 18:30:42',NULL,NULL,NULL,'18c7bb9b-7ccc-4a74-9f49-57734ba44c58'),(27,26,NULL,12,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:42','2025-12-05 18:30:42',NULL,NULL,NULL,'97d73393-7861-44f2-a91c-a734a8ce957d'),(28,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:47','2025-12-05 18:30:57',NULL,NULL,NULL,'2e1fcd5a-146c-4740-9bae-a811fdb7dfd1'),(29,28,NULL,13,3,'craft\\elements\\Entry',1,0,'2025-12-05 18:30:57','2025-12-05 18:30:57',NULL,NULL,NULL,'0e16abcd-0ebe-41ea-8b42-e51a2d5c94c3'),(30,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-12-05 18:31:00','2025-12-05 18:31:09',NULL,'2025-12-06 11:33:10',NULL,'2020d190-7a4c-45b7-bf72-9c004ba87ddb'),(31,30,NULL,14,4,'craft\\elements\\Entry',1,0,'2025-12-05 18:31:09','2025-12-05 18:31:09',NULL,NULL,NULL,'f558fe6e-ec79-4398-9105-c882709ea94c'),(32,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:31:12','2025-12-05 18:31:27',NULL,NULL,NULL,'9b183450-c15f-402a-870d-512e07434fb2'),(33,32,NULL,15,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:31:27','2025-12-05 18:31:27',NULL,NULL,NULL,'06abdc39-e380-4df3-a130-d0f56101e76b'),(34,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:32:49','2025-12-05 18:33:00',NULL,NULL,NULL,'c3e2f74c-0837-427e-90d4-5c4c04821199'),(35,34,NULL,16,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:33:00','2025-12-05 18:33:00',NULL,NULL,NULL,'12406b69-a7b3-426f-9f05-fc18206f85d0'),(36,NULL,19,NULL,2,'craft\\elements\\Entry',1,0,'2025-12-05 18:33:17','2025-12-05 18:33:17',NULL,NULL,NULL,'f50f675e-5a08-422e-b527-ceb7e33a4490');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2025-12-05 16:50:37','2025-12-05 16:50:37','a40ba660-4159-4ae8-9642-f05a34fde1c4'),(2,2,1,'Entry Level One','entry-level-one','entry-level/entry-level-one',NULL,1,'2025-12-05 17:42:04','2025-12-05 17:42:17','9b2260e6-bb0f-4183-bea4-6007511debf9'),(3,3,1,'Entry Level One','entry-level-one','entry-level/entry-level-one',NULL,1,'2025-12-05 17:42:17','2025-12-05 17:42:17','2913f3ce-79e4-4c76-a38c-18b1b9e0baf1'),(4,4,1,'Entry Level Two','entry-level-two','entry-level/entry-level-two',NULL,1,'2025-12-05 17:42:21','2025-12-05 17:42:32','1c9497c8-8b8e-48be-824f-907766dd3e83'),(5,5,1,'Entry Level Two','entry-level-two','entry-level/entry-level-two',NULL,1,'2025-12-05 17:42:32','2025-12-05 17:42:32','7115f2a2-ca40-445e-bb9f-673dd2721c49'),(6,6,1,'Entry two','entry-two','entry-level/entry-two',NULL,1,'2025-12-05 17:42:55','2025-12-05 17:43:01','9c735e56-e261-40f8-8694-1f917579a065'),(7,7,1,'Entry two','entry-two','entry-level/entry-two',NULL,1,'2025-12-05 17:43:01','2025-12-05 17:43:01','6ecc3638-100f-4d91-b15f-88fd23b8265e'),(8,8,1,'Test 2 Entry','test-2-entry','entry-level/test-2-entry',NULL,1,'2025-12-05 17:49:53','2025-12-05 17:50:02','affa4554-891d-4f70-8460-d116b4b37a51'),(9,9,1,'Test 2 Entry','test-2-entry','entry-level/test-2-entry',NULL,1,'2025-12-05 17:50:05','2025-12-05 17:50:05','e2e51df1-7593-45cf-b7f3-1248f0aaa406'),(10,10,1,'Test 2','test-2','entry-level/test-2',NULL,1,'2025-12-05 17:55:18','2025-12-05 17:55:29','a5fb4728-4641-4b54-84ee-f0d6478ca65b'),(11,11,1,'Test 2','test-2','entry-level/test-2',NULL,1,'2025-12-05 17:55:28','2025-12-05 17:55:28','af6884b4-94de-4b61-974e-716c314547cf'),(12,12,1,'Entry Level One','entry-level-one','entry-level/entry-level-one',NULL,1,'2025-12-05 17:56:28','2025-12-05 17:56:36','2df2f38c-0c8c-4eb9-9dbb-721d0c1d0231'),(13,13,1,'Entry Level One','entry-level-one','entry-level/entry-level-one',NULL,1,'2025-12-05 17:56:38','2025-12-05 17:56:38','ee6b74ce-db69-4919-bbad-837b0734f955'),(14,14,1,'Level 2','level-2','entry-level/level-2',NULL,1,'2025-12-05 17:56:42','2025-12-05 17:56:51','fb75c4ed-ec23-47c1-8be7-6533434f9229'),(15,15,1,'Level 2','level-2','entry-level/level-2',NULL,1,'2025-12-05 17:56:50','2025-12-05 17:56:50','bffaacc2-c8dd-479a-a998-c0e660cab3f7'),(16,16,1,'Level 2 - 2','level-2-2','entry-level/level-2-2',NULL,1,'2025-12-05 17:56:56','2025-12-05 17:57:07','8d03e826-405a-4dd9-9042-9b43088c262c'),(17,17,1,'Level 2 - 2','level-2-2','entry-level/level-2-2',NULL,1,'2025-12-05 17:57:06','2025-12-05 17:57:06','9e6148a5-d278-4c36-a797-304e0853fd66'),(18,18,1,NULL,'__temp_byefomtdhixkouxotrsdkcfjxrweqikejcde','entry-level/__temp_byefomtdhixkouxotrsdkcfjxrweqikejcde',NULL,1,'2025-12-05 18:14:39','2025-12-05 18:14:39','41da9e86-cf41-44b3-b2d8-58342a0c8292'),(19,19,1,NULL,'__temp_wfngucpwecwwlteohevwmypuiciqimwqpxer','entry-level/__temp_wfngucpwecwwlteohevwmypuiciqimwqpxer',NULL,1,'2025-12-05 18:15:25','2025-12-05 18:15:25','5f20c477-da3c-45d7-8c3a-b43d60d9b73b'),(20,20,1,'Entry level Three Test','entry-level','entry-level/entry-level',NULL,1,'2025-12-05 18:17:13','2025-12-05 18:17:35','e687901c-9f65-45f8-942b-d1402c7611a6'),(21,21,1,'Entry level Three Test','entry-level','entry-level/entry-level',NULL,1,'2025-12-05 18:17:34','2025-12-05 18:17:34','ed64c5e1-4eb0-465f-93a8-4b977f225d81'),(22,22,1,'A new level 4','a-new-level-4','entry-level/a-new-level-4',NULL,1,'2025-12-05 18:29:47','2025-12-05 18:29:59','0f3c38f8-d359-4e9d-a9f8-c71d10940051'),(23,23,1,'A new level 4','a-new-level-4','entry-level/a-new-level-4',NULL,1,'2025-12-05 18:29:58','2025-12-05 18:29:58','135576be-d8a4-4a0c-9c9b-dbe9f523b997'),(24,24,1,'Landing Page','landing-page','entry-level/landing-page',NULL,1,'2025-12-05 18:30:20','2025-12-05 18:30:28','bec075be-ddcf-4b87-877b-5b831337f92b'),(25,25,1,'Landing Page','landing-page','entry-level/landing-page',NULL,1,'2025-12-05 18:30:29','2025-12-05 18:30:29','243258d8-b179-4fc9-81db-098dde319230'),(26,26,1,'Level 2','level-2','entry-level/level-2',NULL,1,'2025-12-05 18:30:31','2025-12-06 11:32:18','32871048-c014-4f6a-9228-d9e68b3c35e6'),(27,27,1,'Level 2','level-2','entry-level/level-2',NULL,1,'2025-12-05 18:30:42','2025-12-05 18:30:42','4f4706f6-ef5d-4369-ae8d-10c5f2bb3a01'),(28,28,1,'Level 3','level-3','entry-level/level-3',NULL,1,'2025-12-05 18:30:47','2025-12-06 11:33:00','73f99556-bd18-4c01-913b-b90d64eda40d'),(29,29,1,'Level 3','level-3','entry-level/level-3',NULL,1,'2025-12-05 18:30:57','2025-12-05 18:30:57','41148de6-3cee-4c2c-906c-578e3043b048'),(30,30,1,'Level 4','level-4','entry-level/level-4',NULL,1,'2025-12-05 18:31:00','2025-12-06 11:30:05','c1bab1dc-ba62-43bc-b710-dc6ece4f0ca1'),(31,31,1,'Level 4','level-4','entry-level/level-4',NULL,1,'2025-12-05 18:31:09','2025-12-05 18:31:09','ad6a3582-54e2-42b7-a759-1ec8b2f7fb2b'),(32,32,1,'Back to level 2','back-to-level-2','entry-level/back-to-level-2',NULL,1,'2025-12-05 18:31:12','2025-12-06 11:32:18','a94e52b8-f171-49d2-abf9-abd52ceef634'),(33,33,1,'Back to level 2','back-to-level-2','entry-level/back-to-level-2',NULL,1,'2025-12-05 18:31:27','2025-12-05 18:31:27','0a62fcd3-9d13-4c88-929b-f4308ccbf9a4'),(34,34,1,'default level two','default-level-two','entry-level/default-level-two',NULL,1,'2025-12-05 18:32:49','2025-12-06 11:32:18','3b4db3cb-3b7a-4f9f-a3bf-eedb8d385364'),(35,35,1,'default level two','default-level-two','entry-level/default-level-two',NULL,1,'2025-12-05 18:33:00','2025-12-05 18:33:00','8d6736ff-d4df-493b-9ecc-912b6c5d7ec9'),(36,36,1,NULL,'__temp_fsywzshvwflkhafvxxzsnbftnhimbqhhcpqr','entry-level/__temp_fsywzshvwflkhafvxxzsnbftnhimbqhhcpqr',NULL,1,'2025-12-05 18:33:17','2025-12-05 18:33:17','8a4d3815-8bea-4091-abd4-1ff316899a0d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,NULL,NULL,1,'2025-12-05 17:42:00',NULL,'live',0,0,'2025-12-05 17:42:04','2025-12-05 17:42:17'),(3,1,NULL,NULL,NULL,1,'2025-12-05 17:42:00',NULL,'live',NULL,NULL,'2025-12-05 17:42:17','2025-12-05 17:42:17'),(4,1,NULL,NULL,NULL,2,'2025-12-05 17:42:00',NULL,'live',0,0,'2025-12-05 17:42:21','2025-12-05 17:42:32'),(5,1,NULL,NULL,NULL,2,'2025-12-05 17:42:00',NULL,'live',NULL,NULL,'2025-12-05 17:42:32','2025-12-05 17:42:32'),(6,1,NULL,NULL,NULL,1,'2025-12-05 17:43:00',NULL,'live',0,0,'2025-12-05 17:42:55','2025-12-05 17:43:01'),(7,1,NULL,NULL,NULL,1,'2025-12-05 17:43:00',NULL,'live',NULL,NULL,'2025-12-05 17:43:01','2025-12-05 17:43:01'),(8,1,NULL,NULL,NULL,2,'2025-12-05 17:50:00',NULL,'live',0,0,'2025-12-05 17:49:53','2025-12-05 17:50:05'),(9,1,NULL,NULL,NULL,2,'2025-12-05 17:50:00',NULL,'live',NULL,NULL,'2025-12-05 17:50:05','2025-12-05 17:50:05'),(10,1,NULL,NULL,NULL,2,'2025-12-05 17:55:00',NULL,'live',0,0,'2025-12-05 17:55:18','2025-12-05 17:55:28'),(11,1,NULL,NULL,NULL,2,'2025-12-05 17:55:00',NULL,'live',NULL,NULL,'2025-12-05 17:55:28','2025-12-05 17:55:28'),(12,1,NULL,NULL,NULL,1,'2025-12-05 17:56:00',NULL,'live',0,0,'2025-12-05 17:56:28','2025-12-05 17:56:38'),(13,1,NULL,NULL,NULL,1,'2025-12-05 17:56:00',NULL,'live',NULL,NULL,'2025-12-05 17:56:38','2025-12-05 17:56:38'),(14,1,NULL,NULL,NULL,2,'2025-12-05 17:56:00',NULL,'live',0,0,'2025-12-05 17:56:42','2025-12-05 17:56:50'),(15,1,NULL,NULL,NULL,2,'2025-12-05 17:56:00',NULL,'live',NULL,NULL,'2025-12-05 17:56:50','2025-12-05 17:56:50'),(16,1,NULL,NULL,NULL,2,'2025-12-05 17:57:00',NULL,'live',0,0,'2025-12-05 17:56:56','2025-12-05 17:57:06'),(17,1,NULL,NULL,NULL,2,'2025-12-05 17:57:00',NULL,'live',NULL,NULL,'2025-12-05 17:57:06','2025-12-05 17:57:06'),(18,1,NULL,NULL,NULL,1,'2025-12-05 18:14:39',NULL,'live',NULL,NULL,'2025-12-05 18:14:39','2025-12-05 18:14:39'),(19,1,NULL,NULL,NULL,1,'2025-12-05 18:15:25',NULL,'live',NULL,NULL,'2025-12-05 18:15:25','2025-12-05 18:15:25'),(20,1,NULL,NULL,NULL,3,'2025-12-05 18:17:00',NULL,'live',0,0,'2025-12-05 18:17:13','2025-12-05 18:17:34'),(21,1,NULL,NULL,NULL,3,'2025-12-05 18:17:00',NULL,'live',NULL,NULL,'2025-12-05 18:17:34','2025-12-05 18:17:34'),(22,1,NULL,NULL,NULL,4,'2025-12-05 18:29:00',NULL,'live',0,0,'2025-12-05 18:29:47','2025-12-05 18:29:58'),(23,1,NULL,NULL,NULL,4,'2025-12-05 18:29:00',NULL,'live',NULL,NULL,'2025-12-05 18:29:58','2025-12-05 18:29:58'),(24,1,NULL,NULL,NULL,1,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:20','2025-12-05 18:30:28'),(25,1,NULL,NULL,NULL,1,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:29','2025-12-05 18:30:29'),(26,1,NULL,NULL,NULL,2,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:31','2025-12-05 18:30:42'),(27,1,NULL,NULL,NULL,2,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:42','2025-12-05 18:30:42'),(28,1,NULL,NULL,NULL,3,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:47','2025-12-05 18:30:56'),(29,1,NULL,NULL,NULL,3,'2025-12-05 18:30:00',NULL,'live',NULL,NULL,'2025-12-05 18:30:57','2025-12-05 18:30:57'),(30,1,NULL,NULL,NULL,4,'2025-12-05 18:31:00',NULL,'live',1,NULL,'2025-12-05 18:31:00','2025-12-05 18:31:08'),(31,1,NULL,NULL,NULL,4,'2025-12-05 18:31:00',NULL,'live',NULL,NULL,'2025-12-05 18:31:09','2025-12-05 18:31:09'),(32,1,NULL,NULL,NULL,2,'2025-12-05 18:31:00',NULL,'live',NULL,NULL,'2025-12-05 18:31:12','2025-12-05 18:31:27'),(33,1,NULL,NULL,NULL,2,'2025-12-05 18:31:00',NULL,'live',NULL,NULL,'2025-12-05 18:31:27','2025-12-05 18:31:27'),(34,1,NULL,NULL,NULL,2,'2025-12-05 18:33:00',NULL,'live',NULL,NULL,'2025-12-05 18:32:49','2025-12-05 18:33:00'),(35,1,NULL,NULL,NULL,2,'2025-12-05 18:33:00',NULL,'live',NULL,NULL,'2025-12-05 18:33:00','2025-12-05 18:33:00'),(36,1,NULL,NULL,NULL,2,'2025-12-05 18:33:17',NULL,'live',NULL,NULL,'2025-12-05 18:33:17','2025-12-05 18:33:17');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,1),(28,1,1),(29,1,1),(30,1,1),(31,1,1),(32,1,1),(33,1,1),(34,1,1),(35,1,1),(36,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Section Landing Page','sectionLandingPage1',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-05 17:37:38','2025-12-06 11:32:18',NULL,'b9329609-fe03-4562-a9bd-030469642367'),(2,2,'Individual Article Page','individualArticlePage1',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-05 17:37:57','2025-12-06 11:33:00',NULL,'be036e7f-651b-41a0-a0b4-09fe4f0ffb68'),(3,3,'A Level Three Entry','aLevelThreeEntry',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-05 18:14:04','2025-12-06 11:39:08',NULL,'a3f07f14-f1ac-4845-b74f-ed0333754e26'),(4,4,'Entry Level Four','entryLevelFour',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-05 18:29:22','2025-12-05 18:29:22','2025-12-06 11:33:10','27da2506-e958-41cf-a066-2be2fa0283d9'),(5,5,'Section Landing Page','sectionLandingPage2',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-06 11:31:03','2025-12-06 11:31:37',NULL,'5455e65b-99ce-4a1f-9b53-a78c08edd1fa'),(6,6,'Individual Article Page','individualArticlePage2',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-12-06 11:34:03','2025-12-06 11:34:03',NULL,'c309933f-7fb2-44a5-997a-9f0646fbe7e8');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"3ebddc67-cd24-4431-89e4-17629dafc2d1\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"0a14e00e-d192-461a-8d2d-f081960d6510\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-05T17:36:26+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-05 17:37:38','2025-12-05 17:37:38',NULL,'1a6d0d99-0870-433a-9e4d-af3c0f13f383'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"502994e7-78f4-492f-8566-d825c6cfa33d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6e25066b-3dae-46b0-a056-9e45a941c2d0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-05T17:36:41+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-05 17:37:57','2025-12-05 17:37:57',NULL,'a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"fece8bfc-ce5d-4b59-b70a-4d009f14b0c8\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"5135c74f-2599-436e-a667-a69175f2eb32\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-05T18:12:56+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-05 18:14:04','2025-12-05 18:14:04',NULL,'8c7a27da-223c-4445-a8b3-10a7aab21f09'),(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"7c362807-dc30-4980-8fef-08aa4bf01c6f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4bb71c03-57ea-4ed3-b40b-45c93426ed61\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-05T18:28:12+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-05 18:29:22','2025-12-05 18:29:22','2025-12-06 11:33:10','dcd39c26-8594-4621-8862-de6ce46cb4ec'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e00544d6-043e-42cc-9823-ce289d260b8f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"e5e277a2-0bc2-4773-9e81-045ec709dfaa\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-06T11:29:35+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-06 11:31:03','2025-12-06 11:31:03',NULL,'d3fde11e-d143-4eb3-8b83-b0380be37370'),(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"2796b2c0-c5a9-47de-9114-d14759427e1b\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"79ccf2d5-ace3-4b91-ae03-cf03c5321c01\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2025-12-06T11:32:51+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2025-12-06 11:34:03','2025-12-06 11:34:03',NULL,'336cdee8-f571-4d9a-b648-99b3500ea520');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.8.21','5.8.0.3',0,'xfddtjdvvxnw','3@gvuvcbybff','2025-12-05 16:50:37','2025-12-06 12:11:37','99005586-f875-48af-a24b-7b6cdd3eb450');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','afb066a2-e1c6-4046-b7df-5102baca0da4'),(2,'craft','m221101_115859_create_entries_authors_table','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','799d806e-a7c4-4a66-9466-baa67c325730'),(3,'craft','m221107_112121_add_max_authors_to_sections','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','1a01ea97-57bd-433c-a03e-9da1d7caa874'),(4,'craft','m221205_082005_translatable_asset_alt_text','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','76292862-65e3-4624-a7b2-d1192a4a472d'),(5,'craft','m230314_110309_add_authenticator_table','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','63d2bd31-7eeb-4d00-b738-047cad8b7359'),(6,'craft','m230314_111234_add_webauthn_table','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','97ea3c6d-e5da-41db-91c7-16cd239738a7'),(7,'craft','m230503_120303_add_recoverycodes_table','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','b961c2c4-004b-476b-bf4b-928902663d1b'),(8,'craft','m230511_000000_field_layout_configs','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','b7055087-1a5e-4798-a560-e27d0420a286'),(9,'craft','m230511_215903_content_refactor','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','27105f57-af56-4d18-8655-38c42d05936c'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','94dee174-5a63-4943-895f-d4b9a1b91ab5'),(11,'craft','m230524_000001_entry_type_icons','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','1bf4b539-7065-4de4-b183-382474374310'),(12,'craft','m230524_000002_entry_type_colors','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','f914fff1-125b-46a8-abb9-2e238acd8179'),(13,'craft','m230524_220029_global_entry_types','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','b3bf2a35-7092-4c91-aeb9-1d6f1dbb91ec'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','f2899d78-9412-4344-b686-107d4630e007'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','2f973810-f779-479c-8188-83cc4eee0c18'),(16,'craft','m230616_173810_kill_field_groups','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','1cd8eb9e-faed-4189-afdb-130d944ef692'),(17,'craft','m230616_183820_remove_field_name_limit','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','96c2dc4b-ef6f-4a2a-b6c5-d9c8ed652bc8'),(18,'craft','m230617_070415_entrify_matrix_blocks','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','f1a15c59-31d6-4220-91e0-3e9bded87586'),(19,'craft','m230710_162700_element_activity','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','1954a27f-873d-4bad-9d9a-6a64689098a3'),(20,'craft','m230820_162023_fix_cache_id_type','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','445abae2-8502-4012-b5de-7e364d08b922'),(21,'craft','m230826_094050_fix_session_id_type','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','7a938b3a-1406-476f-80aa-b2c6f2a42d12'),(22,'craft','m230904_190356_address_fields','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','0bd63bf4-6a55-4ee9-9d00-8fd9426f9e0c'),(23,'craft','m230928_144045_add_subpath_to_volumes','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','ebaec99b-137a-46d2-bda4-a65fbf44f2ca'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','189cf239-c214-4092-9731-9675c3556974'),(25,'craft','m231213_030600_element_bulk_ops','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','ae1f044b-cbc1-4a94-b39d-8ddbe39280d7'),(26,'craft','m240129_150719_sites_language_amend_length','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','d31a282a-4487-40bc-8036-394cbfe2f84c'),(27,'craft','m240206_035135_convert_json_columns','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','bacada05-0ec0-4fc8-a2ab-8766e607858e'),(28,'craft','m240207_182452_address_line_3','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','f2b1148e-e8b5-41ba-bdc2-80db5a2ab7cf'),(29,'craft','m240302_212719_solo_preview_targets','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','c4754302-5163-41ef-845f-3cd2c0cef517'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','13bc826a-cff1-4d47-b774-f63564476f9f'),(31,'craft','m240723_214330_drop_bulkop_fk','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','8655698e-ee58-4b4b-80da-04220a598e65'),(32,'craft','m240731_053543_soft_delete_fields','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','d15999a9-7029-437e-871d-b478c19d94ac'),(33,'craft','m240805_154041_sso_identities','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','cb49dc8a-4ebb-46c2-bf11-10403df58624'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','722bac20-8ff6-411e-999b-f36c18b4c6c0'),(35,'craft','m241120_190905_user_affiliated_sites','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','8116bb74-43ce-43fc-ba08-050b1ccceddc'),(36,'craft','m241125_122914_add_viewUsers_permission','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','6113665a-13ab-4b44-b5d6-c771e8724e89'),(37,'craft','m250119_135304_entry_type_overrides','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','09522f7c-c700-4bc6-9c99-1d052c6d5851'),(38,'craft','m250206_135036_search_index_queue','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','6f1489fc-c03f-40cb-b669-b658261f483a'),(39,'craft','m250207_172349_bulkop_events','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','95d568da-a5ce-45aa-8c73-652915a97d88'),(40,'craft','m250315_131608_unlimited_authors','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','00ef17df-e2bf-4576-9a61-d40dc1ab7c7d'),(41,'craft','m250403_171253_static_statuses','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','75413b49-a35e-4666-944b-f03ef3c677b5'),(42,'craft','m250512_164202_asset_mime_types','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','8a396e86-3e77-4bcf-840a-d5336cd95221'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','2b504893-cf32-4189-a33e-4278f0328086'),(44,'craft','m250531_183058_content_blocks','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','213600bd-1aa9-4e7c-9376-0a9847e7863f'),(45,'craft','m250623_105031_entry_type_descriptions','2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-05 16:50:38','fe71ab6d-53eb-4a03-80e1-e2118c1e3ea6');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (3,'entry-level','1.0.0','1.0.0','2025-12-06 12:10:08','2025-12-06 12:10:08','2025-12-06 12:10:08','91f35666-b103-4f5c-8dbc-40455f036978');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1765023097'),('email.fromEmail','\"martin@hypha.media\"'),('email.fromName','\"Entry Level\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.color','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.description','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.cardThumbAlignment','\"end\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elementCondition','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.autocapitalize','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.autocomplete','false'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.autocorrect','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.class','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.dateAdded','\"2025-12-06T11:29:35+00:00\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.disabled','false'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.elementCondition','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.id','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.includeInCards','false'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.inputType','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.instructions','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.label','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.max','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.min','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.name','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.orientation','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.placeholder','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.providesThumbs','false'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.readonly','false'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.required','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.size','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.step','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.tip','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.title','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.uid','\"e5e277a2-0bc2-4773-9e81-045ec709dfaa\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.userCondition','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.warning','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.elements.0.width','100'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.name','\"Content\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.uid','\"e00544d6-043e-42cc-9823-ce289d260b8f\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.fieldLayouts.d3fde11e-d143-4eb3-8b83-b0380be37370.tabs.0.userCondition','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.handle','\"sectionLandingPage2\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.hasTitleField','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.icon','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.name','\"Section Landing Page\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.showSlugField','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.showStatusField','true'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.slugTranslationKeyFormat','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.slugTranslationMethod','\"site\"'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.titleFormat','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.titleTranslationKeyFormat','null'),('entryTypes.5455e65b-99ce-4a1f-9b53-a78c08edd1fa.titleTranslationMethod','\"site\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.color','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.description','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.cardThumbAlignment','\"end\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elementCondition','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.autocapitalize','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.autocomplete','false'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.autocorrect','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.class','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.dateAdded','\"2025-12-05T18:12:56+00:00\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.disabled','false'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.elementCondition','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.id','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.includeInCards','false'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.inputType','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.instructions','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.label','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.max','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.min','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.name','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.orientation','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.placeholder','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.providesThumbs','false'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.readonly','false'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.required','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.size','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.step','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.tip','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.title','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.uid','\"5135c74f-2599-436e-a667-a69175f2eb32\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.userCondition','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.warning','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.elements.0.width','100'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.name','\"Content\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.uid','\"fece8bfc-ce5d-4b59-b70a-4d009f14b0c8\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.fieldLayouts.8c7a27da-223c-4445-a8b3-10a7aab21f09.tabs.0.userCondition','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.handle','\"aLevelThreeEntry\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.hasTitleField','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.icon','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.name','\"A Level Three Entry\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.showSlugField','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.showStatusField','true'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.slugTranslationKeyFormat','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.slugTranslationMethod','\"site\"'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.titleFormat','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.titleTranslationKeyFormat','null'),('entryTypes.a3f07f14-f1ac-4845-b74f-ed0333754e26.titleTranslationMethod','\"site\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.color','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.description','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.cardThumbAlignment','\"end\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elementCondition','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.autocomplete','false'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.autocorrect','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.class','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.dateAdded','\"2025-12-05T17:36:26+00:00\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.disabled','false'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.elementCondition','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.id','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.includeInCards','false'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.inputType','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.instructions','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.label','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.max','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.min','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.name','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.orientation','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.placeholder','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.providesThumbs','false'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.readonly','false'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.required','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.size','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.step','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.tip','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.title','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.uid','\"0a14e00e-d192-461a-8d2d-f081960d6510\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.userCondition','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.warning','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.elements.0.width','100'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.name','\"Content\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.uid','\"3ebddc67-cd24-4431-89e4-17629dafc2d1\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.fieldLayouts.1a6d0d99-0870-433a-9e4d-af3c0f13f383.tabs.0.userCondition','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.handle','\"sectionLandingPage1\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.hasTitleField','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.icon','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.name','\"Section Landing Page\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.showSlugField','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.showStatusField','true'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.slugTranslationKeyFormat','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.slugTranslationMethod','\"site\"'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.titleFormat','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.titleTranslationKeyFormat','null'),('entryTypes.b9329609-fe03-4562-a9bd-030469642367.titleTranslationMethod','\"site\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.color','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.description','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.cardThumbAlignment','\"end\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elementCondition','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.autocapitalize','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.autocomplete','false'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.autocorrect','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.class','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.dateAdded','\"2025-12-05T17:36:41+00:00\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.disabled','false'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.elementCondition','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.id','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.includeInCards','false'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.inputType','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.instructions','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.label','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.max','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.min','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.name','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.orientation','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.placeholder','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.providesThumbs','false'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.readonly','false'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.required','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.size','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.step','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.tip','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.title','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.uid','\"6e25066b-3dae-46b0-a056-9e45a941c2d0\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.userCondition','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.warning','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.elements.0.width','100'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.name','\"Content\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.uid','\"502994e7-78f4-492f-8566-d825c6cfa33d\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.fieldLayouts.a76bc7d7-3d3b-45e2-8cb5-ce47dac5d86c.tabs.0.userCondition','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.handle','\"individualArticlePage1\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.hasTitleField','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.icon','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.name','\"Individual Article Page\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.showSlugField','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.showStatusField','true'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.slugTranslationKeyFormat','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.slugTranslationMethod','\"site\"'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.titleFormat','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.titleTranslationKeyFormat','null'),('entryTypes.be036e7f-651b-41a0-a0b4-09fe4f0ffb68.titleTranslationMethod','\"site\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.color','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.description','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.cardThumbAlignment','\"end\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elementCondition','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.autocomplete','false'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.autocorrect','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.class','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.dateAdded','\"2025-12-06T11:32:51+00:00\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.disabled','false'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.elementCondition','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.id','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.includeInCards','false'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.inputType','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.instructions','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.label','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.max','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.min','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.name','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.orientation','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.placeholder','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.providesThumbs','false'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.readonly','false'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.required','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.size','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.step','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.tip','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.title','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.uid','\"79ccf2d5-ace3-4b91-ae03-cf03c5321c01\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.userCondition','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.warning','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.elements.0.width','100'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.name','\"Content\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.uid','\"2796b2c0-c5a9-47de-9114-d14759427e1b\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.fieldLayouts.336cdee8-f571-4d9a-b648-99b3500ea520.tabs.0.userCondition','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.handle','\"individualArticlePage2\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.hasTitleField','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.icon','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.name','\"Individual Article Page\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.showSlugField','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.showStatusField','true'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.slugTranslationKeyFormat','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.slugTranslationMethod','\"site\"'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.titleFormat','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.titleTranslationKeyFormat','null'),('entryTypes.c309933f-7fb2-44a5-997a-9f0646fbe7e8.titleTranslationMethod','\"site\"'),('meta.__names__.5455e65b-99ce-4a1f-9b53-a78c08edd1fa','\"Section Landing Page\"'),('meta.__names__.8b0eb8fa-5a19-4e68-bd18-dcb0c249f224','\"Entry Level\"'),('meta.__names__.a3f07f14-f1ac-4845-b74f-ed0333754e26','\"A Level Three Entry\"'),('meta.__names__.b3461d75-57e6-4484-8e61-94098383e4fe','\"Structure Section One\"'),('meta.__names__.b9329609-fe03-4562-a9bd-030469642367','\"Section Landing Page\"'),('meta.__names__.be036e7f-651b-41a0-a0b4-09fe4f0ffb68','\"Individual Article Page\"'),('meta.__names__.c309933f-7fb2-44a5-997a-9f0646fbe7e8','\"Individual Article Page\"'),('meta.__names__.f006d34c-9336-4dda-8070-3d78549608e5','\"Structure Section Two\"'),('meta.__names__.fbbb1ae9-e077-4d51-bd76-766c9f985f46','\"Entry Level\"'),('plugins.entry-level.edition','\"standard\"'),('plugins.entry-level.enabled','true'),('plugins.entry-level.schemaVersion','\"1.0.0\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.0','\"b3461d75-57e6-4484-8e61-94098383e4fe\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.0','\"typeHierarchy\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.0.0','\"b9329609-fe03-4562-a9bd-030469642367\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.0.1.__assoc__.0.0','\"parentTypeUid\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.0.1.__assoc__.0.1','\"\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.1.0','\"be036e7f-651b-41a0-a0b4-09fe4f0ffb68\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.1.1.__assoc__.0.0','\"parentTypeUid\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.1.1.__assoc__.0.1','\"b9329609-fe03-4562-a9bd-030469642367\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.2.0','\"a3f07f14-f1ac-4845-b74f-ed0333754e26\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.2.1.__assoc__.0.0','\"parentTypeUid\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.0.1.__assoc__.2.1.__assoc__.0.1','\"be036e7f-651b-41a0-a0b4-09fe4f0ffb68\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.1.0','\"typeOrder\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.1.1.0','\"b9329609-fe03-4562-a9bd-030469642367\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.1.1.1','\"be036e7f-651b-41a0-a0b4-09fe4f0ffb68\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.0.1.__assoc__.1.1.2','\"a3f07f14-f1ac-4845-b74f-ed0333754e26\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.0','\"f006d34c-9336-4dda-8070-3d78549608e5\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.0','\"typeHierarchy\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.0.0','\"5455e65b-99ce-4a1f-9b53-a78c08edd1fa\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.0.1.__assoc__.0.0','\"parentTypeUid\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.0.1.__assoc__.0.1','\"\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.1.0','\"c309933f-7fb2-44a5-997a-9f0646fbe7e8\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.1.1.__assoc__.0.0','\"parentTypeUid\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.0.1.__assoc__.1.1.__assoc__.0.1','\"5455e65b-99ce-4a1f-9b53-a78c08edd1fa\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.1.0','\"typeOrder\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.1.1.0','\"5455e65b-99ce-4a1f-9b53-a78c08edd1fa\"'),('plugins.entry-level.settings.sectionConfig.__assoc__.1.1.__assoc__.1.1.1','\"c309933f-7fb2-44a5-997a-9f0646fbe7e8\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.defaultPlacement','\"end\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.enableVersioning','true'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.entryTypes.0.uid','\"be036e7f-651b-41a0-a0b4-09fe4f0ffb68\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.entryTypes.1.uid','\"b9329609-fe03-4562-a9bd-030469642367\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.entryTypes.2.uid','\"a3f07f14-f1ac-4845-b74f-ed0333754e26\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.handle','\"structureSectionOne\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.maxAuthors','1'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.name','\"Structure Section One\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.previewTargets.0.label','\"Primary entry page\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.previewTargets.0.refresh','\"1\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.previewTargets.0.urlFormat','\"{url}\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.propagationMethod','\"all\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.enabledByDefault','true'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.hasUrls','true'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.template','\"entry-level/_entry.twig\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.uriFormat','\"entry-level/{slug}\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.structure.maxLevels','null'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.structure.uid','\"0c805d86-688d-40e4-9198-de091aefd533\"'),('sections.b3461d75-57e6-4484-8e61-94098383e4fe.type','\"structure\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.defaultPlacement','\"end\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.enableVersioning','true'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.entryTypes.0.uid','\"c309933f-7fb2-44a5-997a-9f0646fbe7e8\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.entryTypes.1.uid','\"5455e65b-99ce-4a1f-9b53-a78c08edd1fa\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.handle','\"structureSectionTwo\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.maxAuthors','1'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.name','\"Structure Section Two\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.previewTargets.0.label','\"Primary entry page\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.previewTargets.0.refresh','\"1\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.previewTargets.0.urlFormat','\"{url}\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.propagationMethod','\"all\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.enabledByDefault','true'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.hasUrls','true'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.template','\"structure-section-two/_entry.twig\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.siteSettings.fbbb1ae9-e077-4d51-bd76-766c9f985f46.uriFormat','\"structure-section-two/{slug}\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.structure.maxLevels','null'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.structure.uid','\"a26a80d5-089b-4dcf-b154-2fc706992d11\"'),('sections.f006d34c-9336-4dda-8070-3d78549608e5.type','\"structure\"'),('siteGroups.8b0eb8fa-5a19-4e68-bd18-dcb0c249f224.name','\"Entry Level\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.handle','\"default\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.hasUrls','true'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.language','\"en-GB\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.name','\"Entry Level\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.primary','true'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.siteGroup','\"8b0eb8fa-5a19-4e68-bd18-dcb0c249f224\"'),('sites.fbbb1ae9-e077-4d51-bd76-766c9f985f46.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Entry Level\"'),('system.schemaVersion','\"5.8.0.3\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,''),(2,4,1,1,''),(3,6,1,1,''),(4,8,1,1,''),(5,10,1,1,''),(6,12,1,1,''),(7,14,1,1,''),(8,16,1,1,''),(9,20,1,1,''),(10,22,1,1,''),(11,24,1,1,''),(12,26,1,1,''),(13,28,1,1,''),(14,30,1,1,''),(15,32,1,1,''),(16,34,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' martin hypha media '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' entry level one '),(2,'title',0,1,' entry level one '),(4,'slug',0,1,' entry level two '),(4,'title',0,1,' entry level two '),(6,'slug',0,1,' entry two '),(6,'title',0,1,' entry two '),(8,'slug',0,1,' test 2 entry '),(8,'title',0,1,' test 2 entry '),(10,'slug',0,1,' test 2 '),(10,'title',0,1,' test 2 '),(12,'slug',0,1,' entry level one '),(12,'title',0,1,' entry level one '),(14,'slug',0,1,' level 2 '),(14,'title',0,1,' level 2 '),(16,'slug',0,1,' level 2 2 '),(16,'title',0,1,' level 2 2 '),(18,'slug',0,1,' temp byefomtdhixkouxotrsdkcfjxrweqikejcde '),(18,'title',0,1,''),(19,'slug',0,1,' temp wfngucpwecwwlteohevwmypuiciqimwqpxer '),(19,'title',0,1,''),(20,'slug',0,1,' entry level '),(20,'title',0,1,' entry level three test '),(22,'slug',0,1,' a new level 4 '),(22,'title',0,1,' a new level 4 '),(24,'slug',0,1,' landing page '),(24,'title',0,1,' landing page '),(26,'slug',0,1,' level 2 '),(26,'title',0,1,' level 2 '),(28,'slug',0,1,' level 3 '),(28,'title',0,1,' level 3 '),(30,'slug',0,1,' level 4 '),(30,'title',0,1,' level 4 '),(32,'slug',0,1,' back to level 2 '),(32,'title',0,1,' back to level 2 '),(34,'slug',0,1,' default level two '),(34,'title',0,1,' default level two '),(36,'slug',0,1,' temp fsywzshvwflkhafvxxzsnbftnhimbqhhcpqr '),(36,'title',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,1,'Structure Section One','structureSectionOne','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-12-05 17:38:23','2025-12-06 11:30:04',NULL,'b3461d75-57e6-4484-8e61-94098383e4fe'),(2,2,'Structure Section Two','structureSectionTwo','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-12-06 11:31:11','2025-12-06 11:31:11',NULL,'f006d34c-9336-4dda-8070-3d78549608e5');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,2,NULL,NULL,NULL),(1,2,1,NULL,NULL,NULL),(1,3,3,NULL,NULL,NULL),(2,5,2,NULL,NULL,NULL),(2,6,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'entry-level/{slug}','entry-level/_entry.twig',1,'2025-12-05 17:38:23','2025-12-05 17:38:23','f0d491df-b42d-486a-aa17-ab661adfc03f'),(2,2,1,1,'structure-section-two/{slug}','structure-section-two/_entry.twig',1,'2025-12-06 11:31:11','2025-12-06 11:31:11','76d87947-1326-49bf-b821-f2ea9295936a');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Entry Level','2025-12-05 16:50:37','2025-12-05 16:50:37',NULL,'8b0eb8fa-5a19-4e68-bd18-dcb0c249f224');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Entry Level','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2025-12-05 16:50:37','2025-12-05 16:50:37',NULL,'fbbb1ae9-e077-4d51-bd76-766c9f985f46');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,20,0,'2025-12-05 17:42:04','2025-12-05 18:33:17','58b43f85-398e-46c2-a50a-6d02d0617748'),(10,1,18,1,2,3,1,'2025-12-05 18:14:39','2025-12-05 18:30:17','6929f61c-abb1-42ff-86ee-7fc3a4142d35'),(11,1,19,1,4,5,1,'2025-12-05 18:15:25','2025-12-05 18:30:17','58ff2971-b4d9-4761-921b-de3a985d630c'),(14,1,24,1,6,17,1,'2025-12-05 18:30:20','2025-12-05 18:33:00','0bf9a461-3ee3-4ea9-9afb-2e156de169b7'),(15,1,26,1,7,12,2,'2025-12-05 18:30:31','2025-12-05 18:31:09','2ad4cde7-e1e5-4222-b7da-208fa743a309'),(16,1,28,1,8,11,3,'2025-12-05 18:30:47','2025-12-05 18:31:09','7735fb74-300c-4633-8801-cc3899c93827'),(17,1,30,1,9,10,4,'2025-12-05 18:31:00','2025-12-05 18:31:09','9ba151c4-e643-481a-9245-893e5d52d77f'),(18,1,32,1,13,14,2,'2025-12-05 18:31:12','2025-12-05 18:31:27','c12144db-db07-4505-9885-c681f5737e41'),(19,1,34,1,15,16,2,'2025-12-05 18:32:49','2025-12-05 18:33:00','d15ece1c-406d-4504-942e-2e06bb727c59'),(20,1,36,1,18,19,1,'2025-12-05 18:33:17','2025-12-05 18:33:17','afda4a31-6df2-4781-afca-f94fb222b1b2');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2025-12-05 17:38:23','2025-12-05 17:38:23',NULL,'0c805d86-688d-40e4-9198-de091aefd533'),(2,NULL,'2025-12-06 11:31:11','2025-12-06 11:31:11',NULL,'a26a80d5-089b-4dcf-b154-2fc706992d11');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en-GB\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'martin@hypha.media','$2y$13$0iFVnuHR6aiaU0b9//bQ/uf1OKvwdApqFAWx5f8JsqOTMuEae7NsK','2025-12-06 11:53:06',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-12-05 16:50:38','2025-12-05 16:50:38','2025-12-06 11:53:06');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-12-05 17:24:58','2025-12-05 17:24:58','4d7cf61a-de9e-414e-9b83-a2667d19224c'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-12-05 17:24:58','2025-12-05 17:24:58','b8240cac-316e-4d9a-9661-a7500c3d9642'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-12-05 17:24:58','2025-12-05 17:24:58','633fe9ae-05dd-4b9b-838b-400e7b0e4a19'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-12-05 17:24:58','2025-12-05 17:24:58','158689d9-330c-4892-b1ea-fb3766f86f92');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06 12:37:36
