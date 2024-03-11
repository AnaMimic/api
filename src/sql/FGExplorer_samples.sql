-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: FelineGenomeExplorer
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Breeds`
--

DROP TABLE IF EXISTS `Breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Breeds` (
  `breedID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`breedID`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Breeds`
--

LOCK TABLES `Breeds` WRITE;
/*!40000 ALTER TABLE `Breeds` DISABLE KEYS */;
INSERT INTO `Breeds` VALUES (201,'Exotic Shorthair','Quiet, lovely, warm pure, sweet, not hypoallergenic','United States'),(202,'British Shorthair','Easy-going, family-friendly, loyal, patient, not hypoallergenic','United Kingdom'),(203,'Persian','Gentle, sensitive, quiet, with a special ability, not hypoallergenic','Iran (Persia)'),(204,'Maine Coon','Gentle, intelligent, independent, not hypoallergenic','United States'),(205,'American Shorthair','Active, curious, easy-going, playful, not hypoallergenic','United States'),(206,'Devon Rex','Loyal, playful, social, hypoallergenic','United Kingdom'),(207,'Sphynx','Gentle, quiet, friendly, hypoallergenic','Canada'),(208,'Scottish Fold','Affectionate, intelligent, loyal, playful, not hypoallergenic','United Kingdom'),(209,'Abyssinian','Energetic, independent, intelligent, gentle, not hypoallergenic','Egypt'),(210,'Oriental','Curious, intelligent, social, playful, hypoallergenic','United States'),(211,'Siamese','Lively, active, smart, clever, hypoallergenic','Thailand'),(212,'Norwegian Forest Cat','Curious, intelligent, loving, playful, not hypoallergenic','Norway'),(213,'Cornish Rex','Playful, affectionate, curious, intelligent, hypoallergenic','Cornwall, England'),(214,'Bengal','Agile, family-oriented, inquisitive, lively, hypoallergenic','United States'),(215,'Russian Blue','Easy-going, intelligent, loyal, playful, hypoallergenic','Russia'),(216,'Siberian','Agile, intelligent, loyal, playful, hypoallergenic','Russia'),(217,'Burmese','Hypoallergenic, specific traits and origin not provided','Not provided');
/*!40000 ALTER TABLE `Breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExternalSource`
--

DROP TABLE IF EXISTS `ExternalSource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExternalSource` (
  `resourceID` int NOT NULL AUTO_INCREMENT,
  `geneID` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`resourceID`),
  KEY `geneID` (`geneID`),
  CONSTRAINT `externalsource_ibfk_1` FOREIGN KEY (`geneID`) REFERENCES `Genes` (`geneID`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExternalSource`
--

