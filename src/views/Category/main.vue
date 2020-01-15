<template>
  <div id="category_wrapper">
    <Header class="header_wrapper">
      <van-row slot="header">
        <div class="_flex">
          <van-col span="3">
            <van-icon name="arrow-left" class="arrow-left" @click="back"></van-icon>
          </van-col>
          <van-col span="18">
            <div class="center">选酒</div>
          </van-col>
          <van-col span="3"></van-col>
        </div>
      </van-row>
    </Header>

    <!-- 搜索 -->

    <van-row>
      <van-col span="24">
        <div class="cate_input">
          <el-input placeholder="请输入关键字搜索酒类" v-model="headerInput" @click.native="goSearch">
            <i slot="suffix" class="el-input__icon el-icon-search header_search"></i>
          </el-input>
        </div>
      </van-col>
    </van-row>

    <!-- 分类 -->

    <van-row>
      <div class="_cate">
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(1)">
            <span class="iconfont icon-43"></span>
            <div class="_item_tip">白酒</div>
          </div>
        </van-col>
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(2)">
            <span class="iconfont icon-jiu3"></span>
            <div class="_item_tip">洋酒</div>
          </div>
        </van-col>
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(3)">
            <span class="iconfont icon-xiang"></span>
            <div class="_item_tip">红酒整箱</div>
          </div>
        </van-col>
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(4)">
            <span class="iconfont icon-jiu1"></span>
            <div class="_item_tip">老酒</div>
          </div>
        </van-col>
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(5)">
            <span class="iconfont icon-jiu2"></span>
            <div class="_item_tip">葡萄酒</div>
          </div>
        </van-col>
        <van-col span="8">
          <div class="_cate_item" @click="goTwoLevelCate(6)">
            <span class="iconfont icon-jiu"></span>
            <div class="_item_tip">啤酒</div>
          </div>
        </van-col>
      </div>
    </van-row>
  </div>
</template>
<script>
import Header from "../../components/Header/main";
import Vue from "vue";
import { Row, Col, Icon } from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon);
import { request } from "../../request/request";
export default {
  data() {
    return {
      headerInput: ""
    };
  },
  methods: {
    back() {
      this.$router.go(-1);
    },
    goSearch() {
      this.$router.push("/search");
    },
    goTwoLevelCate(id) {
      this.$router.push("/twolevelcate/" + id);
    }
  },
  components: {
    Header
  }
};
</script>
<style  lang='less' src="./style.less" scoped>
</style>
<style src="./icon/iconfont.css">
</style>
<style>
#category_wrapper .el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #dcdfe6;
  outline: 0;
}
#category_wrapper .el-input--suffix .el-input__inner {
  padding-left: 30px;
  background-color: #ececec;
  border: 0;
}
</style>