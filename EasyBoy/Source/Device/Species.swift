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

        case iWatch

        #endif

    }

}