LOCK TABLES `ExternalSource` WRITE;
/*!40000 ALTER TABLE `ExternalSource` DISABLE KEYS */;
INSERT INTO `ExternalSource` VALUES (301,'LOC102900601','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC102900601; transcript_id ; db_xref GeneID:102900601; gbkey Gene; gene LOC102900601; gene_biotype pseudogene; pseudo true; '),(302,'LOC109497283','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109497283; transcript_id ; db_xref GeneID:109497283; gbkey Gene; gene LOC109497283; gene_biotype lncRNA; '),(303,'ZFP62','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id ZFP62; transcript_id ; db_xref GeneID:101082288; db_xref VGNC:VGNC:67232; gbkey Gene; gene ZFP62; gene_biotype protein_coding; '),(304,'LOC123385737','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC123385737; transcript_id ; db_xref GeneID:123385737; gbkey Gene; gene LOC123385737; gene_biotype pseudogene; pseudo true; '),(305,'MAST4','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id MAST4; transcript_id ; db_xref GeneID:101087553; db_xref VGNC:VGNC:102250; gbkey Gene; gene MAST4; gene_biotype protein_coding; '),(306,'LOC111561758','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111561758; transcript_id ; db_xref GeneID:111561758; gbkey Gene; gene LOC111561758; gene_biotype pseudogene; pseudo true; '),(307,'PDE6A','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id PDE6A; transcript_id ; db_xref GeneID:101085100; db_xref VGNC:VGNC:68761; gbkey Gene; gene PDE6A; gene_biotype protein_coding; '),(308,'LOC111557052','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111557052; transcript_id ; db_xref GeneID:111557052; gbkey Gene; gene LOC111557052; gene_biotype snRNA; '),(309,'LOC123382597','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC123382597; transcript_id ; db_xref GeneID:123382597; gbkey Gene; gene LOC123382597; gene_biotype lncRNA; '),(310,'USE1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id USE1; transcript_id ; db_xref GeneID:101095556; db_xref VGNC:VGNC:66859; gbkey Gene; gene USE1; gene_biotype protein_coding; '),(311,'LOC111559582','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111559582; transcript_id ; db_xref GeneID:111559582; gbkey Gene; gene LOC111559582; gene_biotype snRNA; '),(312,'ANKRD7','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id ANKRD7; transcript_id ; db_xref GeneID:101087910; gbkey Gene; gene ANKRD7; gene_biotype protein_coding; '),(313,'LOC111559949','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111559949; transcript_id ; db_xref GeneID:111559949; gbkey Gene; gene LOC111559949; gene_biotype snoRNA; '),(314,'LOC109499344','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109499344; transcript_id ; db_xref GeneID:109499344; gbkey Gene; gene LOC109499344; gene_biotype pseudogene; pseudo true; '),(315,'NKX3-1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id NKX3-1; transcript_id ; db_xref GeneID:105260486; db_xref VGNC:VGNC:78533; gbkey Gene; gene NKX3-1; gene_biotype protein_coding; '),(316,'CPE','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id CPE; transcript_id ; db_xref GeneID:101080963; db_xref VGNC:VGNC:61120; gbkey Gene; gene CPE; gene_biotype protein_coding; '),(317,'PLA2G12A','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id PLA2G12A; transcript_id ; db_xref GeneID:768261; db_xref VGNC:VGNC:64197; gbkey Gene; gene PLA2G12A; gene_biotype protein_coding; '),(318,'LOC101098790','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC101098790; transcript_id ; db_xref GeneID:101098790; gbkey Gene; gene LOC101098790; gene_biotype pseudogene; pseudo true; '),(319,'LOC105260561','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC105260561; transcript_id ; db_xref GeneID:105260561; gbkey Gene; gene LOC105260561; gene_biotype pseudogene; pseudo true; '),(320,'GLO1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id GLO1; transcript_id ; db_xref GeneID:101085123; db_xref VGNC:VGNC:62584; gbkey Gene; gene GLO1; gene_biotype protein_coding; '),(321,'LOC105260579','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC105260579; transcript_id ; db_xref GeneID:105260579; gbkey Gene; gene LOC105260579; gene_biotype protein_coding; '),(322,'CB2H6orf120','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id CB2H6orf120; transcript_id ; db_xref GeneID:101082913; db_xref VGNC:VGNC:60405; gbkey Gene; gene CB2H6orf120; gene_biotype protein_coding; '),(323,'LOC111561114','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111561114; transcript_id ; db_xref GeneID:111561114; gbkey Gene; gene LOC111561114; gene_biotype snoRNA; '),(324,'RAB8B','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RAB8B; transcript_id ; db_xref GeneID:101090774; db_xref VGNC:VGNC:97595; gbkey Gene; gene RAB8B; gene_biotype protein_coding; '),(325,'TBPL2','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id TBPL2; transcript_id ; db_xref GeneID:101093111; gbkey Gene; gene TBPL2; gene_biotype protein_coding; '),(326,'KIAA0586','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id KIAA0586; transcript_id ; db_xref GeneID:101097900; db_xref VGNC:VGNC:63085; gbkey Gene; gene KIAA0586; gene_biotype protein_coding; '),(327,'CUL2','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id CUL2; transcript_id ; db_xref GeneID:101094429; db_xref VGNC:VGNC:61283; gbkey Gene; gene CUL2; gene_biotype protein_coding; '),(328,'SLC2A3','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id SLC2A3; transcript_id ; db_xref GeneID:101096740; gbkey Gene; gene SLC2A3; gene_biotype protein_coding; '),(329,'LOC109501695','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109501695; transcript_id ; db_xref GeneID:109501695; gbkey Gene; gene LOC109501695; gene_biotype lncRNA; '),(330,'RAB42','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RAB42; transcript_id ; db_xref GeneID:101091885; gbkey Gene; gene RAB42; gene_biotype protein_coding; '),(331,'MAN1A2','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id MAN1A2; transcript_id ; db_xref GeneID:101086830; db_xref VGNC:VGNC:68145; gbkey Gene; gene MAN1A2; gene_biotype protein_coding; '),(332,'COL8A1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id COL8A1; transcript_id ; db_xref GeneID:101098078; db_xref VGNC:VGNC:61070; gbkey Gene; gene COL8A1; gene_biotype protein_coding; '),(333,'LOC111556554','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111556554; transcript_id ; db_xref GeneID:111556554; gbkey Gene; gene LOC111556554; gene_biotype protein_coding; '),(334,'LOC123380344','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC123380344; transcript_id ; db_xref GeneID:123380344; gbkey Gene; gene LOC123380344; gene_biotype lncRNA; '),(335,'LOC109491878','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109491878; transcript_id ; db_xref GeneID:109491878; gbkey Gene; gene LOC109491878; gene_biotype lncRNA; '),(336,'ADAMTS15','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id ADAMTS15; transcript_id ; db_xref GeneID:101093887; db_xref VGNC:VGNC:59589; gbkey Gene; gene ADAMTS15; gene_biotype protein_coding; '),(337,'DNAJB13','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id DNAJB13; transcript_id ; db_xref GeneID:101096099; gbkey Gene; gene DNAJB13; gene_biotype protein_coding; '),(338,'LOC109491971','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109491971; transcript_id ; db_xref GeneID:109491971; gbkey Gene; gene LOC109491971; gene_biotype pseudogene; pseudo true; '),(339,'RHOD','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RHOD; transcript_id ; db_xref GeneID:101100837; db_xref VGNC:VGNC:104322; gbkey Gene; gene RHOD; gene_biotype protein_coding; '),(340,'RIC8A','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RIC8A; transcript_id ; db_xref GeneID:101080576; db_xref VGNC:VGNC:64624; gbkey Gene; gene RIC8A; gene_biotype protein_coding; '),(341,'LOC111557183','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111557183; transcript_id ; db_xref GeneID:111557183; gbkey Gene; gene LOC111557183; gene_biotype snoRNA; '),(342,'CXCL12','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id CXCL12; transcript_id ; db_xref GeneID:493806; description C-X-C motif chemokine ligand 12; gbkey Gene; gene CXCL12; gene_biotype protein_coding; gene_synonym SDF-1; '),(343,'RPH3A','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RPH3A; transcript_id ; db_xref GeneID:101086009; db_xref VGNC:VGNC:64735; gbkey Gene; gene RPH3A; gene_biotype protein_coding; '),(344,'RPA1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id RPA1; transcript_id ; db_xref GeneID:101084325; db_xref VGNC:VGNC:64726; gbkey Gene; gene RPA1; gene_biotype protein_coding; '),(345,'LOC101093218','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC101093218; transcript_id ; db_xref GeneID:101093218; gbkey Gene; gene LOC101093218; gene_biotype pseudogene; pseudo true; '),(346,'LOC111558187','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111558187; transcript_id ; db_xref GeneID:111558187; gbkey Gene; gene LOC111558187; gene_biotype snRNA; '),(347,'LOC109494816','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC109494816; transcript_id ; db_xref GeneID:109494816; gbkey Gene; gene LOC109494816; gene_biotype lncRNA; '),(348,'LAX1','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LAX1; transcript_id ; db_xref GeneID:101082716; db_xref VGNC:VGNC:107891; gbkey Gene; gene LAX1; gene_biotype protein_coding; '),(349,'GPR173','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id GPR173; transcript_id ; db_xref GeneID:101089675; db_xref VGNC:VGNC:62687; gbkey Gene; gene GPR173; gene_biotype protein_coding; '),(350,'LOC111558850','https://www.ncbi.nlm.nih.gov/datasets/genome/GCF_018350175.1/','gene_id LOC111558850; transcript_id ; db_xref GeneID:111558850; gbkey Gene; gene LOC111558850; gene_biotype snoRNA; ');
/*!40000 ALTER TABLE `ExternalSource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GeneBreed`
--

DROP TABLE IF EXISTS `GeneBreed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeneBreed` (
  `geneID` varchar(255) NOT NULL,
  `breedID` int NOT NULL,
  PRIMARY KEY (`geneID`,`breedID`),
  KEY `breedID` (`breedID`),
  CONSTRAINT `genebreed_ibfk_1` FOREIGN KEY (`geneID`) REFERENCES `Genes` (`geneID`),
  CONSTRAINT `genebreed_ibfk_2` FOREIGN KEY (`breedID`) REFERENCES `Breeds` (`breedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GeneBreed`
--

LOCK TABLES `GeneBreed` WRITE;
/*!40000 ALTER TABLE `GeneBreed` DISABLE KEYS */;
INSERT INTO `GeneBreed` VALUES ('LOC111557052',201),('PDE6A',201),('ADAMTS15',202),('LOC109491878',202),('LOC111561114',202),('MAST4',202),('LOC105260561',203),('LOC109494816',203),('LOC111559582',203),('LOC123385737',203),('SLC2A3',203),('COL8A1',204),('CXCL12',204),('RAB8B',204),('TBPL2',204),('CB2H6orf120',205),('LOC123380344',205),('ZFP62',206),('GLO1',207),('LOC111556554',207),('LOC111558850',207),('LOC123382597',207),('USE1',207),('LOC105260579',208),('LOC109499344',208),('LOC111557183',208),('LOC111561758',208),('RIC8A',208),('NKX3-1',209),('RPA1',209),('LOC102900601',210),('RHOD',210),('LOC111559949',211),('LAX1',212),('LOC101093218',212),('LOC101098790',212),('MAN1A2',212),('PLA2G12A',213),('CPE',214),('CUL2',215),('GPR173',215),('LOC109491971',215),('LOC109497283',215),('LOC109501695',215),('DNAJB13',216),('LOC111558187',216),('RAB42',216),('ANKRD7',217),('KIAA0586',217),('RPH3A',217);
/*!40000 ALTER TABLE `GeneBreed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genes`
--

DROP TABLE IF EXISTS `Genes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Genes` (
  `geneID` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `chromosomal_location` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`geneID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genes`
--

LOCK TABLES `Genes` WRITE;
/*!40000 ALTER TABLE `Genes` DISABLE KEYS */;
INSERT INTO `Genes` VALUES ('ADAMTS15','D1','27108518:27137553','gene_id ADAMTS15; transcript_id ; db_xref GeneID:101093887; db_xref VGNC:VGNC:59589; gbkey Gene; gene ADAMTS15; gene_biotype protein_coding; '),('ANKRD7','A2','136403086:136420675','gene_id ANKRD7; transcript_id ; db_xref GeneID:101087910; gbkey Gene; gene ANKRD7; gene_biotype protein_coding; '),('CB2H6orf120','B2','151186334:151187554','gene_id CB2H6orf120; transcript_id ; db_xref GeneID:101082913; db_xref VGNC:VGNC:60405; gbkey Gene; gene CB2H6orf120; gene_biotype protein_coding; '),('COL8A1','C2','47394044:47546975','gene_id COL8A1; transcript_id ; db_xref GeneID:101098078; db_xref VGNC:VGNC:61070; gbkey Gene; gene COL8A1; gene_biotype protein_coding; '),('CPE','B1','62604811:62725147','gene_id CPE; transcript_id ; db_xref GeneID:101080963; db_xref VGNC:VGNC:61120; gbkey Gene; gene CPE; gene_biotype protein_coding; '),('CUL2','B4','32115088:32270927','gene_id CUL2; transcript_id ; db_xref GeneID:101094429; db_xref VGNC:VGNC:61283; gbkey Gene; gene CUL2; gene_biotype protein_coding; '),('CXCL12','D2','48733367:48745201','gene_id CXCL12; transcript_id ; db_xref GeneID:493806; description C-X-C motif chemokine ligand 12; gbkey Gene; gene CXCL12; gene_biotype protein_coding; gene_synonym SDF-1; '),('DNAJB13','D1','58010371:58024668','gene_id DNAJB13; transcript_id ; db_xref GeneID:101096099; gbkey Gene; gene DNAJB13; gene_biotype protein_coding; '),('GLO1','B2','37009502:37046586','gene_id GLO1; transcript_id ; db_xref GeneID:101085123; db_xref VGNC:VGNC:62584; gbkey Gene; gene GLO1; gene_biotype protein_coding; '),('GPR173','X','45858858:45883801','gene_id GPR173; transcript_id ; db_xref GeneID:101089675; db_xref VGNC:VGNC:62687; gbkey Gene; gene GPR173; gene_biotype protein_coding; '),('KIAA0586','B3','105203184:105317233','gene_id KIAA0586; transcript_id ; db_xref GeneID:101097900; db_xref VGNC:VGNC:63085; gbkey Gene; gene KIAA0586; gene_biotype protein_coding; '),('LAX1','F1','42055184:42065443','gene_id LAX1; transcript_id ; db_xref GeneID:101082716; db_xref VGNC:VGNC:107891; gbkey Gene; gene LAX1; gene_biotype protein_coding; '),('LOC101093218','E1','17549090:17551650','gene_id LOC101093218; transcript_id ; db_xref GeneID:101093218; gbkey Gene; gene LOC101093218; gene_biotype pseudogene; pseudo true; '),('LOC101098790','B1','149052246:149077226','gene_id LOC101098790; transcript_id ; db_xref GeneID:101098790; gbkey Gene; gene LOC101098790; gene_biotype pseudogene; pseudo true; '),('LOC102900601','A1','9568394:9572001','gene_id LOC102900601; transcript_id ; db_xref GeneID:102900601; gbkey Gene; gene LOC102900601; gene_biotype pseudogene; pseudo true; '),('LOC105260561','B2','28400365:28432935','gene_id LOC105260561; transcript_id ; db_xref GeneID:105260561; gbkey Gene; gene LOC105260561; gene_biotype pseudogene; pseudo true; '),('LOC105260579','B2','50675639:50681078','gene_id LOC105260579; transcript_id ; db_xref GeneID:105260579; gbkey Gene; gene LOC105260579; gene_biotype protein_coding; '),('LOC109491878','D1','23821688:23835332','gene_id LOC109491878; transcript_id ; db_xref GeneID:109491878; gbkey Gene; gene LOC109491878; gene_biotype lncRNA; '),('LOC109491971','D1','59170447:59171672','gene_id LOC109491971; transcript_id ; db_xref GeneID:109491971; gbkey Gene; gene LOC109491971; gene_biotype pseudogene; pseudo true; '),('LOC109494816','E2','18740980:18747942','gene_id LOC109494816; transcript_id ; db_xref GeneID:109494816; gbkey Gene; gene LOC109494816; gene_biotype lncRNA; '),('LOC109497283','A1','10354762:10357491','gene_id LOC109497283; transcript_id ; db_xref GeneID:109497283; gbkey Gene; gene LOC109497283; gene_biotype lncRNA; '),('LOC109499344','B1','31113867:31115258','gene_id LOC109499344; transcript_id ; db_xref GeneID:109499344; gbkey Gene; gene LOC109499344; gene_biotype pseudogene; pseudo true; '),('LOC109501695','B4','107162530:107166003','gene_id LOC109501695; transcript_id ; db_xref GeneID:109501695; gbkey Gene; gene LOC109501695; gene_biotype lncRNA; '),('LOC111556554','D1','6304925:6392868','gene_id LOC111556554; transcript_id ; db_xref GeneID:111556554; gbkey Gene; gene LOC111556554; gene_biotype protein_coding; '),('LOC111557052','A1','208212576:208212771','gene_id LOC111557052; transcript_id ; db_xref GeneID:111557052; gbkey Gene; gene LOC111557052; gene_biotype snRNA; '),('LOC111557183','D2','47670366:47670569','gene_id LOC111557183; transcript_id ; db_xref GeneID:111557183; gbkey Gene; gene LOC111557183; gene_biotype snoRNA; '),('LOC111558187','E2','8638545:8638648','gene_id LOC111558187; transcript_id ; db_xref GeneID:111558187; gbkey Gene; gene LOC111558187; gene_biotype snRNA; '),('LOC111558850','X','126260285:126260417','gene_id LOC111558850; transcript_id ; db_xref GeneID:111558850; gbkey Gene; gene LOC111558850; gene_biotype snoRNA; '),('LOC111559582','A2','118995068:118995174','gene_id LOC111559582; transcript_id ; db_xref GeneID:111559582; gbkey Gene; gene LOC111559582; gene_biotype snRNA; '),('LOC111559949','A3','21305702:21305834','gene_id LOC111559949; transcript_id ; db_xref GeneID:111559949; gbkey Gene; gene LOC111559949; gene_biotype snoRNA; '),('LOC111561114','B3','24155444:24155524','gene_id LOC111561114; transcript_id ; db_xref GeneID:111561114; gbkey Gene; gene LOC111561114; gene_biotype snoRNA; '),('LOC111561758','A1','163466001:163470271','gene_id LOC111561758; transcript_id ; db_xref GeneID:111561758; gbkey Gene; gene LOC111561758; gene_biotype pseudogene; pseudo true; '),('LOC123380344','D1','13691335:13702624','gene_id LOC123380344; transcript_id ; db_xref GeneID:123380344; gbkey Gene; gene LOC123380344; gene_biotype lncRNA; '),('LOC123382597','A2','12752619:12757831','gene_id LOC123382597; transcript_id ; db_xref GeneID:123382597; gbkey Gene; gene LOC123382597; gene_biotype lncRNA; '),('LOC123385737','A1','107407965:107410284','gene_id LOC123385737; transcript_id ; db_xref GeneID:123385737; gbkey Gene; gene LOC123385737; gene_biotype pseudogene; pseudo true; '),('MAN1A2','C1','100329974:100518958','gene_id MAN1A2; transcript_id ; db_xref GeneID:101086830; db_xref VGNC:VGNC:68145; gbkey Gene; gene MAN1A2; gene_biotype protein_coding; '),('MAST4','A1','133377283:133942776','gene_id MAST4; transcript_id ; db_xref GeneID:101087553; db_xref VGNC:VGNC:102250; gbkey Gene; gene MAST4; gene_biotype protein_coding; '),('NKX3-1','B1','34556280:34560679','gene_id NKX3-1; transcript_id ; db_xref GeneID:105260486; db_xref VGNC:VGNC:78533; gbkey Gene; gene NKX3-1; gene_biotype protein_coding; '),('PDE6A','A1','196586086:196648405','gene_id PDE6A; transcript_id ; db_xref GeneID:101085100; db_xref VGNC:VGNC:68761; gbkey Gene; gene PDE6A; gene_biotype protein_coding; '),('PLA2G12A','B1','113277206:113319160','gene_id PLA2G12A; transcript_id ; db_xref GeneID:768261; db_xref VGNC:VGNC:64197; gbkey Gene; gene PLA2G12A; gene_biotype protein_coding; '),('RAB42','C1','21462047:21463846','gene_id RAB42; transcript_id ; db_xref GeneID:101091885; gbkey Gene; gene RAB42; gene_biotype protein_coding; '),('RAB8B','B3','41669243:41755490','gene_id RAB8B; transcript_id ; db_xref GeneID:101090774; db_xref VGNC:VGNC:97595; gbkey Gene; gene RAB8B; gene_biotype protein_coding; '),('RHOD','D1','109767766:109777002','gene_id RHOD; transcript_id ; db_xref GeneID:101100837; db_xref VGNC:VGNC:104322; gbkey Gene; gene RHOD; gene_biotype protein_coding; '),('RIC8A','D1','115335467:115342686','gene_id RIC8A; transcript_id ; db_xref GeneID:101080576; db_xref VGNC:VGNC:64624; gbkey Gene; gene RIC8A; gene_biotype protein_coding; '),('RPA1','E1','14957988:15030606','gene_id RPA1; transcript_id ; db_xref GeneID:101084325; db_xref VGNC:VGNC:64726; gbkey Gene; gene RPA1; gene_biotype protein_coding; '),('RPH3A','D3','10269269:10547813','gene_id RPH3A; transcript_id ; db_xref GeneID:101086009; db_xref VGNC:VGNC:64735; gbkey Gene; gene RPH3A; gene_biotype protein_coding; '),('SLC2A3','B4','42925936:43015456','gene_id SLC2A3; transcript_id ; db_xref GeneID:101096740; gbkey Gene; gene SLC2A3; gene_biotype protein_coding; '),('TBPL2','B3','102547268:102579566','gene_id TBPL2; transcript_id ; db_xref GeneID:101093111; gbkey Gene; gene TBPL2; gene_biotype protein_coding; '),('USE1','A2','12862260:12865180','gene_id USE1; transcript_id ; db_xref GeneID:101095556; db_xref VGNC:VGNC:66859; gbkey Gene; gene USE1; gene_biotype protein_coding; '),('ZFP62','A1','89085004:89099419','gene_id ZFP62; transcript_id ; db_xref GeneID:101082288; db_xref VGNC:VGNC:67232; gbkey Gene; gene ZFP62; gene_biotype protein_coding; ');
/*!40000 ALTER TABLE `Genes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mutations`
--

DROP TABLE IF EXISTS `Mutations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mutations` (
  `mutationID` int NOT NULL AUTO_INCREMENT,
  `geneID` varchar(255) DEFAULT NULL,
  `description` text,
  `effect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mutationID`),
  KEY `geneID` (`geneID`),
  CONSTRAINT `mutations_ibfk_1` FOREIGN KEY (`geneID`) REFERENCES `Genes` (`geneID`)
) ENGINE=InnoDB AUTO_INCREMENT=999160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mutations`
--

LOCK TABLES `Mutations` WRITE;
/*!40000 ALTER TABLE `Mutations` DISABLE KEYS */;
INSERT INTO `Mutations` VALUES (164820,'LOC111561758','Sample mutation 1 for gene A1','Harmful'),(168148,'LOC105260579','Sample mutation 1 for gene B2','Harmful'),(206530,'LOC111561114','Sample mutation 1 for gene B3','Harmful'),(222096,'GPR173','Sample mutation 2 for gene X','Beneficial'),(222409,'LAX1','Sample mutation 2 for gene F1','Beneficial'),(229312,'LOC109491971','Sample mutation 1 for gene D1','Neutral'),(229981,'LOC109499344','Sample mutation 1 for gene B1','Neutral'),(236330,'DNAJB13','Sample mutation 1 for gene D1','Neutral'),(237337,'LOC123385737','Sample mutation 1 for gene A1','Neutral'),(256730,'LOC111559949','Sample mutation 1 for gene A3','Neutral'),(275203,'MAST4','Sample mutation 2 for gene A1','Neutral'),(284064,'RPA1','Sample mutation 2 for gene E1','Beneficial'),(302283,'CUL2','Sample mutation 1 for gene B4','Harmful'),(318126,'LAX1','Sample mutation 1 for gene F1','Harmful'),(339931,'LOC105260561','Sample mutation 2 for gene B2','Harmful'),(400804,'LOC109491971','Sample mutation 2 for gene D1','Harmful'),(401648,'DNAJB13','Sample mutation 2 for gene D1','Neutral'),(402918,'LOC109491878','Sample mutation 2 for gene D1','Beneficial'),(431236,'PLA2G12A','Sample mutation 1 for gene B1','Neutral'),(441097,'TBPL2','Sample mutation 1 for gene B3','Harmful'),(449457,'LOC105260561','Sample mutation 1 for gene B2','Beneficial'),(453531,'LOC109501695','Sample mutation 1 for gene B4','Beneficial'),(465838,'LOC102900601','Sample mutation 2 for gene A1','Neutral'),(476896,'LOC109491878','Sample mutation 1 for gene D1','Beneficial'),(484681,'LOC111559949','Sample mutation 2 for gene A3','Neutral'),(521909,'USE1','Sample mutation 1 for gene A2','Beneficial'),(559773,'RAB8B','Sample mutation 1 for gene B3','Harmful'),(572525,'RPA1','Sample mutation 1 for gene E1','Neutral'),(589570,'CXCL12','Sample mutation 2 for gene D2','Harmful'),(591234,'RPH3A','Sample mutation 2 for gene D3','Beneficial'),(621430,'LOC123385737','Sample mutation 2 for gene A1','Neutral'),(635822,'SLC2A3','Sample mutation 1 for gene B4','Harmful'),(661353,'CUL2','Sample mutation 2 for gene B4','Harmful'),(665894,'PLA2G12A','Sample mutation 2 for gene B1','Beneficial'),(672843,'CB2H6orf120','Sample mutation 2 for gene B2','Beneficial'),(679879,'LOC109501695','Sample mutation 2 for gene B4','Beneficial'),(691723,'NKX3-1','Sample mutation 1 for gene B1','Neutral'),(701661,'CXCL12','Sample mutation 1 for gene D2','Beneficial'),(707086,'MAN1A2','Sample mutation 1 for gene C1','Beneficial'),(715270,'LOC111558187','Sample mutation 1 for gene E2','Neutral'),(723094,'LOC101093218','Sample mutation 1 for gene E1','Neutral'),(771155,'LOC102900601','Sample mutation 1 for gene A1','Beneficial'),(778843,'CB2H6orf120','Sample mutation 1 for gene B2','Neutral'),(798361,'GLO1','Sample mutation 1 for gene B2','Beneficial'),(807611,'RHOD','Sample mutation 2 for gene D1','Neutral'),(819064,'COL8A1','Sample mutation 1 for gene C2','Beneficial'),(835716,'LOC111558850','Sample mutation 1 for gene X','Neutral'),(869598,'GPR173','Sample mutation 1 for gene X','Neutral'),(876997,'PDE6A','Sample mutation 1 for gene A1','Harmful'),(922352,'LOC111561114','Sample mutation 2 for gene B3','Harmful'),(938688,'LOC111557183','Sample mutation 1 for gene D2','Neutral'),(950937,'RHOD','Sample mutation 1 for gene D1','Beneficial'),(994498,'RPH3A','Sample mutation 1 for gene D3','Beneficial'),(999159,'MAST4','Sample mutation 1 for gene A1','Beneficial');
/*!40000 ALTER TABLE `Mutations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Search`
--

DROP TABLE IF EXISTS `Search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Search` (
  `searchID` int NOT NULL AUTO_INCREMENT,
  `userID` int DEFAULT NULL,
  `search_date` timestamp NULL DEFAULT NULL,
  `searchparameters` text,
  PRIMARY KEY (`searchID`),
  KEY `userID` (`userID`),
  CONSTRAINT `search_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `UserProfile` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Search`
--

LOCK TABLES `Search` WRITE;
/*!40000 ALTER TABLE `Search` DISABLE KEYS */;
INSERT INTO `Search` VALUES (101,1,'2024-01-13 19:42:00','gene X'),(102,2,'2024-02-27 13:30:00','gene Y');
/*!40000 ALTER TABLE `Search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProfile`
--

DROP TABLE IF EXISTS `UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserProfile` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL UNIQUE,
  `email` varchar(255) NOT NULL,
  `pswd` char(255) NOT NULL,
  `last_login` time DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfile`
-- $2y$10$ewkDcusmwZEQUh7hGZrJvepkEt0.9N/c.JX73nk7C9ty85aaDHi/a -> your_password
--

LOCK TABLES `UserProfile` WRITE;
/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
INSERT INTO `UserProfile` VALUES (1,'JaneDoe','jane.doe@example.com','$2y$10$ewkDcusmwZEQUh7hGZrJvepkEt0.9N/c.JX73nk7C9ty85aaDHi/a','15:45:00'),(2,'JohnSmith','john.smith@example.com','$2y$10$ewkDcusmwZEQUh7hGZrJvepkEt0.9N/c.JX73nk7C9ty85aaDHi/a','09:30:00');
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27 21:11:37
