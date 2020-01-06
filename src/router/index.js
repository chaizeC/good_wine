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
    component: () =>
      import("../views/Home/main")
  },
  {
    path: "/cart",
    name: "cart",
    component: () =>
      import("../views/Cart/main")
  },
  {
    path: "/category",
    name: "category",
    component: () =>
      import("../views/Category.vue/main")
  },
  {
    path: "/profile",
    name: "profile",
    component: () =>
      import("../views/Profile/main")
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
