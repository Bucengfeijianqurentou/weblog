package com.cishu.weblog.web.service;

import com.cishu.weblog.common.utils.Response;
import com.cishu.weblog.web.model.vo.search.SearchArticlePageListReqVO;

public interface SearchService {

    /**
     * 关键词分页搜索
     * @param searchArticlePageListReqVO
     * @return
     */
    Response searchArticlePageList(SearchArticlePageListReqVO searchArticlePageListReqVO);
}
