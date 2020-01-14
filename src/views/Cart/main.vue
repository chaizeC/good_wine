<template>
  <div id="cart_wrapper">
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
  created() {
    this.$store.dispatch("initCartList", 1);
  },
  methods: {
    back() {
      this.$router.go(-1);
    }
  },
  components: {
    Header
  }
};
</script>

<style scoped>
@import url("./style.less");
</style>