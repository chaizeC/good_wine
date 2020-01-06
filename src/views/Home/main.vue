<template>
  <div id="home_wrapper">
    <Header class="header_wrapper">
      <van-row slot="header">
        <van-col span="4">
          <div class="felx_box">
            <img src="../../common/img/wine.png" alt class="wine" />
          </div>
        </van-col>

        <van-col span="20">
          <div class="felx_box">
            <el-input placeholder="请输入关键字搜索酒类" v-model="headerInput">
              <i
                slot="suffix"
                class="el-input__icon el-icon-search header_search"
                @click="getGoodBySearch(headerInput)"
              ></i>
            </el-input>
          </div>
        </van-col>
      </van-row>
    </Header>
  </div>
</template>

<script>
import Header from "../../components/Header/main";
import Vue from "vue";
import { Row, Col } from "vant";
Vue.use(Row).use(Col);
import { request } from "../../request/request";
export default {
  data() {
    return {
      headerInput: ""
    };
  },
  methods: {
    getGoodBySearch(value) {
      request({
        url: "/selectProductByName",
        params: {
          product_name: value
        }
      }).then(res=>{
        console.log(res);
      }).catch(err=>{

      })
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
<style lang="less" scoped>
#home_wrapper {
  .header_wrapper {
    padding: 0 15px;
    .wine {
      width: 30px;
      height: 30px;
    }
  }
  .felx_box {
    display: flex;
    flex-direction: column;
    height: 44px;
    justify-content: center;
  }
}
</style>
<style>
.el-input.is-active .el-input__inner,
.el-input__inner:focus {
  border-color: #dcdfe6;
  outline: 0;
}
</style>