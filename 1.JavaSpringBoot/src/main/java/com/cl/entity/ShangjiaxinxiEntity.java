package com.cl.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 商家信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
@TableName("shangjiaxinxi")
public class ShangjiaxinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public ShangjiaxinxiEntity() {
		
	}
	
	public ShangjiaxinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 商家账号
	 */
					
	private String shangjiazhanghao;
	
	/**
	 * 商家密码
	 */
					
	private String shangjiamima;
	
	/**
	 * 商家名称
	 */
					
	private String shangjiamingcheng;
	
	/**
	 * 商家图片
	 */
					
	private String shangjiatupian;
	
	/**
	 * 联系电话
	 */
					
	private String lianxidianhua;
	
	/**
	 * 营业时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	@DateTimeFormat 		
	private Date yingyeshijian;
	
	/**
	 * 商家地址
	 */
					
	private String shangjiadizhi;
	
	/**
	 * 店内设施
	 */
					
	private String dianneisheshi;
	
	/**
	 * 商家简介
	 */
					
	private String shangjiajianjie;
	
	/**
	 * 商家公告
	 */
					
	private String shangjiagonggao;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：商家账号
	 */
	public void setShangjiazhanghao(String shangjiazhanghao) {
		this.shangjiazhanghao = shangjiazhanghao;
	}
	/**
	 * 获取：商家账号
	 */
	public String getShangjiazhanghao() {
		return shangjiazhanghao;
	}
	/**
	 * 设置：商家密码
	 */
	public void setShangjiamima(String shangjiamima) {
		this.shangjiamima = shangjiamima;
	}
	/**
	 * 获取：商家密码
	 */
	public String getShangjiamima() {
		return shangjiamima;
	}
	/**
	 * 设置：商家名称
	 */
	public void setShangjiamingcheng(String shangjiamingcheng) {
		this.shangjiamingcheng = shangjiamingcheng;
	}
	/**
	 * 获取：商家名称
	 */
	public String getShangjiamingcheng() {
		return shangjiamingcheng;
	}
	/**
	 * 设置：商家图片
	 */
	public void setShangjiatupian(String shangjiatupian) {
		this.shangjiatupian = shangjiatupian;
	}
	/**
	 * 获取：商家图片
	 */
	public String getShangjiatupian() {
		return shangjiatupian;
	}
	/**
	 * 设置：联系电话
	 */
	public void setLianxidianhua(String lianxidianhua) {
		this.lianxidianhua = lianxidianhua;
	}
	/**
	 * 获取：联系电话
	 */
	public String getLianxidianhua() {
		return lianxidianhua;
	}
	/**
	 * 设置：营业时间
	 */
	public void setYingyeshijian(Date yingyeshijian) {
		this.yingyeshijian = yingyeshijian;
	}
	/**
	 * 获取：营业时间
	 */
	public Date getYingyeshijian() {
		return yingyeshijian;
	}
	/**
	 * 设置：商家地址
	 */
	public void setShangjiadizhi(String shangjiadizhi) {
		this.shangjiadizhi = shangjiadizhi;
	}
	/**
	 * 获取：商家地址
	 */
	public String getShangjiadizhi() {
		return shangjiadizhi;
	}
	/**
	 * 设置：店内设施
	 */
	public void setDianneisheshi(String dianneisheshi) {
		this.dianneisheshi = dianneisheshi;
	}
	/**
	 * 获取：店内设施
	 */
	public String getDianneisheshi() {
		return dianneisheshi;
	}
	/**
	 * 设置：商家简介
	 */
	public void setShangjiajianjie(String shangjiajianjie) {
		this.shangjiajianjie = shangjiajianjie;
	}
	/**
	 * 获取：商家简介
	 */
	public String getShangjiajianjie() {
		return shangjiajianjie;
	}
	/**
	 * 设置：商家公告
	 */
	public void setShangjiagonggao(String shangjiagonggao) {
		this.shangjiagonggao = shangjiagonggao;
	}
	/**
	 * 获取：商家公告
	 */
	public String getShangjiagonggao() {
		return shangjiagonggao;
	}

}
