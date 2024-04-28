-- Description
-- 다음은 식품공장의 정보를 담은 FOOD_FACTORY 테이블입니다. FOOD_FACTORY 테이블은 다음과 같으며 FACTORY_ID, FACTORY_NAME, ADDRESS, TLNO는 각각 공장 ID, 공장 이름, 주소, 전화번호를 의미합니다.

-- Column name	Type	Nullable
-- FACTORY_ID	VARCHAR(10)	FALSE
-- FACTORY_NAME	VARCHAR(50)	FALSE
-- ADDRESS	VARCHAR(100)	FALSE
-- TLNO	VARCHAR(20)	TRUE
-- 문제
-- FOOD_FACTORY 테이블에서 강원도에 위치한 식품공장의 공장 ID, 공장 이름, 주소를 조회하는 SQL문을 작성해주세요. 이때 결과는 공장 ID를 기준으로 오름차순 정렬해주세요.

-- 예시
-- FOOD_FACTORY 테이블이 다음과 같을 때

-- FACTORY_ID	FACTORY_NAME	ADDRESS	TLNO
-- FT19980003	(주)맛있는라면	강원도 정선군 남면 칠현로 679	033-431-3122
-- FT19980004	(주)맛있는기름	경기도 평택시 포승읍 포승공단순환로 245	031-651-2410
-- FT20010001	(주)맛있는소스	경상북도 구미시 1공단로7길 58-11	054-231-2121
-- FT20010002	(주)맛있는통조림	전라남도 영암군 미암면 곤미현로 1336	061-341-5210
-- FT20100001	(주)맛있는차	전라남도 장성군 서삼면 장산리 233-1번지	061-661-1420
-- FT20100002	(주)맛있는김치	충청남도 아산시 탕정면 탕정면로 485	041-241-5421
-- FT20100003	(주)맛있는음료	강원도 원주시 문막읍 문막공단길 154	033-232-7630
-- FT20100004	(주)맛있는국	강원도 평창군 봉평면 진조길 227-35	033-323-6640
-- FT20110001	(주)맛있는밥	경기도 화성시 팔탄면 가재리 34번지	031-661-1532
-- FT20110002	(주)맛있는과자	광주광역시 북구 하서로 222	062-211-7759
-- SQL을 실행하면 다음과 같이 출력되어야 합니다.

-- FACTORY_ID	FACTORY_NAME	ADDRESS
-- FT19980003	(주)맛있는라면	강원도 정선군 남면 칠현로 679
-- FT20100003	(주)맛있는음료	강원도 원주시 문막읍 문막공단길 154
-- FT20100004	(주)맛있는국	강원도 평창군 봉평면 진조길 227-35

-- 코드를 입력하세요
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID ASC
;