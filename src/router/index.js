import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    redirect: '/home'
  },
  {
    path: "/home",
    name: "home",
    meta: {
      showTab: true,
      title: "主页"
    },
    component: () =>
      import("../views/Home/main")
  },
  {
    path: "/cart",
    name: "cart",
    meta: {
      showTab: true,
      title: "购物车"
    },
    component: () =>
      import("../views/Cart/main")
  },
  {
    path: "/category",
    name: "category",
    meta: {
      showTab: true,
      title: "分类页"
    },
    component: () =>
      import("../views/Category/main")
  },
  {
    path: "/profile",
    name: "profile",
    meta: {
      showTab: true,
      title: "我的信息"
    },
    component: () =>
      import("../views/Profile/main")
  },
  {
    path: "/search",
    name: "search",
    meta: {
      showTab: false,
      title: "搜索页"
    },
    component: () =>
      import("../views/Search/main")
  },
  {
    path: "/twolevelcate/:id",
    name: "twolevelcate",
    meta: {
      showTab: false,
      title: "二级分类页"
    },
    component: () =>
      import("../views/TwoLevelCate/main")
  },
  {
    path: "/detail/:id",
    name: "detail",
    meta: {
      showTab: false,
      title: "详情页"
    },
    component: () =>
      import("../views/Detail/main")
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});
router.beforeEach((to, from, next) => {
  document.title = to.meta.title
  next()
})
export default router;
