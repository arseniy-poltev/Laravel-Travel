/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100314
 Source Host           : localhost:3306
 Source Schema         : travel_db

 Target Server Type    : MySQL
 Target Server Version : 100314
 File Encoding         : 65001

 Date: 13/08/2019 18:53:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `holiday_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `booking_holiday_id_foreign`(`holiday_id`) USING BTREE,
  INDEX `booking_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `booking_holiday_id_foreign` FOREIGN KEY (`holiday_id`) REFERENCES `holidays` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `booking_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES (7, 1, 7, '2019-07-29', '2019-09-27', '2019-08-12 10:21:52', '2019-08-13 10:43:59');
INSERT INTO `booking` VALUES (8, 1, 8, '2019-09-03', '2019-09-19', '2019-08-12 10:25:34', '2019-08-12 15:18:01');
INSERT INTO `booking` VALUES (10, 1, 10, '2019-05-06', '2019-09-20', '2019-08-12 15:19:23', '2019-08-12 18:25:46');
INSERT INTO `booking` VALUES (13, 1, 13, '2019-08-26', '2019-09-26', '2019-08-12 18:34:09', '2019-08-13 03:53:12');
INSERT INTO `booking` VALUES (14, 1, 14, '2019-09-02', '2019-09-24', '2019-08-12 18:41:55', '2019-08-13 03:53:03');
INSERT INTO `booking` VALUES (15, 5, 6, '2019-08-06', '2019-08-13', '2019-08-13 02:57:53', '2019-08-13 02:57:53');
INSERT INTO `booking` VALUES (17, 1, 17, '2019-08-02', '2019-09-20', '2019-08-13 03:54:14', '2019-08-13 03:57:31');
INSERT INTO `booking` VALUES (18, 7, 6, '2019-08-10', '2019-09-27', '2019-08-13 10:40:43', '2019-08-13 10:40:43');
INSERT INTO `booking` VALUES (19, 1, 55, '2019-08-22', '2019-09-27', '2019-08-13 10:43:16', '2019-08-13 10:43:16');

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `hotel` tinyint(1) NOT NULL,
  `car_rental` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `holidays_location_id_foreign`(`location_id`) USING BTREE,
  CONSTRAINT `holidays_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holidays
