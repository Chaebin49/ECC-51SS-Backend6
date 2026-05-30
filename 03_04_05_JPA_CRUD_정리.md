# Spring Boot 3장 ~ 5장 정리
> 스프링부트3 자바 백엔드 개발 입문

---

# 3장 데이터베이스와 JPA

## 3.1 DTO와 Entity

### DTO(Data Transfer Object)
- 사용자 입력 데이터를 전달하는 객체
- 폼(Form) 데이터를 Controller로 전달할 때 사용

예시:

```java
public class ArticleForm {

    private String title;
    private String content;
}
```

### Entity
- 데이터베이스 테이블과 연결되는 객체
- DB 테이블의 열(Column)과 매핑됨

예시:

```java
@Entity
public class Article {

    @Id
    @GeneratedValue
    private Long id;

    @Column
    private String title;

    @Column
    private String content;
}
```

---

## DTO → Entity 변환

DTO는 바로 DB 저장이 불가능하므로 Entity로 변환해야 함.

### ArticleForm.java

```java
public Article toEntity() {
    return new Article(null, title, content);
}
```

### 흐름

```text
폼 데이터
↓
DTO(ArticleForm)
↓ toEntity()
Entity(Article)
↓
DB 저장
```

---

## 3.2 Repository

Repository는 DB 작업을 담당한다.

### 역할
- 저장(save)
- 조회(find)
- 삭제(delete)

### Repository 생성

```java
public interface ArticleRepository
extends CrudRepository<Article, Long> {

}
```

### 의미

```java
CrudRepository<Article, Long>
```

- `Article` → 엔티티 클래스
- `Long` → 기본키(id) 타입

---

## 3.3 데이터 저장하기

### Controller에서 데이터 받기

```java
@PostMapping("/articles/create")
public String createArticle(ArticleForm form) {
```

### DTO → Entity 변환

```java
Article article = form.toEntity();
```

### DB 저장

```java
articleRepository.save(article);
```

### 전체 흐름

```text
브라우저 입력
↓
Controller
↓
DTO
↓
Entity 변환
↓
Repository save()
↓
Database 저장
```

---

## save()

DB에 데이터를 저장하는 메서드

```java
articleRepository.save(article);
```

---

## 3.4 DB 데이터 조회

### 전체 데이터 조회

```java
Iterable<Article> articleEntityList =
articleRepository.findAll();
```

### findAll()

DB의 모든 데이터를 조회

---

## 특정 데이터 조회

```java
articleRepository.findById(id);
```

### Optional 처리

```java
articleRepository.findById(id).orElse(null);
```

---

# 4장 CRUD

CRUD는 데이터 처리 기본 기능이다.

```text
Create → 생성
Read → 조회
Update → 수정
Delete → 삭제
```

---

## Create (생성)

게시글 작성 후 저장

```java
articleRepository.save(article);
```

---

## Read (조회)

### 전체 목록 조회

```java
articleRepository.findAll();
```

### 상세 조회

```java
articleRepository.findById(id);
```

---

## Update (수정)

### 기존 데이터 찾기

```java
Article target =
articleRepository.findById(id)
.orElse(null);
```

### 수정 후 저장

```java
articleRepository.save(article);
```

---

## Delete (삭제)

### 삭제

```java
articleRepository.delete(target);
```

---

# 5장 서비스 계층(Service)

## Service란?

Controller와 Repository 사이에서
비즈니스 로직을 처리하는 계층

### 역할

- 데이터 검증
- 예외 처리
- 로직 분리

### 구조

```text
Controller
↓
Service
↓
Repository
↓
Database
```

---

## Service 클래스 생성

```java
@Service
public class ArticleService {

}
```

---

## Repository 주입

```java
@Autowired
private ArticleRepository articleRepository;
```

---

## 데이터 조회

```java
public Iterable<Article> index() {
    return articleRepository.findAll();
}
```

---

## 단일 데이터 조회

```java
public Article show(Long id) {
    return articleRepository
            .findById(id)
            .orElse(null);
}
```

---

## 데이터 저장

```java
public Article create(ArticleForm dto) {

    Article article = dto.toEntity();

    return articleRepository.save(article);
}
```

---

## 수정(Update)

```java
public Article update(Long id,
                      ArticleForm dto) {

    Article article = dto.toEntity();

    Article target =
            articleRepository.findById(id)
                    .orElse(null);

    if(target == null) {
        return null;
    }

    return articleRepository.save(article);
}
```

---

## 삭제(Delete)

```java
public Article delete(Long id) {

    Article target =
            articleRepository.findById(id)
                    .orElse(null);

    if(target == null) {
        return null;
    }

    articleRepository.delete(target);

    return target;
}
```

---

# 핵심 개념 정리

## 어노테이션

```java
@Entity
```
DB 테이블과 연결

```java
@Id
```
대표값(PK)

```java
@GeneratedValue
```
자동 번호 생성

```java
@Column
```
DB 열과 연결

```java
@Controller
```
컨트롤러 선언

```java
@Service
```
서비스 선언

```java
@Autowired
```
객체 자동 주입(DI)

---

# 핵심 메서드

```java
save()
```
저장

```java
findAll()
```
전체 조회

```java
findById()
```
단일 조회

```java
delete()
```
삭제

```java
toEntity()
```
DTO → Entity 변환

---

# 느낀 점

JPA를 사용하면 SQL을 직접 작성하지 않고도 데이터를 저장하고 조회할 수 있다는 점이 편리했다. DTO와 Entity의 역할 차이를 이해했고, Repository를 통해 CRUD 기능을 쉽게 구현할 수 있었다. 또한 Service 계층을 통해 Controller와 DB 로직을 분리하는 구조를 배웠다.
