autoscale: true
slidenumbers: true

## 関数を引数として渡す書き方のポイント
### <br><br><br>加藤由訓 / @yoshikuni_kato
#### iOSDC 2017<br>2017/09/17

---
# Who am I?

![right 300%](images/250x250_green.png)

- 加藤由訓（Yoshikuni Kato） [@yoshikuni_kato](https://twitter.com/yoshikuni_kato)
- iOSエンジニア（2.5 years）
- Yahoo! Japan -> オハコ
- 「ラジへぇ」くん →
- Interests: 設計 / FRP / Coordinator Pattern / UI実装

---
# functionalに書く傾向

- functionalに書くことが増えてきた
  - FRP (RxSwift / ReactiveSwift)
  - map / filter / reduce
- `if`や`for`が減る
- 宣言的に書ける

^ functionalに書くことが増えた

---
# このLTでシェアすること

- 関数を引数として渡す場合の書き方
→ 少しの変更だけど、より宣言的に見える方法

- arrayのmapを例に

^ より宣言的に見える渡し方の紹介

---
# 書き方１ - クロージャを直接書く

``` swift
let array: [Int] = [1, 2, 3]

array.map { number -> Int in
    return number * 2
}
```

^ クロージャの中に直接2倍する処理を書く

---
# arrayのmapの定義


```swift
func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
```

- mapの引数：Elementを受け取ってTを返すクロージャ
- 関数は、名前付きのクロージャと捉えられる
- 関数自体を渡すことができる

^ mapの引数には関数を渡せる

---
# 書き方２ - 関数を渡す

``` swift
// 先に関数を定義
func twoTimes(of number: Int) -> Int {
  return number * 2
}


let array: [Int] = [1, 2, 3]
array.map(twoTimes) // 関数を渡す
```

^ 関数を定義して、その関数自体を渡す

---
# パラメーターが複数ある場合

```swift
func someFunc(a: Int, b: Int) -> String {
    return "a = \(a), b = \(b)"
}

let array: [Int] = [1, 2, 3]
array
    .map { number  -> (a: Int, b: Int) in
        return (a: number, b: number)  // 一旦タプルにする
    }
    .map(someFunc)
```

---
# イニシャライザの場合

``` swift
struct Sample {

    let number: Int

    init(number: Int) {
        self.number = number
    }
}
```

^ map処理の中で、別のオブジェクトに変換したい

---
# 書き方１ - クロージャを直接書く

``` swift
let array: [Int] = [1, 2, 3]

array.map { number -> Sample in
    return Sample(number: number)
}
```

---
# 書き方２ - 関数を渡す

``` swift
let array: [Int] = [1, 2, 3]

array.map(Sample.init)
```

<br>
<br>

- イニシャライザ(`.init`) = そのObjectを返す関数

---
# 違い 1

```swift
array.map { number -> Sample in
    return Sample(number: number)
}

array.map(Sample.init)
```

^ 簡潔に書ける

---
# 違い 2

```swift
array
  .map { number -> Int in
      return number * 2
  }
  .map { number -> Sample in
    return Sample(number: number)
  }
  .map { sample -> Foo in
    return Foo(sample: sample)
  }

array
  .map(twoTimes)
  .map(Sample.init)
  .map(Foo.init)
```

^ さらに効果が現れるのは、複数回mapする場合
^ 仕様をそのままコードとして記述しているような感覚

---
# まとめ

- 少し書き方を変えるだけで、より宣言的に書ける方法を紹介
- 活用例：ModelからViewModelへの変換

```swift
　 model.map(ViewModel.init)
```

- 結果的に、処理を関数に切り出していくことになる
- 関数を渡していく感覚（手続き型の感覚から徐々に離れる）

^ 再利用性・テストしやすさが高まる

---
# 参考

- Connecting View Controllers, Swift Talk[^1]
- From Runtime Programming to Functions, Swift Talk[^2]

[^1]: https://talk.objc.io/episodes/S01E05-connecting-view-controllers

[^2]: https://talk.objc.io/episodes/S01E19-from-runtime-programming-to-functions

---
# おまけ

```swift
func someFunc(a: Int, b: Int) -> String {
    return "a: \(a), b: \(b)"
}

// タプルは渡せない
let parameters = (a: 0, b: 0)
someFunc(parameters) // 🙅（swift3~）


// mapだと渡せる
let array: [(Int, Int)] = [(0, 0)]
array.map(someFunc) // 🙆（swift3でも）
```

- なぜ書けるのか分かっている人がいたら教えてください
