-- Description
-- 다음은 아이스크림 가게의 상반기 주문 정보를 담은 FIRST_HALF 테이블과 아이스크림 성분에 대한 정보를 담은 ICECREAM_INFO 테이블입니다. FIRST_HALF 테이블 구조는 다음과 같으며, SHIPMENT_ID, FLAVOR, TOTAL_ORDER 는 각각 아이스크림 공장에서 아이스크림 가게까지의 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량을 나타냅니다. FIRST_HALF 테이블의 기본 키는 FLAVOR입니다.

-- NAME	TYPE	NULLABLE
-- SHIPMENT_ID	INT(N)	FALSE
-- FLAVOR	VARCHAR(N)	FALSE
-- TOTAL_ORDER	INT(N)	FALSE
-- ICECREAM_INFO 테이블 구조는 다음과 같으며, FLAVOR, INGREDITENT_TYPE 은 각각 아이스크림 맛, 아이스크림의 성분 타입을 나타냅니다. INGREDIENT_TYPE에는 아이스크림의 주 성분이 설탕이면 sugar_based라고 입력되고, 아이스크림의 주 성분이 과일이면 fruit_based라고 입력됩니다. ICECREAM_INFO의 기본 키는 FLAVOR입니다. ICECREAM_INFO테이블의 FLAVOR는 FIRST_HALF 테이블의 FLAVOR의 외래 키입니다.

-- NAME	TYPE	NULLABLE
-- FLAVOR	VARCHAR(N)	FALSE
-- INGREDIENT_TYPE	VARCHAR(N)	FALSE
-- 문제
-- 상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.

-- 예시
-- 예를 들어 FIRST_HALF 테이블이 다음과 같고

-- SHIPMENT_ID	FLAVOR	TOTAL_ORDER
-- 101	chocolate	3200
-- 102	vanilla	2800
-- 103	mint_chocolate	1700
-- 104	caramel	2600
-- 105	white_chocolate	3100
-- 106	peach	2450
-- 107	watermelon	2150
-- 108	mango	2900
-- 109	strawberry	3100
-- 110	melon	3150
-- 111	orange	2900
-- 112	pineapple	2900
-- ICECREAM_INFO 테이블이 다음과 같다면

-- FLAVOR	INGREDIENT_TYPE
-- chocolate	sugar_based
-- vanilla	sugar_based
-- mint_chocolate	sugar_based
-- caramel	sugar_based
-- white_chocolate	sugar_based
-- peach	fruit_based
-- watermelon	fruit_based
-- mango	fruit_based
-- strawberry	fruit_based
-- melon	fruit_based
-- orange	fruit_based
-- pineapple	fruit_based
-- 상반기 아이스크림 총주문량이 3,000보다 높은 아이스크림 맛은 chocolate, strawberry, melon, white_chocolate입니다. 이 중에 아이스크림의 주 성분이 과일인 아이스크림 맛은 strawberry와 melon이고 총주문량이 큰 순서대로 아이스크림 맛을 조회하면 melon, strawberry 순으로 조회되어야 합니다. 따라서 SQL 문을 실행하면 다음과 같이 나와야 합니다.

-- FLAVOR
-- melon
-- strawberry


-- 코드를 입력하세요
SELECT FIRST_HALF.FLAVOR
FROM FIRST_HALF
    JOIN ICECREAM_INFO
    ON FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR
WHERE INGREDIENT_TYPE = 'fruit_based' AND TOTAL_ORDER > 3000
ORDER BY TOTAL_ORDER DESC
;

-- ## FIRST_HALF : 주문 정보 테이블
--   # SHIPMENT_ID : 아이스크림 가게 출하 번호
--   # FLAVOR : 맛(PK)
--   # TOTAL_ORDER : 총주문량

-- ## ICECREAM_INFO : 아이스크림 성분 정보
--   # FLAVoR : 맛(PK, FK)
--   # INGREDIENT_TYPE : 아스크림 성분 타입 (sugar_based, fruit_based)



-- # 조인은 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것을 말한다.
-- # INNER JOIN(내부 조인)은 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야 한다.
-- # OUTER JOIN(외부 조인)은 두 테이블을 조인할 때, 1개의 테이블에만 데이터가 있어도 결과가 나온다.
-- # CROSS JOIN(상호 조인)은 한쪽 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인하는 기능이다.
-- # SELF JOIN(자체 조인)은 자신이 자신과 조인한다는 의미로, 1개의 테이블을 사용한다.


-- ## JOIN 

-- # SELECT <열 목록>
-- #  FROM <첫 번째 테이블>
-- #           INNER JOIN <두 번째 테이블>
-- #           ON <조인될 조건>
-- #  [WHERE 검색 조건]
 
 
-- # SELECT FIRST_HALF.FLAVOR 
-- # FROM FIRST_HALF JOIN ICECREAM_INFO ON FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR
-- # WHERE TOTAL_ORDER > 3000
-- # AND INGREDIENT_TYPE = 'fruit_based'
-- # ORDER BY TOTAL_ORDER DESC


-- # SELECT A.FLAVOR
-- # FROM FIRST_HALF A
-- # JOIN ICECREAM_INFO B ON A.FLAVOR = B.FLAVOR
-- # WHERE (A.TOTAL_ORDER > 3000) AND (B.INGREDIENT_TYPE = 'fruit_based')
-- # ORDER BY A.TOTAL_ORDER DESC


-- # SELECT FIRST_HALF.FLAVOR
-- # FROM FIRST_HALF, ICECREAM_INFO
-- # WHERE FIRST_HALF.FLAVOR = ICECREAM_INFO.FLAVOR AND FIRST_HALF.TOTAL_ORDER > 3000 AND ICECREAM_INFO.INGREDIENT_TYPE = 'fruit_based'
-- # ORDER BY TOTAL_ORDER DESC
 
 