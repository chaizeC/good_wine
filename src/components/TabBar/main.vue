<template>
  <div class="_flex _shadow" id="tabbar_wrapper">
    <div class="tab_item" @click="switchPath('/home')">
      <img src="./img/home.png" alt v-if="$route.path!='/home'" />
      <img src="./img/active.png" alt v-else />
      <div :class="{_red:$route.path=='/home'}">主页</div>
    </div>
    <div class="tab_item" @click="switchPath('/category')">
      <img src="./img/category.png" alt v-if="$route.path!='/category'" />
      <img src="./img/category_active.png" alt v-else />
      <div :class="{_red:$route.path=='/category'}">分类</div>
    </div>
    <div class="tab_item" @click="switchPath('/cart')">
      <img src="./img/cart.png" alt v-if="$route.path!='/cart'" />
      <img src="./img/cart_active.png" alt v-else />
      <div :class="{_red:$route.path=='/cart'}">购物车</div>
    </div>
    <div class="tab_item" @click="switchPath('/profile')">
      <img src="./img/profile.png" alt v-if="$route.path!='/profile'" />
      <img src="./img/profile_active.png" alt v-else />
      <div :class="{_red:$route.path=='/profile'}">我的</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TabBar",
  data() {
    return {};
  },
  methods: {
    switchPath(path) {
      this.$router.push(path);
    }
  }
};
</script>

<style lang="less">
#tabbar_wrapper {
  height: 46px;
  position: fixed;
  bottom: 0;
  text-align: center;
  font-size: 12px;
  width: 100%;
  justify-content: space-around;
  .tab_item {
    img {
      width: 30px;
    }
  }
}
</style>