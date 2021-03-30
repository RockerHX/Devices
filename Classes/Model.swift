//
//  Model.swift
//  Devices
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


extension Device {

    public enum Model {
        #if os(iOS)
        /*** iPod ***/
        case iPodTouch5Gen
        case iPodTouch6Gen
        case iPodTouch7Gen
        /*** iPhone ***/
        case iPhone4
        case iPhone4S
        case iPhone5
        case iPhone5C
        case iPhone5S
        case iPhone6
        case iPhone6Plus
        case iPhone6S
        case iPhone6SPlus
        case iPhoneSE
        case iPhone7
        case iPhone7Plus
        case iPhone8
        case iPhone8Plus
        case iPhoneX
        case iPhoneXR
        case iPhoneXS
        case iPhoneXSMax
        case iPhone11
        case iPhone11Pro
        case iPhone11ProMax
        case iPhoneSE2
        case iPhone12Mini
        case iPhone12
        case iPhone12Pro
        case iPhone12ProMax
        /*** iPad ***/
        case iPad3
        case iPad4
        case iPad5
        case iPad6
        case iPad7
        case iPad8
        case iPadAir
        case iPadAir2
        case iPadAir3
        case iPadAir4
        case iPadMini
        case iPadMini2
        case iPadMini3
        case iPadMini4
        case iPadMini5
        case iPadPro9_7Inch
        case iPadPro10_5Inch
        case iPadPro11Inch
        case iPadPro11Inch2
        case iPadPro12_9Inch
        case iPadPro12_9Inch2
        case iPadPro12_9Inch3
        case iPadPro12_9Inch4
        /*** HomePod ***/
        case HomePod
        #elseif os(OSX)
        /*** Mac Mini ***/
        case MacMini2012Late
        case MacMini2014Late
        /*** MacBook Air ***/
        case MacBookAir2012Mid
        case MacBookAir2013MidAnd2014Early
        case MacBookAir2015Early
        case MacBookAir2017Mid
        /*** MacBook ***/
        case MacBook2015Early
        case MacBook2016Early
        case MacBook2017Mid
        /*** MacBook Pro ***/
        case MacBookPro2010Mid
        case MacBookPro2011
        case MacBookPro2012Mid
        /*** MacBook Pro Retina ***/
        case MacBookProRetina2012Mid
        case MacBookProRetina2012Late
        case MacBookProRetina2014Mid
        case MacBookProRetina2015Early
        case MacBookProRetina2015Mid
        case MacBookProRetina2016Late
        case MacBookProRetina2017Mid
        /*** iMac ***/
        case iMac2012Late
        case iMac2013Late
        case iMac2014Mid
        case iMac2015Late
        case iMac2017
        /*** iMac Retina ***/
        case iMacRetina2014Late
        case iMacRetina2015Late
        case iMacRetina2017Mid
        /*** iMac Pro ***/
        case iMacPro
        /*** Mac Pro ***/
        case MacPro2012Mid
        case MacPro2013Late
        case MacPro2017Early
        #elseif os(tvOS)
        case AppleTV4Gen
        case AppleTV4K
        #elseif os(watchOS)
        case AppleWatch
        case AppleWatchSeries1
        case AppleWatchSeries2
        case AppleWatchSeries3
        case AppleWatchSeries4
        #endif
        /*** Simulator ***/
        indirect case simulator(Model)
        /*** unknown ***/
        case unknown
    }

}


#if os(OSX)
#else
import UIKit


extension Device {

    static fileprivate func simulatorCode() -> String? {
        return ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]
    }

}


#endif


// MARK: - Model Methods -
extension Device {

