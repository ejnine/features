# Для одинакового ведения логов

## logback-spring.xml
```
<configuration>
    <property name="LOG_LEVEL" value="INFO" />

    <appender name="ConsoleAppender" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>
                %highlight(%-5level) %magenta(%d{YYYY-MM-dd hh:mm:ss}) %boldWhite(%logger{0}.%line) : %msg%n
            </pattern>
        </encoder>
    </appender>

    <appender name="FileAppender" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>logs/application.log</file>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>logs/application-%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>90</maxHistory>
        </rollingPolicy>
        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss} [%thread] %-5level %logger{12} - %msg%n</pattern>
        </encoder>
    </appender>

    <logger name="org.springframework" level="WARN" additivity="false">
        <appender-ref ref="ConsoleAppender"/>
    </logger>

    <logger name="WARN_AND_ERROR_ONLY" level="WARN" additivity="false">
        <appender-ref ref="FileAppender"/>
    </logger>

    <root level="INFO">
        <appender-ref ref="ConsoleAppender"/>
    </root>
</configuration>

```
