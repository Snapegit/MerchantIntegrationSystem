
<template>
	<div>
		<div class="app-contain">
			<el-form class="userinfo_form" ref="userinfoFormRef" :model="form" label-width="$template2.back.add.form.base.labelWidth">
				<el-row>
					<el-col :span="24">
						<el-form-item label="商家账号" prop="shangjiazhanghao">
							<el-input class="list_inp" v-model="user.shangjiazhanghao" readonly placeholder="商家账号" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="商家密码" prop="shangjiamima">
							<el-input class="list_inp" v-model="user.shangjiamima" readonly placeholder="商家密码" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="商家名称" prop="shangjiamingcheng">
							<el-input class="list_inp" v-model="user.shangjiamingcheng"  placeholder="商家名称" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="商家图片" prop="shangjiatupian">
							<uploads
								action="file/upload" 
								tip="请上传商家图片" 
								:limit="3" 
								style="width: 100%;text-align: left;"
								:fileUrls="user.shangjiatupian?user.shangjiatupian:''" 
								@change="shangjiaxinxishangjiatupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="联系电话" prop="lianxidianhua">
							<el-input class="list_inp" v-model="user.lianxidianhua"  placeholder="联系电话" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="营业时间" prop="yingyeshijian">
							<el-date-picker
								class="list_date"
								v-model="user.yingyeshijian"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								placeholder="营业时间" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="商家地址" prop="shangjiadizhi">
							<el-input class="list_inp" v-model="user.shangjiadizhi"  placeholder="商家地址" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="店内设施" prop="dianneisheshi">
							<el-input class="list_inp" v-model="user.dianneisheshi"  placeholder="店内设施" clearable />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="商家简介" prop="shangjiajianjie">
							<el-input class="list_inp" v-model="user.shangjiajianjie"  placeholder="商家简介" clearable />
						</el-form-item>
					</el-col>
					<span class="userinfo_form_btn_box">
						<el-button class='userinfo_confirm' type="primary" @click="onSubmit">保存</el-button>
					</span>
				</el-row>
			</el-form>
		</div>
	</div>
</template>

<script setup>
	import { isNumber,isIntNumer,isEmail,isMobile,isPhone,isURL,checkIdCard } from "@/utils/toolUtil";
	import {
		reactive,
		ref,
		getCurrentInstance
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const tableName = ref('shangjiaxinxi')
	const user = ref({})
	const init = () => {
	}
	const shangjiaxinxishangjiatupianUploadSuccess=(fileUrls)=> {
	    user.value.shangjiatupian = fileUrls;
	}
	const onSubmit = () => {
		if((!user.value.shangjiazhanghao)){
			context?.$toolUtil.message(`商家账号不能为空`,'error')
			return false
		}
		if((!user.value.shangjiamingcheng)){
			context?.$toolUtil.message(`商家名称不能为空`,'error')
			return false
		}
		if(user.value.shangjiatupian!=null){
			user.value.shangjiatupian = user.value.shangjiatupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		if((user.value.lianxidianhua)&&(!context?.$toolUtil.isMobile(user.value.lianxidianhua))){
			context?.$toolUtil.message(`联系电话应输入手机格式`,'error')
			return false
		}
		context?.$http({
			url: `${tableName.value}/update`,
			method: 'post',
			data: user.value
		}).then(res => {
			context?.$toolUtil.message('修改成功','success')
		})

	}
	const getInfo = () => {
		context?.$http({
			url: `${tableName.value}/session`,
			method: 'get'
		}).then(res => {
			user.value = res.data.data
			init()
		})
	}
	getInfo()
</script>

<style lang="scss" scoped>
	// 表单
	.userinfo_form {
		border-radius: 6px;
		padding: 30px;
		// form item
		:deep(.el-form-item) {
			margin: 0 0 20px 0;
			display: flex;
			// 内容盒子
			.el-form-item__content{
				display: flex;
				width: calc(100% - 90px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
			}
			// 输入框
			.list_inp {
				border: 2px solid #5FB7FF;
				border-radius: 20px;
				padding: 0 10px;
				background: #fff;
				width: 100%;
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
			//日期选择器
			.list_date {
				border: 2px solid #5FB7FF;
				border-radius: 20px;
				background: #fff;
				width: 100%;
				line-height: 36px;
				box-sizing: border-box;
				//去掉默认样式
				.el-input__wrapper{
					border: none;
					box-shadow: none;
					background: none;
					border-radius: 0;
					height: 100%;
				}
			}
			//图片上传样式
			.el-upload-list  {
				//提示语
				.el-upload__tip {
					margin: 7px 0 0;
					color: #999;
					display: none;
					font-size: 12px;
					justify-content: flex-start;
					align-items: center;
				}
				//外部盒子
				.el-upload--picture-card {
					border: 2px solid #5FB7FF;
					cursor: pointer;
					background-color: #fff;
					border-radius: 20px;
					width: 90px;
					line-height: 100px;
					text-align: center;
					height: 90px;
					//图标
					.el-icon{
						color: #9E9E9E;
						font-size: 32px;
					}
				}
				.el-upload-list__item {
					border: 2px solid #5FB7FF;
					cursor: pointer;
					background-color: #fff;
					border-radius: 20px;
					width: 90px;
					line-height: 100px;
					text-align: center;
					height: 90px;
				}
			}

		}
		// 按钮盒子
		.userinfo_form_btn_box {
			display: flex;
			width: 100%;
			justify-content: center;
			align-items: center;
			// 确定按钮
			.userinfo_confirm {
				border: 0;
				cursor: pointer;
				border-radius: 4px;
				padding: 0 24px;
				box-shadow: inset 0px 4px 10px 0px rgba(147,147,147,0.302);
				outline: 4px solid #EAF5FF;
				margin: 0 20px;
				color: #2C2C2C;
				background: #96C6EE;
				width: auto;
				font-size: 14px;
				height: 40px;
			}
			// 确定按钮-悬浮
			.userinfo_confirm:hover {
				background: rgba(150, 198, 238, 0.5);
				font-size: 16px;
			}
		}
	}
</style>
