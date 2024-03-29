//
//  LoginViewModel.swift
//  ONX Delivery
//
//  Created by Basma on 12/08/2023.
//
import SwiftyJSON

class LoginViewModel {
    var errorMessage = "";
    var passwordMessage = "";
    
    var updateState: (()->())?
    
    var state : DataState = .empty {
        didSet {
            self.updateState?()
        }
    }
    
    func getUser(id:String, password:String)
    {
        let url = Urls.login
        
        let parameters:[String:Any] = [
            "Value" : [
                "P_LANG_NO": "2",
                "P_DLVRY_NO": id,
                "P_PSSWRD": password
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
    
}
