#  정대리 SwfitUI #4 Image


![7](https://user-images.githubusercontent.com/63503972/226151724-f14f101e-a05c-4df4-b53a-3108d1c11d10.gif)
<br> 
<br>
<br>


<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/226151794-26107de7-e042-478d-bb38-ec2432bcc48b.png">

> 가운데 원형의 이미지가 있는 뷰가 CircleImageView이고, 이를 ContentView에서 사용하여 메인화면을 구성했다.

<br>
<br>
<br>

# ✏️ CircleImageView
<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/226151861-6a4c2ee8-1274-4029-97f5-b79f0d358360.png">
<br>

```swift
struct CircleImageView: View {
    var body: some View {
        
        Image("hoonImage") // SwiftUI에서는 파라미터 없이 이미지의 이름만 넣어주면 된다.
            .resizable() // 이미지를 화면의 사이즈에 맞춘다.
            .scaledToFill() // aspectRatio와 동일
            .frame(width: 300, height: 300) // 이미지 크기 조절
            .clipShape(Circle()) // 이미지를 지정한 모양으로 자른다.
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(
                Circle()
                .foregroundColor(.black)
                .opacity(0.5)
            )
            .overlay(            // 뷰를 중첩시킨다.
                Circle()
                .stroke(Color.blue,
                        lineWidth: 10)
            )
            .overlay(            // 뷰를 중첩시킨다.
                Circle()
                .stroke(Color.red,
                        lineWidth: 10)
                .padding()
            )
            .overlay(            // 뷰를 중첩시킨다.
                Circle()
                .stroke(Color.yellow,
                        lineWidth: 10)
                .padding(30)
            )
            .overlay(            // 뷰를 중첩시킨다.
                Text("Hoon").foregroundColor(.white)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            )
    }
}
```

## 🧑🏻‍💻 사용한 수식어

- **Image**
    - SwiftUI에서는 이미지를 가져오는것이 정말 간단하다. Assets 파일안에 사용할 사진을 넣어주고 이름만 명시하면된다.
<br>
    
- **resizable**
    - 이미지를 화면의 사이즈에 맞춘다. ex) 이미지의 크기가 화면의 크기보다 클 때 사용
    
- **scaleToFill**
    - aspectRatio와 동일

- **frame** 
    - 이미지 크기 조절

- **clipShape**
    - 이미지를 지정한 모양으로 자른다.
    
- **shadow**
    - 이미지 그림자 설정
    
- **overlay**
    - 뷰 원본의 공간을 기준으로 그 위에 새로운 뷰를 중첩하여 쌓는 기능을 한다.
        - UIKit에서 addSubview 메서드를 사용하는 개념과 같다.
        - 따로 크기를 지정하지 않는다면 기존의 뷰와 같은 크기로 생성된다.
<br>
<br>
<br>

