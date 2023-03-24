
# some 알아보기

```swift

struct ContentView: View {

var body: some View {

Text("Hello, world!")

.padding()

}

}

```

SwiftUI 프로젝트를 생성하면 가장 먼저 보이는 코드

<br>

<br>

<br>

  

## ✏️ 1. some이란?

  

* some이라는 키워드는 Swift 5.1에서 등장한 새로운 기능으로, 해당 키워드가 반환 타입 앞에 붙을 경우, 해당 반환 타입이 **불투명한 타입(Opaque Type)** 이라는것을 나타낸다.

* 불투명한 타입이라는 것을 보통 **"역 제네릭 타입(reverse generic types)"** 라고 표현한다."

  

먼저 제네릭 타입에 대해 다시 알아보자!

<br>

<br>

<br>

  

## 1-1. 제네릭 타입(Generic Types)

```swift

func swap<T>(a: inout T, b: inout T) { }

```

위와 같은 함수가 바로 제네릭 함수다.

타입에 의존하지 않는 범용 코드를 만들때 사용하는데, 이 때문에 함수를 작성하는 순간에는 실제로 어떤 타입이 들어올지 알 수 없다.

그래서 당연하게 함수 본문에서는 매개변수를 이용해 많은 작업을 할 수 없다.

  

따라서 만약 제네릭 타입에 대한 제약이 필요할 경우, 프로토콜을 사용해 다음과 같이 제한을 줄 수 있다.

<br>

  

```swift

func swap<T>(a: inout T, b: inout T) where T: Equatable { }

```

함수 내부에선 a,b 매개변수가 어떤 타입일진 모르지만, Equatable을 채택하고 있으니 a,b에 한해서 == 연산 정도는 사용 가능하다고 확신할 수 있으며 이를 토대로 작업을 할 수 있다.

따라서 제네릭의 경우 **함수 구현 내에서는 값의 실제 타입에 대해서 알 수 없다**

  

그렇다면 제네릭 함수의 실제 타입에 대해서는 제네릭 함수를 호출하는 **외부**에서 알 수 있다.

<br>

  

```swift

var a: String = "hoons"

var b: String = "brand"

swap(a: &a, b: &b)

```

이런식으로 실제 호출하는 곳에서 알 수 있다.

<br>

<br>

<br>

  

## 1-2. 불투명한 타입(Opaque Types)

위에서 언급했듯이 불투명한 타입이 역 제네릭 타입이라고 불린다고 했다.

제네릭이 함수 **"외부"** 에서 해당 타입에 대해 알 수 있는 반면,

불투명한 타입의 경우, **외부에서 함수의 반환 값 유형을 정확하게 알 수 없다.**

  

다음과 같은 선물 상자를 하나 만든다고 가정해보자.

  

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FTd5PA%2FbtryF8r5ezg%2FQEjVXgwwJbGOnnZcDnY8qk%2Fimg.png)

  

이 상자 안에는 **사과, 체리** 두 가지 중 하나가 들어 있다.

겉으로 봤을 때는 똑같이 노란 상자이기 때문에 어떤 과일(타입)을 갖고 있는지 알 수 없다.

<br>

<br>

  

이를 프로토콜로 구현해본다면,

```swift

struct Apple {}

struct Cherry {}

protocol GiftBox {

associatedtype giftType

var gift: giftType { get }

}

```

이런식으로 **associatedtype**을 이용해서 구현할 수 있다. (associatedtype은 Protocol 내의 Generic Type이다.)

<br>

<br>

  

실제 선물인 gift의 타입이 사과인지 체리인지는 알 수 없으니, **associatedtype(giftType)** 으로 만들고, 이제 선물을 포장하는 곳에서 다음과 같이 구현한다.

```swift

struct AppleGiftBox: GiftBox {

var gift: Apple

}

struct CherryGiftBox: GiftBox {

var gift: Cherry

}

```
<br>

<br>

<br>

makeGiftBox 함수를 통해 GifxBox를 만드는 작업을 한다.

만약 내가 오늘은 체리를 선물하고 싶고, 내일은 사과를 선물하고 싶을 때 return type을 CherryGiftBox, AppleGiftBox로 지정해버리면 범용적으로 사용할 수 없으니 위와 같이 **GiftBox를 return**하는 함수를 만들었다.




  

