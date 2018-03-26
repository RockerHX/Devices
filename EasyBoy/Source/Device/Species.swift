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

        case macMini
        case macBookAir
        case macBook
        case macBookPro
        case iMac
        case macPro
        case xServe

        #endif

    }

}

