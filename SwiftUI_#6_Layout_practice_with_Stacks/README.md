#  정대리 SwfitUI #6 Layout practice with Stacks

> 지금까지 배운 내용들을 사용하여 레이아웃 연습을 한다.
    스택으로 시작해 스택으로 끝난다는 느낌을 많이 받았으며, SwiftUI에서 스택의 중요성을 알게되었다.
<br>
<br>
<br>
    
# ✏️ MyProjectCard

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226951521-4e971dc4-2302-4327-bb5e-5bdaaa31a156.png">

```swift
VStack(alignment: .leading, spacing: 0) {
    
    Text("정대리 SwiftUI 수강하기")
        .font(.system(size: 23))
        .fontWeight(.black)
        .padding(.bottom, 5)
        
    Text("10 AM - 11 AM")
        .foregroundColor(.secondary)
    
    Spacer().frame(height: 20)
    
    HStack {
        Image("1")
            .resizable() // frame에 맞게끔 이미지 크기 조절
            .frame(width: 50, height: 50)
            .clipShape(Circle()) // 이미지를 자르는데 어떤 모양으로 자를것인가
            .overlay(            // Circle.stroke를 overlay해 테두리 만들기
                Circle()
                    .stroke(lineWidth: 5)
                    .foregroundColor(.blue)
            )
        
        Image("2")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        
        Image("3")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
        
        Spacer()
        
        Text("확인")
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(width: 80)
            .background(Color.blue)
            .cornerRadius(20)
            
    }
}
.padding(30)
.background(Color.yellow)
.cornerRadius(20)
```
<br>

**VStack**
- 모든 요소들의 최상위 Stack
- **alignment** -> leading으로 왼쪽 정렬, **spacing** -> 0으로 요소간 간격이 최소로 설정되어있다.
- VStack안에는 두개의 Text와 한개의 HStack으로 구성되어있다.
- height값을 20으로 설정한 Spacer를 통해 하단 HStack과의 간격을 설정
<br>

**HStack**
- 세개의 Image, 1개의 Text로 구성되어있다.
<br>

- **Image**
    - 인스타그램, 페이스북, 카카오톡등의 유명한 소셜미디어의 프로필과 같이 만들었다.
    - **resizable**: 통해 원본 이미지의 크기가 아닌 따로 설정한 크기를 사용한다.
    - **clipShape(Circle())**: 이미지를 자를건데 -> **clipShape**, 어떤 모양으로 자를건지? -> **Circle()**
    - **overlay**: 첫번째 이미지에는 Circle의 stroke를 사용해 테두리 처리를 해주었다.
<br>
<br>
<br>

# ✏️ MyBasicCard

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226956448-2bdffeed-9444-4877-ac27-cda408558995.png">

```swift
HStack(spacing: 20) {
    
    Image(systemName: "flag.fill")
        .font(.system(size: 40))
        .foregroundColor(.white)
    
    VStack(alignment: .leading, spacing: 0) {

        // Divider().opacity(0)
        // Rectangle().frame(height: 0)
        
        Text("하하하")
            .fontWeight(.bold)
            .font(.system(size: 23))
            .foregroundColor(Color.white)
        
        Spacer().frame(height: 5)
        
        Text("하하하")
            .foregroundColor(Color.white)
    }
    
    Spacer()
    
}
.padding(20)
.background(Color.purple)
.cornerRadius(20)
```

**HStack**
- 모든 요소들의 최상위 Stack
- 한개의 Image와 한개의 VStack으로 이루어져있다.
<br>

**VStack**
- **alignment** -> leading으로 왼쪽 정렬, **spacing** -> 0으로 요소간 간격이 최소로 설정되어있다.
- 두개의 Text가 있으며 Spacer를 통해 텍스트간 세로 간격을 설정하였다.
<br>

**HStack을 View 양끝으로 확장한 방법**
- HStack안에 VStack만이 존재하는 것이 아닌, VStack 이후 Spacer가 존재한다.
    - 이를통해 View를 가로방향으로 가능한 최대로 확장하였다.
- Spacer를 사용하지 않고도 VStack 내부에 주석처리 되어있는 Divider나 Rectangle같은 투명한 View를 width 제한 없이 frame을 설정하면 같은 결과가 나온다.
<br>
<br>
<br>

# ✏️ ContentView

![31](https://user-images.githubusercontent.com/63503972/226964582-04af01b3-84fe-42f9-a4ea-c418f1f6dc0d.gif)
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226960615-c0cca914-b0b4-4da1-8d38-807a22c33f2d.png">

```swift
ZStack(alignment: .bottomTrailing) {
    
    VStack(alignment: .leading, spacing: 0) {
        
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.largeTitle)
            Spacer()
            Image(systemName: "person.crop.circle.fill")
                .font(.largeTitle)
        }
        .padding(20)
        
        Text("이창훈 할일 목록")
            .font(.system(size: 40))
            .fontWeight(.black)
            .padding(.horizontal, 20)
        
        ScrollView {
            VStack {
                MyProjectCard()
                MyBasicCard()
                MyBasicCard()
                MyBasicCard()
                MyBasicCard()
                MyBasicCard()
                MyBasicCard()
                MyBasicCard()
            }
            .padding()
        }
    }
    
    // 추가 버튼
    Circle()
        .foregroundColor(.yellow)
        .frame(width: 60, height: 60)
        .overlay(
            Image(systemName: "plus")
                .font(.system(size: 30))
                .foregroundColor(.white)
        )
        .padding(10)
        .shadow(radius: 20)
    
}
```
<br>

**ZStack**
- 모든 요소들의 최상위 Stack
- **alignment** -> **bottomTrailing**으로 설정하여 추가 버튼을 오른쪽 하단으로 배치했다.
- ZStack의 존재 이유는 오른쪽 하단에 보이는 추가(+) 버튼을 가장 위로 띄우기 위함이다.
- 한개의 VStack과 Circle(추가버튼)으로 구성되어있다.
<br>

**VStack**
- **alignment** -> leading으로 왼쪽 정렬, **spacing** -> 0으로 요소간 간격이 최소로 설정되어있다.
- 한개의 HStack과 Text 그리고 ScrollView로 이루어져있다.
<br>

**HStack**
- 두개의 Image 사이에 Spacer가 있는 형태로 구성되어있다.
- Spacer를 중간에 배치함으로써 두개의 Image가 View 양옆으로 이동되었다.
- padding을 주어 하단의 Text와 간격을 두었다.
<br>

**ScrollView & VStack**
- 위 gif를 보면 알 수 있듯이 **"이창훈 할일 목록"** Text까지는 스크롤을 해도 항상 존재한다.
    - 이것이 **MyProjectCard**와 다수의 **MyBasicCard**가 들어있는 VStack에만 ScrollView가 적용된 이유다.
<br>

- 앞서 정리한 **MyProjectCard**와 **MyBasicCard**를 보면 View 양옆으로 Stack이 확장되어 있는 모습이지만,
    이를 각 View에서 직접 padding을 따로 주지 않고, VStack에 padding을 주어 한번만 padding을 준 모습이다.