-- ----------------------------
INSERT INTO `holidays` VALUES (1, 'China Holiday', 'Shen Yang', 1, 0, 0, 0, '2019-08-11 18:25:25', '2019-08-11 18:25:25');
INSERT INTO `holidays` VALUES (3, 'Javan holiday', 'japan ciy', 7, 1, 0, 0, '2019-08-11 18:26:34', '2019-08-12 08:43:04');
INSERT INTO `holidays` VALUES (5, 'Emlynne', 'Jiapeng', 41, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (6, 'Derby', 'Haapsalu', 87, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (7, 'Donaugh', 'Mir', 158, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (8, 'Thia', 'Cumaná', 27, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (9, 'Cleveland', 'Tianjiazhuang', 16, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (10, 'Rube', 'São Caetano do Sul', 33, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (11, 'Gennifer', 'Maracaju', 27, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (12, 'Conn', 'Mondokan', 160, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (13, 'Joseito', 'Beringovskiy', 33, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (14, 'Clemmy', 'Piedra Blanca', 131, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (15, 'Park', 'Nam Đàn', 136, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (16, 'Kingston', 'Conel', 80, 1, 1, 1, NULL, '2019-08-13 04:33:42');
INSERT INTO `holidays` VALUES (17, 'Shandy', 'Tielu', 139, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (18, 'Lilli', 'Valuyki', 170, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (19, 'Sibyl', 'Jingpeng', 62, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (20, 'Davie', 'Lima', 167, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (21, 'Jamil', 'Chornukhyne', 170, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (22, 'Fair', 'Šumperk', 27, 0, 0, 1, NULL, '2019-08-13 04:33:52');
INSERT INTO `holidays` VALUES (23, 'Boycey', 'Mubende', 106, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (24, 'Rea', 'Nowa Dęba', 27, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (25, 'Bel', 'Photharam', 136, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (26, 'Abbie', 'Fernandópolis', 111, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (27, 'Clare', 'Capitán Bado', 69, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (28, 'Jsandye', 'Poputnaya', 187, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (29, 'Almeda', 'Zbraslavice', 43, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (30, 'Rasia', 'Sidomulyo', 52, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (31, 'Fletch', 'Lantang', 177, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (32, 'Reid', 'Wenci', 134, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (33, 'Edsel', 'Jiangkou', 137, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (34, 'Kendricks', 'Limoeiro do Norte', 27, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (35, 'Augustine', 'Sunan', 28, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (36, 'Nat', 'Wates', 194, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (37, 'Rosalie', 'Santa Rosa', 81, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (38, 'Luigi', 'Babakanjaya', 52, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (39, 'Daffie', 'Marne-la-Vallée', 148, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (40, 'Elonore', 'Sumbergebang', 200, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (41, 'Alon', 'Wailebe', 180, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (42, 'Arther', 'Đồng Mỏ', 30, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (43, 'Avril', 'Ledeunu', 60, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (44, 'Travis', 'Nihommatsu', 192, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (45, 'Berty', 'Guimarães', 195, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (46, 'Napoleon', 'Yangping', 125, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (47, 'Natalina', 'Dīvāndarreh', 178, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (48, 'Ann', 'Wan’an', 87, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (49, 'Klaus', 'Shuanglong', 98, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (50, 'Lennard', 'Orléans', 131, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (51, 'Alejoa', 'Macau', 139, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (52, 'Jessy', 'Juliaca', 88, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (53, 'Kayla', 'Ciasna', 183, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (54, 'Silvia', 'Nong Khai', 106, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (55, 'Leonard', 'Wahawaha', 29, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (56, 'Lorine', 'Taman', 57, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (57, 'Corina', 'Mekarsari', 179, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (58, 'Aili', 'Oebaki', 149, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (59, 'Gerri', 'Opatów', 48, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (60, 'Mag', 'Daba', 17, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (61, 'Jemmie', 'Runan', 44, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (62, 'Vidovik', 'Slobodnica', 149, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (63, 'Aubrey', 'Ban Lam Luk Ka', 149, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (64, 'Yelena', 'Skhodnya', 188, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (65, 'Arden', 'Hongde', 18, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (66, 'Valentia', 'Sabadell', 123, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (67, 'Debbi', 'Örebro', 47, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (68, 'Nomi', 'Kuanghe', 33, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (69, 'Susanna', 'Arjona', 116, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (70, 'Anthony', 'Pensacola', 60, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (71, 'Yevette', 'Lancai', 105, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (72, 'Desmund', 'Houmt Souk', 73, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (73, 'Clemmie', 'Sacramento', 163, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (74, 'Mirilla', 'Ciduren', 16, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (75, 'Alyda', 'Pita', 128, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (76, 'Benedikt', 'Sinegor\'ye', 77, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (77, 'Elka', 'Nogoonnuur', 93, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (78, 'Alethea', 'Uchkulan', 154, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (79, 'Rossie', 'Zaplavnoye', 193, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (80, 'Sarah11', 'Log', 68, 1, 1, 0, NULL, '2019-08-13 10:39:00');
INSERT INTO `holidays` VALUES (81, 'Lynnea', 'Pérama', 36, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (82, 'Daveen', 'Kuala Lumpur', 72, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (83, 'Bernetta', 'Diavatós', 164, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (84, 'Stacy', 'Neochóri', 61, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (85, 'Dita', 'Borås', 87, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (86, 'Isidoro', 'Al Ḩajar al Aswad', 19, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (87, 'Oralie', 'Jinsheng', 41, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (88, 'Carce', 'Taramana', 146, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (89, 'Meg', 'Monte da Pedra', 99, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (90, 'Barbey', 'Niort', 136, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (91, 'Maison', 'Alegre', 102, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (92, 'Ody', 'Kalinkavichy', 54, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (93, 'Calvin', 'Horka nad Moravou', 138, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (94, 'Heather', 'Ḩajjah', 71, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (95, 'Johannes', 'Lucheng', 189, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (96, 'Anett', 'Dijon', 116, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (97, 'Livy', 'Yuanqiao', 69, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (98, 'Rriocard', 'Torkanivka', 118, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (99, 'Elspeth', 'Tyresö', 84, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (100, 'Riannon', 'Hrvatini', 17, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (101, 'Trina', 'Gorzkowice', 29, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (102, 'Carmita', 'Yurla', 130, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (103, 'Nada', 'Brumadinho', 184, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (104, 'Paige', 'Viçosa', 106, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (105, 'Gerrilee', 'Shuiting', 149, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (106, 'Maggy', 'Sindanghayu', 53, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (107, 'Dietrich', 'Cimişlia', 165, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (108, 'Shell', 'Zvenyhorodka', 90, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (109, 'Cleavland', 'Shuanglu', 64, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (110, 'Persis', 'Caringin', 114, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (111, 'Valerye', 'Maevatanana', 96, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (112, 'Carey', 'Bertoua', 160, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (113, 'Sue', 'Gadzhiyevo', 21, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (114, 'Morton', 'Skrzyszów', 19, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (115, 'Shandeigh', 'La Laja', 190, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (116, 'Bradly', 'Uzda', 18, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (117, 'Roland', 'Rancabungur', 108, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (118, 'Judye', 'Aranos', 156, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (119, 'Robin', 'Gadang', 148, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (120, 'Laurence', 'Chashnikovo', 26, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (121, 'Jody', 'Bromma', 80, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (122, 'Hazel', 'Bualu', 89, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (123, 'Hakim', 'Battle Creek', 27, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (124, 'Cristionna', 'Meiyao', 137, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (125, 'Jessey', 'Nema', 13, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (126, 'Marne', 'Heping', 168, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (127, 'Virgie', 'Vyborg', 190, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (128, 'Verla', 'Cravinhos', 146, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (129, 'Andi', 'Meia Via', 51, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (130, 'Foster', 'Pirajuí', 146, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (131, 'Olva', 'Krzemieniewo', 189, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (132, 'Gerri', 'Pingshui', 200, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (133, 'Jerrylee', 'Clearwater', 44, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (134, 'Angelo', 'Suizhou', 85, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (135, 'Marie', 'Ladhewāla Warāich', 122, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (136, 'Alisun', 'Vilque', 132, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (137, 'Urbain', 'Gaohu', 155, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (138, 'Edmon', 'Calimita', 129, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (139, 'Cynthia', 'Smålandsstenar', 93, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (140, 'Lancelot', 'Penghu', 170, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (141, 'Riva', 'Marne-la-Vallée', 192, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (142, 'Axe', 'Amiens', 193, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (143, 'Carmella', 'Sechenovo', 134, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (144, 'Bond', 'Mełgiew', 49, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (145, 'Babs', 'Baro', 141, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (146, 'Darcy', 'Shumyachi', 57, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (147, 'Trueman', 'Hongqi', 190, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (148, 'Marcel', 'Mława', 65, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (149, 'Lizbeth', 'Pines', 124, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (150, 'Alberta', 'Uijeongbu-si', 52, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (151, 'Alysia', 'Nowa Sarzyna', 144, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (152, 'Hedy', 'Koktokay', 79, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (153, 'Kilian', 'Krajan Atas Suger Lor', 191, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (154, 'Der', 'Cikiruh Wetan', 169, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (155, 'Gerhard', 'Topchikha', 52, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (156, 'Nolana', 'Ilhabela', 75, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (157, 'Leroi', 'Depok', 74, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (158, 'Billie', 'At-Bashi', 69, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (159, 'Bette-ann', 'Lianyi', 178, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (160, 'Brunhilde', 'Jiaoshanhe', 82, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (161, 'Gasper', 'Hengduo', 166, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (162, 'Jelene', 'Saskylakh', 196, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (163, 'Hunt', 'Sukatani', 129, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (164, 'Isiahi', 'Sipirok', 163, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (165, 'Jeramie', 'Doropeti', 163, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (166, 'Shurlocke', 'Cuevas', 54, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (167, 'Rudie', 'Sutton', 184, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (168, 'Roby', 'Datian', 120, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (169, 'Cati', 'Manacsac', 200, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (170, 'Donal', 'Podujeva', 187, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (171, 'Franky', 'Dalkey', 51, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (172, 'Rennie', 'Granja', 193, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (173, 'Emlynne', 'Si That', 77, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (174, 'Emelina', 'Ouyang', 13, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (175, 'Gracie', 'Torino', 157, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (176, 'Vinita', 'Brasília', 137, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (177, 'Sharlene', 'Presidente Bernardes', 140, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (178, 'Kelcie', 'Bunog', 172, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (179, 'Darnell', 'Piotrków Trybunalski', 186, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (180, 'Mata', 'Croix', 180, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (181, 'Tomasine', 'Non Narai', 125, 1, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (182, 'Rikki', 'Curitiba', 146, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (183, 'Trenton', 'Pasirgaru', 24, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (184, 'Rochell', 'Mauloo', 39, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (185, 'Lucienne', 'Longhe', 39, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (186, 'Simeon', 'Salt Lake City', 176, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (187, 'Thayne', 'Matriz de Camaragibe', 130, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (188, 'Trish', 'Asen', 10, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (189, 'Iolande', 'Huya', 185, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (190, 'Collie', 'Sainyabuli', 107, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (191, 'Simon', 'Makbon', 74, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (192, 'Annalise', 'Al Fayyūm', 167, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (193, 'Patricia', 'Isdalstø', 14, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (194, 'Mae', 'Budy', 186, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (195, 'Barbara-anne', 'Novopavlovsk', 149, 0, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (196, 'Kippar', 'Nglego', 192, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (197, 'Waylin', 'Kawengan', 6, 0, 1, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (198, 'Johna', 'Ḩabīl ar Raydah', 132, 0, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (199, 'Juli', 'Daqin Tal', 55, 0, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (200, 'Nikki', 'Datarkadu', 125, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (201, 'Diana', 'Muktāgācha', 23, 1, 0, 1, NULL, NULL);
INSERT INTO `holidays` VALUES (202, 'Moira', 'Saint Louis', 88, 1, 1, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (203, 'Arron', 'Volta Redonda', 165, 1, 0, 0, NULL, NULL);
INSERT INTO `holidays` VALUES (204, 'Tasha', 'Oyonnax', 100, 1, 0, 1, NULL, NULL);

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES (1, 'China', '2019-08-11 18:14:13', '2019-08-11 18:14:13');
INSERT INTO `locations` VALUES (2, 'Japan', '2019-08-11 18:14:25', '2019-08-11 18:14:25');
INSERT INTO `locations` VALUES (6, 'Afghanistan', NULL, NULL);
INSERT INTO `locations` VALUES (7, 'Africa', NULL, NULL);
INSERT INTO `locations` VALUES (8, 'Albania', NULL, NULL);
INSERT INTO `locations` VALUES (9, 'Algeria', NULL, NULL);
INSERT INTO `locations` VALUES (10, 'American Samoa', NULL, NULL);
INSERT INTO `locations` VALUES (11, 'Andorra', NULL, NULL);
INSERT INTO `locations` VALUES (12, 'Angola', NULL, NULL);
INSERT INTO `locations` VALUES (13, 'Antigua and Barbuda', NULL, NULL);
INSERT INTO `locations` VALUES (14, 'Arab World', NULL, NULL);
INSERT INTO `locations` VALUES (15, 'Argentina', NULL, NULL);
INSERT INTO `locations` VALUES (16, 'Armenia', NULL, NULL);
INSERT INTO `locations` VALUES (17, 'Aruba', NULL, NULL);
INSERT INTO `locations` VALUES (18, 'Australia', NULL, NULL);
INSERT INTO `locations` VALUES (19, 'Austria', NULL, NULL);
INSERT INTO `locations` VALUES (20, 'Azerbaijan', NULL, NULL);
INSERT INTO `locations` VALUES (21, 'Bahamas, The', NULL, NULL);
INSERT INTO `locations` VALUES (22, 'Bahrain', NULL, NULL);
INSERT INTO `locations` VALUES (23, 'Bangladesh', NULL, NULL);
INSERT INTO `locations` VALUES (24, 'Barbados', NULL, NULL);
INSERT INTO `locations` VALUES (25, 'Belarus', NULL, NULL);
INSERT INTO `locations` VALUES (26, 'Belgium', NULL, NULL);
INSERT INTO `locations` VALUES (27, 'Belize', NULL, NULL);
INSERT INTO `locations` VALUES (28, 'Benin', NULL, NULL);
INSERT INTO `locations` VALUES (29, 'Bermuda', NULL, NULL);
INSERT INTO `locations` VALUES (30, 'Bhutan', NULL, NULL);
INSERT INTO `locations` VALUES (31, 'Bolivia', NULL, NULL);
INSERT INTO `locations` VALUES (32, 'Bosnia and Herzegovina', NULL, NULL);
INSERT INTO `locations` VALUES (33, 'Botswana', NULL, NULL);
INSERT INTO `locations` VALUES (34, 'Brazil', NULL, NULL);
INSERT INTO `locations` VALUES (35, 'Brunei Darussalam', NULL, NULL);
INSERT INTO `locations` VALUES (36, 'Bulgaria', NULL, NULL);
INSERT INTO `locations` VALUES (37, 'Burkina Faso', NULL, NULL);
INSERT INTO `locations` VALUES (38, 'Burundi', NULL, NULL);
INSERT INTO `locations` VALUES (39, 'Cabo Verde', NULL, NULL);
INSERT INTO `locations` VALUES (40, 'Cambodia', NULL, NULL);
INSERT INTO `locations` VALUES (41, 'Cameroon', NULL, NULL);
INSERT INTO `locations` VALUES (42, 'Canada', NULL, NULL);
INSERT INTO `locations` VALUES (43, 'Caribbean small states', NULL, NULL);
INSERT INTO `locations` VALUES (44, 'Cayman Islands', NULL, NULL);
INSERT INTO `locations` VALUES (45, 'Central African Republic', NULL, NULL);
INSERT INTO `locations` VALUES (46, 'Chad', NULL, NULL);
INSERT INTO `locations` VALUES (47, 'Channel Islands', NULL, NULL);
INSERT INTO `locations` VALUES (48, 'Chile', NULL, NULL);
INSERT INTO `locations` VALUES (49, 'China', NULL, NULL);
INSERT INTO `locations` VALUES (50, 'Colombia', NULL, NULL);
INSERT INTO `locations` VALUES (51, 'Comoros', NULL, NULL);
INSERT INTO `locations` VALUES (52, 'Congo, Dem. Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (53, 'Congo, Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (54, 'Costa Rica', NULL, NULL);
INSERT INTO `locations` VALUES (55, 'Cote d\'Ivoire', NULL, NULL);
INSERT INTO `locations` VALUES (56, 'Croatia', NULL, NULL);
INSERT INTO `locations` VALUES (57, 'Cuba', NULL, NULL);
INSERT INTO `locations` VALUES (58, 'Curacao', NULL, NULL);
INSERT INTO `locations` VALUES (59, 'Cyprus', NULL, NULL);
INSERT INTO `locations` VALUES (60, 'Czech Republic', NULL, NULL);
INSERT INTO `locations` VALUES (61, 'Denmark', NULL, NULL);
INSERT INTO `locations` VALUES (62, 'Djibouti', NULL, NULL);
INSERT INTO `locations` VALUES (63, 'Dominican Republic', NULL, NULL);
INSERT INTO `locations` VALUES (64, 'Dominica', NULL, NULL);
INSERT INTO `locations` VALUES (65, 'East Asia & Pacific (all income levels)', NULL, NULL);
INSERT INTO `locations` VALUES (66, 'East Asia & Pacific (developing only)', NULL, NULL);
INSERT INTO `locations` VALUES (67, 'East Asia and the Pacific (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (68, 'Ecuador', NULL, NULL);
INSERT INTO `locations` VALUES (69, 'Egypt, Arab Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (70, 'El Salvador', NULL, NULL);
INSERT INTO `locations` VALUES (71, 'Equatorial Guinea', NULL, NULL);
INSERT INTO `locations` VALUES (72, 'Eritrea', NULL, NULL);
INSERT INTO `locations` VALUES (73, 'Estonia', NULL, NULL);
INSERT INTO `locations` VALUES (74, 'Ethiopia', NULL, NULL);
INSERT INTO `locations` VALUES (75, 'Euro area', NULL, NULL);
INSERT INTO `locations` VALUES (76, 'Europe & Central Asia (all income levels)', NULL, NULL);
INSERT INTO `locations` VALUES (77, 'Europe & Central Asia (developing only)', NULL, NULL);
INSERT INTO `locations` VALUES (78, 'Europe and Central Asia (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (79, 'European Union', NULL, NULL);
INSERT INTO `locations` VALUES (80, 'Faeroe Islands', NULL, NULL);
INSERT INTO `locations` VALUES (81, 'Fiji', NULL, NULL);
INSERT INTO `locations` VALUES (82, 'Finland', NULL, NULL);
INSERT INTO `locations` VALUES (83, 'France', NULL, NULL);
INSERT INTO `locations` VALUES (84, 'French Polynesia', NULL, NULL);
INSERT INTO `locations` VALUES (85, 'Gabon', NULL, NULL);
INSERT INTO `locations` VALUES (86, 'Gambia, The', NULL, NULL);
INSERT INTO `locations` VALUES (87, 'Georgia', NULL, NULL);
INSERT INTO `locations` VALUES (88, 'Germany', NULL, NULL);
INSERT INTO `locations` VALUES (89, 'Ghana', NULL, NULL);
INSERT INTO `locations` VALUES (90, 'Greece', NULL, NULL);
INSERT INTO `locations` VALUES (91, 'Greenland', NULL, NULL);
INSERT INTO `locations` VALUES (92, 'Grenada', NULL, NULL);
INSERT INTO `locations` VALUES (93, 'Guam', NULL, NULL);
INSERT INTO `locations` VALUES (94, 'Guatemala', NULL, NULL);
INSERT INTO `locations` VALUES (95, 'Guinea-Bissau', NULL, NULL);
INSERT INTO `locations` VALUES (96, 'Guinea', NULL, NULL);
INSERT INTO `locations` VALUES (97, 'Guyana', NULL, NULL);
INSERT INTO `locations` VALUES (98, 'Haiti', NULL, NULL);
INSERT INTO `locations` VALUES (99, 'Heavily indebted poor countries (HIPC)', NULL, NULL);
INSERT INTO `locations` VALUES (100, 'High income: nonOECD', NULL, NULL);
INSERT INTO `locations` VALUES (101, 'High income: OECD', NULL, NULL);
INSERT INTO `locations` VALUES (102, 'High income', NULL, NULL);
INSERT INTO `locations` VALUES (103, 'Honduras', NULL, NULL);
INSERT INTO `locations` VALUES (104, 'Hong Kong SAR, China', NULL, NULL);
INSERT INTO `locations` VALUES (105, 'Hungary', NULL, NULL);
INSERT INTO `locations` VALUES (106, 'Iceland', NULL, NULL);
INSERT INTO `locations` VALUES (107, 'India', NULL, NULL);
INSERT INTO `locations` VALUES (108, 'Indonesia', NULL, NULL);
INSERT INTO `locations` VALUES (109, 'Iran, Islamic Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (110, 'Iraq', NULL, NULL);
INSERT INTO `locations` VALUES (111, 'Ireland', NULL, NULL);
INSERT INTO `locations` VALUES (112, 'Isle of Man', NULL, NULL);
INSERT INTO `locations` VALUES (113, 'Israel', NULL, NULL);
INSERT INTO `locations` VALUES (114, 'Italy', NULL, NULL);
INSERT INTO `locations` VALUES (115, 'Jamaica', NULL, NULL);
INSERT INTO `locations` VALUES (116, 'Japan', NULL, NULL);
INSERT INTO `locations` VALUES (117, 'Jordan', NULL, NULL);
INSERT INTO `locations` VALUES (118, 'Kazakhstan', NULL, NULL);
INSERT INTO `locations` VALUES (119, 'Kenya', NULL, NULL);
INSERT INTO `locations` VALUES (120, 'Kiribati', NULL, NULL);
INSERT INTO `locations` VALUES (121, 'Korea, Dem. Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (122, 'Korea, Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (123, 'Kosovo', NULL, NULL);
INSERT INTO `locations` VALUES (124, 'Kuwait', NULL, NULL);
INSERT INTO `locations` VALUES (125, 'Kyrgyz Republic', NULL, NULL);
INSERT INTO `locations` VALUES (126, 'Lao PDR', NULL, NULL);
INSERT INTO `locations` VALUES (127, 'Latin America & Caribbean (all income levels)', NULL, NULL);
INSERT INTO `locations` VALUES (128, 'Latin America & Caribbean (developing only)', NULL, NULL);
INSERT INTO `locations` VALUES (129, 'Latin America and the Caribbean (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (130, 'Latvia', NULL, NULL);
INSERT INTO `locations` VALUES (131, 'Least developed countries: UN classification', NULL, NULL);
INSERT INTO `locations` VALUES (132, 'Lebanon', NULL, NULL);
INSERT INTO `locations` VALUES (133, 'Lesotho', NULL, NULL);
INSERT INTO `locations` VALUES (134, 'Liberia', NULL, NULL);
INSERT INTO `locations` VALUES (135, 'Libya', NULL, NULL);
INSERT INTO `locations` VALUES (136, 'Liechtenstein', NULL, NULL);
INSERT INTO `locations` VALUES (137, 'Lithuania', NULL, NULL);
INSERT INTO `locations` VALUES (138, 'Low & middle income', NULL, NULL);
INSERT INTO `locations` VALUES (139, 'Low income', NULL, NULL);
INSERT INTO `locations` VALUES (140, 'Lower middle income', NULL, NULL);
INSERT INTO `locations` VALUES (141, 'Luxembourg', NULL, NULL);
INSERT INTO `locations` VALUES (142, 'Macao SAR, China', NULL, NULL);
INSERT INTO `locations` VALUES (143, 'Macedonia, FYR', NULL, NULL);
INSERT INTO `locations` VALUES (144, 'Madagascar', NULL, NULL);
INSERT INTO `locations` VALUES (145, 'Malawi', NULL, NULL);
INSERT INTO `locations` VALUES (146, 'Malaysia', NULL, NULL);
INSERT INTO `locations` VALUES (147, 'Maldives', NULL, NULL);
INSERT INTO `locations` VALUES (148, 'Mali', NULL, NULL);
INSERT INTO `locations` VALUES (149, 'Malta', NULL, NULL);
INSERT INTO `locations` VALUES (150, 'Marshall Islands', NULL, NULL);
INSERT INTO `locations` VALUES (151, 'Mauritania', NULL, NULL);
INSERT INTO `locations` VALUES (152, 'Mauritius', NULL, NULL);
INSERT INTO `locations` VALUES (153, 'Mexico', NULL, NULL);
INSERT INTO `locations` VALUES (154, 'Micronesia, Fed. Sts.', NULL, NULL);
INSERT INTO `locations` VALUES (155, 'Middle East & North Africa (all income levels)', NULL, NULL);
INSERT INTO `locations` VALUES (156, 'Middle East & North Africa (developing only)', NULL, NULL);
INSERT INTO `locations` VALUES (157, 'Middle East and North Africa (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (158, 'Middle income', NULL, NULL);
INSERT INTO `locations` VALUES (159, 'Moldova', NULL, NULL);
INSERT INTO `locations` VALUES (160, 'Monaco', NULL, NULL);
INSERT INTO `locations` VALUES (161, 'Mongolia', NULL, NULL);
INSERT INTO `locations` VALUES (162, 'Montenegro', NULL, NULL);
INSERT INTO `locations` VALUES (163, 'Morocco', NULL, NULL);
INSERT INTO `locations` VALUES (164, 'Mozambique', NULL, NULL);
INSERT INTO `locations` VALUES (165, 'Myanmar', NULL, NULL);
INSERT INTO `locations` VALUES (166, 'Namibia', NULL, NULL);
INSERT INTO `locations` VALUES (167, 'Nepal', NULL, NULL);
INSERT INTO `locations` VALUES (168, 'Netherlands', NULL, NULL);
INSERT INTO `locations` VALUES (169, 'New Caledonia', NULL, NULL);
INSERT INTO `locations` VALUES (170, 'New Zealand', NULL, NULL);
INSERT INTO `locations` VALUES (171, 'Nicaragua', NULL, NULL);
INSERT INTO `locations` VALUES (172, 'Nigeria', NULL, NULL);
INSERT INTO `locations` VALUES (173, 'Niger', NULL, NULL);
INSERT INTO `locations` VALUES (174, 'North Africa', NULL, NULL);
INSERT INTO `locations` VALUES (175, 'North America', NULL, NULL);
INSERT INTO `locations` VALUES (176, 'Northern Mariana Islands', NULL, NULL);
INSERT INTO `locations` VALUES (177, 'Norway', NULL, NULL);
INSERT INTO `locations` VALUES (178, 'OECD members', NULL, NULL);
INSERT INTO `locations` VALUES (179, 'Oman', NULL, NULL);
INSERT INTO `locations` VALUES (180, 'Other small states', NULL, NULL);
INSERT INTO `locations` VALUES (181, 'Pacific island small states', NULL, NULL);
INSERT INTO `locations` VALUES (182, 'Pakistan', NULL, NULL);
INSERT INTO `locations` VALUES (183, 'Palau', NULL, NULL);
INSERT INTO `locations` VALUES (184, 'Panama', NULL, NULL);
INSERT INTO `locations` VALUES (185, 'Papua New Guinea', NULL, NULL);
INSERT INTO `locations` VALUES (186, 'Paraguay', NULL, NULL);
INSERT INTO `locations` VALUES (187, 'Peru', NULL, NULL);
INSERT INTO `locations` VALUES (188, 'Philippines', NULL, NULL);
INSERT INTO `locations` VALUES (189, 'Poland', NULL, NULL);
INSERT INTO `locations` VALUES (190, 'Portugal', NULL, NULL);
INSERT INTO `locations` VALUES (191, 'Puerto Rico', NULL, NULL);
INSERT INTO `locations` VALUES (192, 'Qatar', NULL, NULL);
INSERT INTO `locations` VALUES (193, 'Romania', NULL, NULL);
INSERT INTO `locations` VALUES (194, 'Russian Federation', NULL, NULL);
INSERT INTO `locations` VALUES (195, 'Rwanda', NULL, NULL);
INSERT INTO `locations` VALUES (196, 'Samoa', NULL, NULL);
INSERT INTO `locations` VALUES (197, 'San Marino', NULL, NULL);
INSERT INTO `locations` VALUES (198, 'Sao Tome and Principe', NULL, NULL);
INSERT INTO `locations` VALUES (199, 'Saudi Arabia', NULL, NULL);
INSERT INTO `locations` VALUES (200, 'Senegal', NULL, NULL);
INSERT INTO `locations` VALUES (201, 'Serbia', NULL, NULL);
INSERT INTO `locations` VALUES (202, 'Seychelles', NULL, NULL);
INSERT INTO `locations` VALUES (203, 'Sierra Leone', NULL, NULL);
INSERT INTO `locations` VALUES (204, 'Singapore', NULL, NULL);
INSERT INTO `locations` VALUES (205, 'Sint Maarten (Dutch part)', NULL, NULL);
INSERT INTO `locations` VALUES (206, 'Slovak Republic', NULL, NULL);
INSERT INTO `locations` VALUES (207, 'Slovenia', NULL, NULL);
INSERT INTO `locations` VALUES (208, 'Small states', NULL, NULL);
INSERT INTO `locations` VALUES (209, 'Solomon Islands', NULL, NULL);
INSERT INTO `locations` VALUES (210, 'Somalia', NULL, NULL);
INSERT INTO `locations` VALUES (211, 'South Africa', NULL, NULL);
INSERT INTO `locations` VALUES (212, 'South Asia (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (213, 'South Asia', NULL, NULL);
INSERT INTO `locations` VALUES (214, 'South Sudan', NULL, NULL);
INSERT INTO `locations` VALUES (215, 'Spain', NULL, NULL);
INSERT INTO `locations` VALUES (216, 'Sri Lanka', NULL, NULL);
INSERT INTO `locations` VALUES (217, 'St. Kitts and Nevis', NULL, NULL);
INSERT INTO `locations` VALUES (218, 'St. Lucia', NULL, NULL);
INSERT INTO `locations` VALUES (219, 'St. Martin (French part)', NULL, NULL);
INSERT INTO `locations` VALUES (220, 'St. Vincent and the Grenadines', NULL, NULL);
INSERT INTO `locations` VALUES (221, 'Sub-Saharan Africa (all income levels)', NULL, NULL);
INSERT INTO `locations` VALUES (222, 'Sub-Saharan Africa (developing only)', NULL, NULL);
INSERT INTO `locations` VALUES (223, 'Sub-Saharan Africa (IFC classification)', NULL, NULL);
INSERT INTO `locations` VALUES (224, 'Sub-Saharan Africa excluding South Africa and Nigeria', NULL, NULL);
INSERT INTO `locations` VALUES (225, 'Sub-Saharan Africa excluding South Africa', NULL, NULL);
INSERT INTO `locations` VALUES (226, 'Sudan', NULL, NULL);
INSERT INTO `locations` VALUES (227, 'Suriname', NULL, NULL);
INSERT INTO `locations` VALUES (228, 'Swaziland', NULL, NULL);
INSERT INTO `locations` VALUES (229, 'Sweden', NULL, NULL);
INSERT INTO `locations` VALUES (230, 'Switzerland', NULL, NULL);
INSERT INTO `locations` VALUES (231, 'Syrian Arab Republic', NULL, NULL);
INSERT INTO `locations` VALUES (232, 'Tajikistan', NULL, NULL);
INSERT INTO `locations` VALUES (233, 'Tanzania', NULL, NULL);
INSERT INTO `locations` VALUES (234, 'Thailand', NULL, NULL);
INSERT INTO `locations` VALUES (235, 'Timor-Leste', NULL, NULL);
INSERT INTO `locations` VALUES (236, 'Togo', NULL, NULL);
INSERT INTO `locations` VALUES (237, 'Tonga', NULL, NULL);
INSERT INTO `locations` VALUES (238, 'Trinidad and Tobago', NULL, NULL);
INSERT INTO `locations` VALUES (239, 'Tunisia', NULL, NULL);
INSERT INTO `locations` VALUES (240, 'Turkey', NULL, NULL);
INSERT INTO `locations` VALUES (241, 'Turkmenistan', NULL, NULL);
INSERT INTO `locations` VALUES (242, 'Turks and Caicos Islands', NULL, NULL);
INSERT INTO `locations` VALUES (243, 'Tuvalu', NULL, NULL);
INSERT INTO `locations` VALUES (244, 'Uganda', NULL, NULL);
INSERT INTO `locations` VALUES (245, 'Ukraine', NULL, NULL);
INSERT INTO `locations` VALUES (246, 'United Arab Emirates', NULL, NULL);
INSERT INTO `locations` VALUES (247, 'United Kingdom', NULL, NULL);
INSERT INTO `locations` VALUES (248, 'United States', NULL, NULL);
INSERT INTO `locations` VALUES (249, 'Upper middle income', NULL, NULL);
INSERT INTO `locations` VALUES (250, 'Uruguay', NULL, NULL);
INSERT INTO `locations` VALUES (251, 'Uzbekistan', NULL, NULL);
INSERT INTO `locations` VALUES (252, 'Vanuatu', NULL, NULL);
INSERT INTO `locations` VALUES (253, 'Venezuela, RB', NULL, NULL);
INSERT INTO `locations` VALUES (254, 'Vietnam', NULL, NULL);
INSERT INTO `locations` VALUES (255, 'Virgin Islands (U.S.)', NULL, NULL);
INSERT INTO `locations` VALUES (256, 'West Bank and Gaza', NULL, NULL);
INSERT INTO `locations` VALUES (257, 'World', NULL, NULL);
INSERT INTO `locations` VALUES (258, 'Yemen, Rep.', NULL, NULL);
INSERT INTO `locations` VALUES (259, 'Zambia', NULL, NULL);
INSERT INTO `locations` VALUES (260, 'Zimbabwe', NULL, '2019-08-13 10:40:15');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_11_133940_create_permission_tables', 3);
INSERT INTO `migrations` VALUES (5, '2019_08_11_180629_location_table', 4);
INSERT INTO `migrations` VALUES (6, '2019_08_11_113758_holiday_table', 5);
INSERT INTO `migrations` VALUES (12, '2019_08_11_192904_booking_table', 6);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
INSERT INTO `model_has_roles` VALUES (1, 'App\\Models\\BackpackUser', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\BackpackUser', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\BackpackUser', 2);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\BackpackUser', 5);
INSERT INTO `model_has_roles` VALUES (2, 'App\\Models\\BackpackUser', 7);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'manage_holiday', 'web', '2019-08-11 13:47:35', '2019-08-11 13:47:35');
INSERT INTO `permissions` VALUES (2, 'manage_user', 'web', '2019-08-11 13:48:05', '2019-08-11 13:48:05');
INSERT INTO `permissions` VALUES (3, 'booking', 'web', '2019-08-11 13:58:03', '2019-08-11 13:58:03');
INSERT INTO `permissions` VALUES (4, 'manage_location', 'backpack', '2019-08-13 03:59:11', '2019-08-13 03:59:11');

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
INSERT INTO `role_has_permissions` VALUES (1, 1);
INSERT INTO `role_has_permissions` VALUES (2, 1);
INSERT INTO `role_has_permissions` VALUES (3, 2);
INSERT INTO `role_has_permissions` VALUES (4, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'web', '2019-08-11 13:43:22', '2019-08-11 13:43:22');
INSERT INTO `roles` VALUES (2, 'user', 'web', '2019-08-11 13:43:30', '2019-08-11 13:43:30');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'hgh141592_71@outlook.com', NULL, '$2y$10$WfqFuDnXc4RO30MwfyFEXebMTNxU8enckVGI4DNk883.0giLTHVG.', 'HVMBpXdtGe9bohV1R8Sq2d92l1jLc7VIMAhLbwdAZ1RrOcbcpZRCRnikBLwv', '2019-08-11 10:02:58', '2019-08-11 13:52:23');
INSERT INTO `users` VALUES (2, 'testUser', 'test@test.com111', NULL, '$2y$10$nLvV7DHdbkZ4BXpNWjDC3OfLVkORJLXQA.85gzJWHdb5SmFBcwtVq', NULL, '2019-08-11 13:49:14', '2019-08-11 17:50:30');
INSERT INTO `users` VALUES (5, 'SuperDev', 'superDev71@outlook.com', NULL, '$2y$10$tHtPABwrAnZrB4l/AyPDGu2eFsFbkkZVNZ.5kQwyk/sjtxZZgw18S', '1fHcBvLPasWHnJ4D22aZp5qnziJ3xQqbsepNFEIXDSrEnXtubxxdclRRh1Pn', '2019-08-12 12:23:05', '2019-08-13 03:58:06');
INSERT INTO `users` VALUES (7, 'anywhere111', 'anywhere0811@gmail.com', NULL, '$2y$10$XOJv5yDn4OQEECy6eAwaOOkgL78EU0T1ZTEJHxQDY04LvSB96eWQm', NULL, '2019-08-13 10:38:19', '2019-08-13 10:38:28');

SET FOREIGN_KEY_CHECKS = 1;
