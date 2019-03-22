//
//  networking.swift
//  OneFi-Movie
//
//  Created by Olatunji Fagbore on 22/03/2019.
//  Copyright © 2019 Softskan Limited. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Networking {
    var dataresponse: DataResponse<Any>!
    
    func abc(url: URL) -> DataResponse<Any> {
        
        //sending HTTP POST request
        Alamofire.request(url, method: .get, encoding: URLEncoding(destination: .queryString)).responseJSON {
            response in
            print("myresponzeeeee: ", response)
            self.dataresponse = response

        }
        return self.dataresponse
    }
}
