<template>
  <div id="twoLevelCate_wrapper">
    <Header class="header_wrapper flex_box" ref="header">
      <van-row slot="header">
        <van-col span="3">
          <div class="flex_box">
            <van-icon name="arrow-left" class="arrow-left" @click="back"></van-icon>
          </div>
        </van-col>

        <van-col span="21">
          <div class="flex_box">
            <el-input placeholder="请输入关键字搜索酒类" v-model="headerInput" @click.native="goSearch">
              <i slot="suffix" class="el-input__icon el-icon-search header_search"></i>
            </el-input>
          </div>
        </van-col>
      </van-row>
    </Header>

    <!-- 内容 -->
    <van-sticky>
      <van-row>
        <div class="_cate _flex">
          <div
            class="_cate_item"
            :class="{_cate_item_active:currentIndex==1}"
            @click="switchIndex(1)"
          >综合</div>
          <div
            class="_flex _cate_item"
            :class="{_cate_item_active:currentIndex==2}"
            @click="switchIndex(2)"
          >
            <div>价格</div>
            <div class="arrow">
              <i class="el-icon-caret-top" :class="{arrow_active:sortFlag&&currentIndex==2}"></i>
              <i class="el-icon-caret-bottom" :class="{arrow_active:!sortFlag&&currentIndex==2}"></i>
            </div>
          </div>
          <div
            class="_cate_item"
            :class="{_cate_item_active:currentIndex==3}"
            @click="switchIndex(3)"
          >筛选</div>
        </div>
      </van-row>
    </van-sticky>

    <!-- 商品内容 -->
    <van-row>
      <div class="_content _padding">
        <van-col span="24" v-for="(item, index) in cateGoodsList" :key="index">
          <van-row>
            <div class="_item" @click="goDetail(item.productId)">
              <van-col span="8">
                <img :src="item.productPic" class="_img" />
              </van-col>
              <van-col span="16">
                <div class="item_info _padding">
                  <div class="title">{{item.productName}}</div>
                  <div class="logo"></div>
                  <div class="price _flex">
                    <div class="old">￥ {{item.marketPrice.toFixed(2)}}</div>
                    <div class="now">￥ {{item.productPrice.toFixed(2)}}</div>
                  </div>
                </div>
              </van-col>
            </div>
          </van-row>
        </van-col>
      </div>
    </van-row>
    <!-- 弹出层 -->

    <van-popup position="right" :style="{ height: '20%' }" v-model="condition"></van-popup>
    <!-- 返回顶部 -->
    <ReturnTop v-show="scrollTop" @click="showPopup">200"></ReturnTop>
  </div>
</template>

<script>
import Header from "../../components/Header/main";
import ReturnTop from "../../components/ReturnTop/main";
import { request } from "../../request/request";
import Vue from "vue";
import { Row, Col, Icon, Sticky, Popup, Cell } from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon)
  .use(Sticky)
  .use(Cell)
  .use(Popup);

export default {
  data() {
    return {
      headerInput: "",
      currentIndex: 1,
      sortFlag: false,
      scrollTop: "",
      cateGoodsList: [],
      condition: false
    };
  },
  created() {
    this.getTwoLevelById();
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    back() {
      this.$router.go(-1);
    },
    goSearch() {
      this.$router.push("/search");
    },
    switchIndex(index) {
      this.currentIndex = index;
      if (index == 2) {
        if (this.sortFlag) {
          this.cateGoodsList.sort((a, b) => {
            if (a.productPrice > b.productPrice) {
              return -1;
            } else if (a.productPrice < b.productPrice) {
              return 1;
            } else {
              return 0;
            }
          });
          this.sortFlag = false;
        } else {
          this.cateGoodsList.sort((a, b) => a.productPrice - b.productPrice);
          this.sortFlag = true;
        }
      } else if (index == 3) {
        this.showPopup();
      } else {
        this.getTwoLevelById();
        this.sortFlag = false;
      }
    },
    getTwoLevelById() {
      request({
        url: "/products",
        params: {
          series_id: this.$route.params.id
        }
      })
        .then(res => {
          this.cateGoodsList = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    handleScroll() {
      this.scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
    },
    goDetail(id) {
      this.$router.push("/detail/" + id);
    },
    showPopup() {
      this.condition = true;
    }
  },
  components: {
    Header,
    ReturnTop
  }
};
</script>
<style  lang='less' src="./style.less" scoped>
</style>
<style>
#twoLevelCate_wrapper .el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #dcdfe6;
  outline: 0;
}
#twoLevelCate_wrapper .el-input__inner {
  height: 25px;
}
#twoLevelCate_wrapper
  .el-input__suffix-inner
  .el-input__icon.el-icon-search.header_search {
  line-height: 25px;
}
#twoLevelCate_wrapper .el-input--suffix .el-input__inner {
  padding-left: 30px;
  background-color: #ececec;
  border: 0;
}
#twoLevelCate_wrapper
  .el-input__suffix-inner
  .el-input__icon.el-icon-circle-close.el-input__clear {
  line-height: 25px;
}
</style>