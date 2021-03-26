package com.etc.renting.util;

import com.netflix.hystrix.contrib.metrics.eventstream.HystrixMetricsStreamServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MyHystrixConfig {

    @Bean
    public ServletRegistrationBean getServlet(){
        HystrixMetricsStreamServlet hmss=new HystrixMetricsStreamServlet();
        ServletRegistrationBean srb=new ServletRegistrationBean(hmss);
        srb.setLoadOnStartup(1);
        srb.addUrlMappings("/hystrix.stream");
        srb.setName("HystrixMetricsStreamServlet");
        return srb;
    }


}
