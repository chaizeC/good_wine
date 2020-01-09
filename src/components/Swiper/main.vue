<template>
  <div id="swiper_wrapper">
    <swiper :options="swiperOption" v-if="swiperList.length">
      <!-- 必须设置vif否则loop无效 -->
      <swiper-slide v-for="(item, index) in swiperList" :key="index">
        <div v-if="!homeFlag">
          <img :src="item.bigPic" alt />
        </div>
        <div v-else>
          <img v-lazy="item.pic||item.productPic" />
          <div class="item_text">{{item.productName}}</div>
          <div class="item_price _red">{{item.productPrice.toFixed(2)}}</div>
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
    font-size: 12px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  .item_price {
    font-size: 12px;
  }
}
</style>
<style>
.swiper-pagination-bullet-active {
  background: white;
}
</style>