```swift

func makeGiftBox() -> GiftBox {

return CherryGiftBox.init(gift: .init())

}

```

  

오늘은 체리로 선물을 만들고, 내일은 만약 사과를 선물하고 싶다면, **외부에서 보여질 함수 모양은 건드릴 필요가 없고,**

함수 내부의 return 구문만 CherryGiftBox를 AppleGiftBox로 수정해주면 된다.

<br>

<br>

  

**하지만!!**

위처럼 코드를 작성하면 에러가 발생한다.

```swift

Protocol 'GiftBox' can only be used as a generic constraint because it has Self or associated type requirements

```

위 에러가 발생하는 이유는,

**반환 타입이 GiftBox인데, 받는 사람은 GiftBox안에 사과가 있을지 체리가 있을지 알 수 없기 때문이다.**

<br>

<br>

  

**나는 선물을 만들 때 분명 체리를 담았지만, 선물을 받는 입장에서는 안에 들은 게 어떤 것인지 알수 없다.**

**말 그대로 GiftBox라는 프로토콜을 냅다 받은 것으로 생각할 수 있다.**

  

이런 문제가 생긴 이유는, **gift라는 프로퍼티의 타입이 GiftBox란 프로토콜 내에 지정된 타입(String/Int 등)이 아닌, associatedtype(or Self) 이기 때문이다.**

<br>

<br>

  

나는 분명 함수 **"내부"** 에서 **"사과"** 로 만들었는데 라고 생각을 해도, **여기서 문제는 이 사실을 바로 "함수 내부"만 알고 있다는 것이다!**

  

외부에선 GiftBox로 나오는데,

GiftBox의 gift 프로퍼티가 associatedtype으로 선언되어 있어서, **"외부"** 에선 **해당 GiftBox안에 어떤 타입의 gift가 들어있는지를 알 수 없다.**

<br>

<br>

  

다시 제네릭과 역 제네릭 타입을 정리해보자면,

**실제 타입을 함수 "내부"에서 알 수 없고, "외부"에서 결정 짓는게 제네릭 타입이었다면,**

**실제 타입을 함수 "외부"에선 알 수 없고, "내부"에서 결정 짓는 게 불투명 타입(역 제네릭)인 것이다.**

<br>

  

여기서 중요한 건,

함수 내부(선물을 주는 사람)의 단순 변심에 의해

**함수 내부의 내용을 바꿔버리면(CherryGiftBox->AppleGiftBox) 리턴 타입이 바뀐다는 것이다!**

<br>

  

따라서, 이때 **내 함수는 반환타입이 내 변심에 의해 바뀔 수는 있지만, 항상 특정 타입만 반환할 거야!!** 라고 컴파일러(받는 사람)에게 알릴 때 사용하는 것이 바로 **some**이라는 키워드이다.

<br>

<br>

<br>

  

```swift

func makeGiftBox() -> some GiftBox {

return AppleGiftBox.init(gift: .init())

}

```

위처럼 **some**이란 키워드를 추가하면 에러가 사라지면서 반환 타입인 GiftBox가 **"불투명 타입"** 이 된다는 것이다!

<br>

<br>

<br>

  

**특정 타입만 반환 이란??**

함수를 짜는 입장(선물하는 사람 입장)에서 나는 "체리"를 포장하는 코드를 짰다.

이 경우, 받은 사람의 GiftBox가 "사과"로 바귈 일은 절대 없고,

내가 직접 함수 내부에서 사과로 포장하는 코드로 고치기 전까지는 **특정 타입(체리)가 든 GiftBox만 항상 반환한다는 것을 알리는 것이다.**

<br>

<br>

  

만약 내가 내일 사과로 포장하는 코드로 함수 내부를 수정 했다면, **특정 타입(사과)가 든 GiftBox만 반환한다는 것을 알리는 것이 바로 some, 즉 불투명 리턴 타입**인 것이다!

<br>

<br>

<br>

  

정리하자면 some이란 것은,

**명확하지 않은 타입(associatedType or Self)이 프로토콜 내에 정의되어 있고,**

