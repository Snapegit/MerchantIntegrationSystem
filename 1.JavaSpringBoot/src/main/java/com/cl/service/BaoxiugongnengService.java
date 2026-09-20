package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.BaoxiugongnengEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.BaoxiugongnengView;


/**
 * 报修功能
 *
 * @author 
 * @email 
 * @date 2024-02-18 10:53:03
 */
public interface BaoxiugongnengService extends IService<BaoxiugongnengEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BaoxiugongnengView> selectListView(Wrapper<BaoxiugongnengEntity> wrapper);
   	
   	BaoxiugongnengView selectView(@Param("ew") Wrapper<BaoxiugongnengEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BaoxiugongnengEntity> wrapper);
   	

}

