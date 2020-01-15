
<template>
  <div id="recommend_wrapper">
    <!-- 爆款推荐 -->
    <div class="headlines" v-show="showTitle">
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
          <div class="explosive_item" :class="{_right:index%2,_left:!(index%2)}">
            <img v-lazy="item.pic||item.productPic" class="_img" />
            <div class="logo"></div>
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
  props: {
    showTitle: {
      type: Boolean,
      default: true
    }
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
  background: #f9f9f9;
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
      background: white;
      border-radius: 15px;
      margin: 6px 6px 0 6px;
      position: relative;
      ._img {
        border-radius: 15px;
      }
      .logo {
        background: url(../../common/img/listIcon.png) no-repeat -124px -29px;
        height: 31px;
        width: 76px;
        position: absolute;
        transform: scale(0.6);
        bottom: 49px;
        left: -2px;
      }
    }
    ._left {
      margin-right: 3px;
    }
    ._right {
      margin-left: 3px;
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
    text-indent: 62px;
  }

  .item_price {
    font-size: 15px;
    font-weight: 700;
    font-family: Arial, Helvetica, sans-serif, Lucida Grande, Verdana;
    padding: 10px;
  }
}
</style>