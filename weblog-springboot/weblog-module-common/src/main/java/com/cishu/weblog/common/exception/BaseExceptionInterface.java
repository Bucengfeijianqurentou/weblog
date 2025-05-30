package com.cishu.weblog.common.exception;

/**
 * 通用异常接口
 */
public interface BaseExceptionInterface {
    /**
     * 获取异常码
     * @return
     */
    String getErrorCode();

    /**
     * 获取异常信息。
     * @return
     */
    String getErrorMessage();
}
