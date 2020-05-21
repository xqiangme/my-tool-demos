package com.example.advice;

import com.example.task.demo.TaskStudent;
import com.xqiang.job.admin.common.enums.SysExceptionEnum;
import com.xqiang.job.admin.common.exception.JobAdminBaseException;
import com.xqiang.job.admin.common.param.base.JobAdminResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局统一异常处理
 *
 * @author mengq
 */
@ControllerAdvice
public class ExceptionAdvice {

    private static Logger log = LoggerFactory.getLogger(TaskStudent.class);

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public JobAdminResponse defaultExceptionHandler(Exception exception) {
        JobAdminResponse result = new JobAdminResponse();
        try {
            throw exception;
        } catch (JobAdminBaseException e) {
            log.error("【 全局异常捕获 】>> 自定义业务异常  >> errorMsg : {} ", e.getMsg());
            log.debug("【 全局异常捕获 】>> 自定义业务异常堆栈  >> stack : ", e);
            result.setCode(e.getCode());
            result.setMsg(e.getMessage());
        } catch (HttpRequestMethodNotSupportedException e) {
            String errorMsg = String.format("请求方式 %s 错误 ! 请使用 %s 方式", e.getMethod(), e.getSupportedHttpMethods());
            log.error("【 全局异常捕获 】>> {}", errorMsg);
            result.setCode(SysExceptionEnum.INVALID_PARAM.getCode());
            result.setMsg(errorMsg);
        } catch (HttpMediaTypeNotSupportedException e) {
            String errorMsg = String.format("请求类型 %s 错误 ! 请使用 %s 方式", e.getContentType(), e.getSupportedMediaTypes());
            log.error("【 全局异常捕获 】>> {}", errorMsg);
            result.setCode(SysExceptionEnum.INVALID_PARAM.getCode());
            result.setMsg(errorMsg);
        } catch (Exception e) {
            log.error("【 全局异常捕获 】>>  未知异常 stack :", e);
            result.setCode(SysExceptionEnum.SYSTEM_ERROR.getCode());
            result.setMsg(SysExceptionEnum.SYSTEM_ERROR.getMsg());
        }
        return result;
    }

}