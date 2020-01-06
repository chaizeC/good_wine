
<template>
  <div id="header_wrapper" class="_shadow _flex">
    <slot name="left"></slot>
    <slot name="center"></slot>
    <slot name="right"></slot>
  </div>
</template>


<script>
export default {};
</script>

<style lang="less">
#header_wrapper {
  padding: 12px;
  position: fixed;
  top: 0;
  z-index: 666;
  width: 100%;
  height: 44px;
}
</style>