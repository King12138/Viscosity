# Viscosity
![swift version](https://img.shields.io/badge/Language-Swift3-blue.svg)
[![travis-ci](https://travis-ci.org/Wzxhaha/Viscosity.svg?branch=master)](https://travis-ci.org/Wzxhaha/Viscosity)
[![Platform](https://img.shields.io/cocoapods/p/Viscosity.svg?style=flat)](https://github.com/Wzxhaha/Viscosity)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/Viscosity.svg)](https://cocoapods.org/pods/Viscosity)
<br/>
Autolayout DSL for iOS, simple and powerful.

## Requirements
- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+

## Able to do
- Support mode: normal, update and remake.
- Support All `NSLayoutAttribute`
- Support `center` and `edges`
- And a lot of powerful usage, You can look at the `examples` in the file

## Usage

### Normal

```swift
 view.vis_makeConstraints { (make) in
   make.left.equalTo(view.vis_right).offset(100).multiplier(2).priority(10)
   make.size.lessThanOrEqualTo(100).priority(10)
 }
```

```swift
 view.vis_makeConstraints { (make) in
   make[.left, .right, .top].equalTo(view)
   make.height.equalTo(100)
 }
```

### Update

```swift
 view.vis_updateConstraints { (make) in
   make.left.equalTo(view).offset(100)
 }
```

### Remake
```swift
 view.vis_remakeConstraints { (make) in
   make.left.equalTo(view).offset(100)
 }
```

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Viscosity into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target '<Your Target Name>' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'Viscosity', '~> 1.1'

end
```

Then, run the following command:

```bash
$ pod install
```

## Contact me
Email: `wzxjiang@foxmail.com`

## License
Viscosity is released under the MIT license. See LICENSE for details.
