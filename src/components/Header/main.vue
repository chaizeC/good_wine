
<template>
  <div id="header_wrapper" class="_shadow">
    <slot name="header"></slot>
  </div>
</template>


<script>
export default {
  props: {}
};
</script>

<style lang="less">
#header_wrapper {
  position: fixed;
  top: 0;
  z-index: 666;
  width: 100%;
  height: 44px;
  background: white;
}
</style>