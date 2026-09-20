package com.cl.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.cl.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.BaoxiugongnengEntity;
import com.cl.entity.view.BaoxiugongnengView;

import com.cl.service.BaoxiugongnengService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 报修功能
 * 后端接口
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
@RestController
@RequestMapping("/baoxiugongneng")
public class BaoxiugongnengController {
    @Autowired
    private BaoxiugongnengService baoxiugongnengService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BaoxiugongnengEntity baoxiugongneng,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjiaxinxi")) {
			baoxiugongneng.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<BaoxiugongnengEntity> ew = new EntityWrapper<BaoxiugongnengEntity>();

		PageUtils page = baoxiugongnengService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, baoxiugongneng), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,BaoxiugongnengEntity baoxiugongneng, 
		HttpServletRequest request){
        EntityWrapper<BaoxiugongnengEntity> ew = new EntityWrapper<BaoxiugongnengEntity>();

		PageUtils page = baoxiugongnengService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, baoxiugongneng), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BaoxiugongnengEntity baoxiugongneng){
       	EntityWrapper<BaoxiugongnengEntity> ew = new EntityWrapper<BaoxiugongnengEntity>();
      	ew.allEq(MPUtil.allEQMapPre( baoxiugongneng, "baoxiugongneng")); 
        return R.ok().put("data", baoxiugongnengService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BaoxiugongnengEntity baoxiugongneng){
        EntityWrapper< BaoxiugongnengEntity> ew = new EntityWrapper< BaoxiugongnengEntity>();
 		ew.allEq(MPUtil.allEQMapPre( baoxiugongneng, "baoxiugongneng")); 
		BaoxiugongnengView baoxiugongnengView =  baoxiugongnengService.selectView(ew);
		return R.ok("查询报修功能成功").put("data", baoxiugongnengView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BaoxiugongnengEntity baoxiugongneng = baoxiugongnengService.selectById(id);
		baoxiugongneng = baoxiugongnengService.selectView(new EntityWrapper<BaoxiugongnengEntity>().eq("id", id));
        return R.ok().put("data", baoxiugongneng);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BaoxiugongnengEntity baoxiugongneng = baoxiugongnengService.selectById(id);
		baoxiugongneng = baoxiugongnengService.selectView(new EntityWrapper<BaoxiugongnengEntity>().eq("id", id));
        return R.ok().put("data", baoxiugongneng);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BaoxiugongnengEntity baoxiugongneng, HttpServletRequest request){
    	baoxiugongneng.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(baoxiugongneng);
        baoxiugongnengService.insert(baoxiugongneng);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody BaoxiugongnengEntity baoxiugongneng, HttpServletRequest request){
    	baoxiugongneng.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(baoxiugongneng);
        baoxiugongnengService.insert(baoxiugongneng);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody BaoxiugongnengEntity baoxiugongneng, HttpServletRequest request){
        //ValidatorUtils.validateEntity(baoxiugongneng);
        baoxiugongnengService.updateById(baoxiugongneng);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        baoxiugongnengService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
