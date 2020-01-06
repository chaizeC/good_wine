<template>
  <div id="home_wrapper">
    <Header class="header_wrapper">
      <div slot="left">
        <img src="../../common/img/wine.jpg" alt class="wine" />
      </div>
      <div slot="center"></div>
      <div slot="right"></div>
    </Header>
    <van-button type="default">默认按钮</van-button>
  </div>
</template>

<script>
import Header from "../../components/Header/main";
import Vue from "vue";
import { Button } from "vant";
Vue.use(Button);
export default {
  components: {
    Header
  }
};
</script>

<style scoped>
@import url("./style.less");
</style>
<style lang="less" scoped>
#home_wrapper {
  .header_wrapper {
    .wine {
      width: 80px;
    }
  }
}
</style>