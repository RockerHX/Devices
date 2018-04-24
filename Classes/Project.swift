//
//  Project.swift
//  Devices
//
//  Created by RockerHX on 2018/4/24.
//


extension Device {

    public struct Project {
        
        public init() {}

        // MARK: - Public Property -
        public var version: String {
            let infoDictionary = Bundle.main.infoDictionary
            let version = infoDictionary?["CFBundleShortVersionString"] as? String
            return version!
        }

        public var build: String {
            let infoDictionary = Bundle.main.infoDictionary
            let build = infoDictionary?["CFBundleVersion"] as? String
            return build!
        }

        public var wholeVersion: String {
            return "\(version) (Build \(build))"
        }

    }

}

