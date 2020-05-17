



![EasySwiftLayout](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Resources/Logo.png?raw=true)

[![Platform](https://img.shields.io/cocoapods/p/EasySwiftLayout.svg?color=yellow)](https://github.com/denandreychuk/EasySwiftLayout)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/EasySwiftLayout.svg?color=yellow)](https://cocoapods.org/pods/EasySwiftLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?color=yellow)](https://github.com/Carthage/Carthage)

I am glad to share with you a lightweight Swift framework for Apple's Auto-Layout. It helps you write readable and compact UI code using simple API. 

At first, it was only a few extenstions of `UIView` desiged for some of my commercial projects, but eventually code continued to grow, so I decided to move it to a seperate framework. I hope some of you find it helpful, so feel free to share your feedback and give some stars to EasySwiftLayout!

If you want to report bug or request new feature - open a ticket. I will try my best to cover them as soon as posible.

## Contents

- [Requirements](#requirements)
- [Documentation](#documentation)
- [Installation](#installation)
- [Usage](#usage)
- [API Cheat Sheet](#api-cheat-sheet)
- [License](#license)

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 4+

## Documentation

All methods in EasySwiftLayout designed to be self-explaining, but at the same time all of them includes detail description of usage. You can check it both in code by pressing `⌥` key and clicking on the method, and in our [API Cheat Sheet](#api-cheat-sheet) section down below.

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
- Move this file to your project folder.
- Select your application in the Project Navigator (blue icon) to navigate to the target configuration window.
- Select the desired target under the "Targets" heading in the sidebar.
- In "General" tab click on the `+` button under the "Embedded Binaries" section (in Xcode 11 it calls `Frameworks, Libraries, and Embedded Content`) and select moved `EasySwiftLayout.framework` file.
- Done.

  > The `EasySwiftLayout.framework` is automatically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

## Usage

### Quick Start

```swift
import EasySwiftLayout

class ViewController: UIViewController {
    private let boxView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAndLayoutSubviews()
    }
    
    private func addAndLayoutSubviews() {
        view.addSubview(boxView)
        
        boxView
            .centerInSuperview()
            .size(toSquareWithSide: 50)
    }
}
```

### Example

<img src="https://github.com/denandreychuk/EasySwiftLayout/blob/denis_example/Resources/Example.jpg?raw=true" width="125">

EasySwiftLayout comes with project example. You can check out how easily you can create screens like this with ESL.

- Navigate to the project folder and open `EasySwiftLayout.xcodeproj`.
- Select scheme `Example-IOS` by pressing `^ + 0` and just run it on any device.

## API Cheat Sheet

### `UIView` Extenstions:

#### Size Methods (Constants)

<details>
<summary><code>width(_:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the width of the view using the specified type of relation to the given size with the priority of the constraint.

##### Declaration

```swift
func width(_ width: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints the width anchor using `NSLayoutConstraint`.

- To make Auto-Layout works properly, it automatically sets view
property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Pass size greater than zero, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
width | `CGFloat` | The value to set this view width to.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>height(_:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the height of the view using the specified type of relation to the given size with the priority of the constraint.

##### Declaration

```swift
func height(_ height: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints the height anchor using `NSLayoutConstraint`.

- To make Auto-Layout works properly, it automatically sets view
property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Pass size greater than zero, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
height | `CGFloat` | The value to set this view height to.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>size(_:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the dimensions of the view using the specified type of relation to the given size with the priority of the constraint.

##### Declaration

```swift
func size(_ size: CGSize, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints the height and width anchors using `NSLayoutConstraint`

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Pass size greater than zero, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
size | `CGSize` | The size to set this view dimensions to.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>size(toSquareWithSide:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the dimensions of the view to a square with the side using the specified type of relation to the given size with the priority of the constraint.

##### Declaration

```swift
func size(toSquareWithSide side: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints width and height anchors using `NSLayoutConstraint` to match square size.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Pass side greater than zero, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
side | `CGFloat` | Square side to set this view dimensions to.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

#### Size Methods (Another view)

<details>
<summary><code>width(match:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the width of the view using the specified type of relation to the width of another view with the inset and priority of the constraint.

##### Declaration

```swift
func width(match anotherView: UIView, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints width and height anchors using `NSLayoutConstraint` to match square size.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | Another view to set this view width to.
inset | `CGFloat` | The value to inset (or shrunk) the width. Negative value cause the width to be outset (or expanded).
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>height(match:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the height of the view using the specified type of relation to the height of another view with the inset and priority of the constraint.

##### Declaration

```swift
func height(match anotherView: UIView, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints width and height anchors using `NSLayoutConstraint` to match square size.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | Another view to set this view height to.
inset | `CGFloat` | The value to inset (or shrunk) the height. Negative value cause the height to be outset (or expanded).
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>size(match:withInsets:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the size of the view using the specified type of relation to the size of another view with the insets and priority of the constraints.

##### Declaration

```swift
func size(match anotherView: UIView, withInsets insets: ESLSizeInsets = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints width and height anchors using `NSLayoutConstraint` to match square size.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | Another view to set this view height to.
insets | `ESLSizeInsets` | The values to inset (or shrunk) the size. Negative values cause the size to be outset (or expanded).
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

<details>
<summary><code>size(match:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Sets the size of the view using the specified type of relation to the size of another view with the insets and priority of the constraints.

##### Declaration

```swift
func size(match anotherView: UIView, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Constraints width and height anchors using `NSLayoutConstraint` to match square size.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | Another view to set this view height to.
inset | `CGFloat` | The value to inset (or shrunk) the size. Negative value cause the size to be outset (or expanded).
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Size.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Size.swift)

</details>

#### Pin Methods

<details>
<summary><code>pin(topTo:leftTo:bottomTo:rightTo:withInsets:priority:)</code></summary>
  
##### Summary

Pins the edges to the given NSLayoutAxisAnchors with the insets and priority of the constraints.

##### Declaration

```swift
func pin(topTo top: NSLayoutYAxisAnchor? = nil, leftTo left: NSLayoutXAxisAnchor? = nil, bottomTo bottom: NSLayoutYAxisAnchor? = nil, rightTo right: NSLayoutXAxisAnchor? = nil, withInsets insets: UIEdgeInsets = .zero, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Compact version of default Swift layout. Allows you to pin edges to specific `NSLayoutAxisAnchor`.

- To make Auto-Layout works properly, it automatically sets view’s property  `translatesAutoresizingMaskIntoConstraints`  to  `false`

##### Precondition

You should pass at least one anchor, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
top  | `NSLayoutYAxisAnchor` | The anchor to pin top to.
left  | `NSLayoutXAxisAnchor` | The anchor to pin left to.
bottom | `NSLayoutYAxisAnchor` | The anchor to pin bottom to.
right | `NSLayoutXAxisAnchor` | The anchor to pin right to.
insets | `UIEdgeInsets` | The insets between the edges.
priority | `UILayoutPriority` | The priority of the constraints.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In

[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdge(_:toEdge:ofView:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edge of the view using the specified type of relation to the given edge of another view with the inset and priority of the constraint.

##### Declaration

```swift
func pinEdge(_ edge: ESLEdge, toEdge pinningEdge: ESLEdge, ofView anotherView: UIView, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Consider, accordingly to [Apple's documentation](https://apple.co/2PFH9f2), you cannot pin edges with different axis, otherwise it will throw fatal error.

- To make Auto-Layout works properly, it automatically sets view’s property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

- Another view must be in the same view hierarchy as this view.

- Pin edges with same axis or method will throw fatal error.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
pinningEdge  | `ESLEdge` | The edge of another view to pin to.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
inset | `CGFloat` | The inset between the edge of this view and the edge of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdge(_:toSameEdgeOfView:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edge of the view using the specified type of relation to the corresponding margin of another view with the inset and priority of the constraint.

##### Declaration

```swift
func pinEdge(_ edge: ESLEdge, toSameEdgeOfView anotherView: UIView, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view’s property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
inset | `CGFloat` | The inset beetween the edge of this view and the corresponding edge of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(_:toSameEdgesOfView:withInsets:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of another view with the insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView anotherView: UIView, withInsets insets: UIEdgeInsets = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you need to customize the insets based on the edge, use `pinEdges(_:toSameEdgesOfView:withInset:usingRelation:priority:)`.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
insets | `UIEdgeInsets` | The insets beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(_:toSameEdgesOfView:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of another view with the equal insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfView anotherView: UIView, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you don’t need to customize the insets based on the edge, use `pinEdges(_:toSameEdgesOfView:withInsets:usingRelation:priority:)`.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
insets | `CGFloat` | The inset beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(ofGroup:toSameEdgesOfView:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins edges of the view of the given group using the specified type of relation to the corresponding margins of another view with the equal insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(ofGroup edgeGroup: ESLEdgeGroup, toSameEdgesOfView anotherView: UIView, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edgeGroup  | `ESLEdgeGroup` | The group of edges of this view to pin to.
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
insets | `CGFloat` | The inset beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(toSameEdgesOfView:excludingEdge:withInsets:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of another view with the insets and priority of the constraints, excluding one edge

##### Declaration

```swift
func pinEdges(toSameEdgesOfView anotherView: UIView, excludingEdge excludedEdge: ESLEdge, withInsets insets: UIEdgeInsets = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you don’t need to customize the insets based on the edge, use `pinEdges(toSameEdgesOfView:excludingEdge:withInset:usingRelation:priority:)`.
- 
- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
insets | `UIEdgeInsets` | The insets beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(toSameEdgesOfView:excludingEdge:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of another view with the equal inset and priority of the constraints, excluding one edge.

##### Declaration

```swift
func pinEdges(toSameEdgesOfView anotherView: UIView, excludingEdge excludedEdge: ESLEdge, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you need to customize the insets based on the edge, use `pinEdges(toSameEdgesOfView:excludingEdge:withInsets:usingRelation:priority:)`.
- 
- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `NSLayoutYAxisAnchor` | Another view to pin to.
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
inset | `CGFloat` | The inset beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdge(_:toEdge:ofGuide:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edge of the view using the specified type of relation to the given edge of guide with the inset and priority of the constraint.

##### Declaration

```swift
func pinEdge(_ edge: ESLEdge, toEdge pinningEdge: ESLEdge, ofGuide guide: ESLGuide, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Consider, accordingly to [Apple's documentation](https://apple.co/2PFH9f2), you cannot pin edges with different axis, otherwise it will throw fatal error.

- To make Auto-Layout works properly, it automatically sets view’s property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

Pin edges with same axis or method will throw fatal error.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
pinningEdge  | `ESLEdge` | The edge of another view to pin to.
guide | `ESLGuide` | The guide to pin to..
inset | `CGFloat` | The inset between the edge of this view and the edge of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdge(_:toSameEdgeOfGuide:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edge of the view using the specified type of relation to the corresponding margin of guide with the inset and priority of the constraint.

##### Declaration

```swift
func pinEdge(_ edge: ESLEdge, toSameEdgeOfGuide guide: ESLGuide, withInset inset: CGFloat = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view’s property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
guide | `ESLGuide` | The guide to pin to.
inset | `CGFloat` | The inset beetween the edge of this view and the corresponding edge of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(_:toSameEdgesOfGuide:withInsets:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of guide with the insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfGuide guide: ESLGuide, withInsets insets: UIEdgeInsets = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you need to customize the insets based on the edge, use `pinEdges(_:toSameEdgesOfGuide:withInset:usingRelation:priority:)`.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
guide | `ESLGuide` | The guide to pin to..
insets | `UIEdgeInsets` | The insets beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(_:toSameEdgesOfGuide:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of guide with the equal insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(_ edges: [ESLEdge] = ESLEdge.all, toSameEdgesOfGuide guide: ESLGuide, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you don’t need to customize the insets based on the edge, use `pinEdges(_:toSameEdgesOfGuide:withInsets:usingRelation:priority:)`.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
guide | `ESLGuide` | The guide to pin to.
insets | `CGFloat` | The inset beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(ofGroup:toSameEdgesOfGuide:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins edges of the view of the given group using the specified type of relation to the corresponding margins of guide with the equal insets and priority of the constraints.

##### Declaration

```swift
func pinEdges(ofGroup edgeGroup: ESLEdgeGroup, toSameEdgesOfGuide guide: ESLGuide, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edgeGroup  | `ESLEdgeGroup` | The group of edges of this view to pin to.
guide | `ESLGuide` | The guide to pin to.
insets | `CGFloat` | The inset beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(toSameEdgesOfGuide:excludingEdge:withInsets:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of guide with the insets and priority of the constraints, excluding one edge.

##### Declaration

```swift
func pinEdges(toSameEdgesOfGuide guide: ESLGuide, excludingEdge excludedEdge: ESLEdge, withInsets insets: UIEdgeInsets = .zero, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you don’t need to customize the insets based on the edge, use `pinEdges(toSameEdgesOfGuide:excludingEdge:withInset:usingRelation:priority:)`.
- 
- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
guide | `ESLGuide` | The guide to pin to.
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
insets | `UIEdgeInsets` | The insets beetween the edges of this view and corresponding edges of another view.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

<details>
<summary><code>pinEdges(toSameEdgesOfGuide:excludingEdge:withInset:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of guide with the equal inset and priority of the constraints, excluding one edge.

##### Declaration

```swift
func pinEdges(toSameEdgesOfGuide guide: ESLGuide, excludingEdge excludedEdge: ESLEdge, withInset inset: CGFloat, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- If you need to customize the inset based on the edge, use `pinEdges(toSameEdgesOfGuide:excludingEdge:withInsets:usingRelation:priority:)`.
- 
- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
guide | `ESLGuide` | The guide to pin to.
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
inset | `CGFloat` | The inset beetween the edges of this view and corresponding edges of guide.
relation | `NSLayoutConstraint.Relation` | The type of relationship for the constraints.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin.swift)

</details>

#### Pin to Superview Methods

Just to remind, let's say you have a view called `MyView`, which has a `UIButton`(loginButton) over it. In this case, `MyView` is a `superview` for `loginButton` and `loginButton` is a subview of `MyView`.

<details>
<summary><code>pinEdge(_:toSuperviewEdge:withInset:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edge of the view using the specified type of relation to the given edge of its superview with the inset and priority of the constraint. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdge(_ edge: ESLEdge, toSuperviewEdge superviewEdge: ESLEdge, withInset inset: CGFloat = .zero, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

- Consider, accordingly to [Apple's documentation](https://apple.co/2PFH9f2), you cannot pin edges with different axis, otherwise it will throw fatal error.

- Use this method only if you want to pin the edge of the view to the opposite margin of its superview, in other cases `pinEdgeToSuperview(_:withInset:usingRelation:priority:)` would be a better approach.

- To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

- The view should have the superview, otherwise method will have no effect.

- Pin edges with same axis or method will throw fatal error.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
superviewEdge | `ESLEdge` | The edge of its superview to pin to.
inset | `CGFloat` | The inset between the edge of this view and the edge of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgeToSuperview(_:withInset:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edge of the view using the specified type of relation to the corresponding margin of its superview with the inset and priority of the constraint. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgeToSuperview(_ edge: ESLEdge, withInset inset: CGFloat = .zero, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edge  | `ESLEdge` | The edge of this view to pin.
inset | `CGFloat` | The inset beetween the edge of this view and the corresponding edge of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgesToSuperview(_:withInsets:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of its superview with the insets and priority of the constraints. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgesToSuperview(_ edges: [ESLEdge] = ESLEdge.all, withInsets insets: UIEdgeInsets = .zero, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

1. If you don't need to customize the insets based on the edge, use `pinEdgesToSuperview(_:withInset:usingRelation:priority:)`.

2. To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
insets | `UIEdgeInsets` | The insets beetween the edges of this view and the corresponding edges of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgesToSuperview(_:withInset:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the given edges of the view using the specified type of relation to the corresponding margins of its superview with the equal insets and priority of the constraints. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgesToSuperview(_ edges: [ESLEdge] = ESLEdge.all, withInset inset: CGFloat, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

1. If you need to customize the insets based on the edge, use `pinEdgesToSuperview(_:withInsets:usingRelation:priority:)`.

2. To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
edges  | `[ESLEdge]` | The edges of this view to pin.
inset | `CGFloat` | The inset beetween the edges of this view and the orresponding edges of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgesToSuperview(ofGroup:withInset:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins edges of the view of the given group using the specified type of relation to the corresponding margins of its superview with the equal insets and priority of the constraints. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgesToSuperview(ofGroup group: ESLEdgeGroup, withInset inset: CGFloat = .zero, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
group | `ESLEdgeGroup` | The group of edges of this view to pin to.
inset | `CGFloat` | The inset beetween the edges of this view and the orresponding edges of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgesToSuperview(excludingEdge:withInsets:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of its superview with the insets and priority of the constraints, excluding one edge. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgesToSuperview(excludingEdge excludedEdge: ESLEdge, withInsets insets: UIEdgeInsets = .zero, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

1. If you don't need to customize the insets based on the edge, use `pinEdgesToSuperview(excludingEdge:withInset:usingRelation:priority:)`.

2. To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
insets | `UIEdgeInsets` | The insets beetween the edges of this view and the orresponding edges of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

<details>
<summary><code>pinEdgesToSuperview(excludingEdge:withInset:respectingGuide:usingRelation:priority:)</code></summary>
  
##### Summary

Pins the edges of the view using the specified type of relation to the corresponding margins of its superview with the equal inset and priority of the constraints, excluding one edge. Optionally respects one of pre-defined Apple's layout guides.

##### Declaration

```swift
func pinEdgesToSuperview(excludingEdge excludedEdge: ESLEdge, withInset inset: CGFloat, respectingGuide guide: ESLSuperviewGuide = .none, usingRelation relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

1. If you need to customize the insets based on the edge, use `pinEdgesToSuperview(excludingEdge:withInset:usingRelation:priority:)`.

2. To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`.

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
excludedEdge | `ESLEdge` | The edge to be ingored and not pinned.
inset | `CGFloat` | The inset beetween the edges of this view and the orresponding edges of its superview.
guide | `ESLSuperviewGuide` | The guide to respect in layout.
relation | `NSLayoutConstraint.Relation` | The type of relationship for constraint.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Pin(Superview).swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Pin(Superview).swift)

</details>

#### Center Methods

<details>
<summary><code>centerInView(_:withOffset:priority:)</code></summary>
  
##### Summary

Centers the view in another view with the offset and priority of the constraint.

##### Declaration

```swift
func centerInView(_ anotherView: UIView, withOffset offset: ESLOffset = .zero, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | Another view to center in.
offset | `ESLOffset` | Axis offset.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Center.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Center.swift)

</details>

<details>
<summary><code>centerInView(_:axis:withOffset:priority:)</code></summary>
  
##### Summary

Centers the axis of this view in another view with the offset and priority of the constraint.

##### Declaration

```swift
func centerInView(_ anotherView: UIView, axis: ESLAxis, withOffset offset: CGFloat = .zero, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

Another view must be in the same view hierarchy as this view.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
anotherView | `UIView` | View to center in.
axis | `ESLAxis` | Axis to center
offset | `ESLOffset` | Axis offset.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Center.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Center.swift)

</details>

<details>
<summary><code>centerInSuperview(withOffset:priority:)</code></summary>
  
##### Summary

Centers the view in its superview view with the offset and priority of the constraint.

##### Declaration

```swift
func centerInSuperview(withOffset offset: ESLOffset = .zero, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
offset | `ESLOffset` | Axis offset.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Center.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Center.swift)

</details>

<details>
<summary><code>centerInSuperview(axis:withOffset:priority:)</code></summary>
  
##### Summary

Centers the axis of this view in its superview with the offset and priority of the constraint.

##### Declaration

```swift
func centerInSuperview(axis: ESLAxis, withOffset offset: CGFloat = .zero, priority: UILayoutPriority = .required) -> Self
```

##### Discussion

To make Auto-Layout works properly, it automatically sets view property `translatesAutoresizingMaskIntoConstraints` to `false`

##### Precondition

The view should have the superview, otherwise this method will have no effect.

##### Parameters

Parameter  | Type | Description
---------- | ---- |------------
axis | `ESLAxis` | Axis to center.
offset | `CGFloat | Axis offset.
priority | `UILayoutPriority` | The priority of the constraint.

##### Returns

`self`  with attribute  `@discardableResult`.

##### Declared In
[UIView + Center.swift](https://github.com/denandreychuk/EasySwiftLayout/blob/master/Source/UIView%20%2B%20Center.swift)

</details>

## License

EasySwiftLayout is released under the MIT license. [See LICENSE](https://github.com/denandreychuk/EasySwiftLayout/blob/master/LICENSE) for details.
