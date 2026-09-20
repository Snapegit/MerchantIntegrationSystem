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

import com.cl.entity.CuxiaohuodongEntity;
import com.cl.entity.view.CuxiaohuodongView;

import com.cl.service.CuxiaohuodongService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 促销活动
 * 后端接口
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
@RestController
@RequestMapping("/cuxiaohuodong")
public class CuxiaohuodongController {
    @Autowired
    private CuxiaohuodongService cuxiaohuodongService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,CuxiaohuodongEntity cuxiaohuodong,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("shangjiaxinxi")) {
			cuxiaohuodong.setShangjiazhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<CuxiaohuodongEntity> ew = new EntityWrapper<CuxiaohuodongEntity>();

		PageUtils page = cuxiaohuodongService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cuxiaohuodong), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,CuxiaohuodongEntity cuxiaohuodong, 
		HttpServletRequest request){
        EntityWrapper<CuxiaohuodongEntity> ew = new EntityWrapper<CuxiaohuodongEntity>();

		PageUtils page = cuxiaohuodongService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cuxiaohuodong), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( CuxiaohuodongEntity cuxiaohuodong){
       	EntityWrapper<CuxiaohuodongEntity> ew = new EntityWrapper<CuxiaohuodongEntity>();
      	ew.allEq(MPUtil.allEQMapPre( cuxiaohuodong, "cuxiaohuodong")); 
        return R.ok().put("data", cuxiaohuodongService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(CuxiaohuodongEntity cuxiaohuodong){
        EntityWrapper< CuxiaohuodongEntity> ew = new EntityWrapper< CuxiaohuodongEntity>();
 		ew.allEq(MPUtil.allEQMapPre( cuxiaohuodong, "cuxiaohuodong")); 
		CuxiaohuodongView cuxiaohuodongView =  cuxiaohuodongService.selectView(ew);
		return R.ok("查询促销活动成功").put("data", cuxiaohuodongView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        CuxiaohuodongEntity cuxiaohuodong = cuxiaohuodongService.selectById(id);
		cuxiaohuodong = cuxiaohuodongService.selectView(new EntityWrapper<CuxiaohuodongEntity>().eq("id", id));
        return R.ok().put("data", cuxiaohuodong);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        CuxiaohuodongEntity cuxiaohuodong = cuxiaohuodongService.selectById(id);
		cuxiaohuodong = cuxiaohuodongService.selectView(new EntityWrapper<CuxiaohuodongEntity>().eq("id", id));
        return R.ok().put("data", cuxiaohuodong);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CuxiaohuodongEntity cuxiaohuodong, HttpServletRequest request){
    	cuxiaohuodong.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(cuxiaohuodong);
        cuxiaohuodongService.insert(cuxiaohuodong);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody CuxiaohuodongEntity cuxiaohuodong, HttpServletRequest request){
    	cuxiaohuodong.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(cuxiaohuodong);
        cuxiaohuodongService.insert(cuxiaohuodong);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody CuxiaohuodongEntity cuxiaohuodong, HttpServletRequest request){
        //ValidatorUtils.validateEntity(cuxiaohuodong);
        cuxiaohuodongService.updateById(cuxiaohuodong);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        cuxiaohuodongService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
