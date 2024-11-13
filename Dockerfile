FROM amazoncorretto:17.0.13-alpine3.20

COPY build/libs/*.jar app.jar

EXPOSE 8080

ENV RDS_PASSWORD=defaultpassword
ENV SPRING_PROFILE=local

CMD ["echo", "${RDS_PASSWORD}"]

ENTRYPOINT ["sh", "-c", "java -jar -DRDS_PASSWORD=${RDS_PASSWORD} app.jar --spring.profiles.active=${SPRING_PROFILE}"]

# ENTRYPOINT ["java", "-jar", "-DRDS_PASSWORD=${RDS_PASSWORD}", "app.jar"]
# RDS_PASSSWORD, SPRING_PROFILE같은 환경변수 주입을 이런 식으로 쓰면
# 이미지를 빌드할 때 설정된 ENV 값을 사용하게 돼서
# 컨테이너 실행 시 전달한 RDS_PASSWORD를 사용하지 않게돼버림

