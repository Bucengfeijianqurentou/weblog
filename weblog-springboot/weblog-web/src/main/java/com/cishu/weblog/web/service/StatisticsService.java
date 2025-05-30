package com.cishu.weblog.web.service;

import com.cishu.weblog.common.utils.Response;

public interface StatisticsService {
    /**
     * 获取文章总数、分类总数、标签总数、总访问量统计信息
     * @return
     */
    Response findInfo();
}