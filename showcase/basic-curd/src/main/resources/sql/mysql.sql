/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : exitsoft-basic-curd

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2013-11-28 15:34:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tb_data_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `tb_data_dictionary`;
CREATE TABLE `tb_data_dictionary` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(1) COLLATE utf8_bin NOT NULL,
  `value` varchar(32) COLLATE utf8_bin NOT NULL,
  `fk_category_id` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_layhfd1butuigsscgucmp2okd` (`fk_category_id`),
  CONSTRAINT `FK_layhfd1butuigsscgucmp2okd` FOREIGN KEY (`fk_category_id`) REFERENCES `tb_dictionary_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_data_dictionary
-- ----------------------------
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d481b6920001', '启用', null, 'I', '1', '402881e437d467d80137d46fc0e50001');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d481dda30002', '禁用', null, 'I', '2', '402881e437d467d80137d46fc0e50001');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d481f23a0003', '删除', null, 'I', '3', '402881e437d467d80137d46fc0e50001');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d4870b230005', 'String', null, 'S', 'S', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d487328e0006', 'Integer', null, 'S', 'I', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d487a3af0007', 'Long', null, 'S', 'L', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d487e23a0008', 'Double', null, 'S', 'N', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d488416d0009', 'Date', null, 'S', 'D', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d47b250137d4885686000a', 'Boolean', null, 'S', 'B', '402881e437d47b250137d485274b0004');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d49e430137d4a5e8570003', '菜单类型', null, 'S', '01', '402881e437d467d80137d4709b9c0002');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d49e430137d4a61cec0004', '资源类型', null, 'S', '02', '402881e437d467d80137d4709b9c0002');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d49e430137d4a6f1aa0005', '部门', null, 'S', '02', '402881e437d467d80137d4712ca70003');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d49e430137d4a7783d0006', '机构', null, 'S', '01', '402881e437d467d80137d4712ca70003');
INSERT INTO `tb_data_dictionary` VALUES ('402881e437d49e430137d4a7ba1a0007', '权限组', null, 'S', '03', '402881e437d467d80137d4712ca70003');

-- ----------------------------
-- Table structure for `tb_dictionary_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary_category`;
CREATE TABLE `tb_dictionary_category` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(128) COLLATE utf8_bin NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `fk_parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9qkei4dxobl1lm4oa0ys8c3nr` (`code`),
  KEY `FK_bernf41kympxy2kjl4vbq5q44` (`fk_parent_id`),
  CONSTRAINT `FK_bernf41kympxy2kjl4vbq5q44` FOREIGN KEY (`fk_parent_id`) REFERENCES `tb_dictionary_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_dictionary_category
-- ----------------------------
INSERT INTO `tb_dictionary_category` VALUES ('402881e437d467d80137d46fc0e50001', 'state', '状态', null, null);
INSERT INTO `tb_dictionary_category` VALUES ('402881e437d467d80137d4709b9c0002', 'resource-type', '资源类型', null, null);
INSERT INTO `tb_dictionary_category` VALUES ('402881e437d467d80137d4712ca70003', 'group-type', '组类型', null, null);
INSERT INTO `tb_dictionary_category` VALUES ('402881e437d47b250137d485274b0004', 'value-type', '值类型', null, null);

-- ----------------------------
-- Table structure for `tb_group`
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) NOT NULL,
  `type` varchar(2) COLLATE utf8_bin NOT NULL,
  `fk_parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_byw2jrrrxrueqimkmgj3o842j` (`name`),
  KEY `FK_idve4hc50mytxm181wl1knw28` (`fk_parent_id`),
  CONSTRAINT `FK_idve4hc50mytxm181wl1knw28` FOREIGN KEY (`fk_parent_id`) REFERENCES `tb_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_group
-- ----------------------------
INSERT INTO `tb_group` VALUES ('402881c4408c7d2301408c86b7a80001', '普通用户', null, '1', '03', null, null, null);
INSERT INTO `tb_group` VALUES ('402881c4408c7d2301408c870ed10002', '运维人员', null, '1', '03', null, null, null);
INSERT INTO `tb_group` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0002', '超级管理员', null, '1', '03', null, null, null);

