# project_semi(JHTA 세미프로젝트)
--------------
#### 인원: 4명
#### 진행 기간: 2021.05.28~2021.06.15(기획 5일, 개발 11일)   
#### 주제: 의류 쇼핑몰   
#### 역할: 제품 상세, 장바구니, 구매, FaQ, Notice, Qna 페이지 구현   
----------------
#### skill: Java, jsp, JavaScript, Ajax, servlet, Html, css, Bootstrap, Oracle, MVC, GitHub   
------------------
>역할 상세 설명   
- **상품 상세**: 선택한 상품에 맞는 정보를 db에서 불러온다. 해당 제품의 색상 종류를 선택할 수 있고 색상을 선택하게 되면 ajax를 통해 해당 색상에 대해 존재하는 사이즈를 select box에 표시되게 한다. 사이즈까지 선택하게 되면 해당 색상과 사이즈의 상품이 아래에 추가되면서 색상과 사이즈 select box는 초기화된다. 추가된 상품목록은 수량을 변동할 수 있고 삭제가 가능하다. 수량을 변경하게 되면 가격과 적립금이 함께 변동되게 된다. 추가된 상품들의 총 금액과 개수가 표시되며 바로 구매 페이지/카트에 추가가 가능하다.   
- **장바구니**: 제일 상위에는 회원의 정보와 보유 적립금이 표시된다. 중앙 부분에는 장바구니에 담겨있는 상품 내역이 표시되며 각 상품별로 수량 변경, 체크박스 선택을 통한 삭제가 가능하다. 수량변경의 경우 적립금과 금액이 ajax를 통해 실시간으로 변동된다. 장바구니 비우기 버튼을 누르면 장바구니의 모든 제품들이 삭제된다. 상품 주문 버튼을 통해 구매 페이지로 이동 가능하다.   
- **구매 페이지**: 장바구니 페이지와 동일하게 상위에는 회원의 정보와 보유 적립금이 표시된다. 중앙부에는 구매할 상품과 총 가격이 나타난다. 하단부에는 주문자 정보를 기입하는 공간이 있고 배송정보를 기입하는 공간이 있다. 배송 정보 기입 칸은 라디오 버튼(등록한 정보/새로운 배송지/주문자 정보와 동일)을 통해 배송지를 선택할 수 있다. 등록한 정보를 선택할 경우 마이페이지에서 등록한 주소지 정보가 기입되며 수정할 수 없다. 주문자 정보를 선택할 경우 위에서 기입한 주문자 정보와 동일한 정보가 기입된다. 하단에는 결제 예정금액과 적립금을 사용할 수 있는 칸이 존재한다. 적립금을 기입할 경우 총 결제예정금액이 실시간으로 변경된다. 모두 입력하였다면 결제하기 버튼을 통해 결제를 진행할 수 있다.   
- **FaQ**: Bootstrap 아코디언을 통해 구현했다. 질문을 클릭하면 질문에 해당하는 내용이 숨겨지고 다시 클릭하면 보인다.   
- **Notice**: 공지 테이블이 중앙에 위치되어 있다. 하단부에 페이징 처리가 되어있고 제목/내용을 통한 검색이 가능하다.   
- **Qna**: QnA 테이블이 중앙에 위치되어 있다. 비밀글의 경우 자물쇠 이미지가 제목에 표시되며 답변은 [re] 표식으로 질문 글 밑에 표시된다. 하단부에 페이징 처리가 되어있으며 제목/내용/작성자를 통한 검색이 가능하다.
