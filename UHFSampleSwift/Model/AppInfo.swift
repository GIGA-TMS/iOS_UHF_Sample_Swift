//
//  AppInfo.swift
//  UHFSampleSwift
//
//  Created by WadeGigatms on 2022/12/1.
//

import Foundation

struct AppInfo {
    var name: String {
        return getInfoPlist(withKey: BundleKey.CFBundleName.description)
    }
    
    var version: String {
        return getInfoPlist(withKey: BundleKey.CFBundleShortVersionString.description)
    }
    
    var build: String {
        return getInfoPlist(withKey: BundleKey.CFBundleVersion.description)
    }
    
    var minimumOSVersion: String {
        return getInfoPlist(withKey: BundleKey.MinimumOSVersion.description)
    }
    
    var humanReadableCopyright: String {
        return getInfoPlist(withKey: BundleKey.NSHumanReadableCopyright.description)
    }
    
    var bundleIdentifier: String {
        return getInfoPlist(withKey: BundleKey.CFBundleIdentifier.description)
    }
    
    private func getInfoPlist(withKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            return ""
        }
        
        return value
    }
}
