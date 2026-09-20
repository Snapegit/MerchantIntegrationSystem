
<template>
	<div class="app-contain" :style='{"minHeight":"100vh","padding":"0 10%","margin":"40px auto 60px","color":"#666","background":"#fff","width":"100%","fontSize":"14px","position":"relative","height":"100%"}'>
		<div class="bread_view">
			<el-breadcrumb separator="/" class="breadcrumb">
				<el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
				<el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<el-form ref="formRef" :model="form" class="add_form" label-width="120px" :rules="rules">
			<el-row>
				<el-col :span="24">
					<el-form-item label="商家账号" prop="shangjiazhanghao">
						<el-input class="list_inp" v-model="form.shangjiazhanghao" placeholder="商家账号"
							type="text" :readonly="!isAdd||disabledForm.shangjiazhanghao?true:false" />
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="商家密码" prop="shangjiamima">
						<el-input class="list_inp" v-model="form.shangjiamima" placeholder="商家密码"
							type="password" :readonly="!isAdd||disabledForm.shangjiamima?true:false" />
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="商家名称" prop="shangjiamingcheng">
						<el-input class="list_inp" v-model="form.shangjiamingcheng" placeholder="商家名称"
							 type="text" 							:readonly="!isAdd||disabledForm.shangjiamingcheng?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="商家图片" prop="shangjiatupian">
						<uploads
							:disabled="!isAdd||disabledForm.shangjiatupian?true:false"
							action="file/upload" 
							tip="请上传商家图片" 
							:limit="3" 
							style="width: 100%;text-align: left;"
							:fileUrls="form.shangjiatupian?form.shangjiatupian:''" 
							@change="shangjiatupianUploadSuccess">
						</uploads>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="联系电话" prop="lianxidianhua">
						<el-input class="list_inp" v-model="form.lianxidianhua" placeholder="联系电话"
							 type="text" 							:readonly="!isAdd||disabledForm.lianxidianhua?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="营业时间" prop="yingyeshijian">
						<el-date-picker
							class="list_date"
							v-model="form.yingyeshijian"
							format="YYYY 年 MM 月 DD 日"
							value-format="YYYY-MM-DD"
							type="datetime"
							:readonly="!isAdd||disabledForm.yingyeshijian?true:false"
							placeholder="请选择营业时间"
							style="width: 100%;" />
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="商家地址" prop="shangjiadizhi">
						<el-input class="list_inp" v-model="form.shangjiadizhi" placeholder="商家地址"
							 type="text" 							:readonly="!isAdd||disabledForm.shangjiadizhi?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="店内设施" prop="dianneisheshi">
						<el-input v-model="form.dianneisheshi" placeholder="店内设施" type="textarea"
						:readonly="!isAdd||disabledForm.dianneisheshi?true:false"
						/>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="商家简介" prop="shangjiajianjie">
						<el-input v-model="form.shangjiajianjie" placeholder="商家简介" type="textarea"
						:readonly="!isAdd||disabledForm.shangjiajianjie?true:false"
						/>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="商家公告" prop="shangjiagonggao">
						<editor class="list_editor" :value="form.shangjiagonggao" placeholder="请输入商家公告" :readonly="!isAdd||disabledForm.shangjiagonggao?true:false"
							@change="(e)=>editorChange(e,'shangjiagonggao')"></editor>
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">取消</el-button>
				<el-button class="formModel_confirm" @click="save"
					type="success"
					>
					保存
				</el-button>
			</div>
		</el-form>
	</div>
