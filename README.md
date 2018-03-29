[![Devices](https://github.com/RockerHX/Devices/blob/master/Source/Asset/Devices%20Logo.png?raw=true)](https://github.com/RockerHX/Devices)

[![Version](https://img.shields.io/cocoapods/v/Devices.svg)](http://cocoapods.org/pods/Devices)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
![Xcode](https://img.shields.io/badge/Xcode-9.0-orange.svg?style=flat)
[![Platform](https://img.shields.io/cocoapods/p/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)
![Supported](https://img.shields.io/badge/Supported-iOS9%20%7C%20OSX%2010.11%20%7C%20tvOS%209.0%20%7C%20watchOS%201.0-4BC51D.svg?style=flat)
[![License](https://img.shields.io/cocoapods/l/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)

# Installation
## CocoaPods
Devices is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Devices"
```

# Usage
First make sure to import the framework:
```swift
import Devices
```

## iOS

### Device family

Simple code:
```swift
func iOSDeviceFamily() {
    let family = Device.family()
    switch family {
    case .iPhone:
        print("Device belong to \(family) family")
    case .unknown:
        print("unknown Device.")
    }
}
```
Demo code:
[Family Demo Code](/Document/iOS/Family.md)

### Device model

Simple code:
```swift
func iOSDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
    /*** iPod ***/
    case .iPodTouch6Gen:
        print("Device is a \(model)")
    /*** iPhone ***/
    case .iPhoneX:
        print("Device is a \(model)")
    /*** iPad ***/
    case .iPadPro10_5Inch:
        print("Device is a \(model)")
    /*** HomePod ***/
    case .HomePod:
        print("Device is a \(model)")
    case .simulator(let model):
        print("Device is a \(model)")
    /*** unknown ***/
    case .unknown:
        print("unknown Device.")
    }
}
```
Demo code:
[Model Demo Code](/Document/iOS/Model.md)

### Device screen size

Simple code:
```swift
func iOSDeviceSize() {
    let size = Device.size()
    switch size {
    case .screen12_9Inch:
        print("Device size: \(size.description)")
    case .unknown:
        print("Device size unknown.")
    }
}
```
Demo code:
[Size Demo Code](/Document/iOS/Size.md)

## Helpers

### Model

Simple code:
```swift
func iOSModelHelper() {
    let model = Device.model()
    let allPhones = Device.Model.allPhones
    if allPhones.contains(model) {
        print("Current device belong to iPhone ")
    }
    let allSimulatorPhones = Device.Model.allSimulatorPhones
    if allSimulatorPhones.contains(model) {
        print("Current device belong to iPhone Simulator")
    }
}
```
Demo code:
[Model Helper Demo Code](/Document/iOS/ModelHelper.md)

### Size
You can use operator like `>`, `<`, `>=`, `<=`, `==`, `!=`

Simple code:
```swift
func iOSSizeHelper() {
    let size = Device.size()
    if size > .screen4_7Inch {
        print("Your device screen is larger than 4.7 inch")
    }

    if Device.isRetina() {
        print("It's a retina display")
    }
}
```
Demo code:
[Size Helper Demo Code](/Document/iOS/SizeHelper.md)

## OSX
[OSX Demo Code](/Document/OSX/OSX.md)

# License

Device is available under the MIT license. See the LICENSE file for more info.