package com.cishu.weblog.admin.convert;

import com.cishu.weblog.admin.model.vo.comment.FindCommentPageListRspVO;
import com.cishu.weblog.common.domain.dos.CommentDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface CommentConvert {
    /**
     * 初始化 convert 实例
     */
    CommentConvert INSTANCE = Mappers.getMapper(CommentConvert.class);

    /**
     * 将 DO 转化为 VO
     * @param bean
     * @return
     */
    FindCommentPageListRspVO convertDO2VO(CommentDO bean);

}

