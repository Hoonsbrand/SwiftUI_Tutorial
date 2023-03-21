#  정대리 SwfitUI #5 Stacks

> 스택은 3가지로 나눌 수 있다. <br> 수직(Vertical)으로 View를 쌓는 VStack, 수평(Horizontal)으로 View를 쌓는 HStack 그리고 동일한 수평과 수직 값을 갖지만 View를 겹쳐서 쌓아 올리는 ZStack이 있다.


# ✏️ VStack

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226590445-177d6d91-33d4-43bc-8365-6fd42d083029.png">

```swift
VStack(alignment: .trailing, spacing: 0) {
                        
    Text("글자")
        .font(.system(size: 30))
        .fontWeight(.heavy)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.red)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.yellow)
    
    Spacer()
        .frame(height: 50)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.blue)
}
.frame(width: 300)
.background(Color.green)
// Spacer 사용시 safeArea를 무시하는 이슈 해결, VStack안에서 Padding을 줄 수도 있음
.padding(.init(top: 1, leading: 1, bottom: 1, trailing: 1))
```

> VStack에 마지막으로 padding을 저런 방식으로 준 이유는 Spacer 사용 시 safeArea를 무시하는 이슈를 해결한 것이다.
    이 방법 말고도 VStack안에서 padding을 줄 수도 있다.
<br>
<br>
<br>

**VStack(alignment)**
- 요소들의 정렬, 가장 큰 요소를 기준으로 정렬된다.
<br>

**VStack(spacing)**
- 요소들 간 간격 조절
<br>

**Spacer**
- View 간의 간격을 띄우고 싶을 때 사용
- 사용 가능한 전체 공간을 띄어버림
    - 존재하는 요소(들)의 크기를 제외하고 남은 여백을 다 띄어버림
    - Spacer를 n개 선언한다면, Spacer가 띄우는 크기가 n등분이 됨
<br>

**alignment를 trailing으로 설정했음에도 완벽히 정렬이 안된것처럼 보이는 이유?**
> 이유는 당연히 가장 큰 View를 기준으로 정렬이 됐기 때문이다. 상위 View의 trailing으로 정렬을 하고 싶다면 요소들 중 하나의 크기를 더 크게 변경하거나 보이지 않는 새로운 View를 추가하면 된다.
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226595313-147a0acf-7bd6-4550-91da-ab929ab0a044.png">

```swift
Divider()
    .opacity(0)

Rectangle()
    .frame(height: 0)
```
<br>

둘 중 하나를 사용하면 된다. 
예시일 뿐이고 다른 방법 또한 존재한다.
<br>
<br>
<br>

# ✏️ HStack

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226595675-72285f92-e67c-4b76-a13b-17efec96dca8.png">

```swift
HStack(alignment: .center) {
    
    Image(systemName: "flame.fill")
        .foregroundColor(.white)
        .font(.system(size: 70))
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.yellow)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.blue)
}
.padding()
.background(Color.green)
```

> 마찬가지로 alignment를 사용해 정렬을 할 수 있다. 
    spacing은 따로 값을 주지 않았기 때문에 기본값으로 간격이 설정되었다.
<br>
<br>
<br>

# ✏️ ZStack

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226597844-dd0da375-c698-4f7b-9fc2-f43b5a6c4308.png">

> 그림에 보이는 View는 하나의 View가 아니라 파란색, 빨간색, 노란색 3개의 View가 겹겹이 쌓여서 보이는 것이다.
    이처럼 구현하는 방법은 두가지가 있다. View가 큰 순서대로 밑에서 깔며 선언하는것과 zIndex를 이용해 순서(층)를 지정해주는 것이다
    
<br>

**순서에 따라 선언**

```swift
ZStack {
    
    Rectangle()
        .frame(width: 150, height: 150)
        .foregroundColor(.blue)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.red)
    
    Rectangle()
        .frame(width: 50, height: 50)
        .foregroundColor(.yellow)
}
```
<br>
<br>
<br>

**zIndex 사용**

```swift
ZStack {
    
    Rectangle()
        .frame(width: 50, height: 50)
        .foregroundColor(.yellow)
        .zIndex(2)
    
    Rectangle()
        .frame(width: 100, height: 100)
        .foregroundColor(.red)
        .zIndex(1)
    
    Rectangle()
        .frame(width: 150, height: 150)
        .foregroundColor(.blue)
}

```

zIndex의 기본값은 0이며 값이 클수록 위의 층에 존재하며, 두 코드 모두 같은 결과를 만든다.



    

