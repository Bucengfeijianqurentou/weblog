package com.cishu.weblog.web.service.impl;

import com.cishu.weblog.common.domain.dos.BlogSettingsDO;
import com.cishu.weblog.common.domain.mapper.BlogSettingsMapper;
import com.cishu.weblog.common.utils.Response;
import com.cishu.weblog.web.convert.BlogSettingsConvert;
import com.cishu.weblog.web.model.vo.blogsettings.FindBlogSettingsDetailRspVO;
import com.cishu.weblog.web.service.BlogSettingsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class BlogSettingsServiceImpl implements BlogSettingsService {

    @Autowired
    private BlogSettingsMapper blogSettingsMapper;

    /**
     * 获取博客设置信息
     *
     * @return
     */
    @Override
    public Response findDetail() {
        // 查询博客设置信息（约定的 ID 为 1）
        BlogSettingsDO blogSettingsDO = blogSettingsMapper.selectById(1L);
        // DO 转 VO
        FindBlogSettingsDetailRspVO vo = BlogSettingsConvert.INSTANCE.convertDO2VO(blogSettingsDO);

        return Response.success(vo);
    }
}

