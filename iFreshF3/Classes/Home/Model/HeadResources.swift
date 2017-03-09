//
//  HeadResources.swift
//  iFreshF
//
//  Created by Jion on 16/5/3.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class HeadResources: NSObject,DictModelProtocol {

    var msg: String?
    var reqid: String?
    var data: HeadData?
    
    class func loadHomeHeadData(completion:(_ data: HeadResources?,_ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource:"首页焦点按钮", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments)) as! NSDictionary
            let data = DictModelManager.sharedManager.objectWithDictionary(dict: dict as! Dictionary<String, Any>, cls: HeadResources.self) as? HeadResources
            completion(data, nil)
        }
        
    }
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(HeadData.self)"]
    }
}

class HeadData: NSObject,DictModelProtocol {
    var focus: [Activities]?
    var icons: [Activities]?
    var activities: [Activities]?
    
    static func customClassMapping() -> [String : String]? {
        return ["focus" : "\(Activities.self)", "icons" : "\(Activities.self)", "activities" : "\(Activities.self)"]
    }
}

class Activities: NSObject {
    var id: String?
    var name: String?
    var img: String?
    var topimg: String?
    var jptype: String?
    var trackid: String?
    var mimg: String?
    var customURL: String?
}







//end
