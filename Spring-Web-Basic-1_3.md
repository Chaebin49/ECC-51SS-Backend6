# 스프링 부트 웹 개발 기초 학습 정리

스프링 부트를 이용한 웹 애플리케이션 개발의 핵심 원리와 기초 흐름을 정리한 학습 노트입니다.

## 1. 프로젝트 환경 설정
* **IDE:** IntelliJ (실무 권장)
* **빌드 도구:** Gradle - Groovy
* **Spring Boot:** 4.0.6
* **Java:** 17 이상
* **Dependencies:** Spring Web, Thymeleaf

## 2. 스프링 웹 개발 3대 방식

### ① 정적 컨텐츠 (Static Content)
* **개념:** 서버의 개입 없이 파일을 그대로 웹 브라우저에 전달.
* **경로:** `src/main/resources/static/`
* **동작:** `localhost:8080/hello-static.html` 요청 시 해당 파일을 찾아 그대로 반환.


### ② MVC와 템플릿 엔진 (MVC & Template Engine)
* **개념:** 서버에서 HTML을 동적으로 변형하여 전달하는 방식.
* **구성:**
    * **Model:** 데이터
    * **View:** 화면(Thymeleaf 등 템플릿 엔진)
    * **Controller:** 비즈니스 로직 및 모델 생성
* **동작:** 컨트롤러가 리턴 값을 주면 `ViewResolver`가 `templates/` 경로에서 파일을 찾아 렌더링.


### ③ API 방식
* **개념:** 뷰(View) 없이 데이터(JSON)를 클라이언트에 직접 전달.
* **어노테이션:** `@ResponseBody` 사용
* **동작:** * `ViewResolver` 대신 `HttpMessageConverter`가 동작.
    * 기본 객체 처리: `MappingJackson2HttpMessageConverter`가 객체를 JSON으로 변환.


## 3. 핵심 요약
| 방식 | 설명 | 주요 특징 |
| :--- | :--- | :--- |
| **정적 컨텐츠** | 파일을 그대로 전송 | 서버 가공 없음 |
| **MVC/템플릿** | HTML을 동적 렌더링 | ViewResolver 사용 |
| **API** | 데이터(JSON) 전송 | @ResponseBody, 객체 반환 |

## 4. 빌드 및 실행
1. 프로젝트 루트 경로로 이동: `cd 프로젝트_폴더_경로`
2. 빌드 실행: `gradlew.bat build`
3. 실행 파일 확인: `build/libs/` 내 `.jar` 파일 생성
4. 서버 실행: `java -jar hello-spring-0.0.1-SNAPSHOT.jar`
