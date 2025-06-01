package com.cishu.weblog.admin.service;

import com.cishu.weblog.admin.model.vo.comment.FindCommentPageListReqVO;
import com.cishu.weblog.common.utils.Response;

public interface AdminCommentService {


    /**
     * 查询评论分页数据
     * @param findCommentPageListReqVO
     * @return
     */
    Response findCommentPageList(FindCommentPageListReqVO findCommentPageListReqVO);

}
