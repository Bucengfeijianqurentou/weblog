package com.cishu.weblog.admin.convert;

import com.cishu.weblog.admin.model.vo.wiki.FindWikiPageListRspVO;
import com.cishu.weblog.common.domain.dos.WikiDO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface WikiConvert {
    /**
     * 初始化 convert 实例
     */
    WikiConvert INSTANCE = Mappers.getMapper(WikiConvert.class);

    /**
     * WikiDO -> FindWikiPageListRspVO
     * @param bean
     * @return
     */
    @Mapping(target = "isTop", expression = "java(bean.getWeight() > 0)")
    FindWikiPageListRspVO convertDO2VO(WikiDO bean);

}
