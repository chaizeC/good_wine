import axios from 'axios'
export function request(config, callback) {
    var instance = axios.create({
        baseURL: "http://localhost:8095",
        timeout: 5000,
    })
    callback && callback()
    return instance(config) // 返回的本身就是promise对象
}