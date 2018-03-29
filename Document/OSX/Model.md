### Device model

```swift
func OSXDeviceModel() {
    let model = Device.model()
    print(model.identifier)
    switch model {
    /*** Mac Mini ***/
    case .MacMini2012Late:
        print("Device is a \(model)")
    case .MacMini2014Late:
        print("Device is a \(model)")
    /*** MacBook Air ***/
    case .MacBookAir2012Mid:
        print("Device is a \(model)")
    case .MacBookAir2013MidAnd2014Early:
        print("Device is a \(model)")
    case .MacBookAir2015Early:
        print("Device is a \(model)")
    case .MacBookAir2017Mid:
        print("Device is a \(model)")
    /*** MacBook ***/
    case .MacBook2015Early:
        print("Device is a \(model)")
    case .MacBook2016Early:
        print("Device is a \(model)")
    case .MacBook2017Mid:
        print("Device is a \(model)")
    /*** MacBook Pro ***/
    case .MacBookPro2010Mid:
        print("Device is a \(model)")
    case .MacBookPro2011:
        print("Device is a \(model)")
    case .MacBookPro2012Mid:
        print("Device is a \(model)")
    /*** MacBook Pro Retina ***/
    case .MacBookProRetina2012Mid:
        print("Device is a \(model)")
    case .MacBookProRetina2012Late:
        print("Device is a \(model)")
    case .MacBookProRetina2014Mid:
        print("Device is a \(model)")
    case .MacBookProRetina2015Early:
        print("Device is a \(model)")
    case .MacBookProRetina2015Mid:
        print("Device is a \(model)")
    case .MacBookProRetina2016Late:
        print("Device is a \(model)")
    case .MacBookProRetina2017Mid:
        print("Device is a \(model)")
    /*** iMac ***/
    case .iMac2012Late:
        print("Device is a \(model)")
    case .iMac2013Late:
        print("Device is a \(model)")
    case .iMac2014Mid:
        print("Device is a \(model)")
    case .iMac2015Late:
        print("Device is a \(model)")
    case .iMac2017:
        print("Device is a \(model)")
    /*** iMac Retina ***/
    case .iMacRetina2014Late:
        print("Device is a \(model)")
    case .iMacRetina2015Late:
        print("Device is a \(model)")
    case .iMacRetina2017Mid:
        print("Device is a \(model)")
    /*** iMac Pro ***/
    case .iMacPro:
        print("Device is a \(model)")
    /*** Mac Pro ***/
    case .MacPro2012Mid:
        print("Device is a \(model)")
    case .MacPro2013Late:
        print("Device is a \(model)")
    case .MacPro2017Early:
        print("Device is a \(model)")
    case .simulator(let model):
        print("Device is a \(model)")
        /*** unknown ***/
    case .unknown:
        print("unknown Device.")
    }
}
```