## ✏️ 1. @State와 @Binding


![](https://velog.velcdn.com/images%2Fnnnyeong%2Fpost%2F7331afe2-a106-42c0-9503-24fad538fed0%2Fimage.png)
<br>

UIKit을 통해 개발을 할때는 어떤 변수에 변화가 생기면 해당 변화를 직접 관촬하고 새로운 UI를 위해 반영을 해주었어야 했는데 SwiftUI에서는 **property wrapper**를 활용해 이러한 작업을 자동화 할 수 있도록 하였다.
<br>

- **property wrapper**: 변화가 생기면 해당 변수의 값을 읽거나 새로 쓸 수 있음을 의미
- SwiftUI는 @State로 선언된 property들의 저장소를 관리한다.
- **State value**값이 변경되면 View는 해당 value의 appearance를 무효화하고 다시 body 값을 계산한다.
- **@State** 변수값이 변경되면 View를 다시 렌더링 하기 때문에 항상 최신값을 가진다.
- **@State** 인스턴스는 그 자체로 값이 아닌, 값을 읽고 쓰는 것을 의미한다.
- 현재 View UI의 특정 상태를 저장하기 위해 만들어진 것이기 때문에 보통 private으로 선언한다.
- **@State** 속성으로 어떤 프로퍼티의 초기값을 지정했다면, 다른 값으로 재할당이 불가하나 **@Binding** 변수를 통해서만 가능하다.
<br>
<br>
<br>


![](https://velog.velcdn.com/images%2Fnnnyeong%2Fpost%2Ffec00a62-2459-4dc5-8297-3245c19de0fd%2Fimage.png)
<br>

**@State**로 선언된 속성을 다른 View에서 사용하려 한다면 **@Binding**을 사용해 줄 수 있다.
사용시에는 앞에 **$**를 사용해 Bining 변수임을 나타낸다. <br>
**@State**로 선언된 속성에 변경이 생기면 **@Binding** 변수에서 이를 인지하고 해당 값에 따른 View 변화를 바로 반영할 수 있도록 하는 방식이다.
<br>

- 다른 View에서 **@State** 속성으로 선언된 프로퍼티를 사용한다면 **@Binding** 속성을 사용
- 사용시에는 **$**를 앞에 붙여 **binding** 변수임을 나타냄
- 외부에서 접근해야 하기 때문에 private으로 **선언하지 않는다.** 
<br>
<br>
<br>

# ✏️ 2. 예시로 알아보기

![77](https://user-images.githubusercontent.com/63503972/227443563-2e8854f4-1cda-4c2a-b14f-142132e2974a.gif)
<br>

> **add** 버튼을 통해 숫자를 증가시키고, **Move to Check** 버튼을 통해 sheet을 열어 해당 변화가 적용되는지 확인할 수 있다.
<br>
<br>
<br>

# 2-1. ContentView

```swift
struct ContentView: View {
    
    @State var isPresenting = false
    @State private var number: Int = 177
    
    var body: some View {
        
        VStack {
            Text("Number is \(number)")
                .fontWeight(.semibold)
                .font(.system(size: 30))
                .padding(.bottom, 20)
            
            Button(action: {
                self.number += 1
            }) {
                Text("Add")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(10)
            }
            .background(Color.green)
            .cornerRadius(20)
            .padding(50)
            
            Button(action: {
                self.isPresenting = true
            }) {
                Text("Move to Check")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(20)
            .padding(50)
            .sheet(isPresented: $isPresenting) {
                DetailView(number: $number)
            }
            
        }
    }
}
```
<br>
<br>
<br>

# 2-2. DetailView

```swift
struct DetailView: View {
    
    @Binding var number: Int
    
    init(number: Binding<Int> = .constant(7)) {
        _number = number
    }
    
    var body: some View {
        Text("Number : \(number)")
    }
}
```
<br>
<br>
<br>

**@State**로 선언한 속성 number의 값이 변하면 해당 변화가 DetailView에서 **@Binding**되어 자연스럽게 View에 반영된다!



