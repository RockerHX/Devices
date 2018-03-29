### Device family

```swift
func OSXDeviceFamily() {
    let family = Device.family()
    switch family {
    case .MacMini:
        print("Device belong to \(family) family")
    case .MacBookAir:
        print("Device belong to \(family) family")
    case .MacBook:
        print("Device belong to \(family) family")
    case .MacBookPro:
        print("Device belong to \(family) family")
    case .iMac:
        print("Device belong to \(family) family")
    case .iMacPro:
        print("Device belong to \(family) family")
    case .MacPro:
        print("Device belong to \(family) family")
    case .XServe:
        print("Device belong to \(family) family")
    default:
        print("unknown Device.")
    }
}
```