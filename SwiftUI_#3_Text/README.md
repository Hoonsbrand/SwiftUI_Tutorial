#  정대리 SwfitUI #3 Text


<img width="401" alt="image" src="https://user-images.githubusercontent.com/63503972/226114306-0135c382-3e6d-4b4f-b0c0-109e5a0a51da.png">
<br> 
<br>
<br>


```swift
import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
//        formatter.dateStyle = .long
        return formatter
    }()
    
    private var today = Date()
    
    private var trueOrFalse: Bool = false
    
    private var number: Int = 123
    
    var body: some View {
        
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
                .tracking(2) // 글자 사이의 간격
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium) // font의 두께
                .multilineTextAlignment(.center) // 글자 정렬
                .lineLimit(nil) // SwiftUI에서는 nil로 해야 multiLine이 적용된다.
                .lineSpacing(10) // 행간의 간격
                .truncationMode(.middle) // 글자가 View의 크기보다 길때 잘리는 위치
                .shadow(color: Color.red, radius: 1.5, x: -10, y: 10) // radius는 범위라고 생각하면된다. 숫자가 커질수록 그림자의 범위가 커져서 흐려지게 보인다.
                
                .padding(20)
                .background(Color.yellow)
                .cornerRadius(10)
            
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .padding()
            
            Text("안녕하세요!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            
            Text("오늘의 날짜입니다. : \(today, formatter: ContentView.dateFormat)")
                .padding(.top)
            
            Text("참 혹은 거짓: \(String(trueOrFalse))")
                .padding(.top)
            
            Text("숫자입니다: \(number)")
                .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

## ✏️ UILabel과 Text?
**UILabel**
* 단순히 문자열을 화면에 표현해준다.

**Text**
* 단순히 표현만 하는게 아니라 Button, Toggle, Picker 등에서 텍스트를 적용할 때 사용하며 UILabel보다 더 광범위하다.
    - 예를들어, Button을 구현하는데 있어서 Text를 버튼의 구현체로 사용할 수 있다. 
    

<br>
<br>
<br>

## ✏️ 사용한 수식어
- **tracking**
    - 텍스트 사이의 간격을 설정할 수 있다.
        - 값이 커질수록 텍스트 사이의 간격이 커진다. ex) Lorem -> L o r e m
        
- **font**
    - 텍스트의 폰트를 설정할 수 있다. 
    
- **fontWeight**
    - 폰트의 두께를 설정할 수 있다.
    
- **multilineTextAlignment**
    - 텍스트의 정렬을 설정할 수 있다.
    
- **lineLimit**
    - 텍스트의 행의 수를 제어할 수 있다.
        - UIKit에서는 0으로 설정하는것이 SwiftUI에서는 nil로 설정하는 것과 같다.
        
- **lineSpacing**
    - 행간의 간격을 설정할 수 있다. 
        - tracking과 마찬가지로 값이 커질수록 간격이 커진다.
        
- **truncationModetruncationMode**
    - 텍스트의 길이가 View의 크기보다 길때 잘리는 위치를 설정할 수 있으며, head, middle, tail의 옵션이 있다.
    - **head**
        <img width="301" alt="image" src="https://user-images.githubusercontent.com/63503972/226116018-e70a1152-5ca4-4647-a743-b41d694a2359.png">
    
    - **middle**
        <img width="311" alt="image" src="https://user-images.githubusercontent.com/63503972/226116133-ecd45721-3cb6-4771-b981-be3cf70be676.png">
        
    - **tail**
        <img width="303" alt="image" src="https://user-images.githubusercontent.com/63503972/226116153-5602d96b-e40b-49b5-a4bb-eb7fdf25a07e.png">
    
- **shadow**
    - shadow는 텍스트의 그림자를 설정할 수 있다.
        - color는 그림자의 색을 지정한다.
        - x, y를 통해 그림자의 위치를 설정할 수 있다.
        - radius는 범위라고 생각하면 된다. 값이 커질수록 그림자의 범위가 커져서 흐려지게 보인다.
            - **radius = 1.5**
                <img width="317" alt="image" src="https://user-images.githubusercontent.com/63503972/226116499-3c748933-f309-4612-b380-d354498aca25.png">
            - **radius = 3**
                <img width="315" alt="image" src="https://user-images.githubusercontent.com/63503972/226116551-3302daa1-48dc-43fb-9043-21b90c2f6397.png">

<br>
<br>
<br>


## ✏️ 수식어 적용시 주의점
> 수식어는 그 자체 수식어와 뷰 프로토콜이 가진 수식어로 나뉜다. <br> bold, foreground, italic 등의 return 타입이 Text인 반면, trancationMode, lineLimit 등의 return 타입은 some View로 서로 다른 것을 알 수 있다. <br> 즉, 이 말은 적용하는 순서가 중요하다고 말해준다.

개발자가 의도하지 않은 결과로는 두가지가 나온다고 생각한다.
첫번째는 컴파일 에러가 나는것과, 두번째로는 에러는 나지 않더라도 원하는 UI가 구성되지 않는 것이다.

### 1. 컴파일 에러
```swift
//문제 없음
Text("타입 테스트")
    .font(.title) // return Text
    .bold() // return Text
    .padding() // return View
 
 // 문제 없음
 Text("타입 테스트2")
    .bold() // return Text
    .lineLimts(1) // return View
    .font(.title) // return View - font란 호출자에 따라 반환타입이 다르므로 컴파일 에러 발생하지 않는다.

