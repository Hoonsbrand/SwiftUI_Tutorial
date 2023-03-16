#  정대리 SwfitUI #1


## ✏️SwiftUI
* WWDC 2019에서 발표한 프레임워크
* 선언형
    - 내가 무엇을 원하는지 UI구성을 전달하면 **SwiftUI 프레임워크**가 알아서 처리를 해준다.
    - .font, .background와 같은 수식어를 통해 뷰를 변경하는게 아니라 새로운 타입의 뷰를 반환한다.
* preview
    - 시뮬레이터로 결과를 보는게 아니라 캔버스 영역의 **preview**를 통해 결과물을 실시간으로 확인할 수 있어 편리하다.
<br>
<br>

## ✏️SwiftUI의 4가지 원칙
1. 선언형
* 위에서 언급한 것처럼 **SwiftUI 프레임워크**는 선언형으로 구현이 되어있다.   

2. 자동화
* **SwiftUI 프레임워크**가 자동으로 해결을 해주고 있어 따로 명령형과 다르게 일일이 설정을 안해주어도 된다.
    - 특히 레이아웃 부분에서 큰 차이점을 느꼈다.

3. 조합
* 큰 뷰를 하나의 기능을 가진 작은 뷰들로 자르거나 각각의 뷰를 조합해서 원하는 뷰를 쉽게 만들 수 있도록 지원한다.

4. 데이터 업데이트, 최신화
* 그동안 UIKit으로 작업할 때는 데이터가 변경될 때 UI도 따로 적용을 해주어야했는데, 그만큼 코드가 더 필요했고 잘못 입력했을 때는 에러, 버그가 발생했다.
    - 반면 SwiftUI는 데이터가 변경되면 즉시 UI도 자동으로 갱신을 해준다고 한다. 물론 자동으로 그냥 되는것은 아니고 뷰의 특정한 상태를 저장할 State 모델 객체의 변화를 관찰하는 
**ObservableObject**같은 데이터의 변화를 반영해 뷰에 반영을 해준다고 한다.
* 이렇게 실시간으로 업데이트를 해주므로 따로 동기화를 해줘야 하는 번거로움이 줄어들었다. 그러므로 에러와 버그가 발생할 확률도 줄어든다.
<br>
<br>

## ✏️Padding
* 요소들간의 간격을 줄 때 사용
* 기본값은 .all
    - 모든 방향에 padding을 준다.
<br>
<br>

## ✏️ContentView 코드 간소화
* MyVStackView라는 View를 따로 만들어 ContentView에서 호출
    - 최종적으로 모든 View들을 관리하는 ContentView를 보다 간략하게 유지할 수 있다.
<br>
<br>

## ✏️@State
UIKit 을 사용했을 때는 어떠한 변수에 변화가 생기면 해당 변화를 직접 관찰하고 반영 해 주어야 했는데 SwiftUI 에서는 property wrapper 를 활용해 이러한 작업을 자동화 할 수 있도록 했다.
* 변화가 생기면 해당 변수의 값을 읽거나 새로 쓸 수 있음을 의미하는 property wrapper
* SwiftUI 는 state 로 선언된 property 들의 저장소를 관리
* State value 값이 변경되면 뷰는 해당 value 의 appearance 를 무효화 하고 다시 body 값을 계산
* state 변수값이 변경되면 view 를 다시 랜더링 하기 때문에 항상 최신 값을 가짐
* State 인스턴스는 그 자체로 값이 아닌, 값을 읽고 쓰는 것을 의미함
* 현재 뷰 UI의 특정 상태를 저장하기 귀해 만들어진 것이기 때문에 보통 private
* @State 속성으로 어떤 프로퍼티의 초기값을 지정했다면, 다른 값으로 재할당 불가, @Binding 변수를 통해서만 가능

```swift
    private var isActivated: Bool = false
    
    var body: some View {
       // ...
        .onTapGesture {
            print("HStack이 클릭되었다.")
            // toggle() true이면 false로 false이면 true
            self.isActivated.toggle()
        }
```

이 코드를 실행시키면 "Cannot use mutating member on immutable value: 'self' is immutable"라는 에러가 발생한다.

SwiftUI에서는 상태를 변경하는 변수를 사용하기 위해서 **@State** 어노테이션을 사용해야한다.

```swift
    @State
    private var isActivated: Bool = false
```

**isActivated**가 값이 변화가 되면 알아서 렌더링을 다시 해준다.

