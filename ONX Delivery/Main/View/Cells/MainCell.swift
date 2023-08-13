//
//  MainCell.swift
//  ONX Delivery
//
//  Created by Basma on 13/08/2023.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var serialLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var orderDetailsBT: UIButton!
    
    func fillData (rowData : MainData) {
        serialLbl.text = rowData.BILL_SRL
        statusLbl.text = rowData.DLVRY_STATUS_FLG
        let fullPrice = Int(rowData.I_PRICE)! + Int(rowData.I_PRICE_VAT)!
        priceLbl.text = String(fullPrice)
        dateLbl.text = rowData.BILL_DATE
    }

}
