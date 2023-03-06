/*
 Navicat Premium Data Transfer

 Source Server         : MariaDB
 Source Server Type    : MariaDB
 Source Server Version : 101002
 Source Host           : localhost:3306
 Source Schema         : sslchecker

 Target Server Type    : MariaDB
 Target Server Version : 101002
 File Encoding         : 65001

 Date: 06/03/2023 11:06:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for domains
-- ----------------------------
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `uuid` char(36) NOT NULL,
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `server_id` bigint(20) DEFAULT NULL,
  `domain` varchar(100) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `force_redirect` tinyint(1) NOT NULL DEFAULT 1,
  `status_code` int(3) DEFAULT NULL,
  `last_check` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_success` timestamp NULL DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `issuer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `domain` (`domain`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `domains_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of domains
-- ----------------------------
BEGIN;
INSERT INTO `domains` VALUES ('a1ec78fb-4470-418f-987d-e7fca9e2e62d', 1, 1, 'acehprov.go.id', 'A+', '', 1, 1, 200, '2023-03-05 14:51:45', '2023-03-05 14:51:43', '2022-05-13 07:00:00', '2023-05-15 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('371042da-3982-4fdd-a19a-1db0e6f9712a', 2, 1, 'acehcms.id', 'A+', '', 1, 1, 200, '2023-03-05 14:54:59', '2023-03-05 14:54:58', '2022-07-01 07:00:00', '2023-07-03 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('aa82c1e0-0f68-4f9e-a54a-173bb6df6afd', 3, 1, 'dayah.id', 'A+', '', 1, 1, 200, '2023-03-05 14:59:11', '2023-03-05 14:59:11', '2022-04-01 07:00:00', '2023-04-03 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('4a376329-a90d-49b4-908a-16be170588df', 4, 1, 'gampong.id', 'A+', '', 1, 1, 200, '2023-03-05 15:03:14', '2023-03-05 15:03:13', '2022-11-15 07:00:00', '2023-11-15 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('e4ee35c3-0583-4ae0-87fd-c7d121b50efb', 5, 1, 'acehbaratdayakab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 15:07:22', '2023-03-05 15:07:21', '2022-06-02 07:00:00', '2023-07-04 06:59:59', 'CN=GeoTrust RSA CA 2018, OU=www.digicert.com, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('899dd99e-e151-4d01-9de1-be2e96a6141a', 6, 1, 'acehbaratkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 20:54:39', '2023-03-05 20:54:38', '2022-12-06 07:00:00', '2024-01-07 06:59:59', 'CN=GeoTrust RSA CA 2018, OU=www.digicert.com, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('15e4d401-f363-4157-9ac8-19bdad427dac', 7, 1, 'acehbesarkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 15:15:02', '2023-03-05 15:15:00', '2022-11-29 07:00:00', '2023-11-30 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('4fc33864-bbcd-4e98-9370-8452ce53c345', 8, 1, 'acehjayakab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 15:18:53', '2023-03-05 15:18:50', '2022-04-12 07:00:00', '2023-04-13 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('ce58d734-fff9-4861-ad3a-0729c09a316b', 9, 1, 'acehselatankab.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:36:53', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('1f78f47b-b712-4bef-b404-b525ff035865', 10, 1, 'acehsingkilkab.go.id', 'B', '', 1, 1, 200, '2023-03-05 20:57:49', '2023-03-05 20:57:48', '2022-09-19 07:00:00', '2023-09-20 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('e5b571dd-95f8-450b-a687-6f071a1e32e5', 11, 1, 'acehtengahkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 21:00:57', '2023-03-05 21:00:55', '2022-09-08 07:00:00', '2023-09-09 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('22586d49-1c71-467d-bc89-1cdc3fc81808', 12, 1, 'acehtenggarakab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 12:50:13', '2023-03-05 12:50:09', '2022-10-26 07:00:00', '2023-10-27 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('08807578-6c12-4830-9d99-43d2e8ca9466', 13, 1, 'simeuluekab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 13:02:23', '2023-03-05 13:02:18', '2022-03-22 07:00:00', '2023-03-23 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
INSERT INTO `domains` VALUES ('8f581991-3e27-43fd-ba48-80ac8a6a8ea9', 14, 1, 'subulussalamkota.go.id', '', '', 1, 0, 200, '2023-03-05 19:53:30', '2023-03-05 19:53:30', '2022-07-01 07:00:00', '2023-07-03 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('31bbe748-80cc-4484-b3b4-2b33e1dfda36', 15, 1, 'naganrayakab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 13:19:07', '2023-03-05 13:19:06', NULL, NULL, '');
INSERT INTO `domains` VALUES ('bb864c35-62f3-4f71-8525-e69affd17692', 16, 1, 'pidiejayakab.go.id', '', 'ip on the server and in the database is not the same', 1, 1, 412, '2023-03-05 13:19:12', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('86fd77f5-9d3f-4e9b-8377-a54bc9a5002d', 17, 1, 'acehutara.go.id', 'A+', '', 1, 1, 200, '2023-03-05 18:48:00', '2023-03-05 18:47:58', '2023-03-03 07:00:00', '2024-03-03 06:59:59', 'CN=GeoTrust Global TLS RSA4096 SHA256 2022 CA1, O=\"DigiCert, Inc.\", C=US');
INSERT INTO `domains` VALUES ('b67af4b1-f4e9-4e61-a701-2b7ae1766902', 18, 1, 'acehtimurkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 18:51:03', '2023-03-05 18:51:02', '2022-08-01 07:00:00', '2023-08-02 06:59:59', 'CN=GeoTrust RSA CA 2018, OU=www.digicert.com, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('c2584a4e-6f79-4257-b434-905f1e039ef1', 19, 1, 'gayolueskab.go.id', 'B', '', 1, 1, 200, '2023-03-05 13:30:12', '2023-03-05 13:30:11', NULL, NULL, '');
INSERT INTO `domains` VALUES ('8e4f9b1f-52cb-4f88-9f49-c4e9a5759223', 20, 1, 'kejari-pidiejaya.go.id', '', 'domain not resolve', 0, 1, 404, '2023-03-05 14:43:51', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('710cf1aa-b158-4fa8-bcf6-1a19ee421452', 21, 1, 'bandaaceh.imigrasi.go.id', '', 'Get \"https://bandaaceh.imigrasi.go.id\": tls: failed to verify certificate: x509: certificate is valid for *.acehcms.id, acehcms.id, not bandaaceh.imigrasi.go.id', 1, 0, 500, '2023-03-05 20:03:57', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('8aab2ee2-6bf1-486d-b7cb-a21f5fe2fd2b', 22, 1, 'bappeda.pidiekab.go.id', '', 'Get \"https://bappeda.pidiekab.go.id\": tls: failed to verify certificate: x509: certificate is valid for *.acehcms.id, acehcms.id, not bappeda.pidiekab.go.id', 1, 0, 500, '2023-03-05 20:07:26', '2023-03-05 19:54:44', '2022-07-01 07:00:00', '2023-07-03 06:59:59', 'CN=DigiCert TLS RSA SHA256 2020 CA1, O=DigiCert Inc, C=US');
INSERT INTO `domains` VALUES ('61cc8aee-b22d-4a8f-a5dd-c42ec03b226d', 23, 1, 'bireuenkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 13:34:21', '2023-03-05 13:34:20', NULL, NULL, '');
INSERT INTO `domains` VALUES ('b3c2a39a-2d74-4b2a-88fa-0a6fcb5a8627', 24, 1, 'kejati-aceh.kejaksaan.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:42:17', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('4cbda65c-ade7-41ae-9257-b3da04f7a52e', 25, 1, 'benermeriahkab.go.id', 'A+', '', 1, 1, 200, '2023-03-05 13:38:16', '2023-03-05 13:38:15', NULL, NULL, '');
INSERT INTO `domains` VALUES ('faf62e41-05b4-4386-9d9c-00031c00ae2a', 26, 1, 'acehtamiangkab.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:42:57', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('a65f1ff9-4fe7-4299-b74c-bf6a682a1b1b', 27, 1, 'lhokseumawekota.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:43:06', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('e5cb0f42-7b83-4293-9b22-f42ba46851e1', 28, 1, 'langsakota.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:43:18', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('5dfa992c-bd7a-4d7d-934c-b4893e4b0069', 29, 1, 'bandaacehkota.go.id', '', 'ip on the server and in the database is not the same', 0, 1, 412, '2023-03-05 14:43:20', NULL, NULL, NULL, '');
INSERT INTO `domains` VALUES ('5d6345f1-0f81-4156-a3b8-5725f65d546e', 30, 1, 'sabangkota.go.id', 'A+', '', 1, 1, 200, '2023-03-05 19:36:23', '2023-03-05 19:36:22', '2022-08-05 07:00:00', '2023-08-05 06:59:59', 'CN=Sectigo RSA Organization Validation Secure Server CA, O=Sectigo Limited, L=Salford, ST=Greater Manchester, C=GB');
COMMIT;

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `uuid` char(36) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `server` varchar(100) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of server
-- ----------------------------
BEGIN;
INSERT INTO `server` VALUES ('b1dd8de4-311e-49e8-96fe-22c5a00606f6', 1, 'AcehCMS Site', '123.108.101.18', 1);
INSERT INTO `server` VALUES ('ce601cf4-cd6a-499b-9e2e-db1c3509506b', 2, 'AcehCMS Manage', '123.108.101.22', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
