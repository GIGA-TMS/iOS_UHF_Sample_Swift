//
//  HomeViewModel.swift
//  UHFSampleSwift
//
//  Created by WadeGigatms on 2022/11/30.
//

import Foundation
import UHFSDK
import RxSwift

class HomeViewModel: NSObject, UHFScannerCallback, DevConnectionCallback, IUHFDeviceListener {
    
    let discoveredDeviceEvent = PublishSubject<[BaseDevice]>()
    let connectStatusEvent = PublishSubject<GTDevConnStatus>()
    let logEvent = PublishSubject<String>()
    
    let classVers: [ClassVer] = [.UHF_TS100, .UHF_TS100A]
    let channels: [GTConnectType] = [.Type_BLE]
    var uhfDevices: [BaseDevice] { return self._uhfDevices }
    var channel: GTConnectType { return self._channel }
    var classVer: ClassVer { return self._classVer }
    var connectedUhfDevice: BaseDevice?
    
    private var log: String = ""
    private var _uhfDevices: [BaseDevice] = [] {
        didSet {
            discoveredDeviceEvent.onNext(_uhfDevices)
        }
    }
    private var _uhfScanner: UHFScanner!
    private var _classVer: ClassVer = .UHF_TS100A
    private var _channel: GTConnectType = .Type_BLE
    private var _connStatus: GTDevConnStatus = .DevDisconnected
    
    override init() {
        super.init()
        
        _uhfScanner = UHFScanner(self, classVer: _classVer)
    }
    
    // MARK: - Methods
    
    func getAppInfo() {
        let appInfo = AppInfo()
        var version: String { return appInfo.version }
        var build: String { return appInfo.build }
        log("UHFSampleSwift version: \(version).\(build)")
    }
    
    func getSdkInfo() {
        let infoDictionary = Bundle(for: UHFScanner.self).infoDictionary
        let version = infoDictionary?["CFBundleShortVersionString"] as? String ?? "unknown"
        let build = infoDictionary?[kCFBundleVersionKey as String] as? String ?? "unknown"
        log("UHFSDK version: \(version).\(build)")
    }
    
    private func log(_ logString: String) {
        log += (logString + "\n")
        logEvent.onNext(log)
    }
    
    func setClassVer(_ row: Int) {
        _classVer = classVers[row]
        log("set \(_classVer.description)")
    }
    
    func setChannel(_ row: Int) {
        _channel = channels[row]
        log("set \(_channel.description)")
    }
    
    func scan(_ classVer: Int, _ channelIndex: Int) {
        GTDeviceManager.shared().removeAllDevice()
        _uhfDevices.removeAll()
        
        _uhfScanner = nil
        _uhfScanner = UHFScanner(self, classVer: _classVer)
        _uhfScanner.change(channel)
        _uhfScanner.startScanDevice()
        
        log("start scan device")
    }
    
    func stopScan() {
        _uhfScanner = nil
        _uhfScanner.stopScan()
        
        log("stop scan device")
    }
    
    func connect(row: Int) {
        let uhfDevice = uhfDevices[row]
        if uhfDevice.getDevInfo().currentConnStatus == .DevDisconnected {
            connectStatusEvent.onNext(.DevConnecting)
            uhfDevice.connCallback = self
            uhfDevice.connect()
            
            log("connect \(String(describing: uhfDevice.getDevInfo().devName ?? ""))")
        } else {
            uhfDevice.disConnect()
            
            log("disconnect")
        }
    }
    
    // MARK: - UHFScannerCallback
    
    func didDiscover(_ dev: BaseDevice) {
        let addDev = GTDeviceManager.shared().addDevice(dev.getDevInfo())
        _uhfDevices.append(addDev)
        
        log("discover \(String(describing: addDev.getDevInfo().devName ?? ""))")
    }
    
    func didError(_ strError: String) {
        print(strError)
        
        log("discover \(strError))")
    }
    
    func didScanStop() {
        print("scan stop")
        
        log("scan stop")
    }
    
    // MARK: - DevConnectionCallback
    
    func didUpdateConnectionStatus(_ dev: BaseDevice!, status connectedState: GTDevConnStatus, err_code nErrCode: Int32) {
        if _connStatus == connectedState { return }
        
        _connStatus = connectedState
        if _connStatus == .DevConnected {
            let uhfDevice = dev as? UHFDevice
            uhfDevice?.setListener(self)
            connectedUhfDevice = uhfDevice
            uhfDevice?.getFirmwareVersion()
        } else {
            connectedUhfDevice = nil
        }
        
        connectStatusEvent.onNext(_connStatus)
        
        log("\(connectedState.description)")
    }
    
    // MARK: - IUHFDeviceListener
    
    func didGetFirmwareVersion(_ fwVer: String) {
        log("\(fwVer)")
    }
}
