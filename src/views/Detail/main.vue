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

    <!-- 内容 -->
    <div class="content">
      <div class="title">
        <span class="logo"></span>
        <div class="text">{{product.productName}}</div>
      </div>
      <div class="_mt">
        <div class="_white _padding">
          <van-row>
            <van-divider content-position="left" style="margin:0">购买数量</van-divider>
            <div class="_flex">
              <van-col span="4">
                <div class="_r">数量：</div>
              </van-col>
              <van-col span="15">
                <van-stepper v-model="product.quantity" integer />
              </van-col>
            </div>
          </van-row>
        </div>
        <div class="headlines">
          <van-row>
            <van-col span="24">商品属性</van-col>
          </van-row>
        </div>
        <div class="attr">
          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="3">
                  <div class="_r">香型:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.subTitle}}</span>
                </van-col>
              </div>
            </van-row>
          </div>

          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="4">
                  <div class="_r">酒精度:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.usePointLimit}}°</span>
                </van-col>
              </div>
            </van-row>
          </div>

          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="5">
                  <div class="_r">贮藏条件:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.albumPics}}</span>
                </van-col>
              </div>
            </van-row>
          </div>

          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="3">
                  <div class="_r">原料:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.description}}</span>
                </van-col>
              </div>
            </van-row>
          </div>

          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="4">
                  <div class="_r">净含量:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.productStock}}ml</span>
                </van-col>
              </div>
            </van-row>
          </div>

          <div class="_white pd">
            <van-row>
              <div class="_flex">
                <van-col span="5">
                  <div class="_r">适用场合:</div>
                </van-col>
                <van-col span="18">
                  <span class="_black">{{product.productNote}}</span>
                </van-col>
              </div>
            </van-row>
          </div>
        </div>
      </div>

      <!-- 商品特点 -->
      <div class="headlines">
        <van-row>
          <van-col span="24">商品特点</van-col>
        </van-row>
      </div>

      <div class="imglist _mt">
        <img :src="item" alt v-for="(item, index) in imglist" :key="index" class="_img" />
      </div>
    </div>

    <!-- 商品导航 -->
    <van-goods-action>
      <van-goods-action-icon icon="home-o" text="首页" @click="$router.push('/home')" />
      <van-goods-action-icon icon="cart-o" text="购物车" @click="$router.push('/cart')" />
      <van-goods-action-button type="danger" text="加入购物车" @click="addToCart" />
    </van-goods-action>

    <!-- 返回顶部 -->
    <ReturnTop v-show="scrollTop>100"></ReturnTop>
  </div>
</template>
 
<script>
import Header from "../../components/Header/main";
import ReturnTop from "../../components/ReturnTop/main";
import Swiper from "../../components/Swiper/main";
import { request } from "../../request/request";
import Vue from "vue";
import {
  Row,
  Col,
  Icon,
  Stepper,
  Divider,
  GoodsAction,
  GoodsActionIcon,
  GoodsActionButton,
  Toast
} from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon)
  .use(Stepper)
  .use(Divider)
  .use(GoodsAction)
  .use(GoodsActionIcon)
  .use(GoodsActionButton)
  .use(Toast);
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
          disableOnInteraction: false,
          delay: 666
        },
        effect: "cube"
      },
      product: {
        quantity: 1
      },
      imglist: []
    };
  },
  created() {
    this.getSwiperList();
    this.getProductById();
    this.getImgList();
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
      })
        .then(res => {
          this.swiperList = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    getProductById() {
      request({
        url: "/productsInfo",
        params: {
          product_id: this.id
        }
      })
        .then(res => {
          for (var k in res.data) {
            this.product[k] = res.data[k];
          }
        })
        .catch(err => {
          console.log(err);
        });
    },
    getImgList() {
      request({
        url: "/productsPic",
        params: {
          product_id: this.id
        }
      })
        .then(res => {
          this.imglist = res.data;
          this.imglist = this.imglist.map(item => {
            return item.pmsAlbumPics[0].pic;
          });
        })
        .catch(err => {
          console.log(err);
        });
    },
    addToCart() {
      this.$store
        .dispatch("addToCart", this.product)
        .then(res => {
          Toast.success("加入购物车成功！");
        })
        .catch(err => {
          console.log(err);
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