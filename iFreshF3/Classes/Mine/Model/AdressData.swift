//
//  AdressData.swift
//  iFreshF
//
//  Created by Jion on 16/4/18.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class AdressData: NSObject,DictModelProtocol {
    var code: Int = -1
    var msg: String?
    var data: [Adress]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data": "\(Adress.self)"]
    }
    
    class func loadMyAdressData(completion:(_ data: AdressData?, _ error: NSError?) -> Void){
        let path = Bundle.main.path(forResource:"MyAdress", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict as! Dictionary<String, Any>, cls: AdressData.self) as? AdressData
            completion(data, nil)
        }
    }
    
}

class Adress: NSObject {
    
    var accept_name: String?
    var telphone: String?
    var province_name: String?
    var city_name: String?
    var address: String?
    var lng: String?
    var lat: String?
    var gender: String?
}
