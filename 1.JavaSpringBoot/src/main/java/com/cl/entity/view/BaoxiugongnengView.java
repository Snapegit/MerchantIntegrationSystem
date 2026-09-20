package com.cl.entity.view;

import com.cl.entity.BaoxiugongnengEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.cl.utils.EncryptUtil;
 

/**
 * 报修功能
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
@TableName("baoxiugongneng")
public class BaoxiugongnengView  extends BaoxiugongnengEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public BaoxiugongnengView(){
	}
 
 	public BaoxiugongnengView(BaoxiugongnengEntity baoxiugongnengEntity){
 	try {
			BeanUtils.copyProperties(this, baoxiugongnengEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
