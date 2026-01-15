package com.my.todo.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    /*
    Edge Chrome
    1. debug print 사용해서 개발자가 작성한 데이터나 기능 결과 확인 가능하다.
    2. 테스트 종료하고 나면 웹사이트가 필요하지 않지만 상황에 따라
       테스트 모드 웹사이트를 배포용 웹사이트로 사용할 수도 있다.
    3. 개발자가 개발하기 위한 테스트 모드이기 때문에
       실행할 때마다 서버 포트가 변경되기 때문에 일일이 수정해야 한다.
       (변경되지 않도록 서버 포트를 고정적으로 설정할 수 있다.
     */
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                // REST API CORS 설정
                registry.addMapping("/api/**")
                        /*
                        SpringBoot 정책

                        allowedOrigins("*")
                            아무나 다 들어와 -> 무책임함 -> 브라우저가 차단한다.
                        allowedOriginPatterns("*")
                            개발자를 위한 메서드 생성 -> 아무나 다 들어와 -> 들어오세영
                        allowCredentials(true)
                            프론트엔드와 백엔드 사이에서 다음 정보들이 오갈 수 있다.
                            쿠키(로그인 세션), 인증 헤더 Bearer <토큰> 같은 헤더, 클라이언트 보안 인증서
                        allowCredentials(true)
                            보안 설정으로 인해 쿠키 못 보내네 ^^ 유감... 매번 로그인 다시 해
                            -> 로그인 풀리는 현상

                        allowedOrigins + .allowCredentials(true)
                        -> 함께 사용 시 .allowedOrigins 주소 문자열 내부에 * 사용 불가
                        allowedOrigins + .allowCredentials(false)
                        -> 함께 사용 시 .allowedOrigins 주소 문자열 내부에 * 사용 가능
                        allowedOriginPatterns + .allowCredentials(true)
                        -> 함께 사용 시 .allowedOriginPatterns 주소 문자열 내부에 * 사용 가능
                        allowedOriginPatterns + .allowCredentials(false)
                        -> 함께 사용 시 .allowedOriginPatterns 주소 문자열 내부에 * 사용 가능

                        기본적으로 * 사용은 배포 단계에서 치명적인 사유이기 때문에
                        반드시 개발 단계에서만 사용해야 한다.

                         */
//                        .allowedOrigins(
//                                "http://localhost:3000", // IOS 테스트 8080
//                                "http://10.0.2.2:8080"   // 안드로이드 핸드폰 테스트
//                        )
//                        .allowCredentials(true)
//                        .allowCredentials(false)         // * 와 함께 쓸 때는 false여야 함
                        .allowedOriginPatterns(
                                "http://localhost:*",    // 윈도우/웹/IOS 모든 포트 허용한다.
                                "http://10.0.2.2:*"      // 안드로이드 에뮬레이터 모든 포트 허용
                        )
                        .allowCredentials(true)
                        .allowedMethods("GET","POST","PUT","DELETE","PATCH","OPTIONS")
                        .allowedHeaders("*");
            }
        };
    }
}
