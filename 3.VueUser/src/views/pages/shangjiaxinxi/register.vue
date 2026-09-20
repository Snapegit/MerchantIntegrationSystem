<template>
	<div>
		<div class="register_view">
			<el-form :model="registerForm" class="register_form">
				<div class="title_view">{{projectName}}注册</div>
				<div class="list_item">
					<div class="list_label">商家账号：</div>
					<input class="list_inp"
					 v-model="registerForm.shangjiazhanghao" 
					 placeholder="请输入商家账号"
					 type="text"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">商家密码：</div>
					<input class="list_inp"
					 v-model="registerForm.shangjiamima" 
					 placeholder="请输入商家密码"
					 type="password"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">确认商家密码：</div>
					<input class="list_inp" v-model="registerForm.shangjiamima2" type="password" placeholder="请输入确认商家密码" />
				</div>
				<div class="list_item">
					<div class="list_label">商家名称：</div>
					<input class="list_inp"
					 v-model="registerForm.shangjiamingcheng" 
					 placeholder="请输入商家名称"
					 type="text"
					 />
				</div>
				<div class="list_item">
					<div class="list_label">商家图片：</div>
					<div class="list_file_list">
						<uploads
							action="file/upload" 
							tip="请上传商家图片" 
							:limit="3" 
							style="width: 100%;text-align: left;"
							:fileUrls="registerForm.shangjiatupian?registerForm.shangjiatupian:''" 
							@change="shangjiatupianUploadSuccess">
						</uploads>
					</div>
				</div>
				<div class="list_item">
					<div class="list_label">联系电话：</div>
					<input class="list_inp"
					 v-model="registerForm.lianxidianhua" 
					 placeholder="请输入联系电话"
					 type="text"
					 />
				</div>
				<div class="list_btn">
					<el-button class="register" type="success" @click="handleRegister">注册</el-button>
					<div class="r-login" @click="close">已有账号，直接登录</div>
				</div>
			</el-form>	
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context?.$project.projectName
	//获取注册类型
	import { useRoute } from 'vue-router';
	const route = useRoute()
	const tableName = ref('shangjiaxinxi')
	
	
	const registerForm = ref({
	})
	const init=()=>{
	}
    const shangjiatupianUploadSuccess=(fileUrls)=> {
        registerForm.value.shangjiatupian = fileUrls;
    }
	// 多级联动参数
	//注册按钮
	const handleRegister = () => {
		let url = tableName.value +"/register";
		if((!registerForm.value.shangjiazhanghao)){
			context?.$toolUtil.message(`商家账号不能为空`,'error')
			return false
		}
		if((!registerForm.value.shangjiamingcheng)){
			context?.$toolUtil.message(`商家名称不能为空`,'error')
			return false
		}
		if(registerForm.value.shangjiatupian!=null){
			registerForm.value.shangjiatupian = registerForm.value.shangjiatupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if(registerForm.value.lianxidianhua&&(!context?.$toolUtil.isMobile(registerForm.value.lianxidianhua))){
			context?.$toolUtil.message(`联系电话应输入手机格式`,'error')
			return false
		}
		
		context?.$http({
			url:url,
			method:'post',
			data:registerForm.value
		}).then(res=>{
			context?.$toolUtil.message('注册成功','success', obj=>{
				context?.$router.push({
					path: "/login"
				});
			})
		})
	}
	//公共方法
	const getUUID=()=> {
		return new Date().getTime();
	}
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
	init()
</script>
<style lang="scss" scoped>
	.register_view {
		background-repeat: no-repeat;
		flex-direction: column;
		background-size: cover;
		background: url(http://clfile.zggen.cn/20231229/e2095d3a74784da2bdff07be79797146.jpg);
		display: flex;
		min-height: 100vh;
		justify-content: center;
		align-items: center;
		position: relative;
		background-position: center center;
		// 表单盒子
		.register_form {
			border-radius: 20px;
			padding: 30px 20px 40px;
			box-shadow: 0px 26px 36px -20px #083f5d;
			margin: 20px 0;
			background: #fff;
			display: flex;
			width: 600px;
			min-height: 600px;
			justify-content: center;
			flex-wrap: wrap;
		}
		// 标题样式
		.title_view {
			padding: 0;
			margin: 0 0 20px;
			color: #0d6392;
			width: 100%;
			font-size: 18px;
			text-align: center;
		}
		// item盒子
		.list_item {
			margin: 0 0 12px;
			display: flex;
			width: 80%;
			justify-content: flex-start;
			align-items: center;
			// label
			.list_label {
				width: 120px;
				font-size: 14px;
				box-sizing: border-box;
				text-align: right;
			}
			// 输入框
			:deep(.list_inp) {
				border: 1px solid #ddd;
				border-radius: 0px;
				padding: 0 10px;
				width: calc(100% - 120px);
				line-height: 36px;
				box-sizing: border-box;
				height: 36px;
				//去掉默认样式
				.el-input__wrapper{
					border: none;
					box-shadow: none;
					background: none;
					border-radius: 0;
					height: 100%;
					padding: 0;
				}
				.is-focus {
					box-shadow: none !important;
				}
			}
		}
		//图片上传样式
		.list_file_list  {
			//提示语
			:deep(.el-upload__tip){
				margin: 7px 0 0;
				color: #999;
				display: flex;
				font-size: 14px;
				justify-content: flex-start;
				align-items: center;
			}
			//外部盒子
			:deep(.el-upload--picture-card){
				border: 1px solid #ddd;
				cursor: pointer;
				background-color: #fff;
				border-radius: 0px;
				width: 160px;
				line-height: 70px;
				text-align: center;
				height: 60px;
				//图标
				.el-icon{
					color: #bbb;
					font-size: 32px;
				}
			}
			:deep(.el-upload-list__item) {
				border: 1px solid #ddd;
				cursor: pointer;
				background-color: #fff;
				border-radius: 0px;
				width: 160px;
				line-height: 70px;
				text-align: center;
				height: 60px;
			}
		}
		//按钮盒子
		.list_btn {
			margin: 20px 0 0;
			display: flex;
			width: 100%;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			//注册按钮
			.register {
					border: none;
					border-radius: 4px;
					margin: 0 0 0 90px;
					color: #fff;
					background: linear-gradient(158deg, rgba(75,149,218,1) 49%, rgba(0,88,171,1) 100%);
					width: 300px;
					font-size: 14px;
					height: 40px;
			}
			//注册按钮悬浮样式
			.register:hover {
				border: none;
				border-radius: 4px;
				margin: 0 0 0 90px;
				background: linear-gradient(270deg, rgba(75,149,218,1) 49%, rgba(0,88,171,1) 100%);
				width: 300px;
				font-size: 14px;
				opacity: 1;
				height: 40px;
			}
			//已有账号
			.r-login {
				cursor: pointer;
				padding: 20px 0 0 80px;
				color: #999;
				width: 80%;
				font-size: 13px;
				text-align: right;
			}
		}
	}
</style>