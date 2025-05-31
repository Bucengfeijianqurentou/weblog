package com.cishu.weblog.admin.service;

import com.cishu.weblog.admin.model.vo.wiki.AddWikiReqVO;
import com.cishu.weblog.admin.model.vo.wiki.DeleteWikiReqVO;
import com.cishu.weblog.common.utils.Response;

public interface AdminWikiService {


    /**
     * 新增知识库
     * @param addWikiReqVO
     * @return
     */
    Response addWiki(AddWikiReqVO addWikiReqVO);




    /**
     * 删除知识库
     * @param deleteWikiReqVO
     * @return
     */
    Response deleteWiki(DeleteWikiReqVO deleteWikiReqVO);


}
