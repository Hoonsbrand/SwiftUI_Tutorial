#  정대리 SwfitUI #6-2 Layout practice with Stacks

> #6-1에 이어서 List라는 것을 구현해보았고, Navigation에 대해 더 알아보았다.
<br>
<br>
<br>
    
# ✏️ List

> **List**란 단일 열에 정렬 된 데이터 행을 표시하는 컨테이너이다.
    UIKit에서 자주 사용한 TableView, CollectionView가 SwiftUI에선 List를 사용해 대체된다.
    **List**의 생성자에 원하는 뷰를 전달하면 각 row에 담아 표현한다. UIKLit에서 Cell이라 불리는 것이 SwiftUI에선 row라고 표현한다.
<br>
<br>
<br>

<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/228208158-361fb457-c49a-4af0-a856-a1b56c8305b5.png"><br>

```swift
List {
    Section {
        Text("마이 리스트")
        Image(systemName: "person.fill")
    }
    
    Section {
        ForEach(1..<5) {
            Text("마이리스트 \($0)")
        }
    }
    
    Section {
        ForEach(["하나", "둘", "셋"], id: \String.self) {
            Text("마이리스트 \($0)")
        }
    }
}
```
**첫번째 Section**
- 정적 컨텐츠
    - 하나씩 직접 뷰를 전달하여 표현한다.
<br>

**두번째 Section**
- 동적 컨텐츠, **Range\*<Int>\***
    - 동적 컨텐츠를 표현하는 두가지 방법 중 하나, Range\*<Int>\*타입의 값을 넘겨준다.
<br.

**세번째 Section**
- 동적 컨텐츠, **RandomAccessCollection**
    - 동적 컨텐츠를 표현하는 두번째 방법으로 **RandomAccessCollection** 프로토콜을 준수하는 데이터를 제공하는 것이다. 데이터의 각 요소들을 구분하고 식별할 수 있도록 위 코드처럼 Id를 직접 전달하거나 데이터 타입 자체에 identifiable 프로토콜을 채택한다.
- 타입추론이 가능해서 **\.self**로도 작성이 가능하다.
<br>
<br>
<br>



# ✏️ MyList

![4765](https://user-images.githubusercontent.com/63503972/228263821-37480644-1800-4969-aced-5c3f76946486.gif)

<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/228264087-115c732d-7071-4438-8216-d896bbce5d27.png">
<br>

```swift
List {

    // MARK: - 오늘 할 일
    Section {
        ForEach(["a", "b", "c"], id: \.self) { itemIndex in
            MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.green)
        }
    } header: {
        Text("오늘 할 일")
            .font(.headline)
            .foregroundColor(.black)
    } footer: {
        Text("footer")
    }
    // 간격 설정
    .listRowInsets(.init(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 10)))

    // MARK: - 내일 할 일
    Section {
        ForEach(1...10, id: \.self) { itemIndex in
            MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue)
            // 구분선 숨기기
            .listRowSeparator(.hidden)
        }
    } header: {
        Text("내일 할 일")
            .font(.headline)
            .foregroundColor(.black)
    } footer: {
        Text("footer")
    }
    .listRowInsets(.init(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)))
    .listRowBackground(Color.yellow)

}
// List 스타일 설정
.listStyle(.grouped)

// Navigation title 설정
.navigationTitle("내 목록")
.navigationBarTitleDisplayMode(.large)
```
<br>

**header, footer**
- header와 footer를 적용시키기 위해선 List 내부에 Section을 적용시켜야 한다.
<br>

**listRowInsets**
- list에는 기본적으로 padding이 들어가있는데, 이 여백을 직접 설정하고 싶으면 **listRowInsets**을 사용하면된다.
- 첫번째 Section과 두번째 Section이 다른 형태로 보이는 이유는 첫번째 Section의 leading Insets을 80으로 주었기 때문이다.
<br>

**listStyle**
- 리스트 밖에서 적용시킬 수 있다.
<br>

**ListStyle 종류**
- **DefaultListStyle()**  - 기본 리스트 스타일
- **GroupedListStyle()** - 각 섹션을 분리된 그룹으로 묶어 표현하는 스타일
- **InsetGroupedListStyle()**
- **PlainListStyle()** - 데이터 목록을 각 행마다 하나씩 나열하는 형태의 기본 스타일
- **InsetListStyle()**
- **SidebarListStyle()**
<br>

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FxcFlk%2FbtqZGlxuOPD%2F8SsmPQXVakCGTNTvcYp9zK%2Fimg.png)

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fx7jQ7%2FbtqZBdmYhhD%2FK45LcHgm55L96rEG6w3FU1%2Fimg.png)
<br>
<br>
<br>

