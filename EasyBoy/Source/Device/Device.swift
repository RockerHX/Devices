//
//  Device.swift
//  EasyBoy
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


// Apple Device Wiki: https://www.theiphonewiki.com/wiki


import Foundation


public struct Device {

    static func code() -> String {

        func systemInformation(byCode code: String) -> String {
            var size : Int = 0
            sysctlbyname(code, nil, &size, nil, 0)
            var model = [CChar](repeating: 0, count: Int(size))
            sysctlbyname(code, &model, &size, nil, 0)
            return String.init(validatingUTF8: model) ?? ""
        }
        
        #if os(OSX)
        return systemInformation(byCode: "hw.model")
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let code: String = String(validatingUTF8: NSString(bytes: &systemInfo.machine, length: Int(_SYS_NAMELEN), encoding: String.Encoding.ascii.rawValue)!.utf8String!)!
        return code
        #endif
    }

}


#if os(OSX)
extension Device {

    static public func version() -> String {
        return String(describing: model()) + " " + String(describing: sizeInches()) + "-inch"
    }

}
#endif

