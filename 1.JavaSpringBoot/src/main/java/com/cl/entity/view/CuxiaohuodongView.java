package com.cl.entity.view;

import com.cl.entity.CuxiaohuodongEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.cl.utils.EncryptUtil;
 

/**
 * 促销活动
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
@TableName("cuxiaohuodong")
public class CuxiaohuodongView  extends CuxiaohuodongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public CuxiaohuodongView(){
	}
 
 	public CuxiaohuodongView(CuxiaohuodongEntity cuxiaohuodongEntity){
 	try {
			BeanUtils.copyProperties(this, cuxiaohuodongEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
