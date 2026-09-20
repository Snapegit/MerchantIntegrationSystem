package com.cl.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;


import com.cl.dao.CuxiaohuodongDao;
import com.cl.entity.CuxiaohuodongEntity;
import com.cl.service.CuxiaohuodongService;
import com.cl.entity.view.CuxiaohuodongView;

@Service("cuxiaohuodongService")
public class CuxiaohuodongServiceImpl extends ServiceImpl<CuxiaohuodongDao, CuxiaohuodongEntity> implements CuxiaohuodongService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<CuxiaohuodongEntity> page = this.selectPage(
                new Query<CuxiaohuodongEntity>(params).getPage(),
                new EntityWrapper<CuxiaohuodongEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<CuxiaohuodongEntity> wrapper) {
		  Page<CuxiaohuodongView> page =new Query<CuxiaohuodongView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<CuxiaohuodongView> selectListView(Wrapper<CuxiaohuodongEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public CuxiaohuodongView selectView(Wrapper<CuxiaohuodongEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
