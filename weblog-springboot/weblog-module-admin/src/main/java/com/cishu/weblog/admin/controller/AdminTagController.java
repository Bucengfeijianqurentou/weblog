package com.cishu.weblog.admin.controller;

import com.cishu.weblog.admin.model.vo.tag.AddTagReqVO;
import com.cishu.weblog.admin.model.vo.tag.DeleteTagReqVO;
import com.cishu.weblog.admin.model.vo.tag.FindTagPageListReqVO;
import com.cishu.weblog.admin.model.vo.tag.SearchTagsReqVO;
import com.cishu.weblog.admin.service.AdminTagService;
import com.cishu.weblog.common.aspect.ApiOperationLog;
import com.cishu.weblog.common.utils.PageResponse;
import com.cishu.weblog.common.utils.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/admin")
@Api(tags = "Admin 标签模块")
public class AdminTagController {

    @Autowired
    private AdminTagService tagService;



    @PostMapping("/tag/add")
    @ApiOperation(value = "添加标签")
    @ApiOperationLog(description = "添加标签")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public Response addTags(@RequestBody @Validated AddTagReqVO addTagReqVO) {
        return tagService.addTags(addTagReqVO);
    }

    @PostMapping("/tag/list")
    @ApiOperation(value = "标签分页数据获取")
    @ApiOperationLog(description = "标签分页数据获取")
    public PageResponse findTagPageList(@RequestBody @Validated FindTagPageListReqVO findTagPageListReqVO) {
        return tagService.findTagPageList(findTagPageListReqVO);
    }


    @PostMapping("/tag/delete")
    @ApiOperation(value = "删除标签")
    @ApiOperationLog(description = "删除标签")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public Response deleteTag(@RequestBody @Validated DeleteTagReqVO deleteTagReqVO) {
        return tagService.deleteTag(deleteTagReqVO);
    }


    @PostMapping("/tag/search")
    @ApiOperation(value = "标签模糊查询")
    @ApiOperationLog(description = "标签模糊查询")
    public Response searchTags(@RequestBody @Validated SearchTagsReqVO searchTagsReqVO) {
        return tagService.searchTags(searchTagsReqVO);
    }


    @PostMapping("/tag/select/list")
    @ApiOperation(value = "查询标签 Select 列表数据")
    @ApiOperationLog(description = "查询标签 Select 列表数据")
    public Response findTagSelectList() {
        return tagService.findTagSelectList();
    }



}
