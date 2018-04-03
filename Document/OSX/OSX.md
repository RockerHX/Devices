### Device family

Simple code:
```swift
func OSXDeviceFamily() {
    let family = Device.family()
    switch family {
    case .MacBookPro:
        print("Device belong to \(family) family")
    default:
        print("unknown Device.")
    }
}
```
Demo code:
[Family Demo Code](../Family.md)

### Device model

Simple code:
```swift
func OSXDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
    case .MacPro2017Early:
        print("Device is a \(model)")
    case .unknown:
        print("unknown Device.")
    }
}
```
Demo code:
[Model Demo Code](../Model.md)

### Device screen size

Simple code:
```swift
func OSXDeviceSize() {
    let size = Device.size()
    switch size {
    case .screen15Inch:
        print("Device size: \(size.description)")
    case .unknown:
        print("Device size unknown.")
    }
}
```
Demo code:
[Size Demo Code](../Size.md)

## Helpers

### Model

Simple code:
```swift
func OSXModelHelper() {
    let model = Device.model()
    let allMacBookProes = Device.Model.allMacBookProes
    if allMacBookProes.contains(model) {
        print("Current device belong to MacBookPro ")
    }
}
```
Demo code:
[Model Helper Demo Code](../ModelHelper.md)

### Size
You can use operator like `>`, `<`, `>=`, `<=`, `==`, `!=`

Simple code:
```swift
func OSXSizeHelper() {
    let size = Device.size()

    if size == .screen15Inch {
        print("It's a 15 inch screen")
    }

    if Device.isRetina() {
        print("It's a retina display")
    }
}
```
Demo code:
[Size Helper Demo Code](../SizeHelper.md)
