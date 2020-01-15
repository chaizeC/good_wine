import { request } from "../request/request";

export default {

    // 加入购物车
    addToCart({ state, commit }, payload) {
        return new Promise((resolve, reject) => {
            request({
                url: '/joinCart',
                params: {
                    productId: payload.productId,
                    quantity: payload.quantity, //购买数量
                    price: payload.productPrice, //价格
                    productPic: payload.productPic,  //商品主图
                    productName: payload.productName,//商品名称
                    memberId: state.userId, //会员id
                    productSubTitle: payload.subTitle //小标题
                }
            }).then(res => {
                request({
                    url: "/selectCart",
                    params: {
                        member_id: state.userId
                    }
                }).then(res => {
                    console.log(res.data);
                    resolve(res)
                    commit("addToCart", res.data)

                }).catch(err => {
                    reject(err)
                    console.log(err);
                })
            }).catch(err => {
                console.log(err);
            })
        })
    },

    // 查询购物车
    initCartList({ state, commit }, payload) {
        return new Promise((resolve, reject) => {
            request({
                url: "/selectCart",
                params: {
                    member_id: state.userId
                }
            }).then(res => {
                commit("addToCart", res.data)
                resolve(res)
            }).catch(err => {
                reject(err)
            })
        })

    },
}