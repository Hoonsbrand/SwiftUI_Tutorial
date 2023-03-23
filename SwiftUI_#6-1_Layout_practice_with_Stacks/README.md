#  정대리 SwfitUI #6-1 Layout practice with Stacks

> #6에서 구성한 MyBasicCard를 생성자를 통해 좀 더 유동적인 View가 되게 업데이트, button을 통한 Alert구현을 하였다.
<br>
<br>
<br>
    
# ✏️ MyCard

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/227210567-842adbb1-ec3a-42cd-9166-c919839a006e.png">
<br>

```swift
struct MyCard: View {
    
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 5)
                
                Text("\(start) - \(end)")
                    .foregroundColor(Color.white)
                
            }
            
            Spacer()
            
        }
        .padding(20)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
    }
}
```
<br>

기존 MyBasicCard와 비슷하지만 생성자를 통해 같은 내용의 View가 아닌 매번 새로운 내용을 넣을 수 있게 하였다.
<br>
<br>
<br>

# ✏️ ContentView

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/227211112-11bcee13-073c-42e1-aedb-b1730c787f12.png">
<br>

```swift
ScrollView {
    VStack {
        MyProjectCard()
        MyBasicCard()
        MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
        MyCard(icon: "tv.fill", title: "영상 다시보기", start: "8 AM", end: "9 AM", bgColor: Color.blue)
        MyCard(icon: "cart.fill", title: "마트 장보기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
        MyCard(icon: "gamecontroller.fill", title: "오버워치 한판하기", start: "2 PM", end: "3 PM", bgColor: Color.blue)
    }
    .padding()
}
```
<br>

이처럼 매번 다른 내용을 생성자 파라미터를 이용해 쉽게 View를 만든다.
<br>
<br>
<br>

# ✏️ MyProjectCard

![33](https://user-images.githubusercontent.com/63503972/227211582-154c15ce-43eb-4f20-acc2-44723824f350.gif)
<br>

```swift
struct MyProjectCard: View {
    
    @State private var shouldShowAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // ...
            
            HStack {
                // ...
                
                Button(action: {
                    print("DEBUG: 확인 버튼이 클릭되었다.")
                    
                    self.shouldShowAlert = true
                    
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창입니다!"))
                }
    
            }
        }
        // ...
        
    }
}
```
<br>

1. **@State** 변수인 shouldShowAlert를 선언한다.
2. 버튼을 누르면 shouldShowAlert의 값을 true로 변경한다.
3. View 프로토콜의 modifier인 alert(...)를 사용해 창을 띄운다. **.alert**는 더욱 선언적으로 alert를 사용할 수 있다.
4. **isPresented**가 true일 때 alert를 띄우는데 Button의 action에서 shouldShowAlert의 값을 true로 변경하여 알림이 뜬다.
5. alert이 노출될 때 @State 프로퍼티(shouldShowAlert)를 true로 설정해주고, 사용자가 alert를 해제하면 이 값은 자동으로 false로 변경되고 alert는 사라진다.


