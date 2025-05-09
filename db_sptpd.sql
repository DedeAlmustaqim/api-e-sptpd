/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : db_sptpd

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 09/05/2025 11:13:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for laporan_pajak_bulanan
-- ----------------------------
DROP TABLE IF EXISTS `laporan_pajak_bulanan`;
CREATE TABLE `laporan_pajak_bulanan`  (
  `id_laporan` int NOT NULL AUTO_INCREMENT,
  `npwpd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `masa_pajak` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dasar_pengenaan` decimal(15, 2) NULL DEFAULT NULL,
  `tarif_pajak` decimal(5, 2) NULL DEFAULT NULL,
  `pajak_terhutang` decimal(15, 2) NULL DEFAULT NULL,
  `pelaksanaan_kegiatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `keterangan_kegiatan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `bulan` tinyint NULL DEFAULT NULL,
  `tahun` smallint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_laporan`) USING BTREE,
  INDEX `npwpd`(`npwpd` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of laporan_pajak_bulanan
-- ----------------------------
INSERT INTO `laporan_pajak_bulanan` VALUES (1, 'P.1.0000671.000.000', NULL, 10000000.00, NULL, NULL, NULL, NULL, 3, 1, 2025, '2025-05-08 21:47:28');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2025_05_08_130106_add_wp_fields_to_users_table', 2);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'api-token', '01a1a4d38c9c8f757e0a1b5b58bd4b7628e73260b1155968f3affaca0e3010a4', '[\"*\"]', '2025-05-08 12:54:43', NULL, '2025-05-08 12:53:01', '2025-05-08 12:54:43');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 3, 'api-token', 'e186a80660e4dcab6e5d5b391bb7d33af6ccfd04b762cfda14561de15ccf5709', '[\"*\"]', '2025-05-08 14:51:26', NULL, '2025-05-08 13:29:59', '2025-05-08 14:51:26');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 3, 'api-token', '3f04f9f7fc8f937a3fe17429f8e41943144f131b19d9f22f09875da0d22f3e52', '[\"*\"]', NULL, NULL, '2025-05-09 03:55:17', '2025-05-09 03:55:17');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 3, 'api-token', 'c5792316baed6a068d2b47f4237a0ea0c11bb32249e4c9dc04a0f490d0fea1f2', '[\"*\"]', NULL, NULL, '2025-05-09 03:56:22', '2025-05-09 03:56:22');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 3, 'api-token', '7163b55adc9c76e9caa37f7daca58898ce46fc88d9897c17de2fa9852f2aa454', '[\"*\"]', '2025-05-09 03:57:06', NULL, '2025-05-09 03:56:38', '2025-05-09 03:57:06');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 4, 'api-token', '1a26fc106dcf76f126287d8a67f2676e603c8efb667a1a5f979ed8bb4a292001', '[\"*\"]', '2025-05-09 04:05:03', NULL, '2025-05-09 04:01:56', '2025-05-09 04:05:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Fung On Kay', 'fungok@yahoo.com', '2019-08-18 17:21:00', '$2y$10$oOwBznwePeS2qGxgWl5MAONiyuVQDzn0AWith3bKB.pUR2Ue9etjO', 'FDxSh87VVE', '2022-09-11 09:07:29', '2007-12-22 02:43:46');
INSERT INTO `users` VALUES (3, 'Dede Almustaqim', 'dede.almustaqim.dev@gmail.com', '2025-05-08 13:28:41', '$2y$12$iwVLRGCdiaBCxSBKG9OeWucIrUhFrxACa18yLiaEm4daLXfrMoDAy', NULL, '2025-05-08 13:28:18', '2025-05-08 13:28:41');
INSERT INTO `users` VALUES (4, 'Dede Almustaqim', 'pajak.bapenda.bartim@gmail.com', '2025-05-09 04:01:25', '$2y$12$ivyowoUThRL0Zieq8yJTGe0f2oQA4M/bPK42RWmqrpjvHpXTsftiy', NULL, '2025-05-09 03:59:00', '2025-05-09 04:01:25');

-- ----------------------------
-- Table structure for wajib_pajak
-- ----------------------------
DROP TABLE IF EXISTS `wajib_pajak`;
CREATE TABLE `wajib_pajak`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `npwpd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `nama_wajib_pajak` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat_wajib_pajak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `niop` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nama_objek_usaha` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat_objek_usaha` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `klasifikasi_usaha` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wajib_pajak
-- ----------------------------
INSERT INTO `wajib_pajak` VALUES (1, 'P.1.0000671.000.000', 3, 'AHMAD HASAN SAPUTRA', 'TTanah Habang Kanan, Rt. 001, Rw. 000, Desa Luar Daerah, Kec. Luar Daerah, Kab. Barito Timur', '02.00272.110.008', 'WONG SOLO TAMIANG LAYANG', 'Jl.a.yani Tamiang Layang,,samping Pengadilan Tamiang , Rt. 000, Rw. 000, Desa Kelurahan Tamiang Layang , Kec. Dusun Timur', 'Pajak Restoran Dan Sejenisnya');

SET FOREIGN_KEY_CHECKS = 1;
