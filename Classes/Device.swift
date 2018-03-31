//
//  Device.swift
//  Devices
//
//  Created by RockerHX on 2018/3/23.
//  Copyright © 2018年 RockerHX. All rights reserved.
//


// iOS Devices Wiki: https://www.theiphonewiki.com/wiki
// OSX Devices Wiki: https://en.wikipedia.org/wiki/Macintosh#Product_line


#if os(OSX)
import Cocoa
#else
import UIKit
#endif


public struct Device {

    #if os(iOS)
    /// The name identifying the device (e.g. "Dennis' iPhone").
    public var name: String {
        return UIDevice.current.name
    }

    /// The name of the operating system running on the device represented by the receiver (e.g. "iOS" or "tvOS").
    public var systemName: String {
        return UIDevice.current.systemName
    }

    /// The current version of the operating system (e.g. 8.4 or 9.2).
    public var systemVersion: String {
        return UIDevice.current.systemVersion
    }

    /// The model of the device as a localized string.
    public var localizedModel: String {
        return UIDevice.current.localizedModel
    }
    #endif

    static func code() -> String {

        #if os(OSX)
        func systemInformation(byCode code: String) -> String {
            var size : Int = 0
            sysctlbyname(code, nil, &size, nil, 0)
            var model = [CChar](repeating: 0, count: Int(size))
            sysctlbyname(code, &model, &size, nil, 0)
            return String.init(validatingUTF8: model) ?? ""
        }
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
        return model().description + " - " + size().description
    }

}
#endif