-- ----------------------------
-- Table structure for `tb_group_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_resource`;
CREATE TABLE `tb_group_resource` (
  `fk_resource_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `fk_group_id` varchar(32) COLLATE utf8_bin NOT NULL,
  KEY `FK_q82fpmfh128qxoeyymrkg71e2` (`fk_group_id`),
  KEY `FK_3tjs4wt3vvoibo1fvcvog5srd` (`fk_resource_id`),
  CONSTRAINT `FK_3tjs4wt3vvoibo1fvcvog5srd` FOREIGN KEY (`fk_resource_id`) REFERENCES `tb_resource` (`id`),
  CONSTRAINT `FK_q82fpmfh128qxoeyymrkg71e2` FOREIGN KEY (`fk_group_id`) REFERENCES `tb_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_group_resource
-- ----------------------------
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0003', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0004', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0005', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0006', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0007', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0008', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0009', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0010', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0011', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0012', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0013', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0014', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0015', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0016', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0017', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0018', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0019', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0020', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0021', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0022', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0023', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0024', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0025', 'SJDK3849CKMS3849DJCK2039ZMSK0002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0003', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0004', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0008', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0009', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0010', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0012', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0015', '402881c4408c7d2301408c86b7a80001');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0017', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0018', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0019', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0020', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0021', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0022', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0023', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0024', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0025', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0026', '402881c4408c7d2301408c870ed10002');
INSERT INTO `tb_group_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0027', '402881c4408c7d2301408c870ed10002');

-- ----------------------------
-- Table structure for `tb_group_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_group_user`;
CREATE TABLE `tb_group_user` (
  `fk_group_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `fk_user_id` varchar(32) COLLATE utf8_bin NOT NULL,
  KEY `FK_7k068ltfepa1q75qtmvxuawk` (`fk_user_id`),
  KEY `FK_rgmkki7dggfag6ow6eivljmwv` (`fk_group_id`),
  CONSTRAINT `FK_rgmkki7dggfag6ow6eivljmwv` FOREIGN KEY (`fk_group_id`) REFERENCES `tb_group` (`id`),
  CONSTRAINT `FK_7k068ltfepa1q75qtmvxuawk` FOREIGN KEY (`fk_user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_group_user
-- ----------------------------
INSERT INTO `tb_group_user` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0002', 'SJDK3849CKMS3849DJCK2039ZMSK0001');
INSERT INTO `tb_group_user` VALUES ('402881c4408c7d2301408c86b7a80001', '17909124407b8d7901407be4996c0005');
INSERT INTO `tb_group_user` VALUES ('402881c4408c7d2301408c86b7a80001', '17909124407b8d7901407be4996c0006');
INSERT INTO `tb_group_user` VALUES ('402881c4408c7d2301408c86b7a80001', '17909124407b8d7901407be4996c0007');
INSERT INTO `tb_group_user` VALUES ('402881c4408c7d2301408c870ed10002', '17909124407b8d7901407be4996c0004');

-- ----------------------------
-- Table structure for `tb_operating_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_operating_record`;
CREATE TABLE `tb_operating_record` (
  `id` varchar(32) NOT NULL,
  `end_date` datetime NOT NULL,
  `fk_user_id` varchar(32) DEFAULT NULL,
  `operating_target` varchar(512) NOT NULL,
  `start_date` datetime NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `function` varchar(128) DEFAULT NULL,
  `ip` varchar(64) NOT NULL,
  `method` varchar(256) NOT NULL,
  `module` varchar(128) DEFAULT NULL,
  `remark` longtext,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_operating_record
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_record_parameter`
-- ----------------------------
DROP TABLE IF EXISTS `tb_record_parameter`;
CREATE TABLE `tb_record_parameter` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` longtext,
  `fk_record_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6tsjrad76yki1ji619t83r54y` (`fk_record_id`),
  CONSTRAINT `FK_6tsjrad76yki1ji619t83r54y` FOREIGN KEY (`fk_record_id`) REFERENCES `tb_operating_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_record_parameter
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `permission` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `type` varchar(2) COLLATE utf8_bin NOT NULL,
  `value` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `fk_parent_id` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_aunvlvm32xb4e6590jc9oooq` (`name`),
  KEY `FK_k2heqvi9muk4cjyyd53r9y37x` (`fk_parent_id`),
  CONSTRAINT `FK_k2heqvi9muk4cjyyd53r9y37x` FOREIGN KEY (`fk_parent_id`) REFERENCES `tb_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0003', null, null, '1', '权限管理', '01', '#', null, 'glyphicon-briefcase');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0004', 'perms[user:view]', null, '2', '用户管理', '01', '/account/user/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0003', 'glyphicon-user');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0005', 'perms[user:create]', null, '3', '创建用户', '02', '/account/user/save/**', 'SJDK3849CKMS3849DJCK2039ZMSK0004', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0006', 'perms[user:update]', null, '4', '修改用户', '02', '/account/user/update/**', 'SJDK3849CKMS3849DJCK2039ZMSK0004', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0007', 'perms[user:delete]', null, '5', '删除用户', '02', '/account/user/delete/**', 'SJDK3849CKMS3849DJCK2039ZMSK0004', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0008', 'perms[user:read]', null, '6', '查看用户', '02', '/account/user/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0004', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0009', 'perms[group:view]', null, '7', '组管理', '01', '/account/group/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0003', 'glyphicon-briefcase');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0010', 'perms[resource:view]', null, '8', '资源管理', '01', '/account/resource/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0003', 'glyphicon-link');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0011', 'perms[group:save]', null, '9', '创建和编辑组', '02', '/account/group/save/**', 'SJDK3849CKMS3849DJCK2039ZMSK0009', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0012', 'perms[group:read]', null, '10', '查看组', '02', '/account/group/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0009', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0013', 'perms[group:delete]', null, '11', '删除组', '02', '/account/group/delete/**', 'SJDK3849CKMS3849DJCK2039ZMSK0009', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0014', 'perms[resource:save]', null, '12', '创建和编辑资源', '02', '/account/resource/save/**', 'SJDK3849CKMS3849DJCK2039ZMSK0010', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0015', 'perms[resource:read]', null, '13', '查看资源', '02', '/account/resource/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0010', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0016', 'perms[resource:delete]', null, '14', '删除资源', '02', '/account/resource/delete/**', 'SJDK3849CKMS3849DJCK2039ZMSK0010', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0017', null, null, '15', '系统管理', '01', '#', null, 'glyphicon-cog');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0018', 'perms[data-dictionary:view]', '', '22', '数据字典管理', '01', '/foundation/data-dictionary/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0017', 'glyphicon-list-alt');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0019', 'perms[dictionary-category:view]', null, '17', '字典类别管理', '01', '/foundation/dictionary-category/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0017', 'glyphicon-folder-close');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0020', 'perms[dictionary-category:save]', null, '18', '创建和编辑字典类别', '02', '/foundation/dictionary-category/save/**', 'SJDK3849CKMS3849DJCK2039ZMSK0019', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0021', 'perms[dictionary-category:delete]', null, '19', '删除字典类别', '02', '/foundation/dictionary-category/delete/**', 'SJDK3849CKMS3849DJCK2039ZMSK0019', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0022', 'perms[data-dictionary:save]', null, '20', '创建和编辑数据字典', '02', '/foundation/data-dictionary/save/**', 'SJDK3849CKMS3849DJCK2039ZMSK0018', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0023', 'perms[data-dictionary:delete]', null, '21', '删除数据字典', '02', '/foundation/data-dictionary/delete/**', 'SJDK3849CKMS3849DJCK2039ZMSK0018', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0024', 'perms[data-dictionary:read]', null, '22', '查看数据字典', '02', '/foundation/data-dictionary/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0018', null);
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0025', 'perms[dictionary-category:read]', '', '24', '查看字典类别', '02', '/foundation/dictionary-category/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0019', '');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0026', 'perms[operating-record:view]', null, '25', '操作记录管理', '01', '/foundation/audit/operating-record/view/**', 'SJDK3849CKMS3849DJCK2039ZMSK0017', 'glyphicon-eye-open');
INSERT INTO `tb_resource` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0027', 'perms[operating-record:read]', null, '26', '查看操作日志', '02', '/foundation/audit/operating-record/read/**', 'SJDK3849CKMS3849DJCK2039ZMSK0026', null);

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `portrait` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `realname` varchar(64) COLLATE utf8_bin NOT NULL,
  `state` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4wv83hfajry5tdoamn8wsqa6x` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('17909124407b8d7901407be4996c0004', 'es.nick@es.com', 'e10adc3949ba59abbe56e057f20f883e', null, 'nick.lu', '1', 'es001');
INSERT INTO `tb_user` VALUES ('17909124407b8d7901407be4996c0005', 'es.nick@es.com', 'e10adc3949ba59abbe56e057f20f883e', null, 'user1', '1', 'es002');
INSERT INTO `tb_user` VALUES ('17909124407b8d7901407be4996c0006', 'es.nick@es.com', 'e10adc3949ba59abbe56e057f20f883e', null, 'user2', '1', 'es003');
INSERT INTO `tb_user` VALUES ('17909124407b8d7901407be4996c0007', 'es.nick@es.com', 'e10adc3949ba59abbe56e057f20f883e', null, 'user3', '1', 'es004');
INSERT INTO `tb_user` VALUES ('SJDK3849CKMS3849DJCK2039ZMSK0001', 'es.chenxiaobo@gmail.com', '21232f297a57a5a743894a0e4a801fc3', null, 'vincent.chen', '1', 'admin');
