### Device screen size

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