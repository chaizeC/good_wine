<template>
  <div id="app">
    <router-view />
    <TabBar></TabBar>
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
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  padding: 44px 0 46px;
}

._flex {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
._shadow {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)
}
._red {
  color: #ca141d;
}
div {
  box-sizing: border-box;
}
</style>