    static fileprivate func getModel(byCode code: String) -> Model {
        #if os(iOS)
        switch code {
        /*** iPod touch ***/
        case "iPod5,1":                                 return .iPodTouch5Gen
        case "iPod7,1":                                 return .iPodTouch6Gen
        /*** iPhone ***/
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":     return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                  return .iPhone5
        case "iPhone5,3", "iPhone5,4":                  return .iPhone5C
        case "iPhone6,1", "iPhone6,2":                  return .iPhone5S
        case "iPhone7,2":                               return .iPhone6
        case "iPhone7,1":                               return .iPhone6Plus
        case "iPhone8,1":                               return .iPhone6S
        case "iPhone8,2":                               return .iPhone6SPlus
        case "iPhone8,4":                               return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                  return .iPhone7
        case "iPhone9,2", "iPhone9,4":                  return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                return .iPhone8
        case "iPhone10,2", "iPhone10,5":                return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                return .iPhoneX
        case "iPhone11,8":                              return .iPhoneXR
        case "iPhone11,2":                              return .iPhoneXS
        case "iPhone11,4", "iPhone11,6":                return .iPhoneXSMax
        case "iPhone12,1":                              return .iPhone11
        case "iPhone12,3":                              return .iPhone11Pro
        case "iPhone12,5":                              return .iPhone11ProMax
        case "iPhone12,8":                              return .iPhoneSE2
        case "iPhone13,1":                              return .iPhone12Mini
        case "iPhone13,2":                              return .iPhone12
        case "iPhone13,3":                              return .iPhone12Pro
        case "iPhone13,4":                              return .iPhone12ProMax
        /*** iPad ***/
        case "iPad3,1", "iPad3,2", "iPad3,3":           return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":           return .iPad4
        case "iPad6,11", "iPad6,12":                    return .iPad5
        case "iPad7,6":                                 return .iPad6
        case "iPad7,11", "iPad7,12":                    return .iPad7
        case "iPad11,6", "iPad11,7":                    return .iPad8
        case "iPad4,1", "iPad4,2", "iPad4,3":           return .iPadAir
        case "iPad5,3", "iPad5,4":                      return .iPadAir2
        case "iPad11,3", "iPad11,4":                    return .iPadAir3
        case "iPad13,1", "iPad13,2":                    return .iPadAir4
        case "iPad2,5", "iPad2,6", "iPad2,7":           return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":           return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":           return .iPadMini3
        case "iPad5,1", "iPad5,2":                      return .iPadMini4
        case "iPad11,1", "iPad11,2":                    return .iPadMini5
        case "iPad6,3", "iPad6,4":                      return .iPadPro9_7Inch
        case "iPad7,3", "iPad7,4":                      return .iPadPro10_5Inch
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":    return .iPadPro11Inch
        case "iPad8,9", "iPad8,10":                     return .iPadPro11Inch2
        case "iPad6,7", "iPad6,8":                      return .iPadPro12_9Inch
        case "iPad7,1", "iPad7,2":                      return .iPadPro12_9Inch2
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":    return .iPadPro12_9Inch3
        case "iPad8,11", "iPad8,12":                    return .iPadPro12_9Inch4
        /*** HomePod ***/
        case "AudioAccessory1,1":                       return .HomePod
        /*** Simulator ***/
        case "i386", "x86_64":                          return .simulator(getModel(byCode: simulatorCode() ?? "iOS"))
        /*** Unknown ***/
        default:                                        return .unknown
        }
        #elseif os(OSX)
        switch code {
        /*** Mac Mini ***/
        case "Macmini6,1", "Macmini6,2":                            return .MacMini2012Late
        case "Macmini7,1":                                          return .MacMini2014Late
        /*** MacBook Air ***/
        case "MacBookAir5,1", "MacBookAir5,2":                      return .MacBookAir2012Mid
        case "MacBookAir6,1", "MacBookAir6,2":                      return .MacBookAir2013MidAnd2014Early
        case "MacBookAir7,1", "MacBookAir7,2":                      return .MacBookAir2015Early
        case "MacBookAir8,2":                                       return .MacBookAir2017Mid
        /*** MacBook ***/
        case "MacBook8,1":                                          return .MacBook2015Early
        case "MacBook9,1":                                          return .MacBook2016Early
        case "MacBook10,1":                                         return .MacBook2017Mid
        /*** MacBook Pro ***/
        case "MacBookPro6,1", "MacBookPro6,2", "MacBookPro6,3":     return .MacBookPro2010Mid
        case "MacBookPro8,1", "MacBookPro8,2", "MacBookPro8,3":     return .MacBookPro2011
        case "MacBookPro9,1", "MacBookPro9,2":                      return .MacBookPro2012Mid
        /*** MacBook Pro Retina ***/
        case "MacBookPro10,1":                                      return .MacBookProRetina2012Mid
        case "MacBookPro10,2":                                      return .MacBookProRetina2012Late
        case "MacBookPro11,1", "MacBookPro11,2", "MacBookPro11,3":  return .MacBookProRetina2014Mid
        case "MacBookPro12,1":                                      return .MacBookProRetina2015Early
        case "MacBookPro11,4", "MacBookPro11,5":                    return .MacBookProRetina2015Mid
        case "MacBookPro13,1", "MacBookPro13,2", "MacBookPro13,3":  return .MacBookProRetina2016Late
        case "MacBookPro14,1", "MacBookPro14,2", "MacBookPro14,3":  return .MacBookProRetina2017Mid
        /*** iMac ***/
        case "iMac13,1", "iMac13,2":                                return .iMac2012Late
        case "iMac14,1", "iMac14,2":                                return .iMac2013Late
        case "iMac14,4":                                            return .iMac2014Mid
        case "iMac16,1":                                            return .iMac2015Late
        case "iMac18,1":                                            return .iMac2017
        /*** iMac Retina ***/
        case "iMac15,1":                                            return .iMacRetina2014Late
        case "iMac16,2", "iMac17,1":                                return .iMacRetina2015Late
        case "iMac18,2", "iMac18,3":                                return .iMacRetina2017Mid
        /*** iMac Pro ***/
        case "iMacPro1,1":                                          return .iMacPro
        /*** Mac Pro ***/
        case "MacPro5,1":                                           return .MacPro2012Mid
        case "MacPro6,1":                                           return .MacPro2013Late
        case "MacPro7,1":                                           return .MacPro2017Early
        /*** Unknown ***/
        default:                                                    return .unknown
        }
        #elseif os(tvOS)
        switch code {
        case "AppleTV5,3":               return .AppleTV4Gen
        case "AppleTV6,2":               return .AppleTV4K
        /*** Simulator ***/
        case "i386", "x86_64":           return .simulator(getModel(byCode: simulatorCode() ?? "tvOS"))
        default:                         return .unknown
        }
        #elseif os(watchOS)
        switch code {
        case "Watch1,1", "Watch1,2":                         return .AppleWatch
        case "Watch2,6", "Watch2,7":                         return .AppleWatchSeries1
        case "Watch2,3", "Watch2,4":                         return .AppleWatchSeries2
        case "Watch3,1", "Watch3,2", "Watch3,3", "Watch3,4": return .AppleWatchSeries3
        case "Watch4,1", "Watch4,2", "Watch4,3", "Watch4,4": return .AppleWatchSeries4
        /*** Simulator ***/
        case "i386", "x86_64":                               return .simulator(getModel(byCode: simulatorCode() ?? "watchOS"))
        default:                                             return .unknown
        }
        #endif
    }

