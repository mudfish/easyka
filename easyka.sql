/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : easyka

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-06-02 15:59:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) DEFAULT NULL COMMENT '所属分类ID',
  `goods_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `goods_desc` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `on_sale` tinyint(1) DEFAULT '1' COMMENT '是否上架；1是0否',
  `pic` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品图片',
  `seq_no` int(10) DEFAULT NULL COMMENT '商品排序',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品表';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('3', '3', '笑傲江湖', '笑傲江湖笑傲江湖', '0.01', '1', 'api/file/downloadImage/359669649b6741288bc741e4ded4cf59.jpg', '22', null, null, null, null);
INSERT INTO `tb_goods` VALUES ('5', '3', 'aaa', '', '0.00', '0', '', null, null, null, null, null);
INSERT INTO `tb_goods` VALUES ('9', '3', '齐天大圣', '是打发点', '10.00', '0', 'api/file/downloadImage/e3c9efc4b21b4df0833e972e7765d408.png', '2', null, null, null, null);

-- ----------------------------
-- Table structure for tb_goods_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_item`;
CREATE TABLE `tb_goods_item` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL COMMENT '所属商品',
  `km` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '卡密名称',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `order_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '归属订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='卡密';

-- ----------------------------
-- Records of tb_goods_item
-- ----------------------------
INSERT INTO `tb_goods_item` VALUES ('2', '3', 'bbbb', '2021-05-25 04:01:14', '2021431221342296');
INSERT INTO `tb_goods_item` VALUES ('3', '3', 'qqqqq', '2021-05-25 06:32:41', '20214312156271430');
INSERT INTO `tb_goods_item` VALUES ('4', '3', 'assdsd', '2021-05-25 06:32:41', '20214312156271430');
INSERT INTO `tb_goods_item` VALUES ('5', '3', 'asdfasdf', '2021-05-25 06:32:41', null);
INSERT INTO `tb_goods_item` VALUES ('6', '3', 'sdfasdfas', '2021-05-25 06:32:41', null);
INSERT INTO `tb_goods_item` VALUES ('7', '3', 'aaaa', '2021-05-25 06:43:01', null);
INSERT INTO `tb_goods_item` VALUES ('8', '3', 'bbbb', '2021-05-25 06:43:01', null);

-- ----------------------------
-- Table structure for tb_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_type`;
CREATE TABLE `tb_goods_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品类型名称',
  `type_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品类型编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='商品分类';

-- ----------------------------
-- Records of tb_goods_type
-- ----------------------------
INSERT INTO `tb_goods_type` VALUES ('3', '问道', 'wd');
INSERT INTO `tb_goods_type` VALUES ('4', '问道2', 'wd2');

