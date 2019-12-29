package com.example.config.property;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * redis 配置属性
 *
 * @author mengqiang
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "redis")
public class RedisProperty {

    private String host;

    private int port;

    private int database = 0;

    private String password;

    private Integer connectTimeout;

}
