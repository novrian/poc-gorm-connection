CREATE DATABASE bollywood;

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(100) NOT NULL,
  `province_code` varchar(3) NOT NULL,
  `area_tab` int(11) NOT NULL DEFAULT '0',
  `rdpprovince_id` int(11) DEFAULT NULL,
  `p_id` int(11) NOT NULL DEFAULT '0',
  `modifiedDate` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `ended_date` datetime DEFAULT '3014-12-31 23:59:59',
  PRIMARY KEY (`province_id`),
  KEY `province_name` (`province_name`),
  KEY `province_code` (`province_code`),
  KEY `province_ie1` (`modifiedDate`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;

INSERT INTO bollywood.province (province_name,province_code,area_tab,rdpprovince_id,p_id,modifiedDate,ended_date) VALUES
	 ('DKI Jakarta','JKT',1,5,31,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Jawa Barat','JWR',3,20,32,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Banten','BNT',3,5,36,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Bali','BAL',2,13,51,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Kepulauan Bangka Belitung','KBB',0,19,19,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Bengkulu','BGK',0,9,17,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Gorontalo','GOR',0,31,75,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Papua Barat','PAB',0,38,92,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Jambi','JMB',0,18,15,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59'),
	 ('Jawa Tengah','JWT',0,22,33,'2019-03-19 11:32:10.796000000','3014-12-31 23:59:59');
INSERT INTO bollywood.province (province_name,province_code,area_tab,rdpprovince_id,p_id,modifiedDate,ended_date) VALUES
	 ('Jawa Timur','JAT',4,24,35,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kalimantan Barat','KLB',0,25,61,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kalimantan Selatan','KLS',0,27,63,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kalimantan Tengah','KTH',0,26,62,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kalimantan Timur','KLT',0,29,64,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kepulauan Riau','RIK',0,17,14,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Lampung','LMP',0,42,18,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Maluku','MLK',0,36,81,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Maluku Utara','MLU',0,37,82,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Aceh','ACE',0,15,11,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59');
INSERT INTO bollywood.province (province_name,province_code,area_tab,rdpprovince_id,p_id,modifiedDate,ended_date) VALUES
	 ('Nusa Tenggara Barat','NTB',0,40,52,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Nusa Tenggara Timur','NTT',0,41,53,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Papua','PAP',0,39,91,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Riau','RIA',0,14,14,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sulawesi Selatan','SLS',0,34,73,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sulawesi Tengah','SWT',0,32,72,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sulawesi Tenggara','SLT',0,33,74,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sulawesi Utara','SLU',0,30,71,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sumatera Barat','SMB',0,2,13,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sumatera Selatan','SSL',0,4,16,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59');
INSERT INTO bollywood.province (province_name,province_code,area_tab,rdpprovince_id,p_id,modifiedDate,ended_date) VALUES
	 ('Sumatera Utara','SUT',0,1,12,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Daerah Istimewa Yogyakarta','DIY',0,23,34,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Sulawesi Barat','SLB',0,35,76,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Kalimantan Utara','KLU',0,NULL,65,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59'),
	 ('Others','OTR',2,NULL,0,'2019-03-05 11:12:33.790000000','3014-12-31 23:59:59');
	
CREATE USER 'main'@'%' IDENTIFIED BY 'main';
CREATE USER 'secondary'@'%' IDENTIFIED BY 'secondary';
GRANT ALL PRIVILEGES ON bollywood.* TO 'main'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON bollywood.* TO 'secondary'@'%' WITH GRANT OPTION;
