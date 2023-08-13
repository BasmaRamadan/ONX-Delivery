//
//  MainViewModel.swift
//  ONX Delivery
//
//  Created by Basma on 13/08/2023.
//

import Foundation
import SwiftyJSON

class MainViewModel {
    var errorMessage = "";
    var passwordMessage = "";
    
    var updateState: (()->())?
    
    var state : DataState = .empty {
        didSet {
            self.updateState?()
        }
    }
    
    func getMainData()
    {
        let url = Urls.mainData
        
        let parameters:[String:Any] = [
            "Value" : [
                "P_DLVRY_NO": "1010",
                    "P_LANG_NO": "2",
                    "P_BILL_SRL":"",
                    "P_PRCSSD_FLG":""
            ]
        ]
        ServiceManager.callAPI(url: url, method: .post, parameters: parameters, custumHeaders: nil) { (error, response) in
            
            if response != nil
            {
                let statusCode = response!["Result"]["ErrNo"].intValue
                let message = response!["Result"]["ErrMsg"].stringValue
                self.errorMessage = message
                if statusCode == 0 {
                    self.state = .loaded
                }else{
                    let message = response!["Result"]["ErrMsg"].stringValue
                    self.errorMessage = message
                    self.state = .empty
                }
            }
            else
            {
                self.state = .error
            }
        }
    }
    
    func createData () -> [MainData]{
        var mainData = [MainData]()
        let mainData1 = MainData(BILL_DATE: "2/1/2023",BILL_SRL: "#435635", I_PRICE: "220", I_PRICE_VAT: "30", DLVRY_STATUS_FLG: "New")
        let mainData2 = MainData(BILL_DATE: "23/5/2023",BILL_SRL: "#876574", I_PRICE: "340", I_PRICE_VAT: "40", DLVRY_STATUS_FLG: "New")
        let mainData3 = MainData(BILL_DATE: "12/6/2023",BILL_SRL: "#095832", I_PRICE: "500", I_PRICE_VAT: "60", DLVRY_STATUS_FLG: "New")
        let mainData4 = MainData(BILL_DATE: "10/7/2023",BILL_SRL: "#371845", I_PRICE: "100", I_PRICE_VAT: "15", DLVRY_STATUS_FLG: "New")
        let mainData5 = MainData(BILL_DATE: "2/8/2023",BILL_SRL: "#093765", I_PRICE: "910", I_PRICE_VAT: "70", DLVRY_STATUS_FLG: "New")
        mainData.append(mainData1)
        mainData.append(mainData2)
        mainData.append(mainData3)
        mainData.append(mainData4)
        mainData.append(mainData5)
        return mainData
    }
    
}
