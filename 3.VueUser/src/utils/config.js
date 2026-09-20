const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '购物车管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'购物车',
							url:'/index/cartList'
						},
					]
				},
				{
					name: '新闻资讯管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'新闻资讯',
							url:'/index/newsList'
						},
					]
				},
				{
					name: '促销活动管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'促销活动',
							url:'/index/cuxiaohuodongList'
						},
					]
				},
				{
					name: '商家信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'商家信息',
							url:'/index/shangjiaxinxiList'
						},
					]
				},
				{
					name: '菜品信息管理',
					icon: '${frontMenu.fontClass}',
					child:[
						{
							name:'菜品信息',
							url:'/index/caipinxinxiList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "基于Spring Boot的九州美食城商户一体化系统"
        } 
    }
}
export default config
