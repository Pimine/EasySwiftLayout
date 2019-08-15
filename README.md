###EasySwiftLayout

Easy Swift Layout - simple lightweight Swift framework. It creates a great API for `UIView` as well as some methods and types which will helps you build UI using Apple's AutoLayout in more effient way.

####Usage :

Initialize the view using `setupForAutoLayout()` method:
```swift
let view = UIView().setupForAutoLayout()
```

Pin all 4 edges in just one line:
```swift
//To superview:
view.pinToSuperview([.left, .right])

//Custom view:
view.pin([.left,. .rihgt], toSameEdgesOfView: someView)
```

Pin edge to some view:
```swift
view.pin(.top, toEdge: .bottom, ofView: someView)
```

Center element by Y axis in view:
```swift
//In superview:
view.centerInSuperview(.y)

//Custom view:
view.centerInView(someView, axis: .y)
```
