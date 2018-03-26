//
//  Device.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


import UIKit


public struct Device {

    static fileprivate func getCode() -> String {
        #if os(iOS)
        var systemInfo = utsname()
        uname(&systemInfo)
        let code: String = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        return code
        #elseif os(OSX)
        var size : Int = 0
        sysctlbyname("hw.model", nil, &size, nil, 0)
        var model = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.model", &model, &size, nil, 0)
        return String.init(validatingUTF8: model) ?? ""
        #endif
    }

}


// MARK: - Species Methods -
extension Device {

    static fileprivate func getSpecies(byCode code: String) -> Species {
        #if os(iOS)
        if code.contains("iPhone") {
            return .iPhone
        } else if code.contains("iPad") {
            return .iPad
        } else if code.contains("iPod") {
            return .iPodtouch
        } else if code == "i386" || code == "x86_64" {
            return .simulator
        } else {
            return .unknown
        }
        #elseif os(OSX)
        if code.hasPrefix("MacMini") {
            return .MacMini
        } else if code.hasPrefix("MacBookAir") {
            return .MacBookAir
        } else if code.hasPrefix("MacBook") {
            return .MacBook
        } else if code.hasPrefix("MacBookPro") {
            return .MacBookPro
        } else if code.hasPrefix("iMac") {
            return .iMac
        } else if code.hasPrefix("iMacPro") {
            return .iMacPro
        } else if code.hasPrefix("MacPro") {
            return .MacPro
        } else if code.hasPrefix("Xserve") {
            return .Xserve
        } else {
            return .unknown
        }
        #elseif os(tvOS)
        return .AppleTV
        #elseif os(watchOS)
        return .AppleWatch
        #endif
    }

    static public func species() -> Species {
        return getSpecies(byCode: getCode())
    }

    static public func isPad() -> Bool {
        return species() == .iPad
    }

    static public func isPhone() -> Bool {
        return species() == .iPhone
    }

    static public func isPod() -> Bool {
        return species() == .iPodtouch
    }

    static public func isSimulator() -> Bool {
        return species() == .simulator
    }

}


// MARK: - Model Methods -
extension Device {

    static fileprivate func getModel(byCode code: String) -> Species.Model {
        switch code {
        /*** iPod touch ***/
        case "iPod1,1":                                  return .iPodTouch1Gen
        case "iPod2,1":                                  return .iPodTouch2Gen
        case "iPod3,1":                                  return .iPodTouch3Gen
        case "iPod4,1":                                  return .iPodTouch4Gen
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
        case "iPad1,1":                                  return .iPad1
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad6,11", "iPad6,12":                     return .iPad5
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad6,7", "iPad6,8", "iPad7,1", "iPad7,2": return .iPadPro12_9Inch
        case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
        case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch

        /*** Unknown ***/
        default:                                         return .unknown
        }
    }

    static public func model() -> Species.Model {
        return getModel(byCode: getCode())
    }

}


// MARK: - Size Methods -
extension Device {

    static public func size() -> Size {
        let width: Double = Double(UIScreen.main.bounds.width)
        let height: Double = Double(UIScreen.main.bounds.height)
        let screenHeight: Double = max(width, height)

        switch screenHeight {
        case 480:
            return .screen3_5Inch
        case 568:
            return .screen4Inch
        case 667:
            return (UIScreen.main.scale == 3.0) ? .screen5_5Inch : .screen4_7Inch
        case 736:
            return .screen5_5Inch
        case 812:
            return .screen5_8Inch
        case 1024:
            switch model() {
            case .iPadMini, .iPadMini2, .iPadMini3, .iPadMini4:
                return .screen7_9Inch
            case .iPadPro10_5Inch:
                return .screen10_5Inch
            default:
                return .screen9_7Inch
            }
        case 1112:
            return .screen10_5Inch
        case 1366:
            return .screen12_9Inch
        default:
            return .unknown
        }
    }

    static public func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }

}

