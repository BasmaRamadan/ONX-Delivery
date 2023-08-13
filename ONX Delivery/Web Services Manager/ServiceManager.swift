




import UIKit
import Alamofire
import SwiftyJSON

class ServiceManager: NSObject {
    
    typealias ApiResponse = (Error?, JSON?) -> Void
    typealias ApiResponseWithStatusCode = (Error?, JSON?, Int?) -> Void
    
    
    class func callAPI(url: String, method: HTTPMethod, parameters: [String:Any]?, custumHeaders: [String: String]?, onCompletion: @escaping ApiResponse) -> Void
    {
        var headers: HTTPHeaders!
        headers = [:]
        
        if let head = custumHeaders
        {
            headers = head
        }
        else
        {
            
            headers["Accept"] = "application/json"
            headers["Content-Type"] = "application/json"
        }
        
        Alamofire.request(URL(string: url)!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON {response in
            
            print(response)
            if let result = response.result.value
            {
                onCompletion(nil, JSON(result));
            }
            else
            {
                onCompletion(response.result.error, nil);
            }
        }
    }
    
}
