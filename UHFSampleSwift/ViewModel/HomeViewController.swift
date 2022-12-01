//
//  HomeViewController.swift
//  UHFSampleSwift
//
//  Created by WadeGigatms on 2022/11/30.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var disposeBag = DisposeBag()
    private var viewModel: HomeViewModel = HomeViewModel()
    
    @IBOutlet weak var logTextView: UITextView!
    @IBOutlet weak var channelPickerView: UIPickerView!
    @IBOutlet weak var classVerPickerView: UIPickerView!
    @IBOutlet weak var deviceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initializeUI()
        setupObserver()
        viewModel.getAppInfo()
        viewModel.getSdkInfo()
    }
    
    @IBAction func scanButton(_ sender: Any) {
        let classVerIndex = classVerPickerView.selectedRow(inComponent: 0)
        let channelIndex = channelPickerView.selectedRow(inComponent: 0)
        viewModel.scan(classVerIndex, channelIndex)
    }
    
    private func initializeUI() {
        channelPickerView.dataSource = self
        channelPickerView.delegate = self
        
        classVerPickerView.dataSource = self
        classVerPickerView.delegate = self
        
        deviceTableView.dataSource = self
        deviceTableView.delegate = self
        
        logTextView.text = ""
        logTextView.isEditable = false
    }
    
    private func setupObserver() {
        viewModel.discoveredDeviceEvent.subscribe(onNext: { _ in
            self.deviceTableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.connectStatusEvent.subscribe(onNext: { status in
            self.deviceTableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.logEvent.subscribe(onNext: { log in
            self.logTextView.text = log
        }).disposed(by: disposeBag)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case channelPickerView:
            return viewModel.channels.count
        case classVerPickerView:
            return viewModel.classVers.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case channelPickerView:
            return viewModel.channels[row].description
        case classVerPickerView:
            return viewModel.classVers[row].description
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case channelPickerView:
            viewModel.setChannel(row)
        case classVerPickerView:
            viewModel.setClassVer(row)
        default:
            break
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.uhfDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DeviceTableViewCell
        cell.configure(viewModel.uhfDevices[indexPath.row])
        if viewModel.uhfDevices[indexPath.row] == viewModel.connectedUhfDevice {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.connect(row: indexPath.row)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
