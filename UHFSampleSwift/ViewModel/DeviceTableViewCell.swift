//
//  DeviceTableViewCell.swift
//  UHFSampleSwift
//
//  Created by WadeGigatms on 2022/11/29.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ uhfDevice: BaseDevice) {
        deviceLabel.text = uhfDevice.getDevInfo()?.devName
    }

}
