<template>
  <div id="detail_wrapper">
    <Header class="header_wrapper">
      <van-row slot="header">
        <div class="_flex">
          <van-col span="3">
            <van-icon name="arrow-left" class="arrow-left" @click="back"></van-icon>
          </van-col>
          <van-col span="18">
            <div class="center">商品详情</div>
          </van-col>
          <van-col span="3"></van-col>
        </div>
      </van-row>
    </Header>

    <!-- 轮播 -->
    <Swiper :swiperList="swiperList" :swiperOption="swiperOption" class="swiper_wrapper"></Swiper>

    <!-- 返回顶部 -->
    <ReturnTop v-show="scrollTop>200"></ReturnTop>
  </div>
</template>
 
<script>
import Header from "../../components/Header/main";
import ReturnTop from "../../components/ReturnTop/main";
import Swiper from "../../components/Swiper/main";
import { request } from "../../request/request";
import Vue from "vue";
import { Row, Col, Icon } from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon);

export default {
  data() {
    return {
      id: this.$route.params.id,
      scrollTop: "",
      swiperList: [],
      swiperOption: {
        loop: true,
        pagination: {
          el: ".swiper-pagination"
        },
        autoplay: {
          disableOnInteraction: false
        },
        effect: "cube"
      }
    };
  },
  created() {
    this.getSwiperList();
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
    handleScroll() {
      this.scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
    },
    getSwiperList() {
      request({
        url: "/cartPic",
        params: {
          product_color: this.id,
          product_id: this.id
        }
      }).then(res => {
        this.swiperList = res.data;
      });
    }
  },
  components: {
    Header,
    ReturnTop,
    Swiper
  }
};
</script>

<style lang="less" src="./style.less" scoped>
</style>