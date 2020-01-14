<template>
  <div id="swiper_wrapper">
    <swiper :options="swiperOption" v-if="swiperList.length">
      <!-- 必须设置vif否则loop无效 -->
      <swiper-slide v-for="(item, index) in swiperList" :key="index">
        <div v-if="!homeFlag">
          <img :src="item.bigPic||item.pic" alt />
        </div>
        <div v-else>
          <img v-lazy="item.productPic" @click="$router.push('/detail/'+item.productId)" />
          <div class="item_text">{{item.productName}}</div>
          <div class="item_price _red">￥{{item.productPrice.toFixed(2)}}</div>
        </div>
      </swiper-slide>
      <div class="swiper-pagination" slot="pagination"></div>
    </swiper>
  </div>
</template>

<script>
import Vue from "vue";
import VueAwesomeSwiper from "vue-awesome-swiper";

// require styles
import "swiper/dist/css/swiper.css";

Vue.use(VueAwesomeSwiper /* { default global options } */);
export default {
  data() {
    return {};
  },
  props: {
    swiperList: {
      type: Array,
      default() {
        return [];
      }
    },
    swiperOption: {
      type: Object,
      default() {
        return {
          loop: true,
          autoplay: {
            disableOnInteraction: false
          }
        };
      }
    },
    homeFlag: {
      type: Boolean,
      default: false
    }
  },

  methods: {},

  mounted() {}
};
</script>

<style  lang="less" scoped>
#swiper_wrapper {
  img {
    width: 100%;
  }
  .item_text {
    font-size: 13px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    height: 40px;
    font-weight: 400;
    line-height: 20px;
  }
  .item_price {
    margin-top: 10px;
    font-size: 15px;
    font-weight: 700;
  }
}
</style>
<style>
.swiper-pagination-bullet-active {
  background: white;
}
</style>