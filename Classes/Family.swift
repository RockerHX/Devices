//
//  Type.swift
//  Devices
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


extension Device {

    public enum Family {

        #if os(iOS)
        case iPodtouch
        case iPhone
        case iPad
        #elseif os(OSX)
        case MacMini
        case MacBookAir
        case MacBook
        case MacBookPro
        case iMac
        case iMacPro
        case MacPro
        case XServe
        #elseif os(tvOS)
        case AppleTV
        #elseif os(watchOS)
        case AppleWatch
        #endif
        case simulator
        case unknown
    }

}


// MARK: - Family Methods -
extension Device {

    static fileprivate func getFamily(byCode code: String) -> Family {
        #if os(iOS)
        if code.contains("iPhone") {
            return .iPhone
        } else if code.contains("iPad") {
            return .iPad
        } else if code.contains("iPod") {
            return .iPodtouch
        }
        #elseif os(OSX)
        if code.hasPrefix("MacMini") {
            return .MacMini
        } else if code.hasPrefix("MacBookAir") {
            return .MacBookAir
        } else if code.hasPrefix("MacBookPro") {
            return .MacBookPro
        } else if code.hasPrefix("MacBook") {
            return .MacBook
        } else if code.hasPrefix("iMacPro") {
            return .iMacPro
        } else if code.hasPrefix("iMac") {
            return .iMac
        } else if code.hasPrefix("MacPro") {
            return .MacPro
        } else if code.hasPrefix("Xserve") {
            return .XServe
        }
        #elseif os(tvOS)
        if code.hasPrefix("Apple TV") {
            return .AppleTV
        }
        #elseif os(watchOS)
        if code.hasPrefix("Apple Watch") {
            return .AppleWatch
        }
        #endif
        if code == "i386" || code == "x86_64" {
            return .simulator
        } else {
            return .unknown
        }
    }

    static public func family() -> Family {
        return getFamily(byCode: code())
    }

    static public func isSimulator() -> Bool {
        return family() == .simulator
    }

    #if os(iOS)
    static public func isPad() -> Bool {
        return family() == .iPad
    }

    static public func isPhone() -> Bool {
        return family() == .iPhone
    }

    static public func isPod() -> Bool {
        return family() == .iPodtouch
    }
    #endif

}

