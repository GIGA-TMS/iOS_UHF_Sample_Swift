//
//  Extension.swift
//  UHFSampleSwift
//
//  Created by WadeGigatms on 2022/11/30.
//

import Foundation

protocol Description {
    var description: String { get }
}

extension BundleKey {
    var description: String {
        switch self {
        case .CFBundleName: return "CFBundleName"
        case .CFBundleShortVersionString: return "CFBundleShortVersionString"
        case .CFBundleVersion: return "CFBundleVersion"
        case .NSHumanReadableCopyright: return "NSHumanReadableCopyright"
        case .CFBundleIdentifier: return "CFBundleIdentifier"
        default: return "unknown"
        }
    }
}

extension ClassVer: Description {
    var description: String {
        switch self {
        case .UHF_UR0250: return "UR0250"
        case .UHF_TS100: return "TS100"
        case .UHF_TS100A: return "TS100A"
        case .UHF_TS800: return "TS800"
        default: return "unknown"
        }
    }
}

extension GTConnectType: Description {
    var description: String {
        switch self {
        case .Type_WiFi_UDP: return "WIFI"
        case .Type_BLE: return "BLE"
        default: return ""
        }
    }
}

extension GTDevConnStatus: Description {
    var description: String {
        switch self {
        case .DevConnected: return "connected"
        case .DevDisconnected: return "disconnected"
        case .DevConnecting: return "connecting"
        default: return "unknown"
        }
    }
}
