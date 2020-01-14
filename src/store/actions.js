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
                    price: payload.price, //价格
                    productPic: payload.productPic,  //商品主图
                    productColor: payload.productColor,
                    productName: payload.productName,//商品名称
                    productMemory: payload.productMemory,
                    memberId: state.userId, //会员id
                    productSubTitle: payload.productSubTitle //小标题
                }
            }).then(res => {
                return new Promise((resolve, reject) => {
                    request({
                        url: "/selectCart",
                        params: {
                            member_id: state.userId
                        }
                    }).then(res => {
                        console.log(res.data);
                        commit("addToCart", res.data)
                        resolve(res)
                    }).catch(err => {
                        console.log(err);
                    })
                }).catch(err => {
                    reject(err)
                })
            })
        })
    },

    // 查询购物车
    initCartList({ state, commit }, payload) {
        request({
            url: "/selectCart",
            params: {
                member_id: state.userId
            }
        }).then(res => {
            console.log(res.data);
        }).catch(err => {
            console.log(err);
        })
    },
}