![1](https://user-images.githubusercontent.com/63503972/224468947-f927174e-fdf5-4683-ac51-8abf8c0c7e07.gif)

```swift
    // @State 값의 변화를 감지 -> View에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
            VStack {
                HStack {
                    MyVStackView()
                    MyVStackView()
                    MyVStackView()
                }   // HStack
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스쳐 추가
                .onTapGesture {
                    print("HStack이 클릭되었다.")
                    
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true이면 false로 false이면 true
                        self.isActivated.toggle()
                    }
                }
```
HStack(가로)을 이용해 간단히 가로로 3개의 스택을 만들어주었다.   
그 후 클릭할때마다 isActivated가 toggle이 되는데, 클릭은 onTapGesture를 사용하며 UIKit과 비슷하지만 조금 더 간단하다고 느꼈다.
제스처를 통해 클릭을 하면 isActivated가 toggle이 되며 View는 이를 감지해 padding을 50 또는 10으로 변경한다.
부드러운 애니메이션을 위해 withAnimation이라는 메서드를 제스처부분에 추가해주었다.
UIView의 animate와 같은 기능을 하는 것 같다.
<br>
<br>

## ✏️NavigationView
![2](https://user-images.githubusercontent.com/63503972/224469741-52f1c825-f700-445e-af2d-8283419b329f.gif)

```swift
        NavigationView {
            VStack {
                HStack {
                    // ...
                }   // HStack
                
                // 네비게이션 버튼(링크)
                // destination 자체가 종착지 (view를 뜻한다)
                NavigationLink(destination: MyTextView()) {
                    Text("네비게이션")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
                .padding(.top, 50)
            }
        } // NavigationView 
```

이번 SwiftUI를 배우면서 감명받았던 부분중에 하나다.   
이 짧은 코드가 내비게이션을 구성한다.
물론 UIKit을 사용할때(코드로), 코드가 그렇게 긴 편은 아니지만 Scene Delegate에서 내비게이션 설정을 해주어야 하는 등의 부가적인 세팅을 해줬어야 했는데, SwiftUI에서는 NavigationView를 최상단 View로 두고 
NavigationLink를 통해 이동할 View와 내비게이션 버튼을 세팅해줄 수 있다.
<br>
<br>

## ✏️Spacer
<img width="332" alt="image" src="https://user-images.githubusercontent.com/63503972/224488729-8bb2ccdd-64bb-49d8-9452-92d4067c2b7f.png">

```swift
        VStack {
            Spacer()
            
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)

            Spacer()
        }
```

Spacer는 View간의 간격을 띄우고 싶을 때 사용한다.
현재 코드에서는 위 아래 Spacer 두개, 중간에 Text가 들어가는데 공간이 총 3개로 나누어져있어 Text가 가운데로 온다.
그렇다면 만약 Spacer가 위아래 하나만 있게 된다면?

<img width="321" alt="image" src="https://user-images.githubusercontent.com/63503972/224488859-6b9be7cd-a830-4d61-9080-de2923dba8e7.png">

Spacer를 위에만 준 모습이다.
<br>
<br>

## ✏️Binding
@State 로 선언된 속성을 다른 뷰에서 사용하려 한다면 @Binding 을 사용해 줄 수 있다. 사용시에는 앞에 $를 사용해 Bining 변수임을 나타낸다. @State 로 선언된 속성에 변경이 생기면 @Binding 변수에서 이를 인지하고 해당 값에 따른 뷰 변화를 바로 반영할 수 있도록 하는 방식이다.

* 다른 뷰에서 @State 속성으로 선언된 프로퍼티를 사용한다면 @Binding 속성을 사용
* 사용시에는 $를 앞에 붙여 binding 변수임을 나타냄
* 외부에서 접근해야 하기 때문에 private X

![4](https://user-images.githubusercontent.com/63503972/225241584-26c3ed83-520f-4fcf-9e8c-fce42c5ccb61.gif)

기존 화면과 다르게 터치를 했을 때 MyStackView의 Color와 padding이 변하는 것을 볼 수 있다.

```swift
struct MyVStackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 60))
        }   // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

```
자식뷰인 MyStackView에 isActivated라는 Binding 변수를 만들어준다.
생성자를 통해 isActivated 변수에 값을 할당하며 기본값은 false로 설정하였다.
그 후 isActivated의 상태에 따라 색깔과 padding이 변화한다.

```swift
struct ContentView: View {
    
    // @State 값의 변화를 감지 -> View에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스쳐 추가
                .onTapGesture {
                    print("HStack이 클릭되었다.")
                    
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true이면 false로 false이면 true
                        self.isActivated.toggle()
                    }
                } 
                // ...
            }
            // ...
        }
        // ...
    }
    // ...
}
```
ContentView에서 MyStackView를 생성자를 통해 생성한다.
위에서 언급한것처럼 onTapGesture를 통해 이벤트가 발생하면 isActivated의 상태가 바뀌는데 생성자를 통해 '$'을 붙인 상태 프로퍼티를 넘겨주면 바인딩 프로퍼티와 연결할 수 있다.
그렇다면 MyStackView에 새로운 값이 바인딩이 되고 그에 따라 UI가 바뀐다.


![5](https://user-images.githubusercontent.com/63503972/225249623-b24dcbb2-fa06-42f9-a05f-74e4692c3db8.gif)
```swift
struct MyTextView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    // ...
    
    var body: some View {
        VStack {
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray)
                .background(Color.black)
        }
    // ...
}
```
MyTextView에도 동일하게 바인딩 프로퍼티와 생성자를 만들어주고 상태에 따른 UI처리를 해준다.


```swift
// ContentView
NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
    // ...
}
```

다시 ContentView로 넘어가서 MyTextView를 연결하는 NavigationLink에서 생성자를 호출해 $isActivated를 넘겨주어 상태에 따라 Text가 변화하는 모습을 볼 수 있다.

