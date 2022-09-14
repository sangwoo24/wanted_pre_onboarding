# wanted_pre_onboarding

- Xcode Version: 13.2.1
- 구현기간: 대략 2~3일

<br><br>
### 폴더 구조
- Service: 네트워크, 이미지 캐싱 작업을 도와주는 클래스들로 구성
- Extension: extension 을 위한 파일들로 구성
- Model: 날씨 정보를 각기 다른 화면에 노출하기 위해 Model들을 한곳에 모아놓고 사용
- View: ViewController, Cell 등 직접 view 단과 관련있는 파일들을 모아놓음
- Style: 그 외 Delegate, plist 등과 같은 파일을 모아놓은 폴더
<br><br>


### 대략적인 구현 설명
1. 초기 날씨 ListView 를 로드함과 동시에 날씨 API 를 호출하여 날씨 정보들을 불러옵니다.
2. Network 동작이 일어나는 동안 화면에 Indicator 를 노출시켜 로딩 중 상태를 보여줍니다.
3. API 응답 Json 을 원하는 Model로 치환한 후 TableView 에 노출합니다.
4. 각 Cell 들을 클릭 시 DetailView 로 이동하여 상세 날씨 정보들을 노출시켜줍니다.
5. Detail View 가 닫히고 다시 ListView 로 돌아올 시, 다시 한번 데이터들을 갱신합니다.
6. 이미지 캐싱같은 경우 내부적으로 NSCache 를 생성하였고, 이미지 URL 을 기준으로 캐싱합니다.
<br><br>

### 느낀점
Flutter 개발자로 일하면서 iOS 공부에 투자 할 시간이 적었는데 이번 기회로 작은 프로젝트라도 시도해봐서 재밌었고, 그동안 까먹은 것들이 너무 많아서 다시 iOS를 열심히 공부해야 할 자극제가 되었다.