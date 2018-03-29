### Device screen size helper

```swift
func OSXModelHelper() {
    let model = Device.model()
    let allMacBookProes = Device.Model.allMacBookProes
    if allMacBookProes.contains(model) {
        print("Current device belong to MacBookPro ")
    }
}
```