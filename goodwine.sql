/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : goodwine

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 03/01/2020 16:31:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_color` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `product_memory` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_series` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品系列',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (3, 38, 299, 2, 1, 649.00, '碳岩灰', '4GB+64GB', 'http://img14.360buyimg.com/n1/s450x450_jfs/t1/103067/21/18/156415/5da59efbE7dc457c5/35dead87733b4c84.jpg', 'Redmi 8', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '2018-08-27 17:18:02', '3', '12');
INSERT INTO `oms_cart_item` VALUES (4, 45, 370, 3, 1, 699.00, '亮黑色', '4GB+64GB', 'http://img10.360buyimg.com/n1/s450x450_jfs/t1/35948/36/1202/113456/5cb06aabEfd11e283/faa31d6ef83442de.jpg', 'Redmi 7', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '2018-08-28 10:22:45', '3', '12');
INSERT INTO `oms_cart_item` VALUES (5, 12, 3, 4, 1, 5499.00, '金色', '256GB', 'http://img10.360buyimg.com/n1/s450x450_jfs/t7684/47/3033720409/308884/b9aedc24/59b848cdN41d277a2.jpg', 'iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '2018-08-28 10:50:50', '1', '1');
INSERT INTO `oms_cart_item` VALUES (10, 29, NULL, 1, 2, 399.00, '梦之白', '8GB+128GB', 'https://img06.jiuxian.com/2019/0225/8ff27752af0d4358a8456913a00502d62.jpg', '葡萄酒', '西班牙安徒生·夜莺干红葡萄酒750ml', NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (11, 7, NULL, NULL, 1, 19.90, '7', '', 'https://img09.jiuxian.com/2019/1126/2a1a5f50fb5743c39742607dcaf9f5f12.jpg', '酱香型', '53°郑酒师 壹号品鉴酒 酱香型白酒 坤沙小酒版 贵州茅台镇  固态纯粮 单瓶100ml', NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (17, 30, NULL, 11, 5, 399.00, '30', '', 'https://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e12.jpg', '浓香型', '法国狮吼堡（升级版）干红葡萄酒750ml法国狮吼堡（升级版）干红葡萄酒750ml', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `member_address_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货信息',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 18732.00, 0.00, 10.00, 1, 1, 0, '申通快递', '214879523412568', 15, 13284, '东晓街道', '无', 0, 0, 2000, '2019-10-29 20:56:39', '2019-11-01 20:56:47', '2019-11-04 20:56:56', '2019-11-08 20:57:47');
INSERT INTO `oms_order` VALUES (13, 2, 2, '201809150102000002', '2018-09-15 14:24:29', 17894.00, 0.00, 10.00, 1, 1, 0, '圆通快递', '201845795138964', 15, 13284, '东晓街道', '无', 0, 0, 1000, '2018-10-11 14:04:19', '2019-11-02 20:56:51', '2019-11-02 20:57:07', '2019-11-07 20:57:52');
INSERT INTO `oms_order` VALUES (14, 3, 2, '201809130101000001', '2018-09-13 16:57:40', 18451.00, 0.00, 10.00, 1, 1, 0, '顺丰快递', '201707196398345', 15, 13284, '东晓街道', '无', 0, 0, 1500, '2018-10-13 13:44:04', '2018-10-16 13:43:41', '2019-10-16 20:57:16', '2019-10-30 20:57:56');
INSERT INTO `oms_order` VALUES (15, 4, 2, '201809130102000002', '2018-09-13 17:03:00', 16457.00, 0.00, 10.00, 1, 1, 0, '顺丰快递', '201707196398346', 15, 13284, '东晓街道', '无', 1, 0, 2000, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', '2019-10-24 20:58:01');
INSERT INTO `oms_order` VALUES (30, 1, NULL, '991577930935283', '2020-01-02 10:08:55', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341577930935283', NULL, 1046, NULL, NULL, NULL, 0, 2000, '2020-01-02 10:08:55', NULL, NULL, '2020-01-02 10:08:55');
INSERT INTO `oms_order` VALUES (31, 1, NULL, '001578031628942', '2020-01-03 14:07:09', NULL, 17.00, NULL, 1, 1, NULL, NULL, '341578031628942', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:07:09', NULL, NULL, '2020-01-03 14:07:09');
INSERT INTO `oms_order` VALUES (32, 1, NULL, '261578031667094', '2020-01-03 14:07:47', NULL, 17.00, NULL, 1, 1, NULL, NULL, '341578031667094', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:07:47', NULL, NULL, '2020-01-03 14:07:47');
INSERT INTO `oms_order` VALUES (33, 1, NULL, '611578031736449', '2020-01-03 14:08:56', NULL, 17.00, NULL, 1, 1, NULL, NULL, '341578031736449', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:08:56', NULL, NULL, '2020-01-03 14:08:56');
INSERT INTO `oms_order` VALUES (34, 1, NULL, '701578031750633', '2020-01-03 14:09:11', NULL, 17.00, NULL, 1, 1, NULL, NULL, '341578031750633', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:09:11', NULL, NULL, '2020-01-03 14:09:11');
INSERT INTO `oms_order` VALUES (35, 1, NULL, '581578031759913', '2020-01-03 14:09:20', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031759913', NULL, 2298, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:09:20', NULL, NULL, '2020-01-03 14:09:20');
INSERT INTO `oms_order` VALUES (36, 1, NULL, '341578031764903', '2020-01-03 14:09:25', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031764903', NULL, 2298, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:09:25', NULL, NULL, '2020-01-03 14:09:25');
INSERT INTO `oms_order` VALUES (37, 1, NULL, '831578031779513', '2020-01-03 14:09:40', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031779513', NULL, 4798, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:09:40', NULL, NULL, '2020-01-03 14:09:40');
INSERT INTO `oms_order` VALUES (38, 1, NULL, '631578031803400', '2020-01-03 14:10:03', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031803400', NULL, 499, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:10:03', NULL, NULL, '2020-01-03 14:10:03');
INSERT INTO `oms_order` VALUES (39, 1, NULL, '801578031831834', '2020-01-03 14:10:32', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031831834', NULL, 2299, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:10:32', NULL, NULL, '2020-01-03 14:10:32');
INSERT INTO `oms_order` VALUES (40, 1, NULL, '861578031835560', '2020-01-03 14:10:36', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031835560', NULL, 2299, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:10:36', NULL, NULL, '2020-01-03 14:10:36');
INSERT INTO `oms_order` VALUES (41, 1, NULL, '141578031839087', '2020-01-03 14:10:39', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031839087', NULL, 2299, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:10:39', NULL, NULL, '2020-01-03 14:10:39');
INSERT INTO `oms_order` VALUES (42, 1, NULL, '031578031845991', '2020-01-03 14:10:46', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031845991', NULL, 4798, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:10:46', NULL, NULL, '2020-01-03 14:10:46');
INSERT INTO `oms_order` VALUES (43, 1, NULL, '411578031896825', '2020-01-03 14:11:37', NULL, 20.00, NULL, 1, 1, NULL, NULL, '341578031896825', NULL, 4798, NULL, NULL, NULL, 0, 2000, '2020-01-03 14:11:37', NULL, NULL, '2020-01-03 14:11:37');
INSERT INTO `oms_order` VALUES (44, 1, NULL, '831578039970051', '2020-01-03 16:26:10', NULL, 9.00, NULL, 0, NULL, NULL, NULL, '341578039970051', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 16:26:10', NULL, NULL, '2020-01-03 16:26:10');
INSERT INTO `oms_order` VALUES (45, 1, NULL, '361578039976652', '2020-01-03 16:26:17', NULL, 9.00, NULL, 0, NULL, NULL, NULL, '341578039976652', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 16:26:17', NULL, NULL, '2020-01-03 16:26:17');
INSERT INTO `oms_order` VALUES (46, 1, NULL, '351578039981194', '2020-01-03 16:26:21', NULL, 9.00, NULL, 0, NULL, NULL, NULL, '341578039981194', NULL, NULL, NULL, NULL, NULL, 0, 2000, '2020-01-03 16:26:21', NULL, NULL, '2020-01-03 16:26:21');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_series` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品系列',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机颜色',
  `product_memory` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机存储',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送积分',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 14, 'http://macro-oss.oss-cn-http://img12.360buyimg.com/n1/s450x450_jfs/t1/23465/6/12585/205701/5c98cb2eE9c893f3d/19e242e358426873.jpg', 'HUAWEI P30', '华为', 'HUAWEI P系列', 3788.00, 1, 90, '亮黑色', '8GB+128GB', 2.02, 0.00, 3585.98, 3788);
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '小米系列', 2699.00, 3, 98, '宝石蓝', '8GB+256GB', 1.44, 0.00, 2022.81, 2699);
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 649.00, 1, 102, '亮黑色', '6GB+128GB', 0.35, 0.00, 591.05, 649);
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 699.00, 1, 103, '亮黑色', '6GB+128GB', 0.37, 0.00, 636.23, 649);
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', 'iPhone 8', 5499.00, 1, 106, '翡冷翠', '6GB+64GB', 2.94, 0.00, 5496.06, 5499);
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 14, 'http://macro-oss.oss-cn-http://img12.360buyimg.com/n1/s450x450_jfs/t1/23465/6/12585/205701/5c98cb2eE9c893f3d/19e242e358426873.jpg', 'HUAWEI P30', '华为', 'HUAWEI P系列', 3788.00, 1, 90, '亮黑色', '8GB+128GB', 2.02, 0.00, 3585.98, 3788);
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '小米系列', 2699.00, 3, 98, '宝石蓝', '8GB+256GB', 1.44, 0.00, 2022.81, 2699);
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 649.00, 1, 102, '亮黑色', '6GB+128GB', 0.35, 0.00, 591.05, 649);
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 699.00, 1, 103, '亮黑色', '6GB+128GB', 0.37, 0.00, 636.23, 649);
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', 'iPhone 8', 5499.00, 1, 106, '翡冷翠', '6GB+64GB', 2.94, 0.00, 5496.06, 5499);
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 14, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'HUAWEI P30', '华为', 'HUAWEI P系列', 3788.00, 1, 90, '亮黑色', '8GB+128GB', 2.02, 0.00, 3585.98, 3788);
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '小米系列', 2699.00, 3, 98, '宝石蓝', '8GB+256GB', 1.44, 0.00, 2022.81, 2699);
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 649.00, 1, 102, '亮黑色', '6GB+128GB', 0.35, 0.00, 591.05, 649);
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 699.00, 1, 103, '亮黑色', '6GB+128GB', 0.37, 0.00, 636.23, 649);
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', 'iPhone 8', 5499.00, 1, 106, '翡冷翠', '6GB+64GB', 2.94, 0.00, 5496.06, 5499);
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 14, 'http://macro-oss.oss-cn-http://img12.360buyimg.com/n1/s450x450_jfs/t1/23465/6/12585/205701/5c98cb2eE9c893f3d/19e242e358426873.jpg', 'HUAWEI P30', '华为', 'HUAWEI P系列', 3788.00, 1, 90, '亮黑色', '8GB+128GB', 2.02, 0.00, 3585.98, 3788);
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '小米系列', 2699.00, 3, 98, '宝石蓝', '8GB+256GB', 1.44, 0.00, 2022.81, 2699);
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '红米系列', 649.00, 1, 102, '亮黑色', '6GB+128GB', 0.35, 0.00, 591.05, 649);
INSERT INTO `oms_order_item` VALUES (50, 30, '991577930935283', 14, 'http://img10.360buyimg.com/n1/s450x450_jfs/t1/15906/7/12540/223215/5c98cbe1E76c40a65/825bcbe195389dc7.jpg', 'HUAWEI P30', '2', '7', 3788.00, 1, NULL, '极光色', '8GB+64GB', NULL, NULL, 3712.24, 0);
INSERT INTO `oms_order_item` VALUES (51, 30, '991577930935283', 29, 'http://img11.360buyimg.com/n1/s450x450_jfs/t1/70520/2/11038/57762/5d8a03a1E486c34f9/49b4de56c0d0c5bb.jpg', '小米9 Pro 5G', '3', '11', 3699.00, 3, NULL, '梦之白', '8GB+256GB', NULL, NULL, 3625.02, 0);
INSERT INTO `oms_order_item` VALUES (52, 31, '001578031628942', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 13, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (53, 32, '261578031667094', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 0, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (54, 33, '611578031736449', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 0, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (55, 34, '701578031750633', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 0, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (56, 35, '581578031759913', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 6, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (57, 35, '581578031759913', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 3, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (58, 36, '341578031764903', 5, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', '馥郁香型', NULL, NULL, 199.00, 0, NULL, '5', '', NULL, NULL, 195.02, 0);
INSERT INTO `oms_order_item` VALUES (59, 36, '341578031764903', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 3, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (60, 37, '831578031779513', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 2, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (61, 37, '831578031779513', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 3, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (62, 38, '631578031803400', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 6, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (63, 39, '801578031831834', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 4, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (64, 40, '861578031835560', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 4, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (65, 41, '141578031839087', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 7, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (66, 42, '031578031845991', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 7, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (67, 42, '031578031845991', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 2, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (68, 43, '411578031896825', 3, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', '浓香型', NULL, NULL, 39.00, 12, NULL, '3', '', NULL, NULL, 38.22, 0);
INSERT INTO `oms_order_item` VALUES (69, 43, '411578031896825', 2, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', '馥郁香型', NULL, NULL, 49.00, 7, NULL, '2', '', NULL, NULL, 48.02, 0);
INSERT INTO `oms_order_item` VALUES (70, 44, '831578039970051', 30, 'https://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e12.jpg', '浓香型', NULL, NULL, 399.00, 9, NULL, '30', '', NULL, NULL, 391.02, 0);
INSERT INTO `oms_order_item` VALUES (71, 45, '361578039976652', 30, 'https://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e12.jpg', '浓香型', NULL, NULL, 399.00, 5, NULL, '30', '', NULL, NULL, 391.02, 0);
INSERT INTO `oms_order_item` VALUES (72, 46, '351578039981194', 30, 'https://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e12.jpg', '浓香型', NULL, NULL, 399.00, 5, NULL, '30', '', NULL, NULL, 391.02, 0);

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`album_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------
INSERT INTO `pms_album_pic` VALUES (1, 1, 'http://img10.jiuxian.com/bill/2019/0902/177d0ee1f1e34deea07e2bb5efc896ce.jpg');
INSERT INTO `pms_album_pic` VALUES (2, 1, 'http://img10.jiuxian.com/bill/2019/0902/90b62b62ec964e2589c21e3bd7956d22.jpg');
INSERT INTO `pms_album_pic` VALUES (3, 1, 'http://img10.jiuxian.com/bill/2019/0902/e987f9f68b224c868d1cca48974ef6e7.jpg');
INSERT INTO `pms_album_pic` VALUES (4, 1, 'http://img10.jiuxian.com/bill/2019/0902/4ac1cbbf5f94450fb3909b115b1b0cc4.jpg');
INSERT INTO `pms_album_pic` VALUES (5, 2, 'http://img01.jiuxian.com/upload/goods/13427/g/1389169583585.jpg');
INSERT INTO `pms_album_pic` VALUES (6, 2, 'http://img07.jiuxian.com/2015/0623/e73f010ad7684096b49a742c2105ee2a5.jpg');
INSERT INTO `pms_album_pic` VALUES (7, 2, 'http://img10.jiuxian.com/bill/2015/0623/4125cdb617e64b39af4f3f9e1b364b5a.jpg');
INSERT INTO `pms_album_pic` VALUES (8, 3, 'http://img10.jiuxian.com/2017/0607/7cd24ec283214e9086b107961d409c24.jpg');
INSERT INTO `pms_album_pic` VALUES (9, 3, 'http://img10.jiuxian.com/2017/0607/b7809cb20e954497873233a4fb6c87db.jpg');
INSERT INTO `pms_album_pic` VALUES (10, 3, 'http://img10.jiuxian.com/2017/0607/dfe973ccbd87492abc0390019b1fc73d.jpg');
INSERT INTO `pms_album_pic` VALUES (11, 3, 'http://img10.jiuxian.com/2017/0607/a1ea5cb259824d2a9f380a8e62559a7a.jpg');
INSERT INTO `pms_album_pic` VALUES (12, 4, 'http://img07.jiuxian.com/brandlogo/2018/0517/37a82bcd7a1648b5a64cc39303a84f44.jpg');
INSERT INTO `pms_album_pic` VALUES (13, 4, 'http://img09.jiuxian.com/brandlogo/2018/0517/2cb069dbc6034870acf6ce0aedb75f34.jpg');
INSERT INTO `pms_album_pic` VALUES (14, 4, 'http://img09.jiuxian.com/brandlogo/2018/0517/c567da2cb07249c0993f7a650463a49c.jpg');
INSERT INTO `pms_album_pic` VALUES (15, 5, 'http://img10.jiuxian.com/bill/2019/0326/763f73cb3fa84287812db147622f2f80.jpg');
INSERT INTO `pms_album_pic` VALUES (16, 5, 'http://img10.jiuxian.com/bill/2019/0326/19ce80c01cf147b38660eff7fb0aaf06.jpg');
INSERT INTO `pms_album_pic` VALUES (17, 6, 'http://img07.jiuxian.com/brandlogo/2019/1209/061fe7fd94164df99550d8514dd007b4.jpg');
INSERT INTO `pms_album_pic` VALUES (18, 6, 'http://img10.jiuxian.com/brandlogo/2019/1209/06dc89634f2448c8bfb739abc808401d.jpg');
INSERT INTO `pms_album_pic` VALUES (19, 6, 'http://img10.jiuxian.com/brandlogo/2019/1209/9dcd435ca4164d0b86514162988b6f94.jpg');
INSERT INTO `pms_album_pic` VALUES (20, 7, 'http://img07.jiuxian.com/brandlogo/2019/1030/bc35c96c8c8f4582b96f76a4119c7a35.jpg');
INSERT INTO `pms_album_pic` VALUES (21, 7, 'http://img08.jiuxian.com/brandlogo/2019/1030/c3610264ef374d0e9a7ccef248036ef6.jpg');
INSERT INTO `pms_album_pic` VALUES (22, 7, 'http://img10.jiuxian.com/brandlogo/2019/1030/63c400ed55e144d595d3efb0fde2d52e.jpg');
INSERT INTO `pms_album_pic` VALUES (23, 8, 'http://img10.jiuxian.com/bill/2019/0409/7ae58128127441a3b85cb65f6be21652.jpg');
INSERT INTO `pms_album_pic` VALUES (24, 8, 'http://img10.jiuxian.com/bill/2019/0409/df3f1105337f4ac297af6531000b09d7.jpg');
INSERT INTO `pms_album_pic` VALUES (25, 8, 'http://img10.jiuxian.com/bill/2019/0409/df3f1105337f4ac297af6531000b09d7.jpg');
INSERT INTO `pms_album_pic` VALUES (26, 9, 'http://img10.jiuxian.com/bill/2019/0402/533dc741d4ff4407b7367b390f032000.jpg');
INSERT INTO `pms_album_pic` VALUES (27, 9, 'http://img10.jiuxian.com/bill/2018/1127/5f53b0900a244f5b897424c034e8a37b.jpg');
INSERT INTO `pms_album_pic` VALUES (28, 9, 'http://img10.jiuxian.com/bill/2018/1127/db81b9da7cb94efcaf8727f3b166bbc4.jpg');
INSERT INTO `pms_album_pic` VALUES (29, 10, 'http://img10.jiuxian.com/bill/2018/1123/1c0790c689aa4d0cbdc46516e149797b.jpg');
INSERT INTO `pms_album_pic` VALUES (30, 10, 'http://img10.jiuxian.com/bill/2018/1123/f9b67b86c502441191957dda4db22da5.jpg');
INSERT INTO `pms_album_pic` VALUES (31, 10, 'http://img10.jiuxian.com/bill/2018/1123/55150f31ac534510bb5773660aaec56c.jpg');
INSERT INTO `pms_album_pic` VALUES (32, 11, 'http://img10.jiuxian.com/brandlogo/2019/0719/32f9d59d75d54b818b9e16ef9f260d71.jpg');
INSERT INTO `pms_album_pic` VALUES (33, 12, 'http://img07.jiuxian.com/brandlogo/2019/0315/848b097bd7144e1596b58c48766c2717.jpg');
INSERT INTO `pms_album_pic` VALUES (34, 12, 'http://img08.jiuxian.com/brandlogo/2019/0218/baafc808b634467daa91ae052fc1d73c.jpg');
INSERT INTO `pms_album_pic` VALUES (35, 13, 'http://img10.jiuxian.com/bill/2019/1114/838b30fe9c1f4da68a85e9c44562cdd7.jpg');
INSERT INTO `pms_album_pic` VALUES (36, 13, 'http://img10.jiuxian.com/bill/2018/1228/5acf5656b248498abcafc124401bb5e8.jpg');
INSERT INTO `pms_album_pic` VALUES (37, 14, 'http://img09.jiuxian.com/brandlogo/2019/0321/74edf8446eda43ae93ea1f62bd84f8ef.jpg');
INSERT INTO `pms_album_pic` VALUES (38, 14, 'http://img09.jiuxian.com/brandlogo/2019/0321/18e75898c6c14ac9b66f66d4b356cdc3.jpg');
INSERT INTO `pms_album_pic` VALUES (39, 14, 'http://img10.jiuxian.com/brandlogo/2019/0321/01c93d920d0d4aa9bcd15fecfe09bce6.jpg');
INSERT INTO `pms_album_pic` VALUES (40, 14, 'http://img07.jiuxian.com/brandlogo/2019/0321/dbadf0a4444f478386047223f17bdb17.jpg');
INSERT INTO `pms_album_pic` VALUES (41, 15, 'http://img10.jiuxian.com/bill/2017/0221/d4becaa7f2ec4fc39fd937f0aa96bed2.jpg');
INSERT INTO `pms_album_pic` VALUES (42, 15, 'http://img10.jiuxian.com/bill/2017/0221/eb023303fe754f7e9c3a4ab2359bc027.jpg');
INSERT INTO `pms_album_pic` VALUES (43, 15, 'http://img10.jiuxian.com/bill/2017/0221/fe6d39ec81af43fc819e763791b91a30.jpg');
INSERT INTO `pms_album_pic` VALUES (44, 15, 'http://img10.jiuxian.com/bill/2017/0221/040bb44480d94ff99a3547b88343d6c9.jpg');
INSERT INTO `pms_album_pic` VALUES (45, 15, 'http://img10.jiuxian.com/bill/2017/0221/f0ab16ea07e8468fb14b007ddc365b68.jpg');
INSERT INTO `pms_album_pic` VALUES (46, 15, 'http://img10.jiuxian.com/bill/2017/0221/6660c4949de843bab74b66d2b07b8276.jpg');
INSERT INTO `pms_album_pic` VALUES (47, 15, 'http://img10.jiuxian.com/bill/2017/0221/f5a3f0cf8dfa4c68861e3aa6d2bef3da.jpg');
INSERT INTO `pms_album_pic` VALUES (48, 15, 'http://img10.jiuxian.com/bill/2017/0221/1f700e0cd6c94440b95406bda8ff3407.jpg');
INSERT INTO `pms_album_pic` VALUES (49, 15, 'http://img10.jiuxian.com/bill/2017/0221/062ac8531296404d937ed40e973fbc54.jpg');
INSERT INTO `pms_album_pic` VALUES (50, 16, 'http://img08.jiuxian.com/brandlogo/2019/1028/39e3cda17c12474cb6b1a6e89905f685.jpg');
INSERT INTO `pms_album_pic` VALUES (51, 16, 'http://img10.jiuxian.com/brandlogo/2019/1028/6146cae496754dab950f33c4798743f1.jpg');
INSERT INTO `pms_album_pic` VALUES (52, 16, 'http://img06.jiuxian.com/brandlogo/2019/1028/a9320f771f9e42148bd47c86b5d3efad.jpg');
INSERT INTO `pms_album_pic` VALUES (53, 17, 'http://img10.jiuxian.com/bill/2016/1223/c6d6e5ba8d7147389f9f960b3b638cdb.jpg');
INSERT INTO `pms_album_pic` VALUES (54, 17, 'http://img10.jiuxian.com/bill/2016/1223/194d9fe30dee4323bc45784e2923629f.jpg');
INSERT INTO `pms_album_pic` VALUES (55, 17, 'http://img10.jiuxian.com/bill/2016/1223/0484aef1fef642f895034691d7b995fa.jpg');
INSERT INTO `pms_album_pic` VALUES (56, 17, 'http://img10.jiuxian.com/bill/2016/1223/da9ea4ca39584aaab1b684847e7e800c.jpg');
INSERT INTO `pms_album_pic` VALUES (57, 17, 'http://img10.jiuxian.com/bill/2016/1223/81bc463ca38f47869fdfa59c981123c1.jpg');
INSERT INTO `pms_album_pic` VALUES (58, 17, 'http://img10.jiuxian.com/bill/2016/1223/94d169afef474de28725b6a7c0057c73.jpg');
INSERT INTO `pms_album_pic` VALUES (59, 17, 'http://img10.jiuxian.com/bill/2017/0302/c67ee4d228b344d99a826a156d7bfc73.jpg');
INSERT INTO `pms_album_pic` VALUES (60, 18, 'http://img10.jiuxian.com/bill/2017/0104/e22adc02d8114ff98faaf502f3f43c7b.jpg');
INSERT INTO `pms_album_pic` VALUES (61, 18, 'http://img10.jiuxian.com/bill/2017/0104/ac6bd315b19e4259b72c2f46537ed660.jpg');
INSERT INTO `pms_album_pic` VALUES (62, 18, 'http://img10.jiuxian.com/bill/2017/0104/460ad5f96b964d1b9889d9beda17bca8.jpg');
INSERT INTO `pms_album_pic` VALUES (63, 18, 'http://img10.jiuxian.com/bill/2017/0104/d11e484977494d6aa577b065310db8d5.jpg');
INSERT INTO `pms_album_pic` VALUES (64, 18, 'http://img10.jiuxian.com/bill/2017/0104/9a9caf2f89fc47de93329fd7e65aa7b3.jpg');
INSERT INTO `pms_album_pic` VALUES (65, 18, 'http://img10.jiuxian.com/bill/2017/0104/0faeb161215c457f8c09b6594a6f8d0b.jpg');
INSERT INTO `pms_album_pic` VALUES (66, 18, 'http://img10.jiuxian.com/bill/2019/0520/afa4fbed4f674b739a9aea5e04915700.jpg');
INSERT INTO `pms_album_pic` VALUES (67, 19, 'http://img10.jiuxian.com/bill/2017/0209/18ff9fd151ab4d7b90c23f351d6872d9.jpg');
INSERT INTO `pms_album_pic` VALUES (68, 19, 'http://img10.jiuxian.com/bill/2017/0209/feb1029979fc48d4ab0b8172a108d395.jpg');
INSERT INTO `pms_album_pic` VALUES (69, 19, 'http://img10.jiuxian.com/bill/2017/0209/8e0055ac345f4926a31734080a085d84.jpg');
INSERT INTO `pms_album_pic` VALUES (70, 19, 'http://img10.jiuxian.com/bill/2017/0209/dacccca50e2b4198b6c7509a2ce567e7.jpg');
INSERT INTO `pms_album_pic` VALUES (71, 19, 'http://img10.jiuxian.com/bill/2017/0209/e17e34fa5daf486e98921beaf510ceac.jpg');
INSERT INTO `pms_album_pic` VALUES (72, 20, 'http://img10.jiuxian.com/brandlogo/2019/0812/e1f062c4e6a143bea061d91a0e237b53.jpg');
INSERT INTO `pms_album_pic` VALUES (73, 20, 'http://img08.jiuxian.com/brandlogo/2019/0812/db64cc05040747859df9c60b04f22577.jpg');
INSERT INTO `pms_album_pic` VALUES (74, 20, 'http://img06.jiuxian.com/brandlogo/2019/0812/fa9b99aff1d64f3dbd0562b223f69938.jpg');
INSERT INTO `pms_album_pic` VALUES (75, 21, 'http://img10.jiuxian.com/bill/2019/1030/541fdfbcb3fc4cc696cbad9809f0dfb8.jpg');
INSERT INTO `pms_album_pic` VALUES (76, 21, 'http://img10.jiuxian.com/bill/2019/1030/230fd8fceb9e414b8adc9d2ade53f722.jpg');
INSERT INTO `pms_album_pic` VALUES (77, 21, 'http://img10.jiuxian.com/bill/2019/1030/1cb3bcf20f1a4bf39a3bb4a1bc31b849.jpg');
INSERT INTO `pms_album_pic` VALUES (78, 22, 'http://img10.jiuxian.com/bill/2018/0917/a5f6e823dfa7487da7d77a8aba9f7690.jpg');
INSERT INTO `pms_album_pic` VALUES (79, 22, 'http://img10.jiuxian.com/bill/2018/0917/2ef6c8c3f51f42cc9089256fa6ab49e9.jpg');
INSERT INTO `pms_album_pic` VALUES (80, 22, 'http://img10.jiuxian.com/bill/2018/0917/87adf66d4d924a9b8ec7e10663e5b831.jpg');
INSERT INTO `pms_album_pic` VALUES (81, 22, 'http://img10.jiuxian.com/bill/2018/0917/6e8d7e39b3b94ad0b523d468a36bc183.jpg');
INSERT INTO `pms_album_pic` VALUES (82, 22, 'http://img10.jiuxian.com/bill/2018/0917/1b93ffe3f8bf489a9e16cd59f30bcbbc.jpg');
INSERT INTO `pms_album_pic` VALUES (83, 23, 'http://img01.jiuxian.com/upload/goods/8458/g/1367977455420.jpg');
INSERT INTO `pms_album_pic` VALUES (84, 23, 'http://img01.jiuxian.com/upload/goods/8458/g/1367977460367.jpg');
INSERT INTO `pms_album_pic` VALUES (85, 23, 'http://img01.jiuxian.com/upload/goods/8458/g/1372043096831.jpg');
INSERT INTO `pms_album_pic` VALUES (86, 24, 'http://img01.jiuxian.com/upload/goods/9930/f/1374049827619.jpg');
INSERT INTO `pms_album_pic` VALUES (87, 24, 'http://img01.jiuxian.com/upload/goods/9930/f/1374299683783.jpg');
INSERT INTO `pms_album_pic` VALUES (88, 24, 'http://img01.jiuxian.com/upload/goods/9930/f/1374299689649.jpg');
INSERT INTO `pms_album_pic` VALUES (89, 25, 'http://img01.jiuxian.com/upload/goods/10553/g/1379497005721.jpg');
INSERT INTO `pms_album_pic` VALUES (90, 25, 'http://img10.jiuxian.com/bill/2014/0426/baa9ccbcf9954fb58743f4827f69a1e7.jpg');
INSERT INTO `pms_album_pic` VALUES (91, 25, 'http://img10.jiuxian.com/bill/2014/0426/d2c69a53ab9b4ad0bbf9630c8c7ef453.jpg');
INSERT INTO `pms_album_pic` VALUES (92, 26, 'http://img10.jiuxian.com/bill/2014/0825/94ca1b1f4ca448c99c4fcf31dc8e9609.jpg');
INSERT INTO `pms_album_pic` VALUES (93, 26, 'http://img10.jiuxian.com/bill/2014/0825/3ff8bf907c3a42bca0ae4808de3f58c1.jpg');
INSERT INTO `pms_album_pic` VALUES (94, 26, 'http://img10.jiuxian.com/bill/2014/0825/0e343b7f49f0489da8d8e64398377bcf.jpg');
INSERT INTO `pms_album_pic` VALUES (95, 26, 'http://img10.jiuxian.com/bill/2014/0825/2f692835d7fe4dc084f841a1296f76ec.jpg');
INSERT INTO `pms_album_pic` VALUES (96, 26, 'http://img10.jiuxian.com/bill/2014/0825/8dc69a56b06e4d4bbd29cc87e3d021d0.jpg');
INSERT INTO `pms_album_pic` VALUES (97, 26, 'http://img10.jiuxian.com/bill/2014/0825/af4a031b46da4c278700fec3cceb783e.jpg');
INSERT INTO `pms_album_pic` VALUES (98, 26, 'http://img10.jiuxian.com/bill/2014/0825/c6a3e24f7e2e4126a4a0bca7a5f09d5d.jpg');
INSERT INTO `pms_album_pic` VALUES (99, 26, 'http://img10.jiuxian.com/bill/2015/0831/bf17b3a8b83a454cbdfd0c7ba8eb046e.jpg');
INSERT INTO `pms_album_pic` VALUES (100, 27, 'http://img10.jiuxian.com/bill/2019/1114/504bb777865b41b8a81a0fcccae72343.jpg');
INSERT INTO `pms_album_pic` VALUES (101, 27, 'http://img10.jiuxian.com/bill/2016/0510/494e1c5ff1d54c5981025d7c539f5eaf.jpg');
INSERT INTO `pms_album_pic` VALUES (102, 27, 'http://img10.jiuxian.com/bill/2016/0510/f46b1cde80c84f7f9a6747179bda108c.jpg');
INSERT INTO `pms_album_pic` VALUES (103, 27, 'http://img10.jiuxian.com/bill/2016/0510/b657bf6a04ff4fd4b6c0d6a2702fcfe6.jpg');
INSERT INTO `pms_album_pic` VALUES (104, 27, 'http://img10.jiuxian.com/bill/2016/0510/08cdadc3d2d24f1a90493df5fc764a72.jpg');
INSERT INTO `pms_album_pic` VALUES (105, 27, 'http://img10.jiuxian.com/bill/2016/0510/c5fec64f76784f15a72ec8c079947d28.jpg');
INSERT INTO `pms_album_pic` VALUES (106, 28, 'http://img10.jiuxian.com/2017/0622/4b0efe34a3944612b990f4940e840191.jpg');
INSERT INTO `pms_album_pic` VALUES (107, 28, 'http://img10.jiuxian.com/2017/0622/f427b8c3bde94c038d1e97236e601214.jpg');
INSERT INTO `pms_album_pic` VALUES (108, 28, 'http://img10.jiuxian.com/2017/0622/07a8a17d3a1744c4b15c2a15611dfa0b.jpg');
INSERT INTO `pms_album_pic` VALUES (109, 28, 'http://img10.jiuxian.com/2017/0622/0400765649964415b604bd627e53890d.jpg');
INSERT INTO `pms_album_pic` VALUES (110, 29, 'http://img10.jiuxian.com/bill/2019/0225/90a121a2264a47db85f7fe9de7ac2ca1.jpg');
INSERT INTO `pms_album_pic` VALUES (111, 29, 'http://img10.jiuxian.com/bill/2019/0225/9886fad3c16744c998ca21066ad84575.jpg');
INSERT INTO `pms_album_pic` VALUES (112, 29, 'http://img10.jiuxian.com/bill/2019/0225/e2c00b78d5904019b9571a0dc9b4c9eb.jpg');
INSERT INTO `pms_album_pic` VALUES (113, 29, 'http://img10.jiuxian.com/bill/2019/0225/1f748ca546f148bd9d22b06e6ad59544.jpg');
INSERT INTO `pms_album_pic` VALUES (114, 29, 'http://img10.jiuxian.com/bill/2019/0225/1de5aa0d50554843bfbbef0cc5405eb3.jpg');
INSERT INTO `pms_album_pic` VALUES (115, 29, 'http://img10.jiuxian.com/bill/2019/0225/7307ec77f869413abe8c566683017a43.jpg');
INSERT INTO `pms_album_pic` VALUES (116, 29, 'http://img10.jiuxian.com/bill/2019/0225/607fca8539854e7f809dde3d786615f6.jpg');
INSERT INTO `pms_album_pic` VALUES (117, 29, 'http://img10.jiuxian.com/bill/2019/0225/915f2d6bcf71411fb1c772b8b962bd7c.jpg');
INSERT INTO `pms_album_pic` VALUES (118, 30, 'http://img10.jiuxian.com/bill/2018/1106/ab7d594393c5433aa7c4cd48efc641e3.jpg');
INSERT INTO `pms_album_pic` VALUES (119, 30, 'http://img10.jiuxian.com/bill/2018/1106/1250bb2feb5f4fd8b118ca91658e384a.jpg');
INSERT INTO `pms_album_pic` VALUES (120, 30, 'http://img10.jiuxian.com/bill/2018/1106/29963aa551ff401e81f3f10f398f1d8e.jpg');
INSERT INTO `pms_album_pic` VALUES (121, 30, 'http://img10.jiuxian.com/bill/2018/1106/5f9c58aa95584f79a3775069eadeb868.jpg');
INSERT INTO `pms_album_pic` VALUES (122, 30, 'http://img10.jiuxian.com/bill/2018/1106/1aa4cd3e48c74f3c9a3e695e66aedd5c.jpg');
INSERT INTO `pms_album_pic` VALUES (123, 30, 'http://img10.jiuxian.com/bill/2018/1106/387ba7894dd44a8298a7948fd59fe4fb.jpg');
INSERT INTO `pms_album_pic` VALUES (124, 30, 'http://img10.jiuxian.com/bill/2018/1106/c96721d60f2044e5b3b2bf4f77097bcc.jpg');
INSERT INTO `pms_album_pic` VALUES (125, 30, 'http://img10.jiuxian.com/bill/2018/1106/284902a9b0014cab863aa7de8a1c5a07.jpg');
INSERT INTO `pms_album_pic` VALUES (126, 31, 'http://img10.jiuxian.com/bill/2017/0601/d579dce85e124e0ebc8c82b12f2e135d.jpg');
INSERT INTO `pms_album_pic` VALUES (127, 31, 'http://img10.jiuxian.com/bill/2017/0601/50f1e2c3303942dca223dd4ba46d98a9.jpg');
INSERT INTO `pms_album_pic` VALUES (128, 31, 'http://img10.jiuxian.com/bill/2017/0601/90615260b00c4d8b919b16384516280d.jpg');
INSERT INTO `pms_album_pic` VALUES (129, 31, 'http://img10.jiuxian.com/bill/2017/0601/78fa57074117457182044529e3716236.jpg');
INSERT INTO `pms_album_pic` VALUES (130, 31, 'http://img10.jiuxian.com/bill/2017/0601/e135a6d811fe4ad69d4d39e492dbc91d.jpg');
INSERT INTO `pms_album_pic` VALUES (131, 31, 'http://img10.jiuxian.com/bill/2017/0601/c1284bf9506d4fbaa460675173c16cba.jpg');
INSERT INTO `pms_album_pic` VALUES (132, 31, 'http://img10.jiuxian.com/bill/2017/0601/63608db7da3e404a828bea253578f176.jpg');
INSERT INTO `pms_album_pic` VALUES (133, 31, 'http://img10.jiuxian.com/bill/2017/0601/07437af3c6434fecbdb35c771bb3c261.jpg');
INSERT INTO `pms_album_pic` VALUES (134, 32, 'http://img10.jiuxian.com/bill/2019/0403/3ab3a6129f8b4e71b8e886d4d61ce43a.jpg');
INSERT INTO `pms_album_pic` VALUES (135, 32, 'http://img10.jiuxian.com/bill/2019/0403/fab7af4075334a129d572836642daac8.jpg');
INSERT INTO `pms_album_pic` VALUES (136, 32, 'http://img10.jiuxian.com/bill/2019/0403/8ef0769b2f7e4a888b9c8f12b42708b0.jpg');
INSERT INTO `pms_album_pic` VALUES (137, 32, 'http://img10.jiuxian.com/bill/2019/0403/921cb6575a4c44adbffb6f84ff2c5896.jpg');
INSERT INTO `pms_album_pic` VALUES (138, 33, 'http://img10.jiuxian.com/bill/2019/0614/60b3a112a39a445f88c876b926e23d73.jpg');
INSERT INTO `pms_album_pic` VALUES (139, 33, 'http://img10.jiuxian.com/bill/2019/0614/3161e1bfb4484ce991cf75270491ee67.jpg');
INSERT INTO `pms_album_pic` VALUES (140, 33, 'http://img10.jiuxian.com/bill/2019/0614/66cec3efabb74a4295ef0731e078d020.jpg');
INSERT INTO `pms_album_pic` VALUES (141, 34, 'http://img10.jiuxian.com/bill/2017/0221/1a0d33b602bc495a9f6e015c68534a91.jpg');
INSERT INTO `pms_album_pic` VALUES (142, 34, 'http://img10.jiuxian.com/bill/2017/0221/4db222c6c09340b0ae222f326244bf09.jpg');
INSERT INTO `pms_album_pic` VALUES (143, 34, 'http://img10.jiuxian.com/bill/2017/0221/ba01e56e84d241e7a9bc351e8c6d30a9.jpg');
INSERT INTO `pms_album_pic` VALUES (144, 34, 'http://img10.jiuxian.com/bill/2017/0221/4a197c378b6f457b809372ff3376bd1f.jpg');
INSERT INTO `pms_album_pic` VALUES (145, 34, 'http://img10.jiuxian.com/bill/2017/0221/60ef16ecd9104de1959fc0f4fbed1a3a.jpg');
INSERT INTO `pms_album_pic` VALUES (146, 34, 'http://img10.jiuxian.com/bill/2017/0221/557200d9204848b9931f05e96de25b90.jpg');
INSERT INTO `pms_album_pic` VALUES (147, 34, 'http://img10.jiuxian.com/bill/2017/0221/332f2d80f0a442338113706056bc9896.jpg');
INSERT INTO `pms_album_pic` VALUES (148, 34, 'http://img10.jiuxian.com/bill/2017/0221/1033a0f3a3224b8b9a3be822330fa78d.jpg');
INSERT INTO `pms_album_pic` VALUES (149, 35, 'http://img10.jiuxian.com/bill/2019/1114/d48368a5d475406992c811873cf1e322.jpg');
INSERT INTO `pms_album_pic` VALUES (150, 35, 'http://img10.jiuxian.com/bill/2016/1118/cbd50439177d4d95824b96d7d57ed84c.jpg');
INSERT INTO `pms_album_pic` VALUES (151, 35, 'http://img10.jiuxian.com/bill/2016/1118/9dd8de733024450ca80e8d97f5d67ee9.jpg');
INSERT INTO `pms_album_pic` VALUES (152, 35, 'http://img10.jiuxian.com/bill/2016/1118/bba3638d5c564c7dbd8dec6cbdcf2211.jpg');
INSERT INTO `pms_album_pic` VALUES (153, 35, 'http://img10.jiuxian.com/bill/2016/1118/04c8b169f71d4af4879554dc8eca82d4.jpg');
INSERT INTO `pms_album_pic` VALUES (154, 35, 'http://img10.jiuxian.com/bill/2016/1118/0fed16c386f44339a7e262c302e01f83.jpg');
INSERT INTO `pms_album_pic` VALUES (343, 35, 'http://img10.jiuxian.com/bill/2016/1118/29206a23cae6451d9182bbae7454525e.jpg');
INSERT INTO `pms_album_pic` VALUES (344, 35, 'http://img10.jiuxian.com/bill/2016/1118/bd1fd05c3159440687d37b6b93214d85.jpg');
INSERT INTO `pms_album_pic` VALUES (345, 35, 'http://img10.jiuxian.com/bill/2016/1118/bf52a1c1a9374ea889e9f5320e8cb3f9.jpg');
INSERT INTO `pms_album_pic` VALUES (346, 35, 'http://img10.jiuxian.com/bill/2016/1118/df8e812821594aef93c2d3d5f72ee2a1.jpg');
INSERT INTO `pms_album_pic` VALUES (347, 35, 'http://img10.jiuxian.com/bill/2016/1118/e51f73c4e7014de2948f627885731e17.jpg');
INSERT INTO `pms_album_pic` VALUES (348, 35, 'http://img10.jiuxian.com/bill/2016/1118/bbef3c9ba84e4fe288d9039d317387b0.jpg');

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  `brand_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌负责人',
  `brand_status` int(255) NOT NULL DEFAULT 1 COMMENT '品牌状态：1正常；0下架',
  PRIMARY KEY (`brand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '白酒', '', 'https://img10.jiuxian.com/bill/2019/1231/8e8d9d78e5fb42358b0f77bfd8544c0a.jpg', NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (2, '洋酒', '', 'https://img09.jiuxian.com/bill/2019/1231/9ccba6d373af4813bf1f2baceb28cbcd.jpg', NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (3, '红酒整箱', '', 'https://img09.jiuxian.com/bill/2020/0101/75b48d587be04c749b3852f74c6c0cd0.jpg', NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (4, '老酒', '', 'https://img07.jiuxian.com/bill/2019/1231/72db28c3a97a458ba6b4219fed821769.jpg', NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (5, '葡萄酒', '', 'https://img08.jiuxian.com/bill/2019/1231/d683f99fd00349ea811b24c0c2d0a17c.jpg', NULL, NULL, 1);
INSERT INTO `pms_brand` VALUES (6, '', '', 'https://img06.jiuxian.com/bill/2019/1231/a3afdafa60ac43bf94d95bbe92e2bfcf.jpg', NULL, NULL, 1);

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `series_id` bigint(20) NULL DEFAULT NULL COMMENT '系列id',
  `product_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货号',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `product_sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `market_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `product_stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `product_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 1, 1, 'https://img06.jiuxian.com/2019/0902/29e4f1ce36eb46678ba34c7be529e5d52.jpg', 'No10001', 0, 1, 0, 1, 200, 50.00, 51.00, 2299, 52, '【包邮】52°白水杜康一坛老酒1000ml', '浓香型', '水、高粱、小麦、大麦', 1000, '干燥、通风、阴凉、清洁处', '陕西白水杜康酒业有限责任公司');
INSERT INTO `pms_product` VALUES (2, 1, 1, 'https://img09.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a2.jpg', 'No10002', 0, 1, 0, 1, 200, 49.00, 50.00, 2499, 48, '48°湘泉牌老湘泉125ml', '馥郁香型', '泉水、高粱、糯米、小麦、大米、玉米', 1000, '干燥、通风、阴凉、清洁处', '酒鬼酒股份有限公司');
INSERT INTO `pms_product` VALUES (3, 1, 1, 'https://img08.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef412.jpg', 'No10003', 0, 1, 0, 1, 200, 39.00, 7599.00, 4299, 45, '【老酒特卖】45°五粮液祝君祥福100ml(2012-2013年)（6瓶装）', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 1000, '干燥、通风、阴凉、清洁处', '酒鬼酒股份有限公司');
INSERT INTO `pms_product` VALUES (4, 1, 1, 'https://img08.jiuxian.com/2019/1203/a634474a7a1842928cbc9896a3adcb8b2.jpg', 'No10004', 0, 1, 0, 1, 200, 67.00, 5299.00, 1799, 53, '53°贵州茅台镇 酱香型白酒 赖锦初私藏纯粮 纯粮食高粱酒 整箱500ml*4瓶', '酱香型', '高粱、小麦、水', 500, '在干燥、通风、阴凉、清洁的条件下', '贵州省仁怀市茅台镇天地人和酿酒有限公司');
INSERT INTO `pms_product` VALUES (5, 1, 1, 'https://img09.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a812.jpg', 'No10005', 0, 1, 0, 1, 200, 199.00, 199.00, 1799, 52, '52°酒鬼原浆酒500ml', '馥郁香型', '泉水、玉米、高粱、小麦、大米、糯米', 500, '常温、干燥、阴凉、避光', '酒鬼酒股份有限公司');
INSERT INTO `pms_product` VALUES (6, 1, 1, 'https://img08.jiuxian.com/2019/1231/1a688464f6144628a11ab33321f8f4cc2.jpg', 'No10006', 0, 1, 1, 1, 200, 215.00, 8899.00, 1799, 52, '【酒仙甄选】52°扳倒井 典藏52_500ml*6瓶 整箱装', '其他', '水、大米、糯米、小麦、玉米、高粱、小米', 500, '干燥、通风、阴凉、清洁处', '山东扳倒井股份有限公司');
INSERT INTO `pms_product` VALUES (7, 1, 1, 'https://img09.jiuxian.com/2019/1126/2a1a5f50fb5743c39742607dcaf9f5f12.jpg', 'No10007', 0, 1, 0, 1, 700, 19.90, 20.00, 1999, 53, '53°郑酒师 壹号品鉴酒 酱香型白酒 坤沙小酒版 贵州茅台镇  固态纯粮 单瓶100ml', '酱香型', '高粱、小麦、水', 100, '在干燥、通风、阴凉、清洁的条件下', '贵州省仁怀市茅台镇天地人和酿酒有限公司');
INSERT INTO `pms_product` VALUES (8, 2, 2, 'https://img07.jiuxian.com/2017/0503/98e610101dbc4fc6bff38ff62f007cd92.jpg', 'No20002', 0, 1, 1, 1, 200, 58.00, 4399.00, 1599, 40, '【包邮】40°英国金铃喜乐致醇调配苏格兰威士忌700ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 700, '干燥、通风、阴凉、清洁处', '洋酒城');
INSERT INTO `pms_product` VALUES (9, 2, 2, 'https://img06.jiuxian.com/2018/1126/f64f01c3fb2241fdb21d6f5918c0e6792.jpg', 'No20003', 0, 1, 1, 1, 200, 58.00, 6399.00, 1199, 38, '【包邮】37.5°法国（原瓶进口）法圣古堡公爵伏特加700ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 700, '干燥、通风、阴凉、清洁处', '法圣古堡');
INSERT INTO `pms_product` VALUES (10, 2, 2, 'http://img09.jiuxian.com/2018/1123/88aeae38780e47ecb09d10f69e3c0a745.jpg', 'No20004', 0, 1, 0, 1, 200, 598.00, 600.00, 1199, 40, '40°法国（原瓶进口）法圣古堡公爵XO白兰地700ml', '浓香型', '水、葡萄汁、焦糖色', 700, '干燥、通风、阴凉、清洁处', '法圣古堡');
INSERT INTO `pms_product` VALUES (11, 2, 2, 'https://img10.jiuxian.com/2019/1225/51b701c876184915834953fddf940b682.jpg', 'No20005', 0, 1, 0, 1, 200, 29.00, 5299.00, 1799, 40, '40°高朗洋酒波朗圣XO白兰地500ml', '浓香型', '水、葡萄汁、焦糖色', 500, '干燥、通风、阴凉、清洁处', '酒游记酒类精品店');
INSERT INTO `pms_product` VALUES (12, 2, 2, 'https://img06.jiuxian.com/2019/1230/5ef3526427a548b9819162bae3aeca192.jpg', 'No20006', 0, 1, 0, 1, 200, 59.00, 3399.00, 1299, 40, '40°路易马西尼XO洋酒白兰地迷你小瓶酒版50mL', '浓香型', '白兰地原酒', 50, '干燥、通风、阴凉、清洁处', '泓利酒类精品店');
INSERT INTO `pms_product` VALUES (13, 2, 2, 'https://img07.jiuxian.com/2017/0106/3c0b1a4c97d248be868da541e56b9d0d2.jpg', 'No20007', 0, 1, 0, 1, 200, 50.00, 13999.00, 3798, 40, '40°英国百龄坛特醇苏格兰威士忌500ml', '浓香型', '水，麦芽，小麦，焦糖色', 500, '干燥、通风、阴凉、清洁处', '百龄坛');
INSERT INTO `pms_product` VALUES (14, 2, 2, 'https://img07.jiuxian.com/2019/1224/7a9ea1714bdd496fac3bc546ed5e50002.jpg', 'No20008', 0, 1, 0, 1, 200, 69.00, 4088.00, 1898, 40, '40°法国卡爹拉金典VSOP白兰地700ml', '浓香型', '水、葡萄汁、焦糖色', 700, '干燥、通风、阴凉、清洁处', '蜂行名酒汇官方旗舰店');
INSERT INTO `pms_product` VALUES (15, 3, 3, 'http://img07.jiuxian.com/2017/0221/9a0729cdcac94714ae9c034bb3f4f05d4.jpg', 'No20009', 0, 1, 0, 1, 200, 99.00, 5088.00, 2698, 12, '西班牙安徒生·小天鹅干红葡萄酒750ml（6瓶装）', '果香浓郁，略带一点香料气息。', '水、葡萄汁、焦糖色', 750, '干燥、通风、阴凉、清洁处', 'FSA酿酒集团');
INSERT INTO `pms_product` VALUES (16, 3, 3, 'http://img07.jiuxian.com/2019/1223/ec8510eec62b416e9841b5db123e40874.jpg', 'No20010', 0, 1, 0, 1, 200, 399.00, 2299.00, 5698, 14, '【到手12支】拉蒙维勒堡酒庄波尔多AOC级法国原瓶进口干红葡萄酒750ml*6整箱装', '浓香型', '水、葡萄汁、焦糖色', 750, '干燥、通风、阴凉、清洁处', '法国拉蒙官方旗舰店');
INSERT INTO `pms_product` VALUES (17, 3, 3, 'http://img09.jiuxian.com/2016/1223/540bb441b5aa43e4a16d1d3edc75b4e84.jpg', NULL, 0, 1, 1, 1, 300, 218.00, 230.00, 454, 14, '澳洲整箱红酒澳大利亚奔富洛神山庄梅洛红葡萄酒750ml (6瓶装)', '花香，果香', '水、葡萄汁、焦糖色', 750, '干燥、通风、阴凉、清洁处', '奔富酒庄');
INSERT INTO `pms_product` VALUES (18, 3, 3, 'http://img06.jiuxian.com/2016/1230/c6bdbab51b654fe29dd9a1a2d570be934.jpg', 'No20012', 0, 1, 0, 1, 500, 198.00, 2899.00, 4298, 14, '智利整箱红酒智利干露.克拉克干红葡萄酒750ml（6瓶装）', '浓香型', '水、葡萄汁、焦糖色', 750, '干燥、通风、阴凉、清洁处', '中酿波尔多酒业');
INSERT INTO `pms_product` VALUES (19, 3, 3, 'http://img09.jiuxian.com/2017/0209/c65aaca28bc1492bb2570ebb28b8f24b4.jpg', 'No20013', 0, 1, 0, 1, 500, 268.00, 3099.00, 3698, 14, '澳洲整箱红酒澳大利亚黄尾袋鼠梅洛红葡萄酒750ml（6瓶装）', '成熟的樱桃和黑胡椒的香味又夹杂着烟草的气息。', '水、葡萄汁、焦糖色', 750, '干燥、通风、阴凉、清洁处', '黄尾袋鼠');
INSERT INTO `pms_product` VALUES (20, 3, 3, 'http://img06.jiuxian.com/2019/0428/e7faf3e27ceb4ccca1f946ec45e3b8284.jpg', 'No20014', 0, 1, 0, 1, 500, 208.00, 1899.00, 2998, 15, '澳大利亚洲原瓶进口乔睿庄园M8西拉子干红葡萄酒750ml*6', '浓香型', '西拉子', 750, '干燥、通风、阴凉、清洁处', '乔睿官方旗舰店');
INSERT INTO `pms_product` VALUES (21, 3, 3, 'http://img06.jiuxian.com/2019/1106/3f7e5df6f2b0403dba87dc237d1928b34.png', 'No20015', 0, 1, 0, 1, 500, 548.00, 2899.00, 3298, 12, '法国拉菲罗斯柴尔德珍藏波尔多法定产区红葡萄酒750ml*6（DBR行货）', '浓香型', '西拉子', 750, '干燥、通风、阴凉、清洁处', '拉菲');
INSERT INTO `pms_product` VALUES (22, 4, 4, 'http://img06.jiuxian.com/2018/0917/ab5e52fc89f94b9788ff056b795017d94.jpg', 'No20016', 0, 1, 0, 1, 500, 39.00, 1590.00, 2798, 50, '【老酒特卖】50°西凤贡酒 125ml（2012年-2013年）', '浓香型', '水、高粱、小麦', 125, '干燥、通风、阴凉、清洁处', '西凤酒厂');
INSERT INTO `pms_product` VALUES (23, 4, 4, 'http://img09.jiuxian.com/2013/1002/7bc45e5c405341a1872be2b64ee4fb174.jpg', 'No20017', 0, 1, 0, 1, 500, 49.00, 899.00, 2998, 42, '【老酒特卖】42°献王嘉宾500ml(2013年)', '浓香型', '纯净水、高粱、小麦、大麦、豌豆', 500, '干燥、通风、阴凉、清洁处', '河北献王酒业有限公司');
INSERT INTO `pms_product` VALUES (24, 4, 4, 'http://img06.jiuxian.com/2013/1002/5216098b0a2c4cba8313c613330f1d9b4.jpg', 'No20018', 0, 1, 0, 1, 500, 39.00, 1299.00, 2398, 38, '【老酒特卖】38°漂流瓶酒350ml（亲情瓶）(2014年)', '浓香型', '水、高粱、小麦、大麦、豌豆', 350, '干燥、通风、阴凉、清洁处', '河北献王酒业有限公司');
INSERT INTO `pms_product` VALUES (25, 4, 4, 'http://img06.jiuxian.com/2014/0426/bf9fd1a028b54a4f9c503a4a630aa7c14.jpg', 'No20019', 0, 1, 0, 1, 500, 69.00, 1899.00, 1198, 42, '【老酒特卖】42°河套老窖500ml（2013年）', '浓香型', '水、高粱、小麦、大米、糯米、玉米', 500, '干燥、通风、阴凉、清洁处', '内蒙古河套酒业集团股份有限公司');
INSERT INTO `pms_product` VALUES (26, 4, 4, 'http://img09.jiuxian.com/2014/0825/b283c78d952c48bbbaf26a2b6c72b57e4.jpg', 'No20020', 0, 1, 0, 1, 500, 89.00, 649.00, 1898, 52, '【老酒特卖】52°五粮液股份天贝春高档喜酒500ml(2014年)', '无', '水、高梁、大米、糯米、小麦、玉米', 1000, '干燥、通风、阴凉、清洁处', '宜宾五粮液股份有限公司');
INSERT INTO `pms_product` VALUES (27, 4, 4, 'http://img07.jiuxian.com/2016/0510/67b8eb12492e497eb4eb30211d9a7d074.jpg', 'No20021', 0, 1, 0, 1, 500, 49.00, 1699.00, 1398, 46, '【老酒特卖】46°红星二锅头珍品100ml（2011-2013年）', '清香型', '水、高粱、大麦、豌豆', 100, '干燥、通风、阴凉、清洁处', '北京红星股份有限公司');
INSERT INTO `pms_product` VALUES (28, 4, 4, 'http://img08.jiuxian.com/2018/1225/150b66fa6dfa4740956ee1da58b8817b4.jpg', 'No30001', 0, 1, 0, 1, 500, 39.00, 20099.00, 998, 45, '【老酒特卖】45°五粮液祝君祥福100ml(2012年-2013年)（3瓶装）', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 100, '干燥、通风、阴凉、清洁处', '五粮液');
INSERT INTO `pms_product` VALUES (29, 5, 5, 'https://img06.jiuxian.com/2019/0225/8ff27752af0d4358a8456913a00502d62.jpg', 'No30002', 0, 1, 1, 1, 500, 399.00, 3899.00, 1148, 12, '西班牙安徒生·夜莺干红葡萄酒750ml', '莓果香气', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '安徒生');
INSERT INTO `pms_product` VALUES (30, 5, 5, 'https://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e12.jpg', 'No30003', 0, 1, 1, 1, 500, 399.00, 1899.00, 949, 12, '法国狮吼堡（升级版）干红葡萄酒750ml法国狮吼堡（升级版）干红葡萄酒750ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '中酿波尔多酒业');
INSERT INTO `pms_product` VALUES (31, 5, 5, 'https://img10.jiuxian.com/2017/0601/76d91ff41241457e8b74788140eac3be2.jpg', 'No30004', 0, 1, 0, 1, 500, 268.00, 2799.00, 1598, 13, '澳大利亚丁戈树红标经典红葡萄酒750ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '丁戈树');
INSERT INTO `pms_product` VALUES (32, 5, 5, 'https://img08.jiuxian.com/2017/0922/6b7d4979a28b4fd3af28e3169e58ba812.jpg', 'No30005', 0, 1, 0, 1, 300, 39.00, 1399.00, 1598, 12, '【包邮】西班牙DO级安徒生美人鱼干红葡萄酒750ml', '果香浓郁，略带一点香料气息。', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '安徒生');
INSERT INTO `pms_product` VALUES (33, 5, 5, 'https://img08.jiuxian.com/2019/0403/a38df60cc17d453e9fe89b907bd3b2d52.jpg', 'No30006', 0, 1, 0, 1, 300, 399.00, 3199.00, 1298, 13, '法国梦特骑士红葡萄酒750ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '酒之源酒类精品店');
INSERT INTO `pms_product` VALUES (34, 5, 5, 'https://img06.jiuxian.com/2019/0125/b7566cb89ddd449ea915458d94604aa12.jpg', 'No30007', 0, 1, 0, 1, 300, 199.00, 1799.00, 799, 13, '智利星得斯H600红葡萄酒750ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '星得斯');
INSERT INTO `pms_product` VALUES (35, 5, 5, 'https://img10.jiuxian.com/2016/1117/0be1c0b2a8b34b1f9ef4887ef4f991df2.jpg', 'No30008', 0, 1, 0, 1, 300, 99.00, 2799.00, 749, 11, '【包邮】法国红酒法国（原瓶进口）维纳斯贝壳干红葡萄酒（单支礼盒）750ml', '浓香型', '泉水、高粱、糯米、小麦、大米、玉米', 750, '干燥、通风、阴凉、清洁处', '五洲海购');
INSERT INTO `pms_product` VALUES (38, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (39, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (40, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (41, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (42, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (43, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (44, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (45, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (46, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (47, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_comment`;
CREATE TABLE `pms_product_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_id` int(11) NULL DEFAULT NULL,
  `comment_time` datetime(0) NULL DEFAULT NULL,
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_series
-- ----------------------------
DROP TABLE IF EXISTS `pms_series`;
CREATE TABLE `pms_series`  (
  `series_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `series_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌的id',
  `series_status` int(255) NULL DEFAULT 1 COMMENT '状态：1上架 0下架',
  PRIMARY KEY (`series_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_series
-- ----------------------------
INSERT INTO `pms_series` VALUES (1, 'iPhone 8', '1', 1);
INSERT INTO `pms_series` VALUES (2, 'iPhone X', '1', 1);
INSERT INTO `pms_series` VALUES (3, 'iPhone XR', '1', 1);
INSERT INTO `pms_series` VALUES (4, 'iPhone 11', '1', 1);
INSERT INTO `pms_series` VALUES (5, 'iPhone 11Pro', '1', 1);
INSERT INTO `pms_series` VALUES (6, 'HUAWEI Mate系列', '2', 1);
INSERT INTO `pms_series` VALUES (7, 'HUAWEI P系列', '2', 1);
INSERT INTO `pms_series` VALUES (8, 'HUAWEI nova系列', '2', 1);
INSERT INTO `pms_series` VALUES (9, '华为畅享系列', '2', 1);
INSERT INTO `pms_series` VALUES (10, 'HUAWEI 麦芒系列1111', '2', 1);
INSERT INTO `pms_series` VALUES (11, '小米系列', '3', 1);
INSERT INTO `pms_series` VALUES (12, '红米系列', '3', 1);
INSERT INTO `pms_series` VALUES (13, 'Find系列', '4', 1);
INSERT INTO `pms_series` VALUES (14, 'Reno系列', '4', 1);
INSERT INTO `pms_series` VALUES (15, 'R系列', '4', 1);
INSERT INTO `pms_series` VALUES (16, 'A系列', '4', 1);
INSERT INTO `pms_series` VALUES (17, 'K系列', '4', 1);
INSERT INTO `pms_series` VALUES (18, 'IQOO', '5', 1);
INSERT INTO `pms_series` VALUES (19, 'NEX系列', '5', 1);
INSERT INTO `pms_series` VALUES (20, 'X系列', '5', 1);
INSERT INTO `pms_series` VALUES (21, 'S系列', '5', 1);
INSERT INTO `pms_series` VALUES (22, 'Z系列', '5', 1);
INSERT INTO `pms_series` VALUES (23, 'Y系列', '5', 1);
INSERT INTO `pms_series` VALUES (24, 'U系列', '5', 1);
INSERT INTO `pms_series` VALUES (25, '坚果', '6', 1);
INSERT INTO `pms_series` VALUES (36, '测试', '6', 1);

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `sku_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `product_stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `product_color` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机颜色',
  `product_memory` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机存储',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 645 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (1, 1, '10001001', NULL, NULL, '1', '', 'http://img09.jiuxian.com/2019/0902/29e4f1ce36eb46678ba34c7be529e5d55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (2, 1, '10001002', NULL, NULL, '1', '', 'http://img06.jiuxian.com/2018/0529/6b9a5a53c7814d4796ab7b783c66ddf25.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (3, 1, '10001003', NULL, NULL, '1', '', 'http://img06.jiuxian.com/2017/1018/bed32212bafa4767873989b0871afe9e5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (4, 2, '10001004', NULL, NULL, '2', NULL, 'http://img07.jiuxian.com/2015/0623/61c57bedb1e54338af5551fa57f0f36a5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (5, 2, '10001005', NULL, NULL, '2', NULL, 'http://img06.jiuxian.com/2015/0623/6f300ad3275644a7924df7c93075e8c55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (6, 2, '10001006', NULL, NULL, '2', NULL, 'http://img07.jiuxian.com/2015/0623/e73f010ad7684096b49a742c2105ee2a5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (7, 3, '10001007', NULL, NULL, '3', NULL, 'http://img06.jiuxian.com/2017/0607/48b7f500b8bb4083af9e840ca1b8ef415.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (8, 3, '10001008', NULL, NULL, '3', NULL, 'http://img09.jiuxian.com/2017/0607/a1ea5cb259824d2a9f380a8e62559a7a5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (9, 3, '10001009', NULL, NULL, '3', NULL, 'http://img06.jiuxian.com/2017/0607/7cd24ec283214e9086b107961d409c245.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (10, 4, '10002001', NULL, NULL, '4', NULL, 'http://img10.jiuxian.com/2019/1203/a634474a7a1842928cbc9896a3adcb8b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (11, 4, '10002002', NULL, NULL, '4', NULL, 'http://img09.jiuxian.com/2019/0627/8e4b7668b63948bb9cc3ff294773272a5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (12, 4, '10002003', NULL, NULL, '4', NULL, 'http://img08.jiuxian.com/2019/0611/119c5806874d46b9ac65d633a4f082465.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (13, 5, '10002004', NULL, NULL, '5', NULL, 'http://img08.jiuxian.com/2017/0822/78c0b66acb7a4707aedb70de47000a815.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (14, 5, '10002005', NULL, NULL, '5', NULL, 'http://img07.jiuxian.com/2017/0822/9943eaa21aa64eb2aab522e0530678db5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (15, 5, '10002006', NULL, NULL, '5', NULL, 'http://img08.jiuxian.com/2017/0822/67f109ceb3f14b4e8566681e868071ff5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (16, 6, '10002007', NULL, NULL, '6', NULL, 'http://img06.jiuxian.com/2019/1231/1a688464f6144628a11ab33321f8f4cc5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (17, 6, '10002008', NULL, NULL, '6', NULL, 'http://img06.jiuxian.com/2019/1231/1a688464f6144628a11ab33321f8f4cc5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (18, 6, '10002009', NULL, NULL, '6', NULL, 'http://img06.jiuxian.com/2019/1231/1a688464f6144628a11ab33321f8f4cc5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (19, 7, '10003001', NULL, NULL, '7', NULL, 'http://img08.jiuxian.com/2019/1126/2a1a5f50fb5743c39742607dcaf9f5f15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (20, 7, '10003002', NULL, NULL, '7', NULL, 'http://img09.jiuxian.com/2019/1126/323443850f2d4a3db5b80ce8237bf8dd5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (21, 7, '10003003', NULL, NULL, '7', NULL, 'http://img09.jiuxian.com/2019/1126/dd74a4120cae49359cb69f0d7a4cabf85.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (22, 8, '10003004', NULL, NULL, '8', NULL, 'http://img10.jiuxian.com/2017/0503/98e610101dbc4fc6bff38ff62f007cd95.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (23, 8, '10004001', NULL, NULL, '8', NULL, 'http://img07.jiuxian.com/2017/0503/92c22504cdca4834a3140c0b847f34e55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (24, 8, '10004002', NULL, NULL, '8', NULL, 'http://img09.jiuxian.com/2017/0503/0528c0707bbd4593855ad33a2b3a04e15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (25, 9, '10004003', NULL, NULL, '9', NULL, 'http://img07.jiuxian.com/2018/1126/f64f01c3fb2241fdb21d6f5918c0e6795.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (26, 9, '10004004', NULL, NULL, '9', NULL, 'http://img06.jiuxian.com/2018/1126/dc3442eb82c846d8a93db75e87d154535.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (27, 9, '10004005', NULL, NULL, '9', NULL, 'http://img08.jiuxian.com/2018/1126/711142a7049843bab12c27c9f0a114745.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (28, 10, '10004006', NULL, NULL, '10', NULL, 'http://img09.jiuxian.com/2018/1123/88aeae38780e47ecb09d10f69e3c0a745.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (29, 10, '10004007', NULL, NULL, '10', NULL, 'http://img07.jiuxian.com/2018/1123/374578cb97be4bebb84ad435bed663a45.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (30, 10, '10004008', NULL, NULL, '10', NULL, 'http://img09.jiuxian.com/2018/1123/0c9ccf6ce12d4d768a4bbf92f58608075.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (31, 11, '10004009', NULL, NULL, '11', NULL, 'http://img08.jiuxian.com/2019/1225/51b701c876184915834953fddf940b685.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (32, 11, '10004010', NULL, NULL, '11', NULL, 'http://img07.jiuxian.com/2019/1225/86bd9e3cda2f437490f045f7a7d6b7455.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (33, 11, '10004011', NULL, NULL, '11', NULL, 'http://img09.jiuxian.com/2019/1225/f2873246ef5445dbaed9d33f9e9b0b5d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (34, 12, '10004012', NULL, NULL, '12', NULL, 'http://img09.jiuxian.com/2019/1230/5ef3526427a548b9819162bae3aeca195.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (35, 12, '10004013', NULL, NULL, '12', NULL, 'http://img08.jiuxian.com/2019/1111/e5121848fafb400d9cffa2b21d1570255.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (36, 12, '10004014', NULL, NULL, '12', NULL, 'http://img06.jiuxian.com/2018/0412/178d4cb9802d41ffa4c1bd2170d7359d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (37, 13, '10004015', NULL, NULL, '13', NULL, 'http://img09.jiuxian.com/2017/0106/3c0b1a4c97d248be868da541e56b9d0d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (38, 13, '10005001', NULL, NULL, '13', NULL, 'http://img07.jiuxian.com/2017/0106/c3da469a0a8249db9965f2772df6a1dd5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (39, 13, '10005002', NULL, NULL, '13', NULL, 'http://img08.jiuxian.com/2017/0106/d5b2ac8e4ef9427ab0c635758782a0495.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (40, 14, '10005003', NULL, NULL, '14', NULL, 'http://img08.jiuxian.com/2019/1224/7a9ea1714bdd496fac3bc546ed5e50005.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (41, 14, '10005004', NULL, NULL, '14', NULL, 'http://img07.jiuxian.com/2019/0403/975c2860fb7d4ccfb481c77e3e3926185.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (42, 14, '10005005', NULL, NULL, '14', NULL, 'http://img09.jiuxian.com/2019/0321/3669e84803dc45cd81dd24d6f13ec9b85.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (43, 15, '10005006', NULL, NULL, '15', NULL, 'http://img10.jiuxian.com/2017/0221/9a0729cdcac94714ae9c034bb3f4f05d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (44, 15, '10005007', NULL, NULL, '15', NULL, 'http://img07.jiuxian.com/2017/0205/74ec8fe4003a46d99472637f310dc6a45.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (45, 15, '10005008', NULL, NULL, '15', NULL, 'http://img09.jiuxian.com/2017/0205/12936597a2094896b240ab895f48cc685.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (46, 16, '10005009', NULL, NULL, '16', NULL, 'http://img06.jiuxian.com/2019/1223/ec8510eec62b416e9841b5db123e40875.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (47, 16, '10005010', NULL, NULL, '16', NULL, 'http://img07.jiuxian.com/2019/1028/83469fefe604438bb1df890aa557eddb5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (48, 16, '10005011', NULL, NULL, '16', NULL, 'http://img06.jiuxian.com/2019/0918/b148588a5e6e49af8046f987979204b55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (49, 17, '10005012', NULL, NULL, '17', NULL, 'http://img08.jiuxian.com/2016/1223/540bb441b5aa43e4a16d1d3edc75b4e85.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (50, 17, '10005013', NULL, NULL, '17', NULL, 'http://img10.jiuxian.com/2016/1223/bddea772ff824a2c8d2f6faa62378ec85.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (51, 17, '10005014', NULL, NULL, '17', NULL, 'http://img09.jiuxian.com/2016/1223/eceeb93a6d994756beaac9f09bb54aa55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (52, 18, '10005015', NULL, NULL, '18', NULL, 'http://img06.jiuxian.com/2016/1230/c6bdbab51b654fe29dd9a1a2d570be935.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (53, 18, '10005016', NULL, NULL, '18', NULL, 'http://img09.jiuxian.com/2016/1230/e6296b1d761844b2bf98e78e057733465.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (54, 18, '10005017', NULL, NULL, '18', NULL, 'http://img09.jiuxian.com/2016/1230/f778b49e21d8464ea90aa5b94e4f90d15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (55, 19, '10005018', NULL, NULL, '19', NULL, 'http://img06.jiuxian.com/2017/0209/c65aaca28bc1492bb2570ebb28b8f24b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (56, 19, '10006001', NULL, NULL, '19', NULL, 'http://img08.jiuxian.com/2017/0209/15632d953336419091a6dd2dbac68a4b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (57, 19, '10006002', NULL, NULL, '19', NULL, 'http://img08.jiuxian.com/2017/0209/e3296225103c42afb406ce5ae71e58705.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (58, 20, '10006003', NULL, NULL, '20', NULL, 'http://img09.jiuxian.com/2019/0428/e7faf3e27ceb4ccca1f946ec45e3b8285.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (59, 20, '10006004', NULL, NULL, '20', NULL, 'http://img10.jiuxian.com/2019/1017/f5eedc204fb3404e88d156c818cc09925.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (60, 20, '10006005', NULL, NULL, '20', NULL, 'http://img06.jiuxian.com/2019/1017/ba4814c008474fc983ca3f3a9326a9bc5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (61, 21, '10006006', NULL, NULL, '21', NULL, 'http://img09.jiuxian.com/2019/1106/3f7e5df6f2b0403dba87dc237d1928b35.png', NULL);
INSERT INTO `pms_sku_stock` VALUES (62, 21, '10006007', NULL, NULL, '21', NULL, 'http://img09.jiuxian.com/2019/1030/0ce11f86586948058787891f65fbdb735.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (63, 21, '10006008', NULL, NULL, '21', NULL, 'http://img10.jiuxian.com/2019/1030/c40ca3777bfe4d779339c33d8ffe92ed5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (64, 22, '10006009', NULL, NULL, '22', NULL, 'http://img09.jiuxian.com/2018/0917/ab5e52fc89f94b9788ff056b795017d95.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (65, 22, '10006010', NULL, NULL, '22', NULL, 'http://img10.jiuxian.com/2018/0917/cefcb17b13d941a486eeb22a817a3c1e5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (66, 22, '10006011', NULL, NULL, '22', NULL, 'http://img10.jiuxian.com/2018/0917/6673e03d41b5464d962bc7b850b9ed915.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (67, 23, '10006012', NULL, NULL, '23', NULL, 'http://img07.jiuxian.com/2013/1002/7bc45e5c405341a1872be2b64ee4fb175.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (68, 23, '20001001', NULL, NULL, '23', NULL, 'http://img08.jiuxian.com/2013/1002/be733f2994c74772901ca1cc714386c45.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (69, 23, '20001002', NULL, NULL, '23', NULL, 'http://img07.jiuxian.com/2013/1002/55c87387f86e4c19a8ed64af9599c62d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (70, 24, '20001003', NULL, NULL, '24', NULL, 'http://img09.jiuxian.com/2013/1002/5216098b0a2c4cba8313c613330f1d9b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (71, 24, '20001004', NULL, NULL, '24', NULL, 'http://img09.jiuxian.com/2013/1002/6f31f40901be4fd39238e4f560a86e985.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (72, 25, '20001005', NULL, NULL, '25', NULL, 'http://img08.jiuxian.com/2014/0426/bf9fd1a028b54a4f9c503a4a630aa7c15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (73, 25, '20001006', NULL, NULL, '25', NULL, 'http://img10.jiuxian.com/2014/0426/498775309c3d4c0d9a53c7584a0672ea5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (74, 25, '20001007', NULL, NULL, '25', NULL, 'http://img10.jiuxian.com/2014/0426/0b9ec95b1ea04203840faa42ed44bd9b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (75, 25, '20001008', NULL, NULL, '25', NULL, 'http://img06.jiuxian.com/2014/0426/8bc798ea1e124149972767480aa781f55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (76, 26, '20002001', NULL, NULL, '26', NULL, 'http://img09.jiuxian.com/2014/0825/b283c78d952c48bbbaf26a2b6c72b57e5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (77, 26, '20002002', NULL, NULL, '26', NULL, 'http://img06.jiuxian.com/2014/0825/5b5e294c090448d2aa200808833023125.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (78, 26, '20002003', NULL, NULL, '26', NULL, 'http://img10.jiuxian.com/2014/0825/0d532cd5fb3d4ed7bd3fd45e797f68bf5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (79, 27, '20002004', NULL, NULL, '27', NULL, 'http://img06.jiuxian.com/2016/0510/67b8eb12492e497eb4eb30211d9a7d075.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (80, 27, '20002005', NULL, NULL, '27', NULL, 'http://img07.jiuxian.com/2016/0510/8752ab5c4aa8431ea595b56a6315e7cb5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (81, 27, '20002006', NULL, NULL, '27', NULL, 'http://img07.jiuxian.com/2016/0510/8e6cb7cfb3cd4930b8b2d2c85453dbea5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (82, 28, '20002007', NULL, NULL, '28', NULL, 'http://img10.jiuxian.com/2018/1225/150b66fa6dfa4740956ee1da58b8817b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (83, 28, '20002008', NULL, NULL, '28', NULL, 'http://img07.jiuxian.com/2017/0622/4b0efe34a3944612b990f4940e8401915.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (84, 28, '20003001', NULL, NULL, '28', NULL, 'http://img07.jiuxian.com/2017/0622/f427b8c3bde94c038d1e97236e6012145.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (85, 29, '20003002', NULL, NULL, '29', NULL, 'http://img10.jiuxian.com/2019/0225/8ff27752af0d4358a8456913a00502d65.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (86, 29, '20004001', NULL, NULL, '29', NULL, 'http://img06.jiuxian.com/2019/0225/f3142dad917f433f94ea82d77929c0d05.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (87, 29, '20004002', NULL, NULL, '29', NULL, 'http://img10.jiuxian.com/2019/0225/a0929f6fa62c40e0b97f26f317cebf1f5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (88, 30, '20004003', NULL, NULL, '30', NULL, 'http://img10.jiuxian.com/2018/1106/dce1464f3b3842d0973e63c77e6f27e15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (89, 30, '20004004', NULL, NULL, '30', NULL, 'http://img06.jiuxian.com/2018/1106/3cd6d71e88b54ff2b3c0d340c0c1be7a5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (90, 30, '20005001', NULL, NULL, '30', NULL, 'http://img10.jiuxian.com/2018/1106/42c8672135e2458ebe50f67346afaf2d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (91, 31, '20005002', NULL, NULL, '31', NULL, 'http://img08.jiuxian.com/2017/0601/76d91ff41241457e8b74788140eac3be5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (92, 31, '20005003', NULL, NULL, '31', NULL, 'http://img06.jiuxian.com/2017/0601/a31eddb9a960476690b06068417a1b835.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (93, 31, '20005004', NULL, NULL, '31', NULL, 'http://img06.jiuxian.com/2017/0601/79110533a5ac4e398466bbb1bb9157375.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (94, 32, '20005005', NULL, NULL, '32', NULL, 'http://img07.jiuxian.com/2017/0922/6b7d4979a28b4fd3af28e3169e58ba815.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (95, 32, '20005006', NULL, NULL, '32', NULL, 'http://img10.jiuxian.com/2017/0922/1d4daeeb39fd4d68bc9e689c70c97b065.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (96, 32, '20005007', NULL, NULL, '32', NULL, 'http://img08.jiuxian.com/2017/0922/680a2e3c7d354eed973ab9f6f81af5465.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (97, 33, '20005008', NULL, NULL, '33', NULL, 'http://img10.jiuxian.com/2019/0403/a38df60cc17d453e9fe89b907bd3b2d55.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (98, 33, '20005009', NULL, NULL, '33', NULL, 'http://img07.jiuxian.com/2019/0403/6ab3a2fc0ed1468bb31ed20dd769ac895.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (99, 33, '20005010', NULL, NULL, '33', NULL, 'http://img09.jiuxian.com/2019/0403/29d50f76034e4446b3b14e4ea6230e665.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (100, 34, '20005011', NULL, NULL, '34', NULL, 'http://img10.jiuxian.com/2019/0125/b7566cb89ddd449ea915458d94604aa15.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (101, 34, '20005012', NULL, NULL, '34', NULL, 'http://img07.jiuxian.com/2019/0125/5908c83cea9c441296dae5ca2304f2175.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (102, 34, '20006001', NULL, NULL, '34', NULL, 'http://img08.jiuxian.com/2019/0125/e6b570a3c14b46789ee3765c3241689d5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (103, 35, '20006002', NULL, NULL, '35', NULL, 'http://img07.jiuxian.com/2016/1117/0be1c0b2a8b34b1f9ef4887ef4f991df5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (104, 35, '20006003', NULL, NULL, '35', NULL, 'http://img10.jiuxian.com/2016/1117/ce679d5fa2df4c269e6be0e29614704b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (105, 35, '20006004', NULL, NULL, '35', NULL, 'http://img10.jiuxian.com/2016/1117/b8c392b96b694d6c97158751d2a72d2b5.jpg', NULL);
INSERT INTO `pms_sku_stock` VALUES (106, NULL, '20006005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (107, NULL, '20006006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (108, NULL, '20006007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (109, NULL, '20006008', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (110, NULL, '20007001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (111, NULL, '20007002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (112, NULL, '20008001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (113, NULL, '20008002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (114, NULL, '20008003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (115, NULL, '20008004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (116, NULL, '20008005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (117, NULL, '20008006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (118, NULL, '20008007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (119, NULL, '20008008', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (120, NULL, '20008009', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (121, NULL, '20008010', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (122, NULL, '20008011', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (123, NULL, '20008012', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (124, NULL, '20008013', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (125, NULL, '20008014', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (126, NULL, '20008015', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (127, NULL, '20008016', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (128, NULL, '20008017', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (129, NULL, '20008018', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (130, NULL, '20008019', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (131, NULL, '20008020', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (132, NULL, '20009001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (133, NULL, '20009002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (134, NULL, '20009003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (135, NULL, '20009004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (136, NULL, '20009005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (137, NULL, '20009006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (138, NULL, '20009007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (139, NULL, '20009008', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (140, NULL, '20009009', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (141, NULL, '20009010', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (142, NULL, '20009011', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (143, NULL, '20009012', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (144, NULL, '20009013', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (145, NULL, '20009014', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (146, NULL, '20009015', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (147, NULL, '20009016', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (148, NULL, '20009017', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (149, NULL, '20009018', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (150, NULL, '20010001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (151, NULL, '20010002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (152, NULL, '20010003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (153, NULL, '20010004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (154, NULL, '20010005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (155, NULL, '20010006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (156, NULL, '20010007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (157, NULL, '20010008', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (158, NULL, '20010009', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (159, NULL, '20011001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (160, NULL, '20011002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (161, NULL, '20011003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (162, NULL, '20011004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (163, NULL, '20011005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (164, NULL, '20011006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (165, NULL, '20012001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (166, NULL, '20012002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (167, NULL, '20012003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (168, NULL, '20013001', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (169, NULL, '20013002', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (170, NULL, '20013003', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (171, NULL, '20013004', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (172, NULL, '20013005', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (173, NULL, '20013006', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (174, NULL, '20013007', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (175, NULL, '20013008', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (176, NULL, '20013009', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pms_sku_stock` VALUES (177, NULL, '20013010', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `coupon_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_type` int(1) NULL DEFAULT NULL COMMENT '优惠卷类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `coupon_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `use_type` int(1) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `coupon_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT '领取数量',
  `product_id` int(50) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠卷表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (2, 0, '全品类通用券', 92, 10.00, 1, 100.00, '2018-08-27 16:40:47', '2018-11-23 16:40:47', 0, '满100减10', 100, 0, 8, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, '小米手机专用券', 92, 50.00, 1, 1000.00, '2018-08-27 16:40:47', '2018-11-16 16:40:47', 2, '小米手机专用优惠券', 100, 0, 8, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, '手机品类专用券', 92, 300.00, 1, 2000.00, '2018-08-27 16:40:47', '2018-09-15 16:40:47', 1, '手机分类专用优惠券', 100, 0, 8, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'T恤分类专用优惠券', 93, 50.00, 1, 500.00, '2018-08-27 16:40:47', '2018-08-15 16:40:47', 1, '满500减50', 100, 0, 7, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, '新优惠券', 100, 100.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-27 00:00:00', 0, '测试', 100, 0, 1, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, '全品类通用券', 100, 5.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, '全品类通用券', 100, 15.00, 1, 200.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, '全品类通用券', 1000, 50.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 1000, 0, 0, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, '移动端全品类通用券', 1, 10.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 0, NULL);
INSERT INTO `sms_coupon` VALUES (19, 0, '手机分类专用', 100, 100.00, 1, 1000.00, '2018-11-09 00:00:00', '2018-11-17 00:00:00', 1, '手机分类专用', 100, 0, 0, NULL);
INSERT INTO `sms_coupon` VALUES (20, 0, '小米手机专用', 100, 200.00, 1, 1000.00, '2018-11-09 00:00:00', '2018-11-24 00:00:00', 2, '小米手机专用', 100, 0, 0, NULL);
INSERT INTO `sms_coupon` VALUES (21, 0, 'xxx', 100, 10.00, 1, 100.00, '2018-11-09 00:00:00', '2018-11-30 00:00:00', 2, NULL, 100, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账户',
  `admin_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `admin_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `admin_create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `admin_status` int(1) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  `admin_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `admin_leaderid` int(255) NULL DEFAULT NULL COMMENT '领导',
  `admin_role` int(255) NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, '93391308', 'admin', '123', '', 'admin@163.com', '2018-09-29 13:55:30', 1, '系统超级管理员', 0, 0);
INSERT INTO `ums_admin` VALUES (2, '46739758', 'tom', '123', '', 'tom@163.com', '2018-10-08 13:32:47', 1, '入驻商家信息管理', 1, 0);
INSERT INTO `ums_admin` VALUES (3, '75157980', 'xiaoming', '123', NULL, 'xiaoming@163.com', '2019-10-16 14:24:15', 1, '招商引资管理员', 1, 0);
INSERT INTO `ums_admin` VALUES (4, '34507884', 'xiaobai', '123', NULL, 'xiaobai@163.com', '2019-10-16 14:24:18', 1, '入驻商家信息管理', 1, 0);
INSERT INTO `ums_admin` VALUES (5, '30875331', '苹果', '123', NULL, 'pingguo@163.com', '2019-10-01 14:25:40', 1, '品牌管理员', 2, 1);
INSERT INTO `ums_admin` VALUES (6, '99241014', '小米', '123', NULL, 'xiaomi@163.com', '2019-10-04 14:32:43', 1, '品牌管理员', 2, 3);
INSERT INTO `ums_admin` VALUES (7, '72390434', 'OPPO', '123', NULL, 'oppo@163.com', '2019-10-06 14:36:01', 1, '品牌管理员', 2, 4);
INSERT INTO `ums_admin` VALUES (8, '61284751', 'VIVO', '123', NULL, 'vivo@163.com', '2019-10-02 14:37:44', 1, '品牌管理员', 2, 5);
INSERT INTO `ums_admin` VALUES (9, '80450214', '华为', '123', NULL, 'huawei@163.com', '2019-10-09 14:38:50', 1, '品牌管理员', 2, 2);
INSERT INTO `ums_admin` VALUES (10, '27979210', '锤子', '123', NULL, 'chuizi@163.com', '2019-10-13 14:39:51', 1, '品牌管理员', 2, 6);

-- ----------------------------
-- Table structure for ums_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role`;
CREATE TABLE `ums_admin_role`  (
  `admin_role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `role_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT '后台用户数量',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  PRIMARY KEY (`admin_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_admin_role
-- ----------------------------
INSERT INTO `ums_admin_role` VALUES (1, '超级管理员', '系统管理员', 0, 1);
INSERT INTO `ums_admin_role` VALUES (2, '入驻商家信息管理', '系统管理员', 0, 1);
INSERT INTO `ums_admin_role` VALUES (3, '招商引资管理员', '系统管理员', 0, 1);
INSERT INTO `ums_admin_role` VALUES (4, '品牌管理员', '品牌管理员', 0, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `member_password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `member_status` int(1) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `member_create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `member_icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `member_gender` int(1) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `member_birthday` date NULL DEFAULT NULL COMMENT '生日',
  `member_city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `integration` int(11) NULL DEFAULT NULL COMMENT '积分',
  `member_level` int(11) NULL DEFAULT NULL COMMENT '会员',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`member_username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`member_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 1, '15222109461', '123456', '15222109461', 1, '2018-08-02 10:35:44', NULL, 1, '2009-06-01', '上海', 1046, 4);
INSERT INTO `ums_member` VALUES (2, 2, '13848384384', '123456', '13848384384', 1, '2018-08-03 16:46:38', NULL, 2, '1999-09-01', '北京', 2000, 4);
INSERT INTO `ums_member` VALUES (3, 3, '15016682413', '123456', '15056682413', 1, '2018-11-12 14:12:04', NULL, 1, '1894-06-13', '天津', 5000, 1);
INSERT INTO `ums_member` VALUES (4, 4, '12345678911', '123456', '18061581841', 1, '2018-11-12 14:12:38', NULL, 2, '1989-07-14', '深圳', 7000, 1);
INSERT INTO `ums_member` VALUES (5, 4, 'wangwu', '123456', '18061581842', 1, '2018-11-12 14:13:09', NULL, 1, '1994-06-15', '广州', 8000, 1);
INSERT INTO `ums_member` VALUES (6, 4, 'lion', '123', '18061581845', 1, '2018-11-12 14:21:39', NULL, 2, '1996-07-05', '青岛', 15000, 2);
INSERT INTO `ums_member` VALUES (7, 4, 'shari', '123', '18061581844', 1, '2018-11-12 14:22:00', NULL, 0, '1989-06-09', '大连', 15000, 2);
INSERT INTO `ums_member` VALUES (8, 4, 'aewen', '123', '18061581843', 1, '2018-11-12 14:22:55', NULL, 0, '1990-10-16', '南京', 60000, 3);
INSERT INTO `ums_member` VALUES (11, 4, '13207622900', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4798, NULL);

-- ----------------------------
-- Table structure for ums_member_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_address`;
CREATE TABLE `ums_member_address`  (
  `member_address_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `post_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`member_address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member_address
-- ----------------------------
INSERT INTO `ums_member_address` VALUES (1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园', 1, '12345');
INSERT INTO `ums_member_address` VALUES (2, 1, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园', 0, '12345');
INSERT INTO `ums_member_address` VALUES (3, 1, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园', 0, '12345');
INSERT INTO `ums_member_address` VALUES (5, 10, '6', '13207622900', '北京市', '北京市', '东城区', '天津工业大学', NULL, NULL);
INSERT INTO `ums_member_address` VALUES (6, 11, '515', '13207622900', '天津市', '天津市', '西青区', '天津工业大学', NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `member_level_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_point` bigint(255) NULL DEFAULT NULL,
  `discount` double(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`member_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 5000, 0.98);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 15000, 0.95);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 50000, 0.90);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 0, 1.00);

SET FOREIGN_KEY_CHECKS = 1;
