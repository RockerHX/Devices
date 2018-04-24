[![Devices](https://github.com/RockerHX/Devices/blob/master/Source/Asset/Devices%20Logo.png?raw=true)](https://github.com/RockerHX/Devices)

[![Version](https://img.shields.io/cocoapods/v/Devices.svg)](http://cocoapods.org/pods/Devices)
![Swift3.2](https://img.shields.io/badge/Swift-3.2-orange.svg?style=flat)
![Swift4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
![Swift4.1](https://img.shields.io/badge/Swift-4.1-orange.svg?style=flat)
![Xcode](https://img.shields.io/badge/Xcode-9.0-orange.svg?style=flat)
[![Platform](https://img.shields.io/cocoapods/p/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)
![Supported](https://img.shields.io/badge/Supported-iOS9%20%7C%20OSX%2010.11%20%7C%20tvOS%209.0%20%7C%20watchOS%202.0-4BC51D.svg?style=flat)
[![License](https://img.shields.io/cocoapods/l/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)

## Features

- [x] Device identification
- [x] Device family detection
- [x] Device model detection
- [x] Device size detection
- [x] Device group detection
- [x] Simulator detection
- [x] Brightness detection
- [x] Battery detection
- [x] Equatable

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
    case .simulator(.iPhoneX):
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

### Brightness
Apple not provide api to get brightness on tvOS and watchOS, and if you want change watchOS's device brightness will be rejected.
So, brightness api can only support iOS and OSX platform.
iOS Simple code:
```swift
func iOSBrightness() {
    print("Device.brightness: \(Device.brightness)")
    Device.brightness = 0.8
}

```
OSX Simple code:
```swift
func OSXBrightness() {
    print("Device.Brightness.level: \(Device.Brightness.level)")
    Device.Brightness.level = .level_5
    Device.Brightness.level = .custom(0.5)
}
```

### Battery

iOS Simple code:
```swift
func iOSBattery() {
    print(Device.Battery.state)
    let batteryState = Device.Battery.state

    switch batteryState {
    case .full:
        print("Your battery is happy! 😊")
    case .charging(let level):
        print("Your battery level: \(level)")
    case .unplugged(let level):
        print("Your battery level: \(level)")
    }

    if Device.Battery.lowPowerMode {
        print("Low Power mode is enabled! 🔋")
    } else {
        print("Low Power mode is disabled! 😊")
    }

    guard batteryState < .charging(80) else {
        print("Your battery is happy! 😊")
        return
    }
}
```

### Project

iOS Simple code:
```swift
func iOSApplication() {
    print("Build: \(Device.Application.shared.build)")
    print("Version: \(Device.Application.shared.version)")
    print("wholeVersion: \(Device.Application.shared.wholeVersion)")
    print("firstLanuch: \(Device.Application.shared.firstLanuch)")
}
```


## OSX
[OSX Demo Code](/Document/OSX/OSX.md)

## tvOS
[tvOS Demo Code](/Document/tvOS/tvOS.md)

## watchOS
[watchOS Demo Code](/Document/watchOS/watchOS.md)

# License

Device is available under the MIT license. See the LICENSE file for more info.
