<template>
  <div id="home_wrapper">
    <Header
      class="header_wrapper"
      @scroll.native="scrollEvent"
      ref="header"
      :class="{bg_white:scrollTop>0}"
    >
      <van-row slot="header">
        <van-col span="3">
          <div class="flex_box">
            <div class="logo"></div>
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
    <!-- 轮播 -->
    <div class="bgc_swiper">
      <Swiper :swiperList="swiperList" :swiperOption="swiperOption" class="swiper_wrapper"></Swiper>
    </div>
    <!-- 分类 -->
    <div class="_flex mt cate_wrapper" ref="cate">
      <div class="cate_item">
        <img src="./img/baijiu.jpg" alt @click="$router.push('/twolevelcate/' + 1)" />
      </div>

      <div class="cate_item">
        <img src="./img/putaojiu.jpg" alt @click="$router.push('/twolevelcate/' + 5)" />
      </div>

      <div class="cate_item">
        <img src="./img/yangjiu.jpg" alt @click="$router.push('/twolevelcate/' + 2)" />
      </div>

      <div class="cate_item">
        <img src="./img/pijiu.jpg" alt @click="$router.push('/twolevelcate/' + 6)" />
      </div>

      <div class="cate_item">
        <img src="./img/laojiu.jpg" alt @click="$router.push('/twolevelcate/' + 4)" />
        <div class="cover_img">
          <img src="./img/laojiu.png" alt class="_img" />
        </div>
        <div class="cover_text">老酒</div>
      </div>
    </div>

    <!-- 女人 -->
    <van-row>
      <van-col span="24">
        <div class="mt">
          <img src="./img/women.jpg" alt class="_img" />
        </div>
      </van-col>
    </van-row>

    <!-- 头条 -->
    <div class="main">
      <div class="headlines">
        <van-row>
          <van-col span="24">精选频道</van-col>
        </van-row>
      </div>
      <div class="_padding recom_all">
        <van-row>
          <van-col span="24">
            <img src="./img/zuoyin.png" class="img_25" />
          </van-col>
        </van-row>
        <div class="recom_goods">
          <Swiper
            :swiperList="selectedChannelList"
            :swiperOption="swiper_selected"
            :homeFlag="true"
          ></Swiper>
        </div>

        <van-row>
          <van-col span="2" offset="22">
            <img src="./img/youyin.png" class="img_25" />
          </van-col>
        </van-row>
      </div>
    </div>
    <Recommend></Recommend>
    <!-- 返回顶部 -->
    <ReturnTop v-show="scrollTop>cate_top"></ReturnTop>
  </div>
</template>

<script>
import Header from "../../components/Header/main";
import Swiper from "../../components/Swiper/main";
import ReturnTop from "../../components/ReturnTop/main";
import Recommend from "../../components/Recommend/main";
import Vue from "vue";
import { Row, Col } from "vant";
Vue.use(Row).use(Col);

import { request } from "../../request/request";

export default {
  data() {
    return {
      headerInput: "",
      searchList: [],
      swiperList: [],
      swiperOption: {
        loop: true,
        pagination: {
          el: ".swiper-pagination"
        },
        autoplay: {
          disableOnInteraction: false
        },
        effect: "flip",
        flipEffect: {
          slideShadows: true,
          limitRotation: true
        }
      },
      swiper_selected: {
        autoplay: {
          disableOnInteraction: false
        },
        slidesPerView: 3
      },
      temporyList: [],
      random: "",
      selectedChannelList: [],
      scrollTop: "",
      cate_top: ""
    };
  },
  created() {
    this.getBrandLogo();
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    goSearch() {
      this.$router.push("/search");
    },
    getBrandLogo() {
      request({
        url: "/brands"
      })
        .then(res => {
          this.swiperList = res.data;
          this.temporyList = [];
          this.temporyList = this.swiperList.map(item => item.brandId);
          this.temporyList = this.getRandomArrayElements(this.temporyList, 2);
          //请求随机商品  精彩推荐
          request({
            url: "/products",
            params: {
              series_id: this.temporyList[0]
            }
          })
            .then(res => {
              this.selectedChannelList = [];
              this.selectedChannelList.push(...res.data);
              request({
                url: "/products",
                params: {
                  series_id: this.temporyList[1]
                }
              })
                .then(res => {
                  this.selectedChannelList.push(...res.data);
                })
                .catch(err => {
                  console.log(err);
                });
            })
            .catch(err => {
              console.log(err);
            });
        })
        .catch(err => {
          console.log(err);
        });
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
    handleScroll() {
      this.scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      this.cate_top = this.$refs.cate.offsetTop;
    }
  },
  computed: {},

  components: {
    Header,
    Swiper,
    ReturnTop,
    Recommend
  }
};
</script>


<style lang="less" src='./style.less' scoped>
</style>
<style>
#home_wrapper .el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #dcdfe6;
  outline: 0;
}
#home_wrapper .el-input__inner {
  height: 25px;
}
#home_wrapper
  .el-input__suffix-inner
  .el-input__icon.el-icon-search.header_search {
  line-height: 25px;
}
#home_wrapper .el-input--suffix .el-input__inner {
  padding-left: 30px;
  background-color: #ececec;
  border: 0;
}
#home_wrapper
  .el-input__suffix-inner
  .el-input__icon.el-icon-circle-close.el-input__clear {
  line-height: 25px;
}
#home_wrapper .bgc_swiper .swiper-slide img {
  height: 200px;
}
.recom_goods img {
  height: auto;
  width: 25px;
  border-radius: 20px;
}
.recom_goods .swiper-slide {
  padding: 0 5px;
  background: white;
  border-radius: 20px;
}
</style>