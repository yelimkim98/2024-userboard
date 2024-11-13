# 실행 가이드
### windows cmd에서 실행하기
```bash
# 환경변수 설정
set RDS_PASSWORD=패스워드값

# 환경변수 설정 잘 됐는지 확인
echo %RDS_PASSWORD%

# 프로젝트 빌드
gradlew clean build

# -D 옵션으로 환경변수 설정
java -jar -DRDS_PASSWORD=패스워드값 build/libs/*.jar
```
### Dockerfile 이용해서 컨테이너로 실행하기
1. docker desktop 실행
2. 프로젝트 빌드
   - 프로젝트루트/build/libs에 jar 파일이 잘 생성됐는지 확인
3. Dockerfile로 image build
   Dockerfile이 있는 위치(=프로젝트 루트)에서 수행
   ```bash
   # image build
   docker build -t userboard:latest .
   
   # 빌드된 이미지 확인
   # userboard:latest가 생긴 것을 확인할 수 있다.
   docker images
   ```
4. 컨테이너 띄우기
   ```bash
   docker run -e RDS_PASSWORD=패스워드값 -p 8080:8080 userboard:latest
   ```

### Docker HUB 로부터 pull 받아서 컨테이너로 실행하기
```bash
docker run -d -p 8080:8080 -e RDS_PASSWORD=패스워드값 kiel0103/2024-userboard:태그
```