const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/cl3222741/client/index.html'
        }
    },
    getProjectName(){
        return {
            projectName: "基于Spring Boot的九州美食城商户一体化系统"
        } 
    }
}
export default config
