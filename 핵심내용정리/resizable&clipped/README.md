## ✏️ resizable 과 clipped 알아보기
    
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
<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/226156303-4d7259cf-105a-4b09-997d-a8b04de18e2d.png">


```swift
Image("backgroundImage")
    .resizable()
    .frame(width: 100, height: 100)
```
<br>
<br>
<br>

**clipped**
<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/226320508-4a75cef0-6962-4349-8f5c-fdd95f2764e8.png">

```swift
Image("backgroundImage")
    .frame(width: 100, height: 100)
    .clipped()
```

resizable은 설정한 frame 값대로 이미지의 크기 자체를 줄이고, clipped는 원본 이미지의 사이즈를 그대로 두고 frame 값 만큼만 잘라서 보여준다.
    
