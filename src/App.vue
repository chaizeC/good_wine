<template>
  <div id="app">
    <el-collapse-transition>
      <router-view />
    </el-collapse-transition>
    <TabBar v-show="$router.currentRoute.meta.showTab"></TabBar>
  </div>
</template>
<script>
import TabBar from "./components/TabBar/main";

export default {
  components: {
    TabBar
  }
};
</script>
<style>
@import url("./common/css/reset.css");
#app {
  font-family: "华文细黑", "Microsoft YaHei", "黑体", sans-serif;
  padding: 44px 0 46px;
}

._flex {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
._shadow {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
._red {
  color: #ca141d !important;
}
._flex_col {
  display: flex;
  flex-direction: column;
  justify-content: center;
}
._padding {
  padding: 15px;
}
._img {
  width: 100%;
}
._white {
  background: white;
}
._mt {
  margin-top: 10px;
}
._r {
  float: right;
}
._black {
  color: black;
}
div {
  box-sizing: border-box;
}
</style>