# ✏️ MyProfileView
<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/228267648-197bdee1-d4ce-4f4f-8d32-22679c9dc0b3.png">

```swift
ScrollView {
    
    VStack {
        Image("profileImage")
            .resizable()
            .scaledToFit()
            .offset(y: 25)
            .frame(width: 250, height: 300)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
        
            .overlay(
                Circle()
                    .strokeBorder(Color.yellow, lineWidth: 15)
            )
        
        Text("꿈꾸는 이창훈")
            .font(.system(size: 30))
            .fontWeight(.black)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
        
        Text("SwiftUI는 재밌어!")
            .font(.system(size: 20))
            .fontWeight(.black)
        
        HStack {
            
            NavigationLink(destination: MyWebView(urlToLoad: portfolioUrl)
                           
            ) {
                Text("포트폴리오 보기")
                    .font(.system(size: 20))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(20)
            }
            
            NavigationLink(destination: MyWebView(urlToLoad: gitHubUrl)
                           
            ) {
                Text("깃허브 보기")
                    .font(.system(size: 20))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
            }
            
        } // HStack
        .padding()
        
    } // VStack
} // ScrollView

.navigationTitle("내 프로필")
.toolbar {
    ToolbarItem(placement: .navigationBarTrailing) {
        NavigationLink(destination: Text("설정화면입니다.")
            .font(.largeTitle)
            .fontWeight(.black)
        ) {
            Image(systemName: "gear")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
    }
}
```

> 앞서 Image 파트에서 배웠던 내용과 같은 UI를 보여주면서 영상을 멈추고 스스로 만들어보라 하였다.
    이미 설명을 해본 View이기 때문에 같은 내용은 기재하지않고 달라진 내용만 정리해보려고한다.
<br>
<br>
<br>

우선 가장 상위 View를 ScrollView로 만들었다. 
그 이유는 단순히 NavigationTitle을 확인하기 위해서이다.
**navigationTitle**을 통해 title을 설정할 수 있고, **toolbar**를 이용해 우리가 흔히 생각하는 NavigationItem들에 대한 설정을 해줄 수 있다.
현재 화면에서 보이지는 않지만, title을 "내 프로필"로 설정하였고, 오른쪽 상단에 item을 넣어주었다.
<br>

> 이제 완성된 contentView를 보자!
<br>
<br>
<br>

# ✏️ ContentView -> MyList

![11](https://user-images.githubusercontent.com/63503972/228272842-78f09a66-2b0b-4d89-852e-5dd33f55cc32.gif)
<br>
<br>
<br>

# ✏️ ContentView -> MyList

![22](https://user-images.githubusercontent.com/63503972/228273848-5e2557c2-2d73-4fe7-ad81-98f680ee7be4.gif)
<br>
<br>
<br>

# ✏️ ContentView
위 두개의 gif를 잘 보면 ContentView에서 다른 View로 이동할때 backButton에 "뒤로가기"라고 되어있는데 이는 ContentView의 navigationTitle을 설정해준 것이다.
<br>

```swift
// 다른 뷰에서 표시되는 backButton을 위한 title 설정
.navigationTitle("뒤로가기")

// 현재 화면에서도 보이기 때문에 hidden
.toolbar(.hidden , for: .navigationBar)
```
현재 화면에서는 toolbar 즉, navigationTitle을 숨긴것을 볼 수 있는데, 만약 숨기지 않는다면
<br>

<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/228275250-f9637a06-52c1-484a-8d6f-0b89f35d1ac6.png">
<br>

이런 모습이 됐기 때문에 숨겨준 것이다.

