package com.cishu.weblog.common.domain.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cishu.weblog.common.domain.dos.UserDO;
import org.apache.catalina.webresources.WarResource;

import java.time.LocalDateTime;

public interface UserMapper extends BaseMapper<UserDO> {

    default UserDO findByUsername(String username) {
        LambdaQueryWrapper<UserDO> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(UserDO::getUsername,username);
        return selectOne(wrapper);
    }


    default int updatePasswordByUsername(String username,String password) {
        LambdaUpdateWrapper<UserDO> wrapper = new LambdaUpdateWrapper<>();
        //设置要更新的字段
        wrapper.set(UserDO::getPassword,password);
        wrapper.set(UserDO::getUpdateTime, LocalDateTime.now());
        //更新条件
        wrapper.eq(UserDO::getUsername,username);
        return update(null, wrapper);

    }

}
