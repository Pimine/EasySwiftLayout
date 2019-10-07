
![EasySwiftLayout](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Resources/Logo.png?raw=true)

[![Platform](https://img.shields.io/cocoapods/p/EasySwiftLayout.svg?color=yellow)](https://github.com/denandreychuk/EasySwiftLayout)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EasySwiftLayout.svg?color=yellow)](https://cocoapods.org/pods/EasySwiftLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?color=yellow)](https://github.com/Carthage/Carthage)

I am glad to share with you a lightweight Swift framework for Apple's Auto-Layout. It helps you write readable and compact UI code using simple API. 

At first, it was only a few extenstions of `UIView` desiged for some of my commercial projects, but eventually code continued to grow, so I decided to move it to a seperate framework. I hope some of you find it helpful, so feel free to share your feedback and give some stars to EasySwiftLayout!

If you want to report bug or request new feature - open a ticket. I will try my best to cover them as soon as posible.

## Contents

- [Requirements](#requirements)
- [Quick Overview](#quick-overview)
- [API Cheat Sheet](#api-cheat-sheet)
- [Installation](#installation)
- [License](#license)

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 4+

## Quick Overview

All methods in `EasySwiftLayout` designed to be self-explaining, but at the same time all of them includes detail description of usage. You can check it both in code by pressing `⌥` key and clicking on the method, and in our [API Cheat Sheet](#api-cheat-sheet) section down below.

## API Cheat Sheet

<details>
<summary>pin(topTo:leftTo:bottomTo:rightTo:withInsets:)</summary>
  
##### Summary

Pins edges to the given `NSLayoutAxisAnchor`s.

##### Declaration

```swift
func  pin(topTo  top: NSLayoutYAxisAnchor? = nil, leftTo  left: NSLayoutXAxisAnchor? = nil, bottomTo  bottom: NSLayoutYAxisAnchor? = nil, rightTo  right: NSLayoutXAxisAnchor? = nil, withInsets  insets: UIEdgeInsets = .zero) -> Self
```

##### Discussion

- Compact version of default Swift layout. Allows you to edges to specific  `NSLayoutAxisAnchor`.

- To make Auto-Layout works properly, it automatically sets view’s property  `translatesAutoresizingMaskIntoConstraints`  to  `false`

##### Precondition

You should pass at least one anchor, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
top  | `NSLayoutYAxisAnchor` | Anchor to pin top to.
left  | `NSLayoutXAxisAnchor` | Anchor to pin left to.
bottom | `NSLayoutYAxisAnchor` | Anchor to pin bottom to.
right | `NSLayoutXAxisAnchor` | Anchor to pin right to.
insets | `UIEdgeInsets` | Insets between edges.

##### Returns
`self`  with attribute  `@discardableResult`.

##### Declared In

[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary>pinEdge(_:toEdge:ofView:withInset:)</summary>
  
##### Summary

Pins edge to the given edge of another view with an inset.

##### Declaration

```swift
func  pinEdge(_  edge: ESLEdge, toEdge  pinningEdge: ESLEdge, ofView  anotherView: UIView, withInset  inset: CGFloat = .zero) -> Self
```

##### Discussion

- Consider, that you cannot pin edge to different axis, otherwise method will throw `fatalError()`. X-axis constraints are not compatible with y-axis.

- To make Auto-Layout works properly, it automatically sets view's property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

- Another view must be in the same view hierarchy as this view.

- Pin edges with same axis or method will throw `fatalError()`

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
pinningEdge  | `ESLEdge` | The edge of another view to pin to.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
inset | `CGFloat` | Inset between edge of this view and edge of another view.

##### Returns
`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary>pinEdge(_:toSameEdgeOfView:withInset:)</summary>
  
##### Summary

Pins the given edge of the view to the corresponding margin of another view with an inset.

##### Declaration

```swift
func  pinEdge(_  edge: ESLEdge, toSameEdgeOfView  anotherView: UIView, withInset  inset: CGFloat = .zero) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view's property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
inset | `CGFloat` | Inset between edge of this view and edge of another view.

##### Returns
`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary>pinEdges(_:toSameEdgesOfView:withInsets:)</summary>
  
##### Summary

Pins the given edges of the view to the corresponding margins of another view with insets.

##### Declaration

```swift
func  pinEdges(_  edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView  anotherView: UIView, withInsets  insets: UIEdgeInsets = .zero) -> Self
```

##### Discussion

- This method is intended to pin multiple edges, it is not recommended to use it for a single edge. For these purposes, `pinEdge(_:toSameEdgeOfView:withInset:)` would be a better approach.

- To make Auto-Layout works properly, it automatically sets view's property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
insets | `UIEdgeInsets` | Insets between edges of this view and corresponding edges of another view

##### Returns
`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate EasySwiftLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'EasySwiftLayout'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate EasySwiftLayout into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "denandreychuk/EasySwiftLayout"
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate EasySwiftLayout into your project manually.

#### Embedded Framework

- Clone this repo by running:
  ```bash
  $ git clone https://github.com/denandreychuk/EasySwiftLayout.git
  ```
- Navigate to the project folder and open `EasySwiftLayout.xcodeproj`.
- Select scheme `Build Framework` by pressing `^ + 0` and run it on any device. It will automatically generate for you `EasySwiftLayout.framework` file and open it in `Finder`.
- Move this file to your project folder. Open 
- Select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- Navigate to generated `EasySwiftLayout.framework` file and select it.
- And that's it!

  > The `EasySwiftLayout.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## License

EasySwiftLayout is released under the MIT license. [See LICENSE](https://github.com/denandreychuk/EasySwiftLayout/blob/master/LICENSE) for details.
