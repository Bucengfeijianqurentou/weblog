package com.cishu.weblog.admin.service;

import com.cishu.weblog.admin.model.vo.blogsettings.UpdateBlogSettingsReqVO;
import com.cishu.weblog.common.utils.Response;

public interface AdminBlogSettingsService {
    /**
     * 更新博客设置信息
     * @param updateBlogSettingsReqVO
     * @return
     */
    Response updateBlogSettings(UpdateBlogSettingsReqVO updateBlogSettingsReqVO);



    /**
     * 获取博客设置详情
     * @return
     */
    Response findDetail();

}
