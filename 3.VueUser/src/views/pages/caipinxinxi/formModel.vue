<template>
	<div class="app-contain" :style='{"padding":"30px 10% 30px","margin":"0px auto","alignItems":"flex-start","color":"#666","flexWrap":"wrap","display":"flex","width":"100%","fontSize":"14px","position":"relative","justifyContent":"space-between"}'>
		<div class="bread_view">
			<el-breadcrumb separator="/" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<div class="back_view">
			<el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
		</div>
		<div class="detail_view">
			<div class="swiper_view">
				<mySwiper :data="bannerList" :type="3"
				:loop="false"
				:navigation="false"
				:pagination="true"
				:paginationType="4"
				:scrollbar="false"
				:slidesPerView="1"
				:spaceBetween="20"
				:autoHeight="false"
				:centeredSlides="false"
				:freeMode="false"
				:effectType="0"
				:direction="horizontal"
				:autoplay="true"
				:slidesPerColumn="1">
				<template #default="scope">
					<img :style='{"objectFit":"contain","width":"100%","height":"500px"}' :src="scope.row?$config.url + scope.row:''">
				</template>
			</mySwiper>
			</div>
			
			<div class="info_view">
				<div class="title_view">
					<div class="detail_title">
						{{detail.caipinmingcheng}}
					</div>
				</div>
				<div class="info_item">
					<div class="info_label">价格</div>
					<div class="info_price"><span>￥</span>{{detail.price}}</div>
				</div>
				<div class="info_item" v-if="detail.jf">
					<div class="info_label">积分</div>
					<div class="info_price">{{detail.jf}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">菜品类型</div>
					<div  class="info_text" >{{detail.caipinleixing}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">菜品详情</div>
					<div  class="info_text" >{{detail.caipinxiangqing}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">口味</div>
					<div  class="info_text" >{{detail.kouwei}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">库存</div>
					<div  class="info_text" >{{detail.kucun}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">商家账号</div>
					<div  class="info_text" >{{detail.shangjiazhanghao}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">商家名称</div>
					<div  class="info_text" >{{detail.shangjiamingcheng}}</div>
				</div>
				<div class="info_item">
					<div class="info_label">商家地址</div>
					<div  class="info_text" >{{detail.shangjiadizhi}}</div>
				</div>
				<div class="btn_view">
					<el-input-number class="inputNumber" v-model="buyNumber" :min="1" ></el-input-number>
					<el-button class="addCart_btn"  type="primary" @click="addCart">加入购物车</el-button>
					<el-button class="buyNow_btn"  type="primary" @click="buyNow">立即购买</el-button>
				</div>
				<div class="btn_view">
					<el-button class="cross_btn" v-if="btnFrontAuth(tableName,'评价')" @click="pingjiaxinxionAcross('评价','pingjiaxinxi','','','')" type="warning">评价</el-button>
					<el-button class="edit_btn" v-if="centerType&&btnAuth('caipinxinxi','修改')" type="primary" @click="editClick">修改</el-button>
					<el-button class="del_btn" v-if="centerType&&btnAuth('caipinxinxi','删除')" type="danger" @click="delClick">删除</el-button>
				</div>
			</div>
		</div>
		<el-tabs type="border-card" v-model="activeName" class="tabs_view">
		</el-tabs>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'caipinxinxi'
	const formName = '菜品信息'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	//查看权限验证
	const btnFrontAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isFrontAuth(e,a)
		}
	}
	// 返回
	const backClick = () =>{
		history.back()
	}
	// 轮播图
	const bannerList = ref([])
	// 详情
	const title = ref('')
	const detail = ref({})
    const activeName = ref('first')
	const getDetail = () => {
		context?.$http({
			url: `${tableName}/detail/${route.query.id}`,
			method: 'get'
		}).then(res => {
			title.value = res.data.data.caipinmingcheng
			bannerList.value = res.data.data.tupian?res.data.data.tupian.split(','):[]
			detail.value = res.data.data
			getInCartList();
		})
	}
	// 下载文件
	const downClick = (file) => {
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('frontToken')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 判断是否从个人中心跳转
	const centerType = ref(false)
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		getDetail()
	}
	//查找是否已添加购物车
	const isInCart = ref(false)
	const getInCartList = () => {
		context?.$http({url:'cart/list',method:'get',params:{userid:context?.$toolUtil.storageGet('userid'),tablename:tableName,goodid: detail.value.id}}).then(res=>{
			if(res.data.data.list.length){
				isInCart.value = true
			}else{
				isInCart.value = false
			}
		})
	}
	const cartForm = ref({
		userid:context?.$toolUtil.storageGet('userid')
	})
	const addCart = () => {
		if(isInCart.value){
			context?.$toolUtil.message('该商品已在购物车，请前往购买','error')
			return false
		}
		cartForm.value.buynumber = buyNumber.value
		cartForm.value.goodid = detail.value.id
		cartForm.value.goodname = title.value
		cartForm.value.tablename = tableName
		cartForm.value.picture = bannerList.value[0]
        cartForm.value.price = detail.value.price;
		context?.$http({
			url: 'cart/save',
			method: 'post',
			data:cartForm.value
		}).then(res=>{
			context?.$toolUtil.message('添加成功','success')
			getInCartList()
		})
	}
	const buyNumber = ref(1)
	//立即购买
	const buyNow = () => {
		let data = {
			tablename: tableName,
			goodid: detail.value.id,
			goodname: title.value,
			buynumber: buyNumber.value,
			userid: context?.$toolUtil.storageGet('userid'),
			discountprice: detail.value.vipprice ? detail.value.vipprice : 0,
			picture: bannerList.value[0],
			price: detail.value.price
		}
		context?.$toolUtil.storageSet('orders_good',JSON.stringify([data]))
		let query = {
			type: 1
		}
		router.push({path: '/index/order_confirm', query: query})
	}
	//修改
	const editClick = () => {
		router.push(`/index/${tableName}Add?id=${detail.value.id}&&type=edit`)
	}
	//删除
	const delClick = () => {
		ElMessageBox.confirm(`是否删除此${formName}？`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(()=>{
			context?.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: [detail.value.id]
			}).then(res=>{
				context?.$toolUtil.message('删除成功','success',()=>{
					history.back()
				})
			})
			
		})
	}
	const pingjiaxinxionAcross = (btnType,table,crossOptAudit,statusColumnName,tips,statusColumnValue) => {
		if(!context?.$toolUtil.storageGet('frontToken')){
			context?.$toolUtil.message('请登录后再操作！','error')
			return false
		}
		if(!btnAuth(tableName,btnType)){
			context?.$toolUtil.message('暂无权限操作！','error')
			return false
		}
		context?.$toolUtil.storageSet('crossObj',JSON.stringify(detail.value))
		context?.$toolUtil.storageSet('crossTable',tableName)
		context?.$toolUtil.storageSet('crossStatusColumnName',statusColumnName)
		context?.$toolUtil.storageSet('crossTips',tips)
		context?.$toolUtil.storageSet('crossStatusColumnValue',statusColumnValue)
		if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
			var obj = detail.value
			for (var o in obj){
				if(o==statusColumnName && obj[o]==statusColumnValue){
					context?.$toolUtil.message(tips,'error')
					return;
				}
			}
		}
		nextTick(()=>{
			router.push(`/index/${table}Add?type=cross&&id=${detail.value.id}`)
		})
	}
	onMounted(()=>{
		init()
	})
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 0px;
		padding: 0;
		margin: 10px auto;
		background: none;
		display: block;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #eee;
			cursor: pointer;
			border-radius: 2px;
			padding: 0 30px;
			outline: none;
			color: #666;
			background: #f9f9f9;
			width: auto;
			font-size: 14px;
			height: 32px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
	// 面包屑盒子
	.bread_view {
		border: 1px solid #0d639220;
		border-radius: 4px;
		padding: 12px 20px;
		margin: 10px auto 10px;
		background: #0d639210;
		width: 100%;
		position: relative;
		:deep(.breadcrumb) {
			font-size: 14px;
			line-height: 1;
			.el-breadcrumb__separator {
				margin: 0 9px;
				color: #ccc;
				font-weight: 500;
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
					color: #333;
					display: inline-block;
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
					color: #999;
					display: inline-block;
				}
			}
		}
	}
	
	.detail_view{
		border-radius: 0px;
		padding: 60px 40px 20px;
		background: #0058ab06;
		display: flex;
		width: 100%;
		border-color: #0058ab20;
		border-width: 1px 1px 0;
		justify-content: space-between;
		position: relative;
		border-style: solid;
		flex-wrap: wrap;
		// 轮播图
		.swiper_view {
			padding: 0;
			margin: 30px auto;
			width: 60%;
			height: 500px;
		}
		
		// 文字区
		.info_view {
			border: 0px solid #eee;
			padding: 0 20px;
			margin: 0 0 20px;
			overflow: hidden;
			background: none;
			width: 100%;
			box-sizing: border-box;
			height: auto;
		
			.title_view {
				border: 0px solid #eee;
				padding: 0 0 0 80px;
				margin: 30px auto;
				display: flex;
				line-height: 36px;
				top: 0;
				left: 12px;
				background: url(http://clfile.zggen.cn/20231229/c16b1e8143674870b2388c54506a0997.png) no-repeat left center / 99% 100%;
				width: calc(100% - 24px);
				justify-content: space-between;
				align-items: center;
				position: absolute;
				height: 36px;
		
				.detail_title {
					color: #fff;
					font-weight: 500;
					font-size: 16px;
				}
				.follow {
					border: 0px solid #ffffff50;
					cursor: pointer;
					border-radius: 4px;
					padding: 4px 10px;
					margin: 60px 10px 0 0;
					color: #333;
					background: none;
					display: flex;
					width: auto;
					line-height: 1;
					justify-content: center;
					align-items: center;
					.iconfont {
						margin: 0 4px 0 0;
						color: #333;
					}
					.iconfontActive {
						margin: 0 4px 0 0;
						color: #f79d1c;
					}
					span {
						color: #333;
					}
					.textActive {
						color: #f79d1c;
					}
				}
				.follow:hover {
				}
				.follow:active {
					transform: scale(1);
				}
			}
		
			.info_item {
					border-radius: 0px;
					padding: 0 0 10px;
					margin: 0 0 10px;
					background: none;
					display: flex;
					border-color: #0058ab20;
					border-width: 0 0 1px;
					align-items: center;
					border-style: dashed;
		
				.info_label {
					margin: 0 12px 0 0;
					font-weight: 500;
					width: auto;
				}
				.info_text {
					color: #888;
				}
			}
			.btn_view {
				padding: 0;
				margin: 20px 0 20px;
				display: flex;
				flex-wrap: wrap;
				// 数量输入框
				.inputNumber {
					margin: 0 5px 0 0;
					display: inline-block;
					width: 150px;
					line-height: 32px;
					position: relative;
					:deep(.el-input-number__decrease) {
						cursor: pointer;
						z-index: 1;
						display: flex;
						border-color: #DCDFE6;
						border-radius: 4px 0 0 4px;
						top: 1px;
						left: 1px;
						background: #f5f5f5;
						width: 40px;
						justify-content: center;
						border-width: 0 1px 0 0;
						align-items: center;
						position: absolute;
						border-style: solid;
						text-align: center;
						height: 30px;
						i {
							color: #666;
							font-size: 14px;
						}
					}
					:deep(.el-input-number__increase) {
						cursor: pointer;
						z-index: 1;
						display: flex;
						border-color: #DCDFE6;
						right: 1px;
						border-radius: 0 4px 4px 0;
						top: 1px;
						background: #f5f5f5;
						width: 40px;
						justify-content: center;
						border-width: 0 0 0 1px;
						align-items: center;
						position: absolute;
						border-style: solid;
						text-align: center;
						height: 30px;
						i {
							color: #666;
							font-size: 14px;
						}
					}
					:deep(.el-input) {
						.el-input__wrapper {
							border: 1px solid #DCDFE6;
							border-radius: 4px;
							padding: 0 20px;
							outline: none;
							color: #666;
							background: #FFF;
							display: inline-block;
							width: 100%;
							font-size: 14px;
							line-height: 32px;
							text-align: center;
							height: 32px;
						}
					}
				}
				// 加入购物车-按钮
				.addCart_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: #0058ab90;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.addCart_btn:hover {
				}
				// 立即购买-按钮
				.buyNow_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: rgba(135, 242, 249, 1);
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.buyNow_btn:hover {
				}
				// 跨表-按钮
				.cross_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: rgba(170, 0, 0, 1.0);
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.cross_btn:hover {
				}
				// 修改-按钮
				.edit_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: rgba(255, 85, 0, 1.0);
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.edit_btn:hover {
				}
				// 删除-按钮
				.del_btn {
					border: none;
					padding: 0 10px;
					color: #fff;
					background: #e96578;
					line-height: 32px;
					height: 32px;
				}
				// 悬浮
				.del_btn:hover {
				}
			}
		}
	}
	

	//底部盒子
	.tabs_view {
		border-radius: 0px;
		padding: 0 0 20px;
		box-shadow: none;
		margin: 0px auto;
		background: #0058ab06;
		width: 100%;
		border-color: #0058ab20;
		border-width: 0 1px 1px;
		border-style: solid;
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			border-radius: 0;
			padding: 2px 60px 0;
			margin: 0;
			background: none;
			display: flex;
			border-color: #fff;
			border-width: 0 0 0px;
			border-style: solid;
			flex-wrap: wrap;
			height: 42px;
			.el-tabs__nav {
				.el-tabs__item {
					border: 1px solid #ddd;
					padding: 0 20px;
					margin: 0 20px 0 0;
					color: #333;
					font-weight: 500;
					display: inline-block;
					font-size: 14px;
					line-height: 36px;
					border-radius: 4px;
					background: none;
					position: relative;
					list-style: none;
					text-align: center;
					min-width: 80px;
					height: 36px;
				}
				.el-tabs__item:hover {
					border: 1px solid #0d6392;
					border-radius: 4px;
					color: #fff;
					background: #0d6392;
				}
				.is-active {
					border: 1px solid #0d6392;
					border-radius: 4px;
					margin: 0 20px 0 0;
					color: #fff;
					background: #0d6392;
					line-height: 36px;
					text-align: center;
					min-width: 80px;
					height: 36px;
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
			border-radius: 0 0 4px 4px;
			padding: 20px 60px;
			color: #666;
			background: none;
			font-size: 14px;
			border-color: #eee;
			border-width: 0;
			border-style: solid;
			text-align: left;
		}
	}
	


</style>