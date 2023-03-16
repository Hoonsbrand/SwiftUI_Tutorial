#  정대리 SwfitUI #2 Webview


![6](https://user-images.githubusercontent.com/63503972/225617331-fb556b03-0c4c-4654-b7f8-e63e2e5337ae.gif) 
<br> 
<br>

## ✏️ UIViewRepresentable
```swift
import SwiftUI
import WebKit

// UIKit의 UIView를 사용할 수 있도록 한다.
// 만약 UIKit의 UIViewController를 사용하고싶다면 UIViewControllerRepresentable을 사용한다.

// MyWebview는 ContentView(메인뷰)에서 사용하는 View이다.
struct MyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    // UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 UIView
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
```
SwiftUI에서 UIKit의 UIView를 사용하고 싶을 때 UIViewRepresentable 프로토콜을 채택 후 구현한다.
<br>
* UIViewRepresentable의 2가지를 필수로 정의하여 사용
    - **makeUIView(context:) -> Self.UiViewType**: UIView를 생성하고 초기화
    - **updateUIView(_:, context:)**: UIView 업데이트가 필요할 때 호출하는 메서드
<br>
<br>

## ✏️ ContentView (기존 코드)
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            HStack {
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.naver.com")
                ) {
                    Text("네이버")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.daum.net")
                ) {
                    Text("다음")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: MyWebview(urlToLoad: "https://www.google.com")
                ) {
                    Text("구글")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

강의에서 제공한 기존 코드인데, 3개의 NavigationLink가 반복되어서 새로운 View를 만들어 코드 중복을 해결하였다.
<br>
<br>

## ✏️ WebviewButton (코드 중복을 피하기 위한 재활용 할 View)
```swift
import SwiftUI

struct WebviewButton: View {
    
    // 접속할 url
    private var url: String
    
    // 웹사이트 이름
    private var webname: String
    
    // 버튼 배경색
    private var buttonColor: Color
    
    init(url: String, webname: String, buttonColor: Color) {
        self.url = url
        self.webname = webname
        self.buttonColor = buttonColor
    }
    
    var body: some View {
        NavigationLink(destination: MyWebview(urlToLoad: url)) {
            Text(webname)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(20)
                .background(buttonColor)
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
    }
}
```
<br>
<br>

## ✏️ ContentView (바꾼 코드)
```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            HStack {
                WebviewButton(url: "https://www.naver.com", webname: "네이버", buttonColor: Color.green)
                WebviewButton(url: "https://www.daum.net",webname: "다음", buttonColor: Color.orange)
                WebviewButton(url: "https://www.google.com", webname: "구글", buttonColor: Color.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
훨씬 더 깔끔해졌다!
