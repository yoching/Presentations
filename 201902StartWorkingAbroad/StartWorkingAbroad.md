autoscale: true
slidenumbers: true

## Swiftエンジニアが<br>海外のポジションに応募する
### <br><br>@yoshikuni_kato
#### Swift愛好会<br>2019/02/12

---
# Who am I ?

![right fit](images/2017Portrait.jpg)

- Yoshikuni Kato（加藤由訓）
- iOS Engineer（4 years）
- Yahoo! Japan -> OHAKO -> Pangea <br>    -> strv (in Czechia)
- Twitter: [@yoshikuni_kato](https://twitter.com/yoshikuni_kato)
- GitHub: [@yoching](https://github.com/yoching)
- Interests: Software Design, FRP (ReactiveSwift), UI Implementation

---
# Agenda

Swiftエンジニアとして、チェコの現地企業で働くことになったので、転職の体験をシェアします。

- 海外転職について
  - 海外で働く方法いろいろ
  - ポジションを探す
  - 応募するか考える
  - （実感）海外の会社を探すのは大変
  - 採用フロー（技術テスト、技術面接、経験に関する質問）
- （おまけ）チェコ、プラハ、strvについて

<!-- - 採用フローは結構共通化されてる
  - 困難多い -->

---
# 転職の経緯

2017ごろ US企業は難しそうなので、選択肢としてヨーロッパへ興味を持つ。
↓
2018/05 UIKonf@ベルリンに参加。ヨーロッパはビザ取りやすそうと実感。
↓
広くポジション探し、応募を繰り返す。
↓
2018/12 チェコ🇨🇿の会社よりオファーをもらう。
↓
2019/05ごろ プラハ移住予定。

---
# おことわり

- 自分の経験の中で得たことベース

---
# 海外転職について

<!-- ---
# Agenda

- 海外で働く方法いろいろ
- ポジションを探す
- 採用フロー
  - 技術テスト
  - 技術面接
  - 経験に関する質問
- 困難 -->

---
# 海外で働き始める方法いろいろ

- 現地企業に直接応募 [^1] ← 今回はこれ
- 日系企業の海外支社 [^1]
- 大学院留学後、現地採用 [^1]
- 現地でフリーランス
- ワーキングホリデー
- 海外転職支援団体（英語研修やスクール→現地採用？）

[^1]: 竜盛博,『エンジニアとして世界の最前線で働く選択肢』, 2015

---
# ポジションを探す - 1

- iOS Developers slack[^2]の `job-board` channel
  - たまに、Appleもポジション投稿してたりする
- LinkedIn - 充実させておくと、メッセージが来る
- カンファレンスへの参加
  - 企業ブース、募集ボードなど
  - 知り合いを作る ← 今回はこのケースになった
  - （非参加でも、Webで）協賛企業を調べる

[^2]: https://ios-developers.io/


---
<!-- # iOS Developers slack -->

![fit](./images/iOSDevelopersSlack.png)

---
# ポジションを探す - 2

- 求人サイト
  - Relocate.me: 移住サポートありのポジション
  - glassdoor
- 逆求人サイト
  - 米だとHIREDが有名(?)。ヨーロッパ（特にベルリン）だとHoneypotがモバイルのポジションに強い。
  Honeypot経由で採用されると、会社がビザサポートない場合にもサポートしてくれるらしい。
- 転職エージェント等
  - 日本のエージェントだと「海外案件」をうたっていてもガチ海外ポジションは見つからない

---
# 応募するか考える

- 会社を知る
Glassdoorが英語圏だと定番っぽい。企業側がGlassdoorの点の高さをアピールしていることも。

- 場所を知る
  - Nomad List: 生活費、居住環境等の比較サイト。眺めるだけで楽しい。
  - Relocate.me: 移住情報（ビザ、税金、住居等）が充実。

---
![fit](./images/Glassdoor.png)

---
![fit](./images/NomadList.png)

---
![fit](./images/RelocateMe.png)

---
# （実感）海外の会社を探すのは大変 - 1

- 業界が分からない
  - 日本のWeb業界なら、会社規模、会社の技術力等なんとなく分かるが・・・
  - 特に、ヨーロッパのサービスは日本に来ていないものも多い
  - web上の情報のみからでは判断できない
  - 気軽に勉強会に行ったり会社を見に行ったりできない（距離）
- 非英語圏の難しさ
  - 英語（仕事）+現地語（生活）が必要
  - 非英語サービスに携われる気がしない
  - とはいえ、英語圏は限られる

---
# （実感）海外の会社を探すのは大変 - 2

- その他
  - 受託事業だと、クライアントと直で話をするので、より英語力が求められる
  - ビザや移住のサポートがあるか
  - 未踏の地に行くのは不安

<br>

→ 途方に暮れることしばしば。

---
# 採用フロー
日本の会社より、パターンが決まっている印象

  1. 人事（or 採用担当）と軽く話す
  1. 技術テスト
  1. 技術面接
  1. 最終面接（マネージャー等）

---
# 技術テスト
- アプリの仕様とデザインが与えられて、それを作る
  - 数画面
  - APIアクセス
  - Locationなど (おそらくAppleのFrameworkの使用例として)
  - Database
- 評価するポイント等は会社によって違う
  - テスタビリティを重視する場合
  - UI実装が重視される場合
  - ...

---
# 技術テスト例

GitHub等でテストを公開している企業もある

- https://github.com/Babylonpartners/iOS-Interview-Demo
- https://github.com/AckeeCZ/cookbook-ios-task


---
# 技術面接例

- 開発手法
  - Scrum/Agile, スプリントのフロー
  - gitの使い方、github flowのやり方
- プログラミングの原則
  - SOLID原則
  - DI
- iOSの技術詳細
  - Swift
  - Database
  - UIKit
  - Foundation
  - Network

---
# 経験に関する質問

- Work you're most proud of / 一番誇りに思っている仕事
- Biggest challenges, difficulties / 今までで一番チャレンジングだった仕事
- どういうポジションを探しているか
- Strength & weakness / 強みと弱み
- What motivates you? / 何があるとモチベーションが上がるか

- ググるとたくさん出てくるので、**事前に回答を準備しておくことが大事**

---
# 練習するサービス

![fit right](./images/Pramp.png)

- Pramp (https://www.pramp.com)
- 面接の練習を行う2人がマッチングされる
- 1回使用したが、とてもいい練習になった。
- Qiita記事[^5]で知った

[^5]: 英語のコーディング面接 (React) を受けた感想、やっておけば良かったと思ったことなど, https://qiita.com/acro5piano/items/df53d695c84db83061da

---
# その他よく使うツール
- calendly
  - 予定合わせツール
  - スロットを選ぶ（時差が考慮されている）→ GoogleCalendarに自動で予定登録
- Google Hangout

<!-- ---
# 便利そうなサービス
  - 面接練習のやつ
  - relocate.me
  - Nomad List -->

<!-- ---
# 就労ビザについて

strvは、フリーランスビザを取ってそれで契約する。
フリーランスビザを取るのに、住所の指定など、面倒な手続きがいくつかあるが、それをサポートしてくれる。 -->

<!-- ---
# 自分の要望の狭さ

- 受託開発
- iOSの技術力高い（トレンドを追っている）
- 厚めのビザ・移住サポート（海外経験が少ないため）
- 言語（日本語、不十分な英語） -->

<!-- - Swift only (No Objective-C)
- 小さめの会社 -->

---
# うまく行かなかったケース

- 技術テスト通らない
- がんばってカバーレター書いたのに返信がない
- 勤務地が希望と合わない
- 非英語サービスの開発
- 転職エージェント（ポジション見つからない）
- 日本で働いている外国人に聞く

---
# やってよかったこと

- LinkedInの充実
- 英語でアウトプットしておく
  - Tokyo iOS meetup[^3]での発表の動画[^4]を、会社の人が見てくれていた
  - SpeakerDeckの英語資料も

[^3]: https://www.meetup.com/TokyoiOSMeetup/

[^4]: https://www.youtube.com/watch?v=Z3tiYtq5oio

---
# 英語について

- 今の会社は英語でコミュニケーション
- + 英会話、自主勉強
- 技術の話は簡単。それ以外が難しい。
- Grammarly使ってる（けどどうなんでしょう・・・）

<!-- ---
# twitter

日本語で情報発信している海外転職エンジニア多い。
チェコについて発信している人いない
→ twitterは狭い世界？ -->

<!-- ---
# Swift Elm

- 最近作っているので、興味あればご覧ください -->

---
#（おまけ）

# チェコ、プラハ、STRV

---
![fill](./images/Czechia.png)


<!-- ---
![fit](./images/Prague.png) -->

---
# チェコ共和国🇨🇿

- 首都：プラハ
- 公用語：チェコ語（難しい） ※ プラハだと英語も割と通じる
- 通貨：コルナ（1コルナ ≒ 5円）
- 生活費が安い（プラハでは東京の6割程度か）
- ヨーロッパの中央にあるので、どこでも行きやすい
- ビール🍺の消費量（一人あたり）世界一、そして安い

<!-- - 人口：10,369,000人 -->

---
# チェコ - IT

<!-- ![inline](./images/avast.png)![inline](./images/jetbrains.png)
![inline](./images/apiary.png) -->

- Avast Antivirus
- JetBrains (IDEs, Kotlin, ...) Headquarters
- apiary: API documentation tool

---
# Mobile Dev Conferences

![inline](./images/mDevTalk.png)![inline](./images/mDevCamp.png)

---
![fit](./images/PragueStreet.jpeg)

<!-- ---
# プラハ

- 首都
- 「中世の宝石」 -->

---
# STRV

![right](./images/strv.png)

- サービスのデザイン＆開発
- 今のクライアントは主に米企業（大企業〜スタートアップまで）
- 200人程度
- 開発環境はよさげ
- 外国人Welcomeな雰囲気
  - Visa & Relocation support
  - 英語とチェコ語のレッスン
- プラハとブルノに開発拠点
- 気になる方はサイトのキャリアページなど

---
# チェコの日本人

- チェコ内に2000人程度
- 日系企業の支社はあるらしい
- Web系の日本人エンジニア/デザイナー、本当に見つからない・・・（ベルリンにはたくさんいるのに・・・）

---
# 最後に

- プラハで働きたい人 Welcome!
- チェコ＆プラハ情報あったら教えてください

---
# Thank you!🇨🇿


<!-- ---
# 以下ドラフト

---
- 海外で仕事を探すのは予想より大変

    - 企業の感覚が分からない
    - 語学
    - 非英語圏
    - 土地勘

- 狭い選択肢
    - 受託 & デザインイケてる & あまりコンサル寄りでない
    - swift only
    - 海外経験

- 長期計画、少しずつ

- うまく行かなかったケース
    - Sydney
    - ロンドンの医療系企業
    - ヨーロッパの受託会社
    - 逆指名求人サイト
    - 転職エージェント

- よく聞かれる質問

- 面接の練習サイト

- 採用フロー
    - 技術テスト⭐️

- チェコとは
    - 場所
    - IT企業
    - ビール
    - 言語


- strvとは

- "海外"

- 便利そうなサイト、他サービス

- 今後も何が起こるか不明

- 移住

- 他都市の話

- Glassdoor -->