    static public func model() -> Model {
        return getModel(byCode: code())
    }

}


#if os(iOS)
extension Device.Model {
    /// Returns whether the device is an iPod (real or simulator)
    public var isPod: Bool {
        return (Device.Model.allPods.contains(self) || Device.Model.allSimulatorPods.contains(self))
    }

    /// Returns whether the device is an iPhone (real or simulator)
    public var isPhone: Bool {
        return ((Device.Model.allPhones.contains(self) ||
            Device.Model.allSimulatorPhones.contains(self) ||
            UIDevice.current.userInterfaceIdiom == .phone) &&
            !isPod)
    }

    /// Returns whether the device is an iPad (real or simulator)
    public var isPad: Bool {
        return (Device.Model.allPads.contains(self) ||
            Device.Model.allSimulatorPads.contains(self) ||
            UIDevice.current.userInterfaceIdiom == .pad)
    }

    /// Returns whether the device is any of the simulator
    /// Useful when there is a need to check and skip running a portion of code (location request or others)
    public var isSimulator: Bool {
        return Device.Model.allSimulators.contains(self)
    }

    public var isZoomed: Bool {
        if Int(UIScreen.main.scale.rounded()) == 3 {
            // Plus-sized
            return UIScreen.main.nativeScale > 2.7
        } else {
            return UIScreen.main.nativeScale > UIScreen.main.scale
        }
    }

}
#endif


extension Device.Model {

    #if os(iOS)

