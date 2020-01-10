
<template>
  <div id="return_top_wrapper" @click="returnTop">
    <i class="el-icon-caret-top"></i>
  </div>
</template>


<script>
export default {
  methods: {
    // 返回顶部
    returnTop() {
      let top = document.documentElement.scrollTop || document.body.scrollTop;
      // 实现滚动效果
      const timeTop = setInterval(() => {
        document.body.scrollTop = document.documentElement.scrollTop = top -= 50;
        if (top <= 0) {
          clearInterval(timeTop);
        }
      }, 10);
    }
  }
};
</script>

<style lang="less" scoped>
#return_top_wrapper {
  width: 40px;
  height: 40px;
  background: white;
  color: #ca141d;
  position: fixed;
  right: 15px;
  bottom: 50px;
  border-radius: 50%;
  text-align: center;
  z-index: 999;
  box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);
  i.el-icon-caret-top {
    line-height: 40px;
    font-size: 30px;
  }
}
</style>