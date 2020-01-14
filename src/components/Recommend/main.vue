
<template>
  <div id="recommend_wrapper">
    <!-- 爆款推荐 -->
    <div class="headlines">
      <van-row>
        <van-col span="24">爆款推荐</van-col>
      </van-row>
    </div>
    <div class="explosive">
      <van-row>
        <van-col
          span="12"
          v-for="(item, index) in recommandList"
          :key="index"
          @click="$router.push('/detail/'+item.productId)"
        >
          <div class="explosive_item _padding">
            <img v-lazy="item.pic||item.productPic" class="_img" />
            <div class="item_text">{{item.productName}}</div>
            <div class="item_price _red">￥{{item.productPrice.toFixed(2)}}</div>
          </div>
        </van-col>
      </van-row>
    </div>
  </div>
</template>


<script>
import { request } from "../../request/request";
import Vue from "vue";
import { Row, Col } from "vant";
Vue.use(Row).use(Col);

export default {
  data() {
    return {
      recommandList: [],
      temporyList: []
    };
  },
  created() {
    this.getrecommandList();
  },
  methods: {
    getRandomArrayElements(arr, count) {
      var shuffled = arr.slice(0),
        i = arr.length,
        min = i - count,
        temp,
        index;
      while (i-- > min) {
        index = Math.floor((i + 1) * Math.random());
        temp = shuffled[index];
        shuffled[index] = shuffled[i];
        shuffled[i] = temp;
      }
      return shuffled.slice(min);
    },
    getrecommandList() {
      request({
        url: "/brands"
      }).then(res => {
        this.temporyList = [];
        this.temporyList = res.data.map(item => item.brandId);
        this.temporyList = this.getRandomArrayElements(this.temporyList, 4);
        //请求随机商品
        for (var i = 0; i < this.temporyList.length; i++) {
          request({
            url: "/products",
            params: {
              series_id: this.temporyList[i]
            }
          }).then(res => {
            this.recommandList.push(...res.data);
          });
        }
      });
    }
  }
};
</script>

<style lang="less" scoped>
#recommend_wrapper {
  .headlines {
    background-image: linear-gradient(45deg, #e66465, #ad0c10, white);
    height: 40px;
    line-height: 40px;
    padding-left: 15px;
    color: white;
    font-family: "幼圆";
    font-weight: 400;
  }

  .explosive {
    .explosive_item {
      border: 2px solid #f3f5f6;
    }

    .even_number {
      margin-left: -1px;
    }
  }

  .item_text {
    font-size: 13px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    height: 40px;
    font-weight: 400;
    line-height: 20px;
  }

  .item_price {
    margin-top: 10px;
    font-size: 15px;
    font-weight: 700;
  }
}
</style>