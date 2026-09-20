package com.cl.dao;

import com.cl.entity.BaoxiugongnengEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.BaoxiugongnengView;


/**
 * 报修功能
 * 
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
public interface BaoxiugongnengDao extends BaseMapper<BaoxiugongnengEntity> {
	
	List<BaoxiugongnengView> selectListView(@Param("ew") Wrapper<BaoxiugongnengEntity> wrapper);

	List<BaoxiugongnengView> selectListView(Pagination page,@Param("ew") Wrapper<BaoxiugongnengEntity> wrapper);
	
	BaoxiugongnengView selectView(@Param("ew") Wrapper<BaoxiugongnengEntity> wrapper);
	

}
