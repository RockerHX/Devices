//
//  Model.swift
//  Device
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit


extension Device {

    public enum Model {
        #if os(iOS)
        /*** iPod ***/
        case iPodTouch5Gen
        case iPodTouch6Gen
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
        /*** iPad ***/
        case iPad3
        case iPad4
        case iPad5
        case iPadAir
        case iPadAir2
        case iPadMini
        case iPadMini2
        case iPadMini3
        case iPadMini4
        case iPadPro9_7Inch
        case iPadPro12_9Inch
        case iPadPro12_9Inch2
        case iPadPro10_5Inch
        /*** HomePod ***/
        case HomePod
        #elseif os(OSX)
        case Mac
        #elseif os(tvOS)
        case AppleTV1Gen
        case AppleTV2Gen
        case AppleTV3Gen
        case AppleTV4Gen
        case AppleTV4K
        #elseif os(watchOS)
        case AppleWatch
        case AppleWatchSeries1
        case AppleWatchSeries2
        case AppleWatchSeries3
        #endif
        /*** Simulator ***/
        indirect case simulator(Model)
        /*** unknown ***/
        case unknown
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
        case .iPodTouch5Gen:        return "iPod Touch 5"
        case .iPodTouch6Gen:        return "iPod Touch 6"
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
        case .iPad3:                return "iPad 3"
        case .iPad4:                return "iPad 4"
        case .iPadAir:              return "iPad Air"
        case .iPadAir2:             return "iPad Air 2"
        case .iPad5:                return "iPad 5"
        case .iPadMini:             return "iPad Mini"
        case .iPadMini2:            return "iPad Mini 2"
        case .iPadMini3:            return "iPad Mini 3"
        case .iPadMini4:            return "iPad Mini 4"
        case .iPadPro9_7Inch:       return "iPad Pro (9.7-inch)"
        case .iPadPro12_9Inch:      return "iPad Pro (12.9-inch)"
        case .iPadPro12_9Inch2:     return "iPad Pro (12.9-inch) 2"
        case .iPadPro10_5Inch:      return "iPad Pro (10.5-inch)"
        case .HomePod:              return "HomePod"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown:              return "unknown"
        }
        #elseif os(OSX)
        return "Mac"
        #elseif os(tvOS)
        switch self {
        case .AppleTV4Gen: return "Apple TV 4"
        case .AppleTV4K: return "Apple TV 4K"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown: return "unknown"
        }
        #elseif os(watchOS)
        switch self {
        case .AppleWatch: return "Apple Watch (1st generation)"
        case .AppleWatchSeries1: return "Apple Watch Series 1"
        case .AppleWatchSeries2: return "Apple Watch Series 2"
        case .AppleWatchSeries3: return "Apple Watch Series 3"
        case .simulator(let model): return "Simulator (\(model))"
        case .unknown: return "unknown"
        }
        #endif
    }
}


// MARK: - Model Methods -
extension Device {

    static fileprivate func simulatorCode() -> String? {
        return ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]
    }

    static fileprivate func getModel(byCode code: String) -> Model {
        #if os(iOS)
        switch code {
        /*** iPod touch ***/
        case "iPod5,1":                                  return .iPodTouch5Gen
        case "iPod7,1":                                  return .iPodTouch6Gen
        /*** iPhone ***/
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      return .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":      return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                   return .iPhone5
        case "iPhone5,3", "iPhone5,4":                   return .iPhone5C
        case "iPhone6,1", "iPhone6,2":                   return .iPhone5S
        case "iPhone7,2":                                return .iPhone6
        case "iPhone7,1":                                return .iPhone6Plus
        case "iPhone8,1":                                return .iPhone6S
        case "iPhone8,2":                                return .iPhone6SPlus
        case "iPhone8,4":                                return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                   return .iPhone7
        case "iPhone9,2", "iPhone9,4":                   return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                 return .iPhone8
        case "iPhone10,2", "iPhone10,5":                 return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                 return .iPhoneX
        /*** iPad ***/
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad6,11", "iPad6,12":                     return .iPad5
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
        case "iPad6,7", "iPad6,8":                       return .iPadPro12_9Inch
        case "iPad7,1", "iPad7,2":                       return .iPadPro12_9Inch2
        case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
        /*** HomePod ***/
        case "AudioAccessory1,1":                        return .HomePod
        /*** Simulator ***/
        case "i386", "x86_64":                           return .simulator(getModel(byCode: simulatorCode() ?? "iOS"))
        /*** Unknown ***/
        default:                                         return .unknown
        }
        #elseif os(OSX)
        return .mac
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
        return [.iPhone4, .iPhone4S, .iPhone5, .iPhone5C, .iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhone7, .iPhone7Plus, .iPhoneSE, .iPhone8, .iPhone8Plus, .iPhoneX]
    }

    /// All iPads
    public static var allPads: [Device.Model] {
        return [.iPad3, .iPad4, .iPadAir, .iPadAir2, .iPad5, .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4, .iPadPro9_7Inch, .iPadPro12_9Inch, .iPadPro12_9Inch2, .iPadPro10_5Inch]
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

    #elseif os(tvOS)

    /// All TVs
    public static var allTVs: [Device.Model] {
        return [.AppleTV4Gen, .appleTV4K]
    }

    /// All simulator TVs
    public static var allSimulatorTVs: [Device.Model] {
        return allTVs.map{ .simulator($0) }
    }

    #elseif os(watchOS)

    /// All Watchs
    public static var allWatchs: [Device.Model] {
        return [.AppleWatch, .AppleWatchSeries1, .AppleWatchSeries2, .AppleWatchSeries2]
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

