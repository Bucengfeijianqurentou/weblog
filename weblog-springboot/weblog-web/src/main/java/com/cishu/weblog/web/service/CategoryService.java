package com.cishu.weblog.web.service;

import com.cishu.weblog.common.utils.Response;
import com.cishu.weblog.web.model.vo.category.FindCategoryArticlePageListReqVO;
import com.cishu.weblog.web.model.vo.category.FindCategoryListReqVO;

public interface CategoryService {
    /**
     * 获取分类列表
     * @return
     */
    Response findCategoryList(FindCategoryListReqVO findCategoryListReqVO);




    /**
     * 获取分类下文章分页数据
     * @param findCategoryArticlePageListReqVO
     * @return
     */
    Response findCategoryArticlePageList(FindCategoryArticlePageListReqVO findCategoryArticlePageListReqVO);

}
