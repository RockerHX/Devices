### Device model

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

or simulator

```swift
switch Device.model() {
case .simulator(.iPhone8):
    print("iPhone8")
default:
    print("other device.")
}
```