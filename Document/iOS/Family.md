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