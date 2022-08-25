
package com.laoxu.game.aspect;

import com.alibaba.fastjson.JSON;
import com.laoxu.game.annotation.OperLogCat;
import com.laoxu.game.common.IpUtil;
import com.laoxu.game.entity.OperLog;
import com.laoxu.game.entity.User;
import com.laoxu.game.service.OperLogService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Aspect
@Component
@Slf4j
public class OperLogAspect {
    @Autowired
    private OperLogService logService;


    /**
     * 操作日志切入点
     */

    //@Pointcut("@annotation(com.laoxu.game.annotation.OperLogCat)")
    public void operLogPoinCut() {
    }


    /**
     * 拦截用户操作日志
     *
     * @param joinPoint 切入点
     * @param keys      返回结果
     */

    //@AfterReturning(value = "operLogPoinCut()", returning = "keys")
    public void saveOperLog(JoinPoint joinPoint, Object keys) {

        // 获取RequestAttributes
        RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
        // 从获取RequestAttributes中获取HttpServletRequest的信息
        HttpServletRequest request = (HttpServletRequest) requestAttributes
                .resolveReference(RequestAttributes.REFERENCE_REQUEST);
        String requestIp = IpUtil.getRemoteIp(request);
        String reqMethod = request.getMethod();
        // 本机访问的不记录日志
        //if (!"0:0:0:0:0:0:0:1".equals(requestIp)) {
        OperLog operlog = new OperLog();
        try {
            // 从切面织入点处通过反射机制获取织入点处的方法
            MethodSignature signature = (MethodSignature) joinPoint.getSignature();
            // 获取切入点所在的方法
            Method method = signature.getMethod();
            // 获取操作
            OperLogCat opLog = method.getAnnotation(OperLogCat.class);
            if (opLog != null) {
                String operModule = opLog.operModule();
                String operType = opLog.operType();
                String operDesc = opLog.operDesc();
                operlog.setOperModule(operModule); // 操作模块
                operlog.setOperType(operType); // 操作类型
                operlog.setOperDesc(operDesc); // 操作描述
            }
            // 获取请求的类名
            String className = joinPoint.getTarget().getClass().getName();
            // 获取请求的方法名
            String methodName = method.getName();
            methodName = className + "." + methodName;

            operlog.setOperMethod(methodName); // 请求方法

            // 请求的参数
            Map<String, String> rtnMap = converMap(request.getParameterMap());
            // 将参数所在的数组转换成json
            String params = JSON.toJSONString(rtnMap);
            operlog.setReqMethod(reqMethod); // 请求方法
            operlog.setOperParam(params); // 请求参数
            operlog.setOperIp(IpUtil.getRemoteIp(request)); // 请求IP
            operlog.setOperUri(request.getRequestURI()); // 请求URI
            User user = (User) request.getSession().getAttribute("user");
            operlog.setOperUser(user.getUsername());
            operlog.setCreateTime(new Date());
            log.info("当前的记录是:" + methodName + params);
            logService.save(operlog);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //}

    }


    /**
     * 转换request 请求参数
     *
     * @param paramMap request获取的参数数组
     */

    public Map<String, String> converMap(Map<String, String[]> paramMap) {
        Map<String, String> rtnMap = new HashMap<String, String>();
        for (String key : paramMap.keySet()) {
            rtnMap.put(key, paramMap.get(key)[0]);
        }
        return rtnMap;
    }
}