![image](https://user-images.githubusercontent.com/63503972/226305054-857ebc9c-3b43-4854-a8a5-837e85bcc855.png)

```swift
// MARK: - 1

Image("hoonImage") // SwiftUI에서는 파라미터 없이 이미지의 이름만 넣어주면 된다.
    .resizable() // 이미지를 화면의 사이즈에 맞춘다.
    .scaledToFill() // aspectRatio와 동일
    .frame(width: 300, height: 300) // 이미지 크기 조절
    .clipShape(Circle()) // 이미지를 지정한 모양으로 자른다.
    .shadow(color: .gray, radius: 10, x: 0, y: 10)

// MARK: - 2
    .overlay(
        Circle()
        .foregroundColor(.black)
        .opacity(0.5)
    )

// MARK: - 3
    .overlay(            // 뷰를 중첩시킨다.
        Circle()
        .stroke(Color.blue,
                lineWidth: 10)
    )

// MARK: - 4
    .overlay(            // 뷰를 중첩시킨다.
        Circle()
        .stroke(Color.red,
                lineWidth: 10)
        .padding()
    )

// MARK: - 5
    .overlay(            // 뷰를 중첩시킨다.
        Circle()
        .stroke(Color.yellow,
                lineWidth: 10)
        .padding(30)
    )

// MARK: - 6
    .overlay(            // 뷰를 중첩시킨다.
        Text("Hoon").foregroundColor(.white)
            .font(.system(size: 50))
            .fontWeight(.bold)
    )
```
<br>
<br>

1. **이미지 띄우기**
- 원형 모양으로 다듬은 후 그림자 효과를 주었다.
<br>

2. **어두운 효과 주기**
- Image 위에 opacity 0.5 만큼의 검은 원형 View를 overlay 한다. 
- padding을 따로 주지 않았기 때문에 상위 View와 동일한 크기로 만들어진다.
<br>

3. **파란색 테두리 overlay** 
- Circle 자체에는 색을 입히지 않고 stroke를 통해 굵기 10만큼의 테두리를 만들고 파란색을 적용했다.
- padding을 주지 않았기 때문에 Image의 테두리에 적용이 된 것처럼 보인다.
<br>

4. **빨간색 테두리 overlay**
- stroke를 통해 굵기 10만큼의 테두리를 만들고 빨간색을 적용했다.
- padding을 기본값만큼 주어 파란색 선과의 간격을 주었다.
<br>

5. **노란색 테두리 overlay**
- stroke를 통해 굵기 10만큼의 테두리를 만들고 노란색을 적용했다.
- padding을 30만큼 주어 빨간색 선과의 간격을 주었는데, 이는 상위 View 즉, Image에 대한 padding이다.
<br>

6. **Text 띄우기**
- 마지막으로 "Hoon"이라는 텍스트를 띄운다. 
<br>
<br>
<br>
    
    
# ✏️ ContentView
<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226312382-72f27d79-1d97-4cde-94d8-9baf2a82673f.png">

```swift
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("backgroundImage")
                    .frame(height: 10)
                    .offset(y: -1550)
                
                CircleImageView()
                
                HStack {
                    NavigationLink(destination: MyWebview(urlToLoad: "https://github.com/Hoonsbrand")
                    ) {
                        Text("깃허브 보기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebview(urlToLoad: "https://frequent-butterfly-0f6.notion.site/163ee2a20785474d95b73a78d1aaeeb1")
                    ) {
                        Text("포트폴리오 보기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                }
                .padding(50)
            }
        }
    }
}
```

> ContentView는 VStack안에 HStack이 들어있는 형태로 구성되어 있다.
    backgroundImage -> CircleImageView -> (NavigationLink -HStack- NavigationLink)
    
    이 화면에서 UI를 구성하는 방식은 여태것 한것과 큰 차이는 없지만 backgroundImage를 구성한 방식이 중요하다고 생각해 정리해보고자 한다.    
<br>
<br>
<br>


**frame**
- Image는 기본적으로 주어진 공간과 관계없이 원본 이미지 사이즈 크기로 적용된다.
- 이미지의 크기를 frame 설정대로 바꾸기 위해서는 resizable이나 clipped등을 같이 사용해주면 된다.
<br>
<br>
<br>

backgroundImage는 보이는 것처럼 frame을 통해 높이를 10으로 설정하고 y를 -1550만큼 이동시켰다.
이미지의 크기를 바꾼것이 아니라 프레임의 크기를 바꾼 것이기 때문에 높이 10과는 무관한 크기의 이미지가 보이는 것이다.
<br>
<br>
<br>

높이를 10으로 설정한 frame에 색을 적용해 어떤식으로 CircleImageView와 간격을 설정했는지 보자.
<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226319540-b5614858-8397-42fe-95d2-aa80dfac260d.png">

```swift
Image("backgroundImage")
    .frame(height: 10)
    .offset(y: -1550)
    .overlay(            // 뷰를 중첩시킨다.
        Rectangle()
            .fill(Color.purple)
    )
```
보이는 이미지의 높이는 10보다 훨씬 크더라도 frame의 높이가 10으로 설정이 되어있기 때문에 해당 간격 이후에 CircleImageView가 띄어지는 것이다.
<br>
<br>
<br>
    

    

