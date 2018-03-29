### Device screen size

```swift
func OSXDeviceSize() {
    let size = Device.size()
    switch size {
    case .screen11Inch:
        print("Device size: \(size.description)")
    case .screen12Inch:
        print("Device size: \(size.description)")
    case .screen13Inch:
        print("Device size: \(size.description)")
    case .screen15Inch:
        print("Device size: \(size.description)")
    case .screen17Inch:
        print("Device size: \(size.description)")
    case .screen20Inch:
        print("Device size: \(size.description)")
    case .screen21_5Inch:
        print("Device size: \(size.description)")
    case .screen24Inch:
        print("Device size: \(size.description)")
    case .screen27Inch:
        print("Device size: \(size.description)")
    case .unknown:
        print("Device size unknown.")
    }
}
```