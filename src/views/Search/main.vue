<template>
  <div id="search_wrapper">
    <Header class="header_wrapper">
      <van-row slot="header">
        <van-col span="3">
          <div class="_flex_col">
            <van-icon name="arrow-left" class="arrow-left" @click="back"></van-icon>
          </div>
        </van-col>
        <van-col span="18">
          <div class="_flex_col">
            <el-input placeholder="请输入关键字搜索酒类" v-model="headerInput" clearable>
              <i slot="prefix" class="el-input__icon el-icon-search header_search"></i>
            </el-input>
          </div>
        </van-col>
        <van-col span="3">
          <div class="_flex_col search_word" @click="getGoodBySearch(headerInput)">搜索</div>
        </van-col>
      </van-row>
    </Header>

    <!-- 热门搜索 -->
    <transition name="van-slide-left">
      <div v-show="searchList.length==0" class="_padding">
        <div class="recommended_key">
          <van-icon name="hot-o" class="recommended_icon" />推荐关键词
        </div>
        <div
          class="recommended_span"
          :class="{_red:redList.indexOf(index)!=-1}"
          v-for="(item, index) in recommendedList"
          :key="index"
          @click="moveKeyToInput(item)"
        >{{item}}</div>
      </div>
    </transition>

    <!-- 搜索的列表 -->
    <transition name="van-slide-right">
      <div v-show="searchList.length!=0" class="search_list">
        <van-list>
          <van-cell v-for="(item,index) in searchList" :key="index" :title="item.productName" />
        </van-list>
      </div>
    </transition>
  </div>
</template>
<script>
import Header from "../../components/Header/main";
import Vue from "vue";
import { Row, Col, Icon, List, Cell } from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon)
  .use(List)
  .use(Cell);
import { request } from "../../request/request";

export default {
  data() {
    return {
      headerInput: "",
      searchList: "",
      recommendedList: [
        "酒",
        "葡萄",
        "老酒",
        "五粮液",
        "葡萄酒",
        "白兰地",
        "进口",
        "52°",
        "整箱",
        "威士忌",
        "伏特加",
        "茅台",
        "二锅头",
        "老窖",
        "干红",
        "白酒",
        "拉菲",
        "啤酒"
      ],
      redList: []
    };
  },
  created() {
    this.recommendedList.forEach((item, index) => {
      this.redList.push(index);
    });
    this.redList = this.getRandomArrayElements(this.redList, 4);
  },
  mounted() {},
  methods: {
    back() {
      this.$router.go(-1);
    },
    getRandomArrayElements(arr, count) {
      var shuffled = arr.slice(0),
        i = arr.length,
        min = i - count,
        temp,
        index;
      while (i-- > min) {
        index = Math.floor((i + 1) * Math.random());
        temp = shuffled[index];
        shuffled[index] = shuffled[i];
        shuffled[i] = temp;
      }
      return shuffled.slice(min);
    },
    getGoodBySearch(value) {
      request({
        url: "/selectProductByName",
        params: {
          product_name: value
        }
      })
        .then(res => {
          this.searchList = res.data;
          if (this.searchList.length) {
            this.$message({
              message: "搜索成功",
              type: "success",
              duration: 1000,
              offset: 2
            });
          } else {
            this.$message({
              message: "搜索为空，换个关键词试试",
              type: "info",
              duration: 1000,
              offset: 2
            });
          }
        })
        .catch(err => {});
    },
    moveKeyToInput(item) {
      this.headerInput = item;
    }
  },
  components: {
    Header
  }
};
</script>
<style lang="less" src='./style.less' scoped>
</style>
<style>
._flex_col .el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #dcdfe6;
  outline: 0;
}
._flex_col .el-input--prefix .el-input__inner {
  padding-left: 30px;
  background-color: #ececec;
  border: 0;
}
._flex_col .el-input__inner {
  height: 25px;
}
._flex_col .el-input__prefix .el-input__icon.el-icon-search.header_search {
  line-height: 25px;
}
._flex_col .el-input__icon.el-icon-circle-close.el-input__clear {
  line-height: 25px;
}
</style>