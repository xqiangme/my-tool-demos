package com.example.config;

import com.example.config.property.OssProperty;
import com.example.config.property.RedisProperty;
import com.tool.general.excel.config.redis.RedisCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringRedisConfig {

    @Autowired
    private RedisProperty redisProperty;

    @Autowired
    private OssProperty ossApplication;

    @Bean
    public RedisCache redisCache() {
        RedisCache redisCache = new RedisCache();
        redisCache.setHost("redis://" + redisProperty.getHost() + ":" + redisProperty.getPort());
        redisCache.setPassword(redisProperty.getPassword());
        redisCache.setDatabase(redisProperty.getDatabase());
        redisCache.setConnectTimeout(redisProperty.getConnectTimeout());
        return redisCache;
    }

//    @Bean
//    public OssProperty ossProperty() {
//        OssProperty ossProperty = new OssProperty();
//        ossProperty.setAccessId(ossApplication.getAccessId());
//        ossProperty.setAccessKey(ossApplication.getAccessKey());
//        ossProperty.setBucket(ossApplication.getBucket());
//        ossProperty.setEndpoint(ossApplication.getEndpoint());
//        ossProperty.setDefaultDir(ossApplication.getDefaultDir());
//        return ossProperty;
//    }

}