//컴파일 에러
Text("타입 테스트3")
    .padding() // return View
    .bold() // return Text - 컴파일 에러 발생 Some view타입에는 bold수식어가 없으므로 컴파일 에러가 발생한다.
    
//컴파일 에러
Text("타입 테스트 4")
    .padding()    // return View
    .font(.large) // return View
    .bold // return Text - 앞 문제와 같이 some View타입에는 bold수식어가 없기 때문에 컴파일 에러가 발생한다.
```
<br>
<br>

### 2. 의도치않은 UI구성
> 이번 프로젝트를 통한 예시와 블로그에서 좋은 예시가 있어 총 두개의 예시를 통해 이해해보자.

### 2-1. 첫 번째 예시

- 원했던 결과
    <img width="376" alt="image" src="https://user-images.githubusercontent.com/63503972/226117333-734f1ac5-9532-4169-89fe-2115257a7bf2.png">
<br>
<br>

- 실제 모습
    <img width="374" alt="image" src="https://user-images.githubusercontent.com/63503972/226117453-6c68a366-9250-404f-84cf-92c0204ee7d4.png">    
<br>
<br>

- 문제의 코드
```swift
.padding(20)
.cornerRadius(10)
.background(Color.yellow)
```
바깥의 초록색 View처럼 cornerRadius를 사용하여 코너부분을 부드럽게 만들고싶었으나, 코드를 잘 보면 cornerRadius를 padding에 준것을 볼 수 있다.
실제로 padding에 색깔을 적용시켜 확인시켜보면,
<br>
<br>

```swift
.padding(20)
.background(Color.red)
.cornerRadius(10)
.background(Color.yellow)
```
<img width="376" alt="image" src="https://user-images.githubusercontent.com/63503972/226117941-22b2d16a-831d-483f-84e3-26ea5f3fa549.png">
이런식으로 노란색 background에 적용된것이 아닌 padding에 적용된 모습을 확인할 수 있다.
이 문제는 간단하게 cornerRadius를 노란색 background 다음에 적용시키면 해결이 가능하다.
<br>
<br>

- 해결한 코드
```swift
.padding(20)
.cornerRadius(10)
.background(Color.yellow)
```
<img width="374" alt="image" src="https://user-images.githubusercontent.com/63503972/226118470-0ba16132-96d2-46da-acac-e24e29793972.png">
<br>
<br>
<br>

### 2-2. 두 번째 예시
```swift
//1번
Text("😍😒☺️😊😘").font(.largeTitle)
        .border(Color.red, width: 3)
        .background(Color.blue)
        .padding()

//2번
Text("😍😒☺️😊😘").font(.largeTitle)
        .border(Color.red, width: 3)
        .padding()
        .background(Color.blue)
```
첫 번째는 background를 먼저 적용하고 padding을 준 반면 두 번째는 padding을 먼저 주고 background를 적용했다.
<img width="751" alt="image" src="https://user-images.githubusercontent.com/63503972/226118640-57116c5b-59b4-46d4-bb4e-f9970c9b7242.png">
<br>
<br>

단지 적용하는 순서만 변경해주었는데 배경색의 범위가 달라진 것을 확인할 수 있다.
<br>

[1번]
1. 텍스트를 생성
2. 텍스트의 테두리를 빨간색, 5 굵기로 추가
3. 텍스트와 크기가 동일한 파란색 배경 추가
4. padding을 통해 뷰에 여백 추가
<br>

[2번]
1. 텍스트를 생성
2. 텍스트의 테두리를 빨간색, 5굵기로 추가
3. padding을 통해 뷰에 여백 추가
4. padding이 적용된 뷰의 크기와 동일한 배경 추가

<br>
<br>
<br>

이렇게 수식어 적용 순서에 따라 적용되는 범위도 달라진다.
Text를 사용할 때 수식어의 순서를 잘 고려해 적용해야겠다.


