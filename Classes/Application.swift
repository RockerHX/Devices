//
//  Application.swift
//  Devices
//
//  Created by RockerHX on 2018/4/24.
//


extension Device {

    public struct Application {

        enum Key: String {
            case FirstLanuch = "NotFirstLanuch"
        }

        // MARK: - Singleton -
        public static let shared = Application()

        // MARK: - Public Property -
        public private(set) var version: String
        public private(set) var build: String
        public private(set) var wholeVersion: String
        public private(set) var firstLanuch: Bool = true

        // MARK: - Initialize Methods -
        fileprivate init() {
            let infoDictionary = Bundle.main.infoDictionary
            version = infoDictionary?["CFBundleShortVersionString"] as! String
            build = infoDictionary?["CFBundleVersion"] as! String
            wholeVersion = "\(version) (Build \(build))"

            let key = Key.FirstLanuch.rawValue
            let userDefaults = UserDefaults.standard
            let currentVersion = wholeVersion
            if let storeVersion = userDefaults.string(forKey: key) {
                firstLanuch = (currentVersion != storeVersion)
            }
            userDefaults.set(currentVersion, forKey: key)
            userDefaults.synchronize()
        }

    }

}

