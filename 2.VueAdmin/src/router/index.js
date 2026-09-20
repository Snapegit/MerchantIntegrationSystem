	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import shangjiaxinxi from '@/views/shangjiaxinxi/list'
	import pingjiaxinxi from '@/views/pingjiaxinxi/list'
	import yonghu from '@/views/yonghu/list'
	import caipinleixing from '@/views/caipinleixing/list'
	import orders from '@/views/orders/list'
	import baoxiugongneng from '@/views/baoxiugongneng/list'
	import caipinxinxi from '@/views/caipinxinxi/list'
	import config from '@/views/config/list'
	import users from '@/views/users/list'
	import cuxiaohuodong from '@/views/cuxiaohuodong/list'
	import shangjiaxinxiRegister from '@/views/shangjiaxinxi/register'
	import shangjiaxinxiCenter from '@/views/shangjiaxinxi/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/shangjiaxinxiCenter',
			name: '商家信息个人中心',
			component: shangjiaxinxiCenter
		}
		,{
			path: '/news',
			name: '新闻资讯',
			component: news
		}
		,{
			path: '/shangjiaxinxi',
			name: '商家信息',
			component: shangjiaxinxi
		}
		,{
			path: '/pingjiaxinxi',
			name: '评价信息',
			component: pingjiaxinxi
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/caipinleixing',
			name: '菜品类型',
			component: caipinleixing
		}
		,{
			path: '/orders',
			name: '订单管理',
			component: orders
		}
		,{
			path: '/baoxiugongneng',
			name: '报修功能',
			component: baoxiugongneng
		}
		,{
			path: '/caipinxinxi',
			name: '菜品信息',
			component: caipinxinxi
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/cuxiaohuodong',
			name: '促销活动',
			component: cuxiaohuodong
		}
		]
	},
	{
		path: '/shangjiaxinxiRegister',
		name: '商家信息注册',
		component: shangjiaxinxiRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
