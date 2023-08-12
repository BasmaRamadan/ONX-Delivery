//
//  LoginViewModel.swift
//  ONX Delivery
//
//  Created by Basma on 12/08/2023.
//

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
                "P_DLVRY_NO": "1010",
                "P_PSSWRD": "1"
                ]
        ]
        
        ServiceManager.callAPI(url: url, method: .post, parameters: parameters, custumHeaders: nil) { (error, response) in
            
            if response != nil
            {
                let statusCode = response!["ErrNo"].intValue
                if statusCode == 0 {
                    self.state = .loaded
                }else{
                    let message = response!["ErrMsg"].stringValue
                    self.errorMessage = message
                    self.state = .empty
                }
            }
            else
            {
                let message = response?["ErrMsg"].stringValue
                self.errorMessage = message ?? "Something wnt wrong!".localized
                self.state = .error
            }
        }
    }
    
}
