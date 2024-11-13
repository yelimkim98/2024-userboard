FROM amazoncorretto:17.0.13-alpine3.20

COPY build/libs/*.jar app.jar

EXPOSE 8080

ENV RDS_PASSWORD=defaultpassword

CMD ["echo", "${RDS_PASSWORD}"]

ENTRYPOINT ["sh", "-c", "java -jar -DRDS_PASSWORD=${RDS_PASSWORD} app.jar"]

# ENTRYPOINT ["java", "-jar", "-DRDS_PASSWORD=${RDS_PASSWORD}", "app.jar"]
# 만약 이렇게 쓰면 이미지를 빌드할 때 설정된 ENV 값을 사용하게 돼서
# 컨테이너 실행 시 전달한 RDS_PASSWORD를 사용하지 않는다는 문제가 생김
