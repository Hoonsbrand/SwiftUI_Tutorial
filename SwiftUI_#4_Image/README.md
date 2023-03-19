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
                Circle()
                .stroke(Color.blue,
                        lineWidth: 10)
            )
            .overlay(            // 뷰를 중첩시킨다.
                Text("Hoon").foregroundColor(.white)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            )
    }
}
```
- **Image**
    - SwiftUI에서는 이미지를 가져오는것이 정말 간단하다. Assets 파일안에 사용할 사진을 넣어주고 이름만 명시하면된다.
<br>
    
- **resizable**
    - 이미지를 화면의 사이즈에 맞춘다. ex) 이미지의 크기가 화면의 크기보다 클 때 사용
    
**resizable 미사용**
```swift
Image("backgroundImage")
    .frame(width: 100, height: 100) // frame만 설정한다고 이미지의 크기가 변하지는 않는다.
```
<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/226156145-29b07304-6d80-41a5-adc6-98dc9912e28e.png">
<br>
<br>
<br>

**resizable 사용**
```swift
Image("backgroundImage")
    .resizable()
    .frame(width: 100, height: 100)
```
<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/226156303-4d7259cf-105a-4b09-997d-a8b04de18e2d.png">
<br>
<br>
<br>
    
    