</template>
<script setup>
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
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'shangjiaxinxi'
	const formName = '商家信息'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//form表单
	const form = ref({
		shangjiazhanghao: '',
		shangjiamima: '',
		shangjiamingcheng: '',
		shangjiatupian: '',
		lianxidianhua: '',
		yingyeshijian: '',
		shangjiadizhi: '',
		dianneisheshi: '',
		shangjiajianjie: '',
		shangjiagonggao: '',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		shangjiazhanghao : false,
		shangjiamima : false,
		shangjiamingcheng : false,
		shangjiatupian : false,
		lianxidianhua : false,
		yingyeshijian : false,
		shangjiadizhi : false,
		dianneisheshi : false,
		shangjiajianjie : false,
		shangjiagonggao : false,
	})
	const isAdd = ref(false)
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		shangjiazhanghao: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		shangjiamima: [
		],
		shangjiamingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		shangjiatupian: [
		],
		lianxidianhua: [
			{ validator: validateMobile, trigger: 'blur' },
		],
		yingyeshijian: [
		],
		shangjiadizhi: [
		],
		dianneisheshi: [
		],
		shangjiajianjie: [
		],
		shangjiagonggao: [
		],
	})
	//商家图片上传回调
	const shangjiatupianUploadSuccess=(e)=>{
		form.value.shangjiatupian = e
	}
	//methods

	//methods
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.shangjiagonggao = res.data.data.shangjiagonggao.replace(reg,'../../../cl3222741/file');
			form.value = res.data.data
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init = (formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null) => {
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			// getInfo()
			for(let x in row){
				if(x=='shangjiazhanghao'){
					form.value.shangjiazhanghao = row[x];
					disabledForm.value.shangjiazhanghao = true;
					continue;
				}
				if(x=='shangjiamima'){
					form.value.shangjiamima = row[x];
					disabledForm.value.shangjiamima = true;
					continue;
				}
				if(x=='shangjiamingcheng'){
					form.value.shangjiamingcheng = row[x];
					disabledForm.value.shangjiamingcheng = true;
					continue;
				}
				if(x=='shangjiatupian'){
					form.value.shangjiatupian = row[x];
					disabledForm.value.shangjiatupian = true;
					continue;
				}
				if(x=='lianxidianhua'){
					form.value.lianxidianhua = row[x];
					disabledForm.value.lianxidianhua = true;
					continue;
				}
				if(x=='yingyeshijian'){
					form.value.yingyeshijian = row[x];
					disabledForm.value.yingyeshijian = true;
					continue;
				}
				if(x=='shangjiadizhi'){
					form.value.shangjiadizhi = row[x];
					disabledForm.value.shangjiadizhi = true;
					continue;
				}
				if(x=='dianneisheshi'){
					form.value.dianneisheshi = row[x];
					disabledForm.value.dianneisheshi = true;
					continue;
				}
				if(x=='shangjiajianjie'){
					form.value.shangjiajianjie = row[x];
					disabledForm.value.shangjiajianjie = true;
					continue;
				}
				if(x=='shangjiagonggao'){
					form.value.shangjiagonggao = row[x];
					disabledForm.value.shangjiagonggao = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
		}
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//富文本数据回调
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.shangjiatupian!=null) {
			form.value.shangjiatupian = form.value.shangjiatupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									history.back()
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							history.back()
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
	onMounted(()=>{
		type.value = route.query.type?route.query.type:'add'
		let row = null
		let table = null
		let statusColumnName = null
		let tips = null
		let statusColumnValue = null
		if(type.value == 'cross'){
			row = context?.$toolUtil.storageGet('crossObj')?JSON.parse(context?.$toolUtil.storageGet('crossObj')):{}
			table = context?.$toolUtil.storageGet('crossTable')
			statusColumnName = context?.$toolUtil.storageGet('crossStatusColumnName')
			tips = context?.$toolUtil.storageGet('crossTips')
			statusColumnValue = context?.$toolUtil.storageGet('crossStatusColumnValue')
		}
		init(route.query.id?route.query.id:null, type.value,'', row, table, statusColumnName, tips, statusColumnValue)
	})
	
</script>
<style lang="scss" scoped>
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
	// 表单
	.add_form{
		border: 1px solid #0058ab20;
		border-radius: 4px;
		padding: 30px 7%;
		background: #0058ab02;
		// form item
		:deep(.el-form-item) {
			border: 0px solid #eee;
			padding: 0 0 20px;
			margin: 0 0 20px 0;
			background: none;
			display: flex;
			border-color: #0058ab20;
			border-width: 0 0 1px;
			border-style: dashed;
			//label
			.el-form-item__label {
			 color: inherit;
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: auto;
			 font-size: inherit;
			 text-align: right;
			 min-width: 150px;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 150px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #0058ab30;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
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
					border: 1px solid #0058ab30;
					border-radius: 0;
					background: #fff;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 300px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 富文本
				.list_editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					margin: 0 0 20px;
					width: 99%;
					border-color: #eee;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				// 长文本
				.el-textarea__inner {
					border: 1px solid #0058ab30;
					border-radius: 0px;
					padding: 12px;
					color: #666;
					width: 100%;
					font-size: 14px;
					min-height: 120px;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #0058ab30;
						cursor: pointer;
						border-radius: 0px;
						background: #fff;
						width: 120px;
						line-height: 90px;
						text-align: center;
						height: 80px;
						//图标
						.el-icon{
							color: #0058ab50;
							font-size: 32px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #0058ab30;
						cursor: pointer;
						border-radius: 0px;
						background: #fff;
						width: 120px;
						line-height: 90px;
						text-align: center;
						height: 80px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		padding: 0 150px;
		margin: 0 0 20px;
		display: flex;
		width: 100%;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #333;
			background: #0058ab10;
			width: auto;
			font-size: 14px;
			height: 36px;
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 0px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #333;
			background: #0058ab30;
			width: auto;
			font-size: 14px;
			height: 36px;
		}
		.formModel_confirm:hover {
		}
	}
</style>