    /// All iPod
    public static var allPods: [Device.Model] {
        return [.iPodTouch5Gen, .iPodTouch6Gen]
    }

    /// All iPhones
    public static var allPhones: [Device.Model] {
        return [.iPhone4,
                .iPhone4S,
                .iPhone5,
                .iPhone5C,
                .iPhone5S,
                .iPhone6,
                .iPhone6Plus,
                .iPhone6S,
                .iPhone6SPlus,
                .iPhone7,
                .iPhone7Plus,
                .iPhoneSE,
                .iPhone8,
                .iPhone8Plus,
                .iPhoneX]
    }

    /// All iPads
    public static var allPads: [Device.Model] {
        return [.iPad3,
                .iPad4,
                .iPad5,
                .iPad6,
                .iPadAir,
                .iPadAir2,
                .iPadMini,
                .iPadMini2,
                .iPadMini3,
                .iPadMini4,
                .iPadPro9_7Inch,
                .iPadPro10_5Inch,
                .iPadPro11Inch,
                .iPadPro12_9Inch,
                .iPadPro12_9Inch2,
                .iPadPro12_9Inch3]
    }

    /// All Plus-Sized Devices
    public static var allPlusSizedDevices: [Device.Model] {
        return [.iPhone6Plus, .iPhone6SPlus, .iPhone7Plus, .iPhone8Plus]
    }

    /// All Plus-Sized Devices
    public static var allProDevices: [Device.Model] {
        return [.iPadPro9_7Inch, .iPadPro12_9Inch, .iPadPro12_9Inch2, .iPadPro10_5Inch]
    }

    /// All simulator iPods
    public static var allSimulatorPods: [Device.Model] {
        return allPods.map{ .simulator($0) }
    }

    /// All simulator iPhones
    public static var allSimulatorPhones: [Device.Model] {
        return allPhones.map{ .simulator($0) }
    }

    /// All simulator iPads
    public static var allSimulatorPads: [Device.Model] {
        return allPads.map{ .simulator($0) }
    }

    #elseif os(OSX)

    /// All Mac mini
    public static var allMacMinis: [Device.Model] {
        return [.MacMini2012Late, .MacMini2014Late]
    }

    /// All MacBook Air
    public static var allMacBookAirs: [Device.Model] {
        return [.MacBookAir2012Mid, .MacBookAir2013MidAnd2014Early, .MacBookAir2015Early, .MacBookAir2017Mid]
    }

    /// All MacBook
    public static var allMacBooks: [Device.Model] {
        return [.MacBook2015Early, .MacBook2016Early, .MacBook2017Mid]
    }

    /// All MacBook Pro
    public static var allMacBookProes: [Device.Model] {
        return [.MacBookPro2010Mid,
                .MacBookPro2011,
                .MacBookPro2012Mid,
                .MacBookProRetina2012Mid,
                .MacBookProRetina2012Late,
                .MacBookProRetina2014Mid,
                .MacBookProRetina2015Early,
                .MacBookProRetina2015Mid,
                .MacBookProRetina2016Late,
                .MacBookProRetina2017Mid]
    }

    /// All iMac
    public static var alliMacs: [Device.Model] {
        return [.iMac2012Late,
                .iMac2013Late,
                .iMac2014Mid,
                .iMac2015Late,
                .iMac2017,
                .iMacRetina2014Late,
                .iMacRetina2015Late,
                .iMacRetina2017Mid,
                .iMacPro]
    }

    /// All MacPro
    public static var allMacProes: [Device.Model] {
        return [.MacPro2012Mid, .MacPro2013Late, .MacPro2017Early]
    }

    #elseif os(tvOS)

    /// All TVs
    public static var allTVs: [Device.Model] {
        return [.AppleTV4Gen, .AppleTV4K]
    }

    /// All simulator TVs
    public static var allSimulatorTVs: [Device.Model] {
        return allTVs.map{ .simulator($0) }
    }

    #elseif os(watchOS)

    /// All Watchs
    public static var allWatchs: [Device.Model] {
        return [.AppleWatch, .AppleWatchSeries1, .AppleWatchSeries2, .AppleWatchSeries3]
    }

    /// All simulator Watchs
    public static var allSimulatorWatchs: [Device.Model] {
        return allWatchs.map{ .simulator($0) }
    }

