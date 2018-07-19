autoscale: true
slidenumbers: true

## App Architecture by Manual DI
### <br><br>@yoshikuni_kato
#### Tokyo iOS meetup<br>2018/07/20

---
# Who am I ?

![right fit](images/2017Portrait.jpg)

- Yoshikuni Kato（加藤由訓）
- iOS Engineer（3.5 years）
- Yahoo! Japan -> OHAKO -> Pangea
- Twitter: [@yoshikuni_kato](https://twitter.com/yoshikuni_kato)
- GitHub: [@yoching](https://github.com/yoching)
- Interests: Software Design, FRP (ReactiveSwift), UI Implementation

---
# Agenda

1. Coordinator Pattern
1. Inspirations
1. Architecture
1. How it changed the development flow?

---
# Sample Code

- yoching/iOSAppArchitectureSample [^1]

[^1]: https://github.com/yoching/iOSAppArchitectureSample

---
# Coordinator Pattern [^2] [^3]

- Basic idea: extract transition logics from VC
  (do not write `present(UIViewController)`, `pushViewController` **inside** UIViewController)
- Objects to handle transition = Coordinator
- View Controllers can be isolated each other -> DI friendly
- Other names: Router (in VIPER), Wireframe, Navigation, ...


<!-- - With this pattern, View Controllers can be isolated each other -> Dependency Injection -->

[^2]: https://speakerdeck.com/yoching/hua-mian-qian-yi-falseguan-li-tomvvm

[^3]: https://speakerdeck.com/yoching/coordinatorpatanfalseshi-jian

---
![inline](./images/CoordinatorExample.png)

---
# Problems of this pattern

- 2 tasks in Coordinator
 - View Transition
 - Dependency Injection

- hard to test
- cannot replace with stub objects

---
# Inspirations

- Minimizing Decision Fatigue to Improve Team Productivity @ try! swift 2017 [^4]
  - **Application / UI / Components** (Project Organization)
- Dependency Injection  @ wikipedia [^5]
  - Manual DI / Automatic DI (DI container)
- Deep Linking at Kickstarter @ SwiftTalk [^6]
  - *Routing* logics


[^4]: https://www.slideshare.net/DerekLee/minimizing-decision-fatigue-to-improve-team-productivity

[^5]: https://ja.wikipedia.org/wiki/%E4%BE%9D%E5%AD%98%E6%80%A7%E3%81%AE%E6%B3%A8%E5%85%A5

[^6]: https://talk.objc.io/episodes/S01E49-deep-linking-at-kickstarter


---
# Architecture

![inline fill](./images/Architecture.png)

---
# 2 Types of Objects

- Runtime Objects
  - several objects for app runtime
  - testable (all dependencies are injected)
- Dependency Management
  - doing Dependency Injection
  - no need to test (like setting file)

---
# Sample Projects

- yoching/iOSAppArchitectureSample [^1]

---
# More Practical sample

- yoching/JSONPlaceholderViewer [^7]

  - persistance using CoreData
  - networking
  - ReactiveSwift

[^7]: https://github.com/yoching/JSONPlaceholderViewer

---
# Development Workflow

| situation | workflow |
| --- | --- |
| make service | make service<br>-> update `components` |
| make view | make VC & VM <br>-> make function at `ViewFactory` |
| make transition | update `coordinator` |

---
# Result

- Coordinator: only view transition
- Factory & Components: Dependency Injection
- No Singleton😄
- *App / Components / UI* is good for object organizing (not only folder structures)

---
# Thank you!

---
# Connecting View Controllers [^8]

```swift
let nc = window?.rootViewController as! UINavigationController
let episodesVC = nc.viewControllers[0] as! EpisodesViewController

let storyboard = UIStoryboard(name: "Main", bundle: nil)

episodesVC.didSelect = { episode in
    let detailVC = storyboard.instantiateViewControllerWithIdentifier("Detail")
                       as! DetailViewController
    detailVC.episode = episode
    nc.pushViewController(detailVC, animated: true)
}
```

- presentation logics are **outside** of view controller

[^8]: https://talk.objc.io/episodes/S01E05-connecting-view-controllers

---
# Coordinator Pattern [^2] [^3]

- Objects to handle transition = Coordinator
- View Controllers can be isolated each other -> DI friendly
- Other names: Router (in VIPER), Wireframe, Navigation, ...

<!-- - Problem: 2 responsibilities (View Transition & View Creation) -->

<!-- - With this pattern, View Controllers can be isolated each other -> Dependency Injection -->

[^2]: https://speakerdeck.com/yoching/hua-mian-qian-yi-falseguan-li-tomvvm

[^3]: https://speakerdeck.com/yoching/coordinatorpatanfalseshi-jian

---
# More commonized way

```swift
// in ViewController
enum EpisodesRoute {
    case detail(Episode)
}
protocol EpisodesRouting: class {
    var routeSelected: ((EpisodesRoute) -> Void)? { get set }
}
class EpisodesViewController: UIViewController, EpisodesRouting {
    var routeSelected: ((EpisodesRoute) -> Void)?
}

// in Coordinator
episodesVC.routeSelected = { route in
    switch route {
    case .detail(let episode):
        // present detail
    }
}
```

---
![inline](./images/CoordinatorExample.png)

---
# Coordinator Pattern problems

- 2 tasks in Coordinator
 - view transition
 - view creation

- lots of dependencies

---
# Goal

- All dependencies are injected from outside

- Coordinator doesn't do view creation

- Organized project


---
# Goal

- All dependencies are injected from outside
  -> make Dependency Management Object
- Coordinator doesn't do view creation
  -> make `ViewFactory`, `CoordinatorFactory`
- Organized project
  -> Application / UI / Component