-- ----------------------------
-- Table structure for tb_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_oper_log`;
CREATE TABLE `tb_oper_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oper_module` varchar(100) DEFAULT NULL COMMENT '操作模块',
  `oper_method` varchar(100) DEFAULT NULL COMMENT '操作了哪个方法',
  `oper_type` varchar(100) DEFAULT NULL COMMENT '操作类型，例如查询删除等',
  `oper_desc` varchar(500) DEFAULT NULL COMMENT '操作描述',
  `req_method` varchar(100) DEFAULT NULL COMMENT '请求方法',
  `oper_param` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `oper_ip` varchar(100) DEFAULT NULL COMMENT '请求IP',
  `oper_uri` varchar(500) DEFAULT NULL COMMENT '请求地址',
  `oper_user` varchar(100) DEFAULT NULL COMMENT '操作人',
  `create_time` varchar(50) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_oper_log
-- ----------------------------
INSERT INTO `tb_oper_log` VALUES ('129', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:17:49.865');
INSERT INTO `tb_oper_log` VALUES ('130', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.add', '新增', '新增分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/add', 'admin', '2021-05-06 12:18:04.834');
INSERT INTO `tb_oper_log` VALUES ('131', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:18:04.847');
INSERT INTO `tb_oper_log` VALUES ('132', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.modify', '修改', '修改分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/modify', 'admin', '2021-05-06 12:18:10.025');
INSERT INTO `tb_oper_log` VALUES ('133', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:18:10.064');
INSERT INTO `tb_oper_log` VALUES ('134', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:18:44.376');
INSERT INTO `tb_oper_log` VALUES ('135', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:19:02.214');
INSERT INTO `tb_oper_log` VALUES ('136', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:19:32.167');
INSERT INTO `tb_oper_log` VALUES ('137', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.remove', '删除', '删除分类', null, '{\"id\":\"1\"}', '0:0:0:0:0:0:0:1', '/goodsType/remove', 'admin', '2021-05-06 12:19:35.585');
INSERT INTO `tb_oper_log` VALUES ('138', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:33.305');
INSERT INTO `tb_oper_log` VALUES ('139', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.add', '新增', '新增分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/add', 'admin', '2021-05-06 12:20:40.444');
INSERT INTO `tb_oper_log` VALUES ('140', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:40.454');
INSERT INTO `tb_oper_log` VALUES ('141', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.remove', '删除', '删除分类', null, '{\"id\":\"2\"}', '0:0:0:0:0:0:0:1', '/goodsType/remove', 'admin', '2021-05-06 12:20:42.535');
INSERT INTO `tb_oper_log` VALUES ('142', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:42.597');
INSERT INTO `tb_oper_log` VALUES ('143', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.add', '新增', '新增分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/add', 'admin', '2021-05-06 12:20:49.01');
INSERT INTO `tb_oper_log` VALUES ('144', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:49.015');
INSERT INTO `tb_oper_log` VALUES ('145', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:52.327');
INSERT INTO `tb_oper_log` VALUES ('146', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.modify', '修改', '修改分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/modify', 'admin', '2021-05-06 12:20:52.336');
INSERT INTO `tb_oper_log` VALUES ('147', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', null, '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-06 12:20:55.687');
INSERT INTO `tb_oper_log` VALUES ('148', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.modify', '修改', '修改分类', null, '{}', '0:0:0:0:0:0:0:1', '/goodsType/modify', 'admin', '2021-05-06 12:20:55.719');
INSERT INTO `tb_oper_log` VALUES ('149', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-13 12:11:26.458');
INSERT INTO `tb_oper_log` VALUES ('150', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-13 12:11:31.521');
INSERT INTO `tb_oper_log` VALUES ('151', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 13:56:44.143');
INSERT INTO `tb_oper_log` VALUES ('152', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 13:57:27.239');
INSERT INTO `tb_oper_log` VALUES ('153', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 13:58:02.426');
INSERT INTO `tb_oper_log` VALUES ('154', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 13:59:00.092');
INSERT INTO `tb_oper_log` VALUES ('155', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 13:59:24.024');
INSERT INTO `tb_oper_log` VALUES ('156', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:03:39.311');
INSERT INTO `tb_oper_log` VALUES ('157', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:04:11.306');
INSERT INTO `tb_oper_log` VALUES ('158', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:04:26.75');
INSERT INTO `tb_oper_log` VALUES ('159', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:04:44.401');
INSERT INTO `tb_oper_log` VALUES ('160', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:05:01.631');
INSERT INTO `tb_oper_log` VALUES ('161', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:07:54.817');
INSERT INTO `tb_oper_log` VALUES ('162', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-13 14:08:15.968');
INSERT INTO `tb_oper_log` VALUES ('163', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:08:16.004');
INSERT INTO `tb_oper_log` VALUES ('164', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:09:12.97');
INSERT INTO `tb_oper_log` VALUES ('165', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:09:32.253');
INSERT INTO `tb_oper_log` VALUES ('166', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:09:55.488');
INSERT INTO `tb_oper_log` VALUES ('167', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:10:32.72');
INSERT INTO `tb_oper_log` VALUES ('168', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:11:03.747');
INSERT INTO `tb_oper_log` VALUES ('169', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-13 14:11:24.499');
INSERT INTO `tb_oper_log` VALUES ('170', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-13 14:11:24.547');
INSERT INTO `tb_oper_log` VALUES ('171', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 01:29:06.455');
INSERT INTO `tb_oper_log` VALUES ('172', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 01:29:35.635');
INSERT INTO `tb_oper_log` VALUES ('173', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 01:45:12.74');
INSERT INTO `tb_oper_log` VALUES ('174', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-14 01:45:39.587');
INSERT INTO `tb_oper_log` VALUES ('175', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 01:45:39.587');
INSERT INTO `tb_oper_log` VALUES ('176', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 02:02:03.84');
INSERT INTO `tb_oper_log` VALUES ('177', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-14 02:02:19.478');
INSERT INTO `tb_oper_log` VALUES ('178', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 02:02:19.522');
INSERT INTO `tb_oper_log` VALUES ('179', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-14 02:02:35.944');
INSERT INTO `tb_oper_log` VALUES ('180', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 02:02:35.979');
INSERT INTO `tb_oper_log` VALUES ('181', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-14 02:02:47.07');
INSERT INTO `tb_oper_log` VALUES ('182', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 02:02:47.11');
INSERT INTO `tb_oper_log` VALUES ('183', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 02:07:46.965');
INSERT INTO `tb_oper_log` VALUES ('184', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 05:19:52.982');
INSERT INTO `tb_oper_log` VALUES ('185', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 05:21:27.6');
INSERT INTO `tb_oper_log` VALUES ('186', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 05:47:25.572');
INSERT INTO `tb_oper_log` VALUES ('187', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 05:48:22.598');
INSERT INTO `tb_oper_log` VALUES ('188', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:43:47.328');
INSERT INTO `tb_oper_log` VALUES ('189', '商品管理', 'com.laoxu.game.controller.GoodsController.modify', '修改', '修改商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/modify', 'admin', '2021-05-14 06:43:58.735');
INSERT INTO `tb_oper_log` VALUES ('190', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:45:05.39');
INSERT INTO `tb_oper_log` VALUES ('191', '商品管理', 'com.laoxu.game.controller.GoodsController.modify', '修改', '修改商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/modify', 'admin', '2021-05-14 06:45:16.837');
INSERT INTO `tb_oper_log` VALUES ('192', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:45:16.872');
INSERT INTO `tb_oper_log` VALUES ('193', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:45:25.718');
INSERT INTO `tb_oper_log` VALUES ('194', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 06:46:35.937');
INSERT INTO `tb_oper_log` VALUES ('195', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:46:35.984');
INSERT INTO `tb_oper_log` VALUES ('196', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:46:38.423');
INSERT INTO `tb_oper_log` VALUES ('197', '商品管理', 'com.laoxu.game.controller.GoodsController.modify', '修改', '修改商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/modify', 'admin', '2021-05-14 06:46:44.154');
INSERT INTO `tb_oper_log` VALUES ('198', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:46:44.183');
INSERT INTO `tb_oper_log` VALUES ('199', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 06:46:51.875');
INSERT INTO `tb_oper_log` VALUES ('200', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:17.487');
INSERT INTO `tb_oper_log` VALUES ('201', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"2\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 07:05:21.868');
INSERT INTO `tb_oper_log` VALUES ('202', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:21.936');
INSERT INTO `tb_oper_log` VALUES ('203', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"4\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 07:05:24.026');
INSERT INTO `tb_oper_log` VALUES ('204', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:24.082');
INSERT INTO `tb_oper_log` VALUES ('205', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"6\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 07:05:26.443');
INSERT INTO `tb_oper_log` VALUES ('206', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:26.502');
INSERT INTO `tb_oper_log` VALUES ('207', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"7\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 07:05:32.526');
INSERT INTO `tb_oper_log` VALUES ('208', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:32.569');
INSERT INTO `tb_oper_log` VALUES ('209', '商品管理', 'com.laoxu.game.controller.GoodsController.remove', '删除', '删除商品', 'POST', '{\"id\":\"8\"}', '0:0:0:0:0:0:0:1', '/goods/remove', 'admin', '2021-05-14 07:05:34.209');
INSERT INTO `tb_oper_log` VALUES ('210', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:34.249');
INSERT INTO `tb_oper_log` VALUES ('211', '商品管理', 'com.laoxu.game.controller.GoodsController.add', '新增', '新增商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/add', 'admin', '2021-05-14 07:05:53.834');
INSERT INTO `tb_oper_log` VALUES ('212', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-14 07:05:53.865');
INSERT INTO `tb_oper_log` VALUES ('213', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:17:19.446');
INSERT INTO `tb_oper_log` VALUES ('214', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-24 07:17:23.141');
INSERT INTO `tb_oper_log` VALUES ('215', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:33:30.153');
INSERT INTO `tb_oper_log` VALUES ('216', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:35:17.675');
INSERT INTO `tb_oper_log` VALUES ('217', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:40:01.558');
INSERT INTO `tb_oper_log` VALUES ('218', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:40:28.15');
INSERT INTO `tb_oper_log` VALUES ('219', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:40:29.584');
INSERT INTO `tb_oper_log` VALUES ('220', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:40:55.892');
INSERT INTO `tb_oper_log` VALUES ('221', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:41:05.047');
INSERT INTO `tb_oper_log` VALUES ('222', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:41:28.555');
INSERT INTO `tb_oper_log` VALUES ('223', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:41:30.477');
INSERT INTO `tb_oper_log` VALUES ('224', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:00.77');
INSERT INTO `tb_oper_log` VALUES ('225', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:02.085');
INSERT INTO `tb_oper_log` VALUES ('226', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:02.125');
INSERT INTO `tb_oper_log` VALUES ('227', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:03.944');
INSERT INTO `tb_oper_log` VALUES ('228', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:03.987');
INSERT INTO `tb_oper_log` VALUES ('229', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:05.045');
INSERT INTO `tb_oper_log` VALUES ('230', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:05.084');
INSERT INTO `tb_oper_log` VALUES ('231', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:06.119');
INSERT INTO `tb_oper_log` VALUES ('232', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:06.159');
INSERT INTO `tb_oper_log` VALUES ('233', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:08.786');
INSERT INTO `tb_oper_log` VALUES ('234', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:08.827');
INSERT INTO `tb_oper_log` VALUES ('235', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:09.728');
INSERT INTO `tb_oper_log` VALUES ('236', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:09.792');
INSERT INTO `tb_oper_log` VALUES ('237', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:10.352');
INSERT INTO `tb_oper_log` VALUES ('238', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:10.393');
INSERT INTO `tb_oper_log` VALUES ('239', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:10.836');
INSERT INTO `tb_oper_log` VALUES ('240', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:10.876');
INSERT INTO `tb_oper_log` VALUES ('241', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:11.111');
INSERT INTO `tb_oper_log` VALUES ('242', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:11.182');
INSERT INTO `tb_oper_log` VALUES ('243', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:14.902');
INSERT INTO `tb_oper_log` VALUES ('244', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:14.943');
INSERT INTO `tb_oper_log` VALUES ('245', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:42:16.395');
INSERT INTO `tb_oper_log` VALUES ('246', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:42:16.433');
INSERT INTO `tb_oper_log` VALUES ('247', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:24.157');
INSERT INTO `tb_oper_log` VALUES ('248', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:43:27.678');
INSERT INTO `tb_oper_log` VALUES ('249', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:27.719');
INSERT INTO `tb_oper_log` VALUES ('250', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:43:28.804');
INSERT INTO `tb_oper_log` VALUES ('251', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:28.84');
INSERT INTO `tb_oper_log` VALUES ('252', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:44.062');
INSERT INTO `tb_oper_log` VALUES ('253', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:43:46.219');
INSERT INTO `tb_oper_log` VALUES ('254', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:46.259');
INSERT INTO `tb_oper_log` VALUES ('255', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:43:47.279');
INSERT INTO `tb_oper_log` VALUES ('256', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:47.317');
INSERT INTO `tb_oper_log` VALUES ('257', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"3\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:43:48.67');
INSERT INTO `tb_oper_log` VALUES ('258', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:43:48.708');
INSERT INTO `tb_oper_log` VALUES ('259', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:44:06.553');
INSERT INTO `tb_oper_log` VALUES ('260', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:44:08.195');
INSERT INTO `tb_oper_log` VALUES ('261', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:44:08.237');
INSERT INTO `tb_oper_log` VALUES ('262', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"1\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:44:08.978');
INSERT INTO `tb_oper_log` VALUES ('263', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:44:09.016');
INSERT INTO `tb_oper_log` VALUES ('264', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"5\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-24 07:44:11.671');
INSERT INTO `tb_oper_log` VALUES ('265', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-24 07:44:11.734');
INSERT INTO `tb_oper_log` VALUES ('266', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-24 09:24:27.402');
INSERT INTO `tb_oper_log` VALUES ('267', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-24 09:26:47.089');
INSERT INTO `tb_oper_log` VALUES ('268', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-24 09:26:54.039');
INSERT INTO `tb_oper_log` VALUES ('269', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-24 09:27:11.018');
INSERT INTO `tb_oper_log` VALUES ('270', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-24 09:53:59.311');
INSERT INTO `tb_oper_log` VALUES ('271', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:03:16.894');
INSERT INTO `tb_oper_log` VALUES ('272', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:03:48.95');
INSERT INTO `tb_oper_log` VALUES ('273', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-25 01:04:17.297');
INSERT INTO `tb_oper_log` VALUES ('274', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:04:18.257');
INSERT INTO `tb_oper_log` VALUES ('275', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:04:43.171');
INSERT INTO `tb_oper_log` VALUES ('276', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:04:45.578');
INSERT INTO `tb_oper_log` VALUES ('277', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:47:18.424');
INSERT INTO `tb_oper_log` VALUES ('278', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:52:16.192');
INSERT INTO `tb_oper_log` VALUES ('279', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 01:54:54.803');
INSERT INTO `tb_oper_log` VALUES ('280', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:04:07.33');
INSERT INTO `tb_oper_log` VALUES ('281', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:05:11.528');
INSERT INTO `tb_oper_log` VALUES ('282', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:05:28.345');
INSERT INTO `tb_oper_log` VALUES ('283', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:06:18.141');
INSERT INTO `tb_oper_log` VALUES ('284', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:06:39.394');
INSERT INTO `tb_oper_log` VALUES ('285', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:07:09.171');
INSERT INTO `tb_oper_log` VALUES ('286', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:09:36.801');
INSERT INTO `tb_oper_log` VALUES ('287', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:45:25.516');
INSERT INTO `tb_oper_log` VALUES ('288', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:46:00.186');
INSERT INTO `tb_oper_log` VALUES ('289', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:46:31.581');
INSERT INTO `tb_oper_log` VALUES ('290', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:46:43.328');
INSERT INTO `tb_oper_log` VALUES ('291', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:47:00.602');
INSERT INTO `tb_oper_log` VALUES ('292', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:49:39.569');
INSERT INTO `tb_oper_log` VALUES ('293', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:50:01.29');
INSERT INTO `tb_oper_log` VALUES ('294', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:51:11.528');
INSERT INTO `tb_oper_log` VALUES ('295', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:53:52.595');
INSERT INTO `tb_oper_log` VALUES ('296', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 02:54:42.977');
INSERT INTO `tb_oper_log` VALUES ('297', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:00:37.742');
INSERT INTO `tb_oper_log` VALUES ('298', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:00:50.881');
INSERT INTO `tb_oper_log` VALUES ('299', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:03:41.05');
INSERT INTO `tb_oper_log` VALUES ('300', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:03:54.609');
INSERT INTO `tb_oper_log` VALUES ('301', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:08:06.172');
INSERT INTO `tb_oper_log` VALUES ('302', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:08:11.571');
INSERT INTO `tb_oper_log` VALUES ('303', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:09:20.992');
INSERT INTO `tb_oper_log` VALUES ('304', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:09:33.677');
INSERT INTO `tb_oper_log` VALUES ('305', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:17:48.291');
INSERT INTO `tb_oper_log` VALUES ('306', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:17:56.839');
INSERT INTO `tb_oper_log` VALUES ('307', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:22:33.55');
INSERT INTO `tb_oper_log` VALUES ('308', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:22:38.62');
INSERT INTO `tb_oper_log` VALUES ('309', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:31:25.185');
INSERT INTO `tb_oper_log` VALUES ('310', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:31:30.297');
INSERT INTO `tb_oper_log` VALUES ('311', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:32:05.141');
INSERT INTO `tb_oper_log` VALUES ('312', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:32:49.548');
INSERT INTO `tb_oper_log` VALUES ('313', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:32:53.716');
INSERT INTO `tb_oper_log` VALUES ('314', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-25 03:43:43.35');
INSERT INTO `tb_oper_log` VALUES ('315', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:43:43.898');
INSERT INTO `tb_oper_log` VALUES ('316', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:43:48.893');
INSERT INTO `tb_oper_log` VALUES ('317', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-25 03:44:56.531');
INSERT INTO `tb_oper_log` VALUES ('318', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:44:58.485');
INSERT INTO `tb_oper_log` VALUES ('319', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:45:02.536');
INSERT INTO `tb_oper_log` VALUES ('320', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:45:23.422');
INSERT INTO `tb_oper_log` VALUES ('321', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:46:49.898');
INSERT INTO `tb_oper_log` VALUES ('322', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:47:07.711');
INSERT INTO `tb_oper_log` VALUES ('323', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:47:07.831');
INSERT INTO `tb_oper_log` VALUES ('324', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:47:50.492');
INSERT INTO `tb_oper_log` VALUES ('325', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:47:54.098');
INSERT INTO `tb_oper_log` VALUES ('326', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:48:05.716');
INSERT INTO `tb_oper_log` VALUES ('327', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:48:48.76');
INSERT INTO `tb_oper_log` VALUES ('328', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:48:53.59');
INSERT INTO `tb_oper_log` VALUES ('329', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:49:09.988');
INSERT INTO `tb_oper_log` VALUES ('330', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:49:29.587');
INSERT INTO `tb_oper_log` VALUES ('331', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:51:09.077');
INSERT INTO `tb_oper_log` VALUES ('332', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:51:12.86');
INSERT INTO `tb_oper_log` VALUES ('333', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:51:17.886');
INSERT INTO `tb_oper_log` VALUES ('334', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:53:43.755');
INSERT INTO `tb_oper_log` VALUES ('335', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:53:48.621');
INSERT INTO `tb_oper_log` VALUES ('336', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:55:00.743');
INSERT INTO `tb_oper_log` VALUES ('337', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:55:09.964');
INSERT INTO `tb_oper_log` VALUES ('338', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:55:22.587');
INSERT INTO `tb_oper_log` VALUES ('339', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:55:31.524');
INSERT INTO `tb_oper_log` VALUES ('340', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:58:46.808');
INSERT INTO `tb_oper_log` VALUES ('341', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:59:00.795');
INSERT INTO `tb_oper_log` VALUES ('342', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:59:17.944');
INSERT INTO `tb_oper_log` VALUES ('343', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:59:25.147');
INSERT INTO `tb_oper_log` VALUES ('344', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:59:51.906');
INSERT INTO `tb_oper_log` VALUES ('345', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 03:59:58.971');
INSERT INTO `tb_oper_log` VALUES ('346', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 04:01:05.018');
INSERT INTO `tb_oper_log` VALUES ('347', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 04:01:14.148');
INSERT INTO `tb_oper_log` VALUES ('348', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:09:57.552');
INSERT INTO `tb_oper_log` VALUES ('349', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:15:25.501');
INSERT INTO `tb_oper_log` VALUES ('350', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:15:38.594');
INSERT INTO `tb_oper_log` VALUES ('351', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:19:57.951');
INSERT INTO `tb_oper_log` VALUES ('352', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.remove', '删除', '删除卡密', 'POST', '{\"id\":\"1\"}', '0:0:0:0:0:0:0:1', '/km/remove', 'admin', '2021-05-25 06:20:08.123');
INSERT INTO `tb_oper_log` VALUES ('353', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:20:08.168');
INSERT INTO `tb_oper_log` VALUES ('354', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-25 06:20:35.026');
INSERT INTO `tb_oper_log` VALUES ('355', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-25 06:20:36.971');
INSERT INTO `tb_oper_log` VALUES ('356', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:28:12.418');
INSERT INTO `tb_oper_log` VALUES ('357', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-25 06:32:13.077');
INSERT INTO `tb_oper_log` VALUES ('358', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-25 06:32:13.952');
INSERT INTO `tb_oper_log` VALUES ('359', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:32:40.67');
INSERT INTO `tb_oper_log` VALUES ('360', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:33:04.644');
INSERT INTO `tb_oper_log` VALUES ('361', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-25 06:43:01.58');
INSERT INTO `tb_oper_log` VALUES ('362', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-30 15:26:16.091');
INSERT INTO `tb_oper_log` VALUES ('363', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-30 15:26:25.24');
INSERT INTO `tb_oper_log` VALUES ('364', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.add', '新增', '新增分类', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goodsType/add', 'admin', '2021-05-30 15:26:25.298');
INSERT INTO `tb_oper_log` VALUES ('365', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-05-30 15:26:35.654');
INSERT INTO `tb_oper_log` VALUES ('366', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 05:51:31.914');
INSERT INTO `tb_oper_log` VALUES ('367', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 05:51:56.237');
INSERT INTO `tb_oper_log` VALUES ('368', '商品管理', 'com.laoxu.game.controller.GoodsController.modify', '修改', '修改商品', 'POST', '{}', '0:0:0:0:0:0:0:1', '/goods/modify', 'admin', '2021-05-31 05:51:56.26');
INSERT INTO `tb_oper_log` VALUES ('369', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-31 06:25:42.404');
INSERT INTO `tb_oper_log` VALUES ('370', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 06:25:42.876');
INSERT INTO `tb_oper_log` VALUES ('371', '商品管理', 'com.laoxu.game.controller.GoodsController.changeSaleState', '修改', '修改商品状态', 'POST', '{\"id\":\"9\",\"state\":\"0\"}', '0:0:0:0:0:0:0:1', '/goods/changeSaleState', 'admin', '2021-05-31 06:25:48.001');
INSERT INTO `tb_oper_log` VALUES ('372', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 06:25:48.046');
INSERT INTO `tb_oper_log` VALUES ('373', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-31 11:33:48.178');
INSERT INTO `tb_oper_log` VALUES ('374', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 11:33:59.27');
INSERT INTO `tb_oper_log` VALUES ('375', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-05-31 11:43:07.499');
INSERT INTO `tb_oper_log` VALUES ('376', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-05-31 14:30:21.968');
INSERT INTO `tb_oper_log` VALUES ('377', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:15:48.423');
INSERT INTO `tb_oper_log` VALUES ('378', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-01 11:15:54.497');
INSERT INTO `tb_oper_log` VALUES ('379', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:16:10.973');
INSERT INTO `tb_oper_log` VALUES ('380', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:17:44.781');
INSERT INTO `tb_oper_log` VALUES ('381', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:19:42.206');
INSERT INTO `tb_oper_log` VALUES ('382', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:19:56.491');
INSERT INTO `tb_oper_log` VALUES ('383', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:20:10.44');
INSERT INTO `tb_oper_log` VALUES ('384', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:20:18.586');
INSERT INTO `tb_oper_log` VALUES ('385', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:21:02.723');
INSERT INTO `tb_oper_log` VALUES ('386', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:21:26.825');
INSERT INTO `tb_oper_log` VALUES ('387', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:21:41.11');
INSERT INTO `tb_oper_log` VALUES ('388', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:21:51.386');
INSERT INTO `tb_oper_log` VALUES ('389', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:16.814');
INSERT INTO `tb_oper_log` VALUES ('390', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\",\"keyword\":\"20214312156271430\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:20.487');
INSERT INTO `tb_oper_log` VALUES ('391', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:27.417');
INSERT INTO `tb_oper_log` VALUES ('392', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\",\"keyword\":\"11111\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:32.16');
INSERT INTO `tb_oper_log` VALUES ('393', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:34.746');
INSERT INTO `tb_oper_log` VALUES ('394', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\",\"keyword\":\"4200001005202105314816604275\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:37.361');
INSERT INTO `tb_oper_log` VALUES ('395', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\",\"keyword\":\"42000010052021053148166\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:40.191');
INSERT INTO `tb_oper_log` VALUES ('396', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:24:42.717');
INSERT INTO `tb_oper_log` VALUES ('397', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:27:00.027');
INSERT INTO `tb_oper_log` VALUES ('398', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:27:29.992');
INSERT INTO `tb_oper_log` VALUES ('399', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:27:58.135');
INSERT INTO `tb_oper_log` VALUES ('400', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:28:27.143');
INSERT INTO `tb_oper_log` VALUES ('401', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:30:18.73');
INSERT INTO `tb_oper_log` VALUES ('402', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:30:56.623');
INSERT INTO `tb_oper_log` VALUES ('403', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:30:57.681');
INSERT INTO `tb_oper_log` VALUES ('404', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:30:58.661');
INSERT INTO `tb_oper_log` VALUES ('405', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:30:59.512');
INSERT INTO `tb_oper_log` VALUES ('406', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:00.271');
INSERT INTO `tb_oper_log` VALUES ('407', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:01.038');
INSERT INTO `tb_oper_log` VALUES ('408', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:01.772');
INSERT INTO `tb_oper_log` VALUES ('409', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:02.489');
INSERT INTO `tb_oper_log` VALUES ('410', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:03.317');
INSERT INTO `tb_oper_log` VALUES ('411', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:04.035');
INSERT INTO `tb_oper_log` VALUES ('412', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:04.611');
INSERT INTO `tb_oper_log` VALUES ('413', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:31:05.373');
INSERT INTO `tb_oper_log` VALUES ('414', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:32:23.325');
INSERT INTO `tb_oper_log` VALUES ('415', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:33:04.738');
INSERT INTO `tb_oper_log` VALUES ('416', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:33:06.88');
INSERT INTO `tb_oper_log` VALUES ('417', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:33:07.59');
INSERT INTO `tb_oper_log` VALUES ('418', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:33:08.391');
INSERT INTO `tb_oper_log` VALUES ('419', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:33:51.788');
INSERT INTO `tb_oper_log` VALUES ('420', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-01 11:34:33.683');
INSERT INTO `tb_oper_log` VALUES ('421', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '127.0.0.1', '/order/list', 'admin', '2021-06-01 11:37:31.969');
INSERT INTO `tb_oper_log` VALUES ('422', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 06:07:07.645');
INSERT INTO `tb_oper_log` VALUES ('423', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 06:07:33.377');
INSERT INTO `tb_oper_log` VALUES ('424', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 06:14:10.063');
INSERT INTO `tb_oper_log` VALUES ('425', '商品管理', 'com.laoxu.game.controller.GoodsController.list', '查询', '查询商品列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goods/list', 'admin', '2021-06-02 06:14:28.664');
INSERT INTO `tb_oper_log` VALUES ('426', '分类管理', 'com.laoxu.game.controller.GoodsTypeController.list', '查询', '查询分类列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/goodsType/list', 'admin', '2021-06-02 06:14:30.415');
INSERT INTO `tb_oper_log` VALUES ('427', '用户管理', 'com.laoxu.game.controller.OperLogController.remove', '删除', '删除用户', 'POST', '{\"id\":\"128\"}', '0:0:0:0:0:0:0:1', '/operlog/remove', 'admin', '2021-06-02 06:14:38.69');
INSERT INTO `tb_oper_log` VALUES ('428', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 06:52:31.611');
INSERT INTO `tb_oper_log` VALUES ('429', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 06:52:57.262');
INSERT INTO `tb_oper_log` VALUES ('430', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 06:53:53.974');
INSERT INTO `tb_oper_log` VALUES ('431', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:14:58.831');
INSERT INTO `tb_oper_log` VALUES ('432', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:15:09.038');
INSERT INTO `tb_oper_log` VALUES ('433', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:20:42.264');
INSERT INTO `tb_oper_log` VALUES ('434', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:20:42.843');
INSERT INTO `tb_oper_log` VALUES ('435', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:22:18.447');
INSERT INTO `tb_oper_log` VALUES ('436', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:22:20.409');
INSERT INTO `tb_oper_log` VALUES ('437', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:23:06.801');
INSERT INTO `tb_oper_log` VALUES ('438', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:23:07.746');
INSERT INTO `tb_oper_log` VALUES ('439', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:25:39.184');
INSERT INTO `tb_oper_log` VALUES ('440', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:25:39.699');
INSERT INTO `tb_oper_log` VALUES ('441', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:26:24.973');
INSERT INTO `tb_oper_log` VALUES ('442', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:26:25.409');
INSERT INTO `tb_oper_log` VALUES ('443', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:32:36.499');
INSERT INTO `tb_oper_log` VALUES ('444', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:32:39.479');
INSERT INTO `tb_oper_log` VALUES ('445', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:33:58.968');
INSERT INTO `tb_oper_log` VALUES ('446', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:34:01.375');
INSERT INTO `tb_oper_log` VALUES ('447', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:40:02.219');
INSERT INTO `tb_oper_log` VALUES ('448', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:40:03.614');
INSERT INTO `tb_oper_log` VALUES ('449', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:41:48.867');
INSERT INTO `tb_oper_log` VALUES ('450', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:41:49.254');
INSERT INTO `tb_oper_log` VALUES ('451', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:42:38.715');
INSERT INTO `tb_oper_log` VALUES ('452', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:42:39.932');
INSERT INTO `tb_oper_log` VALUES ('453', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:42:55.93');
INSERT INTO `tb_oper_log` VALUES ('454', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:42:56.375');
INSERT INTO `tb_oper_log` VALUES ('455', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:44:14.24');
INSERT INTO `tb_oper_log` VALUES ('456', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:44:14.679');
INSERT INTO `tb_oper_log` VALUES ('457', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:46:20.502');
INSERT INTO `tb_oper_log` VALUES ('458', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:46:21.35');
INSERT INTO `tb_oper_log` VALUES ('459', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:46:45.459');
INSERT INTO `tb_oper_log` VALUES ('460', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:46:46.001');
INSERT INTO `tb_oper_log` VALUES ('461', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:47:14.946');
INSERT INTO `tb_oper_log` VALUES ('462', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:47:23.072');
INSERT INTO `tb_oper_log` VALUES ('463', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:47:23.675');
INSERT INTO `tb_oper_log` VALUES ('464', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:48:33.207');
INSERT INTO `tb_oper_log` VALUES ('465', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:48:34.414');
INSERT INTO `tb_oper_log` VALUES ('466', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:49:25.899');
INSERT INTO `tb_oper_log` VALUES ('467', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:49:26.406');
INSERT INTO `tb_oper_log` VALUES ('468', '订单管理', 'com.laoxu.game.controller.OrderController.list', '查询', '查询订单列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/order/list', 'admin', '2021-06-02 07:58:47.445');
INSERT INTO `tb_oper_log` VALUES ('469', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:58:47.799');
INSERT INTO `tb_oper_log` VALUES ('470', '卡密管理', 'com.laoxu.game.controller.GoodsItemController.list', '查询', '查询卡密列表', 'POST', '{\"pageNo\":\"1\",\"pageSize\":\"10\"}', '0:0:0:0:0:0:0:1', '/km/list', 'admin', '2021-06-02 07:58:54.587');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `pay_no` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易流水号',
  `channel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支付渠道；ali；wx',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品ID',
  `contact` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `create_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '下单时间',
  `pay_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易时间',
  `qty` int(10) DEFAULT NULL COMMENT '购买数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '交易金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '订单状态： 0未支付；1已支付；2已处理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('22', '20214312156271430', '2021053122001409131409812331', 'alipay', '3', '11111', '2021-05-31 21:56:14:273', '2021-05-31 21:56:56', '2', '0.02', '1');
INSERT INTO `tb_order` VALUES ('23', '2021431221342296', '4200001005202105314816604275', 'wxpay', '3', '22222', '2021-05-31 22:01:32:539', '2021-05-31 22:01:50', '1', '0.01', '1');
INSERT INTO `tb_order` VALUES ('24', '2021511928738460', null, 'wxpay', '3', '3333333333', '2021-06-01 19:28:19:509', null, '1', '0.01', '0');

-- ----------------------------
-- Table structure for tb_site_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_config`;
CREATE TABLE `tb_site_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '站点名称',
  `contact1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式1',
  `notice` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公告',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='网站设置';

-- ----------------------------
-- Records of tb_site_config
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'e3d0c85bf9d69d7ff11c1440a870d6c7');