    #endif


    /// All real devices (i.e. all devices except for all simulators)
    public static var allModels: [Device.Model] {
        #if os(iOS)
        return allPods + allPhones + allPads
        #elseif os(OSX)
        return allMacMinis + allMacBookAirs + allMacBooks + allMacBookProes + alliMacs + allMacProes
        #elseif os(tvOS)
        return allTVs
        #elseif os(watchOS)
        return allWatchs
        #endif
    }

    /// All simulators
    public static var allSimulators: [Device.Model] {
        return allModels.map{ .simulator($0) }
    }

}


// MARK: - Equatable -
extension Device.Model: Equatable {

    public static func == (lhs: Device.Model, rhs: Device.Model) -> Bool {
        return lhs.identifier == rhs.identifier
    }

}


// MARK: - CustomStringConvertible -
extension Device.Model: CustomStringConvertible {

    public var description: String {
        return identifier
    }

    public var identifier: String {
        #if os(iOS)
        switch self {
        /*** iPod ***/
        case .iPodTouch5Gen:        return "iPod Touch 5 Generation"
        case .iPodTouch6Gen:        return "iPod Touch 6 Generation"
        case .iPodTouch7Gen:        return "iPod Touch 7 Generation"
        /*** iPhone ***/
        case .iPhone4:              return "iPhone 4"
        case .iPhone4S:             return "iPhone 4s"
        case .iPhone5:              return "iPhone 5"
        case .iPhone5C:             return "iPhone 5c"
        case .iPhone5S:             return "iPhone 5s"
        case .iPhone6:              return "iPhone 6"
        case .iPhone6Plus:          return "iPhone 6 Plus"
        case .iPhone6S:             return "iPhone 6s"
        case .iPhone6SPlus:         return "iPhone 6s Plus"
        case .iPhone7:              return "iPhone 7"
        case .iPhone7Plus:          return "iPhone 7 Plus"
        case .iPhoneSE:             return "iPhone SE"
        case .iPhone8:              return "iPhone 8"
        case .iPhone8Plus:          return "iPhone 8 Plus"
        case .iPhoneX:              return "iPhone X"
        case .iPhoneXR:             return "iPhone XR"
        case .iPhoneXS:             return "iPhone XS"
        case .iPhoneXSMax:          return "iPhone XS Max"
        case .iPhone11:             return "iPhone 11"
        case .iPhone11Pro:          return "iPhone 11 Pro"
        case .iPhone11ProMax:       return "iPhone 11 Pro Max"
        case .iPhoneSE2:            return "iPhone SE 2 Generation"
        case .iPhone12Mini:         return "iPhone 12 Mini"
        case .iPhone12:             return "iPhone 12"
        case .iPhone12Pro:          return "iPhone 12 Pro"
        case .iPhone12ProMax:       return "iPhone 12 Pro Max"
        /*** iPad ***/
        case .iPad3:                return "iPad 3"
        case .iPad4:                return "iPad 4"
        case .iPad5:                return "iPad 5"
        case .iPad6:                return "iPad 6"
        case .iPad7:                return "iPad 7"
        case .iPad8:                return "iPad 8"
        case .iPadAir:              return "iPad Air"
        case .iPadAir2:             return "iPad Air 2"
        case .iPadAir3:             return "iPad Air 3"
        case .iPadAir4:             return "iPad Air 4"
        case .iPadMini:             return "iPad Mini"
        case .iPadMini2:            return "iPad Mini 2"
        case .iPadMini3:            return "iPad Mini 3"
        case .iPadMini4:            return "iPad Mini 4"
        case .iPadMini5:            return "iPad Mini 5"
        case .iPadPro9_7Inch:       return "iPad Pro (9.7-inch)"
        case .iPadPro10_5Inch:      return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch:        return "iPad Pro (11-inch)"
        case .iPadPro11Inch2:       return "iPad Pro (11-inch) 2 Generation"
        case .iPadPro12_9Inch:      return "iPad Pro (12.9-inch)"
        case .iPadPro12_9Inch2:     return "iPad Pro (12.9-inch) 2 Generation"
        case .iPadPro12_9Inch3:     return "iPad Pro (12.9-inch) 3 Generation"
        case .iPadPro12_9Inch4:     return "iPad Pro (12.9-inch) 4 Generation"
        /*** HomePod ***/
        case .HomePod:              return "HomePod"
        /*** Simulator ***/
        case .simulator(let model): return "Simulator (\(model))"
        /*** unknown ***/
        case .unknown:              return "unknown"
        }
        #elseif os(OSX)
        switch self {
        /*** Mac Mini ***/
        case .MacMini2012Late:                  return "Mac Mini Late 2012"
        case .MacMini2014Late:                  return "Mac Mini Late 2014"
        /*** MacBook Air ***/
        case .MacBookAir2012Mid:                return "MacBook Air Mid 2012"
        case .MacBookAir2013MidAnd2014Early:    return "MacBook Air Mid 2013 and Early 2014"
        case .MacBookAir2015Early:              return "MacBook Air Early 2015"
        case .MacBookAir2017Mid:                return "MacBook Air Mid 2017"
        /*** MacBook ***/
        case .MacBook2015Early:                 return "MacBook Mid 2017"
        case .MacBook2016Early:                 return "MacBook Mid 2017"
        case .MacBook2017Mid:                   return "MacBook Mid 2017"
        /*** MacBook Pro ***/
        case .MacBookPro2010Mid:                return "MacBook Pro Mid 2010"
        case .MacBookPro2011:                   return "MacBook Pro Mid 2011"
        case .MacBookPro2012Mid:                return "MacBook Pro Mid 2012"
        /*** MacBook Pro Retina ***/
        case .MacBookProRetina2012Mid:          return "MacBook Pro Retina Mid 2012"
        case .MacBookProRetina2012Late:         return "MacBook Pro Retina Late 2012"
        case .MacBookProRetina2014Mid:          return "MacBook Pro Retina Mid 2014"
        case .MacBookProRetina2015Early:        return "MacBook Pro Retina Early 2015"
        case .MacBookProRetina2015Mid:          return "MacBook Pro Retina Mid 2015"
        case .MacBookProRetina2016Late:         return "MacBook Pro Retina Late 2016"
        case .MacBookProRetina2017Mid:          return "MacBook Pro Retina Mid 2017"
        /*** iMac ***/
        case .iMac2012Late:                     return "iMac Late 2012"
        case .iMac2013Late:                     return "iMac Late 2013"
        case .iMac2014Mid:                      return "iMac Mid 2014"
        case .iMac2015Late:                     return "iMac Late 2015"
        case .iMac2017:                         return "iMac 2017"
        /*** iMac Retina ***/
        case .iMacRetina2014Late:               return "iMac Retina Late 2014"
        case .iMacRetina2015Late:               return "iMac Retina Late 2015"
        case .iMacRetina2017Mid:                return "iMac Retina Min 2017"
        /*** iMac Pro ***/
        case .iMacPro:                          return "iMac Pro"
        /*** Mac Pro ***/
        case .MacPro2012Mid:                    return "Mac Pro Mid 2012"
        case .MacPro2013Late:                   return "Mac Pro Late 2013"
        case .MacPro2017Early:                  return "Mac Pro Early 2017"
        /*** Simulator ***/
        case .simulator:                        return "OSX Device not have simulator"
        /*** unknown ***/
        case .unknown:                          return "unknown"
        }
        #elseif os(tvOS)
        switch self {
        case .AppleTV4Gen: return "Apple TV 4"
        case .AppleTV4K: return "Apple TV 4K"
        /*** Simulator ***/
        case .simulator(let model): return "Simulator (\(model))"
        /*** unknown ***/
        case .unknown: return "unknown"
        }
        #elseif os(watchOS)
        switch self {
        case .AppleWatch: return "Apple Watch (1st generation)"
        case .AppleWatchSeries1: return "Apple Watch Series 1"
        case .AppleWatchSeries2: return "Apple Watch Series 2"
        case .AppleWatchSeries3: return "Apple Watch Series 3"
        case .AppleWatchSeries4: return "Apple Watch Series 4"
        /*** Simulator ***/
        case .simulator(let model): return "Simulator (\(model))"
        /*** unknown ***/
        case .unknown: return "unknown"
        }
        #endif
    }
}

