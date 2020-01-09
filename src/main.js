import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

//vant的样式
import 'vant/lib/index.css';

// fastclick：处理移动端click事件300毫秒延迟。
import FastClick from 'fastclick'
FastClick.attach(document.body);

//element
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// 懒加载
import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload, {
  loading: require("./common/img/lazy.png"),
  error: require("./common/img/lazy.png")
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
