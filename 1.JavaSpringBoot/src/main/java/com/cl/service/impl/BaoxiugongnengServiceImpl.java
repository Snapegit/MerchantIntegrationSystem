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


import com.cl.dao.BaoxiugongnengDao;
import com.cl.entity.BaoxiugongnengEntity;
import com.cl.service.BaoxiugongnengService;
import com.cl.entity.view.BaoxiugongnengView;

@Service("baoxiugongnengService")
public class BaoxiugongnengServiceImpl extends ServiceImpl<BaoxiugongnengDao, BaoxiugongnengEntity> implements BaoxiugongnengService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BaoxiugongnengEntity> page = this.selectPage(
                new Query<BaoxiugongnengEntity>(params).getPage(),
                new EntityWrapper<BaoxiugongnengEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BaoxiugongnengEntity> wrapper) {
		  Page<BaoxiugongnengView> page =new Query<BaoxiugongnengView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<BaoxiugongnengView> selectListView(Wrapper<BaoxiugongnengEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BaoxiugongnengView selectView(Wrapper<BaoxiugongnengEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
