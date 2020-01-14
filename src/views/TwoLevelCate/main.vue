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
        <div class="_cate _flex" ref="_cate">
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

    <van-popup position="top" :style="{ height: '30%' }" v-model="condition">
      <div class="_padding condition">
        <van-row>
          <van-divider content-position="left" class="title">根据价格筛选</van-divider>
          <van-col
            span="12"
            v-for="(item, index) in collapse.priceList"
            :key="index"
            @click="sendPrice(item.value,index)"
          >
            <div
              class="_condition_item"
              :class="{_condition_item_active:currentPrice==index}"
            >{{item.label}}</div>
          </van-col>
        </van-row>

        <div class="_flex">
          <el-button type="danger" @click="filterList" circle>确定</el-button>
          <el-button @click="currentPrice=-1;price=''" circle>重置</el-button>
        </div>
      </div>
    </van-popup>

    <!-- 返回顶部 -->
    <ReturnTop v-show="cateTop==0" @click="showPopup">200"></ReturnTop>
  </div>
</template>

<script>
import Header from "../../components/Header/main";
import ReturnTop from "../../components/ReturnTop/main";
import { request } from "../../request/request";
import Vue from "vue";
import { Row, Col, Icon, Sticky, Popup, Cell, Divider } from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon)
  .use(Sticky)
  .use(Cell)
  .use(Popup)
  .use(Divider);

export default {
  data() {
    return {
      headerInput: "",
      currentIndex: 1,
      sortFlag: false,
      scrollTop: "",
      cateGoodsList: [],
      condition: false,
      collapse: {
        priceList: [
          { label: "1-99元", value: "1-99" },
          { label: "100-299元", value: "100-299" },
          { label: "300-499元", value: "300-499" },
          { label: "500-699元", value: "500-699" },
          { label: "700元以上", value: "700-" }
        ]
      },
      price: "",
      temporaryList: [],
      currentPrice: -1,
      cateTop: ""
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
      if (this.currentIndex == 2) {
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
      } else if (this.currentIndex == 3) {
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
          this.cateGoodsList = this.temporaryList = res.data;
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
      this.cateTop = this.$refs._cate.offsetTop;
    },
    goDetail(id) {
      this.$router.push("/detail/" + id);
    },
    showPopup() {
      this.condition = true;
    },
    sendPrice(value, index) {
      this.price = value;
      this.currentPrice = index;
    },
    filterList() {
      this.condition = false;
      this.cateGoodsList = this.temporaryList;
      var res = this.price.split("-");
      this.cateGoodsList = this.cateGoodsList.filter(item => {
        if (res[1]) {
          return item.productPrice >= res[0] && item.productPrice < res[1];
        } else {
          return item.productPrice >= res[0];
        }
      });
      if (!this.cateGoodsList.length) {
        this.$message({
          message: "搜索为空，换个价格试试",
          type: "error",
          duration: 1200,
          offset: 2
        });
      }
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
#twoLevelCate_wrapper .flex_box .el-input--suffix .el-input__inner {
  padding-left: 30px;
  background-color: #ececec;
  border: 0;
}
#twoLevelCate_wrapper
  .el-input__suffix-inner
  .el-input__icon.el-icon-circle-close.el-input__clear {
  line-height: 25px;
}
#twoLevelCate_wrapper .form .el-input__icon {
  line-height: 25px;
}
</style>