**이 프로토콜을 함수(및 연산 프로퍼티)의 반환 타입으로 가질 때**

**반환 타입을 "불투명 타입"으로 만들어 주기 위해 사용하고,**

<br>

  

some이라는 것을 통해 반환 타입을 "불투명 타입"으로 만든단 것은,

**반환 타입이 어떤 타입인지 컴파일러(및 함수 외부)는 아예 모르지만**

**함수 내부에선 어떤 타입을 반환하는지 명확히 알고 있고,**

**따라서 내 함수는 정해진 "특정 타입만 반환"된다고 컴파일러에게 알려주는 것이다.**

<br>

<br>

  

위 예제에서 "특정 타입"은 함수 내부에서 어떻게 구현하냐에 따라 달라지겠지만,

**GiftBox 프로토콜을 준수하고 있는 AppleGiftBox / CherryGiftBox 중 하나가 될 것이다.**

<br>

<br>

<br>

  

## ✏️ 2. some View

**첫번째 예제**



  

```swift

struct ContentView: View {

var body: some View {

Text("Hello, world!")

.padding()

}

}

```

여기서 body라는 것은 View라는 프로토콜에 정의된 프로퍼티인데, 이 프로퍼티는 **연산 프로퍼티(Computed Property)**로 위 코드에선 Text라는 것을 return 하고 있다.

<br>

  

위에서 배운 것을 토대로 **some**은 명확하지 않은 타입(associatedType or Self)이 프로토콜 내에 정의되어 있고, 이 프로토콜을 반환 타입으로 가지고 싶을 때 쓴다!

<br>

  

그럼 **View**는 **프로토콜**이고, 속성 중 하나는 **associatedtype(or Self)**로 선언되어 있을 것이다!

<br>

<br>

<br>

  

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fyiser%2FbtryJY3lTo7%2Fb62W7VeBmpr9S6wvxDNwy0%2Fimg.png)

  

그럼 body라는 연산 프로퍼티는 View라는 프로토콜 타입을 반환하지만 View라는 프로토콜 내에 명확하지 않은 타입이 정의되어 있으니 **some을 통해 불투명 타입이라고 밝혀준 것이다!**

<br>

  

따라서 **body 내부에 내가 작성하는 코드에 따라 리턴 타입이 달라지겠지만, View 프로토콜을 준수하는 타입만 리턴이 가능하다.**

<br>

  

다시 코드를 보면, 컴파일러(및 함수 외부)에서는 View라는 프로토콜을 준수하는 객체가 나올 것은 알지만,

정확히 어떤 타입이 나올지는 모른다.

**다만 위에서 body는 특정 타입(현재는 내가 Text를 리턴했으니 Text)만 항상 반환된단 것을 알려주는 것이 some(불투명 타입)이다.**

<br>

<br>

<br>

  

**두번째 예제**



  

```swift

struct ContentView: View {

var body: some View {

Button {

} label: {

Text("Hello, world!")

}

}

```

이렇게 Button으로 바꾸면 컴파일러 및 함수 외부에선 여전히 정확히 어떤 타입이 나올지는 모르지만,

**위에서 body는 특정 타입(현재는 내가 Button을 리턴 했으니 Button)만 항상 반환된단 것을 알려주는 것이 some(불투명 타입)이다.**

<br>

<br>

<br>

  

## 2-1. some을 사용하는 이유와 이점

이렇게 불투명한 타입을 사용할 경우,

함수 내부에서 **내가 짜는 코드에 따라 시시각각 리턴 타입이 변경 되었지만 (Text -> Button) 이것에 대해 따로 내가 리턴 타입을 바꿔줄 필요가 없다!**

<br>

<br>

  

만약 **some**을 사용하지 않는다면,

```swift

struct ContentView: View {

var body: VStack<TupleView<Text,Image>> {

VStack {

Text("Hello, world!")

Image(systemName: "sodeul!")

}

}

}

```

이런 식으로 body의 타입을 저렇게 다 명명해줬어야 할 것이다.

**한마디로 불필요한 타입에 대해 우리가 알 필요가 없다! 컴파일러가 알아서 한다.**
