autoscale: true
slidenumbers: true

## The Elm Architecture & Swift
### <br><br>@yoshikuni_kato
#### CocoaHeads Prague<br>17.09.2020

---
# Who am I ?

![right fit](images/2017Portrait.jpg)

- Yoshikuni Kato（加藤由訓）
- iOS Engineer（5+ years）
- Yahoo! Japan -> OHAKO -> Pangea -> STRV (since 03.2019)
- Twitter: [@yoshikuni_kato](https://twitter.com/yoshikuni_kato)
- GitHub: [@yoching](https://github.com/yoching)
- Interests: Functional Programming, Software Design, UI Implementation

---
# Agenda
- Brief history: TEA experiments by Swift developers
- Simple TEA implementation
- After SwiftUI

TEA = The Elm Architecture


---
## Brief history: <br> TEA experiments by Swift developers

---
# Brief history: TEA experiments by Swift developers

(This is from my perspective)

2017 Inami presentations, gist about Elm inspired frameworks
2018 May: AppArchitecture book
2018 June: WWDC - no updates about virtual UI
2018 Dec: my experiments
2019 June: SwiftUI came

---
# Presentations by Inami, 2017

- Making Elm with Swift, 03.2017

![right fit](images/InamiySwiftElm.png)

---
# Presentations by Inami, 2017

- Elm Architecture in Swift, 05.2017

![right fit](images/InamiySwiftElm2.png)

---
# Curated list by Inami, 2017

- React & Elm inspired frameworks in Swift

![right fit](images/React&RealmInspiredFrameworks.png)

---
# App Architecture from objc.io, 2018

- This was released in May 2018.

![right fit](images/AppArchitecture.png)

---
# App Architecture from objc.io, 2018

- The Elm Architecture as an experimental architecture

![right fit](images/AppArchitectureBookContents.png)

---
# App Architecture from objc.io, 2018

- some Video Contents

![right fit](images/AppArchitectureVideoContents.png)

---
# My wish before WWDC18

![inline fit](images/TweetBeforeWWDC18.png)

---
# WWDC18

- no new UI framework
- only updates about UIKit
- Yoshi's thought🤔: Apple won't make a new UI library, they'll stick to UIKit.


---
# My trials to understand TEA

- TEA sample from objc.io was a bit difficult for me to understand. Tried to understand them by making them.
- yoching/SwiftElmButtonSample
- yoching/SwiftElmSample2
- mostly done in 12.2018

![right fit](images/YochingElmButtonSample.png)

---
# WWDC19

- SwiftUI came
- mixed feelings
  - this is how it should be (e.g. React)
  - one year later than expected

---
# TEA implementation

---
# What is Elm & TEA
- Elm: functional language for web apps
  - Haskell like
- The Elm Architecture
  - GUI app architecture for Elm

<!-- ---
# Virtual view in Inami's Elm

![inline](images/InamiySwiftElmVirtualView.png) -->

---
# TEA sample
```elm
-- MODEL
type alias Model = Int
init : Model
init = 0

-- UPDATE
type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment -> model + 1
    Decrement -> model - 1
```

![right 300%](images/ElmButtons.png)

---
# TEA sample
```elm
-- VIEW
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
```

![right 300%](images/ElmButtons.png)

---
# 1st sample in Swift
```swift
struct AppState {
    // MODEL
    var value: Int

    // UPDATE
    enum Message { case increment, decrement }
    mutating func update(_ message: Message) {
        switch message {
        case .increment: value = value + 1
        case .decrement: value = value - 1
        }
    }

    ...
```

![right 100%](images/ButtonsSample.gif)

---
# 1st sample in Swift
```swift
    ...

    // VIEW
    var viewController: ViewController<Message> {
        return ._viewController(
            .stackView(
                views: [
                    .button(text: "-", onTap: .decrement),
                    .label(text: "\(value)"),
                    .button(text: "+", onTap: .increment)
                ],
                axis: .vertical,
                distriburtion: .fillEqually
            )
        )
    }
}
```

![right 100%](images/ButtonsSample.gif)

---
# Virtual Views
```swift
indirect enum ViewController<Message> {
    case _viewController(View<Message>)
}

indirect enum View<Message> {
    case _label(Label)
    case _button(Button<Message>)
    case _stackView(StackView<Message>)
    ...
}
```

- e.g. Virtual DOM (React)
- (SwiftUI is basically virtual view)

---
# 2nd sample: Cmd & Subscription
1st sample + save/load

- Save button: save the value to UserDefaults (= side effect without callback)
- Load button: load the value from UserDefaults (= side effect with callback)
- Load value when app becomes active
- Save value when app enters background

![right 100%](images/ButtonsSample2Still.png)

---
# 2nd sample: Cmd & Subscription
```swift
struct AppState {

    // MODEL
    var value: Int

    // UPDATE
    enum Message {
        case increment
        case decrement
        case save
        case load
        case loaded(Int)
    }

    ...
```

---
# 2nd sample: Cmd & Subscription

```swift
// VIEW
var viewController: ViewController<Message> {
    return ._viewController(
        .stackView(
            views: [
                .button(text: "-", onTap: .decrement),
                .label(text: "\(value)"),
                .button(text: "+", onTap: .increment),
                .button(text: "save", onTap: .save),
                .button(text: "load", onTap: .load)
            ],
            axis: .vertical,
            distribution: .fillEqually
        )
    )
}
```

---
# 2nd sample: Cmd & Subscription
```swift
mutating func update(_ message: Message) -> [Command<Message>] {
    switch message {
    case .increment:
        value = value + 1
        return []
    case .decrement:
        value = value - 1
        return []
    case .save:
        return [.save(value: value)]
    case .load:
        return [.load(available: { .loaded($0) })]
    case .loaded(let value):
        self.value = value
        return []
    }
}
```

- need to prepare custom commands

---
# 2nd sample: Cmd & Subscription

```swift
// SUBSCRIPTIONS
var subscriptions: [Subscription<Message>] {
    return [
        .notification(
            name: UIApplication.didBecomeActiveNotification,
            { notification -> Message in
                return .load
        }),
        .notification(
            name: UIApplication.willResignActiveNotification,
            { notification -> Message in
                return .save
        })
    ]
}
```

- need to prepare custom subscriptions

---
# Similarities with SwiftUI
- Data Flow Through SwiftUI @ WWDC19 https://developer.apple.com/videos/play/wwdc2019/226/

![inline](images/SwiftUI-Elm-similarity-original.png)

---
# Similarities with SwiftUI
- Data Flow Through SwiftUI @ WWDC19 https://developer.apple.com/videos/play/wwdc2019/226/

![inline](images/SwiftUI-Elm-similarity.png)

---
# After SwiftUI

---
# SwiftUI + TEA
- rizumita/Selm
- pointfreeco/swift-composable-architecture

---
# The Composable Architecture (TCA)
- from point-free
- inspired by TEA apparently
- high quality
- Effect is very close to Cmd in TEA
- Yoshi's thought: Finally TEA came to reality. It's no more "experimental" architecture

---
# Comparison with other architectures

| Architecture | Enum based Action | Virtual View |
| --- | --- | --- |
| MVVM + UIKit | - | - |
| MVVM + SwiftUI | - | ✅ |
| Redux (XxxFeedback) + UIKit | ✅ | - |
| Redux (XxxFeedback) + SwiftUI | ✅ | ✅|
| TEA (or TCA) | ✅| ✅|

---
# Enum based actions

- In new architectures, actions are represented as **types** (usually enum)
  - e.g.) actions are represented as **functions/methods** in other architectures like MVC, MVVM
  - easier to test, easier to handle because they are value types
- Lots of architectures going towards this direction

---
# Summary

- We can learn a lot from Elm
- Let's try making enum based actions
