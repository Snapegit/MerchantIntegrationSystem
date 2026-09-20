import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import newsList from '@/views/pages/news/list'
import shangjiaxinxiList from '@/views/pages/shangjiaxinxi/list'
import shangjiaxinxiDetail from '@/views/pages/shangjiaxinxi/formModel'
import shangjiaxinxiAdd from '@/views/pages/shangjiaxinxi/formAdd'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import caipinleixingList from '@/views/pages/caipinleixing/list'
import caipinleixingDetail from '@/views/pages/caipinleixing/formModel'
import caipinleixingAdd from '@/views/pages/caipinleixing/formAdd'
import baoxiugongnengList from '@/views/pages/baoxiugongneng/list'
import baoxiugongnengDetail from '@/views/pages/baoxiugongneng/formModel'
import baoxiugongnengAdd from '@/views/pages/baoxiugongneng/formAdd'
import caipinxinxiList from '@/views/pages/caipinxinxi/list'
import caipinxinxiDetail from '@/views/pages/caipinxinxi/formModel'
import caipinxinxiAdd from '@/views/pages/caipinxinxi/formAdd'
import cartList from '@/views/pages/shop_order/cart'
import cuxiaohuodongList from '@/views/pages/cuxiaohuodong/list'
import cuxiaohuodongDetail from '@/views/pages/cuxiaohuodong/formModel'
import cuxiaohuodongAdd from '@/views/pages/cuxiaohuodong/formAdd'
import pingjiaxinxiList from '@/views/pages/pingjiaxinxi/list'
import pingjiaxinxiDetail from '@/views/pages/pingjiaxinxi/formModel'
import pingjiaxinxiAdd from '@/views/pages/pingjiaxinxi/formAdd'
import order_confirm from '@/views/pages/shop_order/confirm'
import ordersList from '@/views/pages/shop_order/list'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'shangjiaxinxiList',
			component: shangjiaxinxiList
		}, {
			path: 'shangjiaxinxiDetail',
			component: shangjiaxinxiDetail
		}, {
			path: 'shangjiaxinxiAdd',
			component: shangjiaxinxiAdd
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'caipinleixingList',
			component: caipinleixingList
		}, {
			path: 'caipinleixingDetail',
			component: caipinleixingDetail
		}, {
			path: 'caipinleixingAdd',
			component: caipinleixingAdd
		}
		, {
			path: 'baoxiugongnengList',
			component: baoxiugongnengList
		}, {
			path: 'baoxiugongnengDetail',
			component: baoxiugongnengDetail
		}, {
			path: 'baoxiugongnengAdd',
			component: baoxiugongnengAdd
		}
		, {
			path: 'caipinxinxiList',
			component: caipinxinxiList
		}, {
			path: 'caipinxinxiDetail',
			component: caipinxinxiDetail
		}, {
			path: 'caipinxinxiAdd',
			component: caipinxinxiAdd
		}
		, {
			path: 'cartList',
			component: cartList
		}
		, {
			path: 'cuxiaohuodongList',
			component: cuxiaohuodongList
		}, {
			path: 'cuxiaohuodongDetail',
			component: cuxiaohuodongDetail
		}, {
			path: 'cuxiaohuodongAdd',
			component: cuxiaohuodongAdd
		}
		, {
			path: 'pingjiaxinxiList',
			component: pingjiaxinxiList
		}, {
			path: 'pingjiaxinxiDetail',
			component: pingjiaxinxiDetail
		}, {
			path: 'pingjiaxinxiAdd',
			component: pingjiaxinxiAdd
		}
		, {
			path: 'order_confirm',
			component: order_confirm
		}
		, {
			path: 'ordersList',
			component: ordersList
		}
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
