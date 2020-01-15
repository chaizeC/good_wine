<template>
  <div id="cart_wrapper">
    <Header class="header_wrapper">
      <van-row slot="header">
        <div class="_flex">
          <van-col span="3">
            <van-icon name="arrow-left" class="arrow-left" @click="back"></van-icon>
          </van-col>
          <van-col span="18">
            <div class="center">购物车</div>
          </van-col>
          <van-col span="3" style="color: #888;">编辑</van-col>
        </div>
      </van-row>
    </Header>

    <div class="content">
      <!-- 购物车为空 -->
      <div v-show="!cartGoodsList.length">
        <div class="empty_cart _padding">
          <img src="./img/emptycart.png" alt class="_img" />
          <div class="word">您的购物车没有商品</div>
          <van-button type="default" @click="$router.push('/category')" class="_btn">去购物</van-button>
        </div>
        <div class="_title">热销推荐</div>
        <Recommend :showTitle="false"></Recommend>
      </div>

      <!-- 购物车不为空 -->
      <div class="full_cart">
        <transition name="van-slide-right">
          <div v-show="cartGoodsList.length">
            <van-checkbox-group v-model="checkboxGroup" ref="checkboxGroup">
              <van-row v-for="(item, index) in cartGoodsList" :key="index">
                <div class="cart_item _flex" :class="{last_item:++index==cartGoodsList.length}">
                  <van-col span="2">
                    <van-checkbox :name="item.productId" icon-disabled checked-color="#ca141d"></van-checkbox>
                  </van-col>
                  <van-col span="6">
                    <img v-lazy="item.productPic" alt class="_img" />
                  </van-col>
                  <van-col span="16">
                    <div class="item_info _flex_col">
                      <div class="logo"></div>
                      <div class="item_text">{{item.productName}}</div>
                      <div class="subtitle">{{item.productSubTitle}}</div>
                      <div class="_flex">
                        <div class="item_price _red">￥{{item.price.toFixed(2)}}</div>
                        <van-stepper v-model="item.quantity" integer />
                      </div>
                    </div>
                  </van-col>
                </div>
              </van-row>
            </van-checkbox-group>
          </div>
        </transition>
      </div>

      <!-- 总计部分 -->
      <div class="total _shadow">
        <van-row>
          <div class="_flex col_center">
            <van-col span="5">
              <van-checkbox v-model="checkedAll" checked-color="#ca141d" @click="toggleAll">全选</van-checkbox>
            </van-col>
            <van-col span="10">
              <span class="_r">
                总计：
                <span class="_red">{{totalPrice}}</span>
              </span>
            </van-col>
            <van-col span="9">
              <div class="total_btn _r">结算({{cartGoodsList.length}})</div>
            </van-col>
          </div>
        </van-row>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import Header from "../../components/Header/main";
import Recommend from "../../components/Recommend/main";
import ReturnTop from "../../components/ReturnTop/main";
import { request } from "../../request/request";
import Vue from "vue";
import {
  Row,
  Col,
  Icon,
  Button,
  Checkbox,
  CheckboxGroup,
  Radio,
  Stepper,
  RadioGroup
} from "vant";
Vue.use(Row)
  .use(Col)
  .use(Icon)
  .use(Button)
  .use(Checkbox)
  .use(CheckboxGroup)
  .use(Radio)
  .use(Stepper)
  .use(RadioGroup);

export default {
  data() {
    return {
      checkboxGroup: []
    };
  },
  created() {
    this.$store.dispatch("initCartList").then(res => {});
  },

  methods: {
    back() {
      this.$router.go(-1);
    },
    // 全选
    toggleAll() {
      if (this.checkboxGroup.length != this.cartGoodsList.length) {
        this.$refs.checkboxGroup.toggleAll(true);
      } else {
        this.$refs.checkboxGroup.toggleAll(false);
      }
    }
  },
  computed: {
    ...mapState(["cartGoodsList"]),
    totalPrice() {
      var totalPrice = 0;
      if (this.checkboxGroup.length) {
        this.cartGoodsList.forEach(item => {
          this.checkboxGroup.forEach(_item => {
            if (item.productId == _item) {
              totalPrice += parseInt(item.price) * parseInt(item.quantity);
            }
          });
        });
        return totalPrice.toFixed(2);
      } else {
        return totalPrice.toFixed(2);
      }
    },
    checkedAll() {
      if (this.checkboxGroup.length == this.cartGoodsList.length) {
        return true;
      } else {
        return false;
      }
    }
  },

  components: {
    Header,
    Recommend
  }
};
</script>

<style lang="less" src="./style.less" scoped>
</style>