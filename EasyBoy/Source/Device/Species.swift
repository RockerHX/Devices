//
//  Type.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


extension Device {

    public enum Species: String {

        case unknown

        #if os(iOS)

        case simulator
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
        return getSpecies(byCode: code())
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

