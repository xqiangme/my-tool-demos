package com.example.config.property;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * oss 配置属性
 *
 * @author mengqiang
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "oss.demo")
public class OssProperty {

    /**
     * OSS accessid
     */
    private String accessId;

    /**
     * oss endpoint
     */
    private String endpoint;

    /**
     * oss secret
     */
    private String accessKey;

    /**
     * oss bucket
     */
    private String bucket;


    private String defaultDir;
}
