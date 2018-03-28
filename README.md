[![Devices](https://github.com/RockerHX/Devices/blob/master/Source/Asset/Devices%20Logo.png?raw=true)](https://github.com/RockerHX/Devices)

[![Version](https://img.shields.io/cocoapods/v/Devices.svg)](http://cocoapods.org/pods/Devices)
![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
![Xcode](https://img.shields.io/badge/Xcode-9.0-orange.svg?style=flat)
[![Platform](https://img.shields.io/cocoapods/p/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)
![Supported](https://img.shields.io/badge/Supported-iOS9%20%7C%20OSX%2010.11%20%7C%20tvOS%209.0%20%7C%20watchOS%201.0-4BC51D.svg?style=flat)
[![License](https://img.shields.io/cocoapods/l/Devices.svg?style=flat)](http://cocoapods.org/pods/Devices)

Devices can detect the current  device family, model and screen size.

# Installation
## CocoaPods
Devices is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Devices"
```

# Usage
## iOS
### Device family
```swift
func iOSDeviceFamily() {
    let family = Device.family()
    switch family {
    case .iPodtouch:
        print("Device belong to \(family) family")
    case .iPhone:
        print("Device belong to \(family) family")
    case .iPad:
        print("Device belong to \(family) family")
    case .simulator:
        print("Device belong to \(family) family")
    case .unknown:
        print("unknown Device.")
    }
}
```

## Device model
```swift
func iOSDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
    /*** iPod ***/
    case .iPodTouch5Gen:
        print("Device is a \(model)")
    case .iPodTouch6Gen:
        print("Device is a \(model)")
    /*** iPhone ***/
    case .iPhone4:
        print("Device is a \(model)")
    case .iPhone4S:
        print("Device is a \(model)")
    case .iPhone5:
        print("Device is a \(model)")
    case .iPhone5C:
        print("Device is a \(model)")
    case .iPhone5S:
        print("Device is a \(model)")
    case .iPhone6:
        print("Device is a \(model)")
    case .iPhone6Plus:
        print("Device is a \(model)")
    case .iPhone6S:
        print("Device is a \(model)")
    case .iPhone6SPlus:
        print("Device is a \(model)")
    case .iPhoneSE:
        print("Device is a \(model)")
    case .iPhone7:
        print("Device is a \(model)")
    case .iPhone7Plus:
        print("Device is a \(model)")
    case .iPhone8:
        print("Device is a \(model)")
    case .iPhone8Plus:
        print("Device is a \(model)")
    case .iPhoneX:
        print("Device is a \(model)")
    /*** iPad ***/
    case .iPad3:
        print("Device is a \(model)")
    case .iPad4:
        print("Device is a \(model)")
    case .iPad5:
        print("Device is a \(model)")
    case .iPadAir:
        print("Device is a \(model)")
    case .iPadAir2:
        print("Device is a \(model)")
    case .iPadMini:
        print("Device is a \(model)")
    case .iPadMini2:
        print("Device is a \(model)")
    case .iPadMini3:
        print("Device is a \(model)")
    case .iPadMini4:
        print("Device is a \(model)")
    case .iPadPro9_7Inch:
        print("Device is a \(model)")
    case .iPadPro12_9Inch:
        print("Device is a \(model)")
    case .iPadPro12_9Inch2:
        print("Device is a \(model)")
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

## Device screen size
```swift
func iOSDeviceSize() {
    let size = Device.size()
    switch size {
    case .screen3_5Inch:
        print("Device size: \(size.description)")
    case .screen4Inch:
        print("Device size: \(size.description)")
    case .screen4_7Inch:
        print("Device size: \(size.description)")
    case .screen5_5Inch:
        print("Device size: \(size.description)")
    case .screen5_8Inch:
        print("Device size: \(size.description)")
    case .screen7_9Inch:
        print("Device size: \(size.description)")
    case .screen9_7Inch:
        print("Device size: \(size.description)")
    case .screen10_5Inch:
        print("Device size: \(size.description)")
    case .screen12_9Inch:
        print("Device size: \(size.description)")
    case .unknown:
        print("Device size unknown.")
    }
}
```

## Helpers
```swift
```

# License

Device is available under the MIT license. See the LICENSE file for more info.