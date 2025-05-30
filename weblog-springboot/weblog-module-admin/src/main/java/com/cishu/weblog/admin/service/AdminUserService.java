package com.cishu.weblog.admin.service;

import com.cishu.weblog.admin.model.vo.user.UpdateAdminUserPasswordReqVO;
import com.cishu.weblog.common.utils.Response;

public interface AdminUserService {
    /**
     * 修改密码
     * @param updateAdminUserPasswordReqVO
     * @return
     */
    Response updatePassword(UpdateAdminUserPasswordReqVO updateAdminUserPasswordReqVO);


    /**
     * 获取当前用户登录信息
     * @return
     */
    Response findUserInfo();

}
