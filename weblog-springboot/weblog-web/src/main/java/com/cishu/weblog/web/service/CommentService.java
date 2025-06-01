package com.cishu.weblog.web.service;

import com.cishu.weblog.common.utils.Response;
import com.cishu.weblog.web.model.vo.comment.FindQQUserInfoReqVO;

public interface CommentService {

    /**
     * 根据 QQ 号获取用户信息
     *
     * @param findQQUserInfoReqVO
     * @return
     */
    Response findQQUserInfo(FindQQUserInfoReqVO findQQUserInfoReqVO);


}