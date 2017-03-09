//
//  Mine.swift
//  iFreshF
//
//  Created by Jion on 16/4/20.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class Mine: NSObject {
    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: MineData?
    
    class func loadMineData(completion:(_ data: Mine?,_ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource: "Mine", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        
        if data != nil {
            let dict:NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict as! Dictionary<String, Any>, cls: Mine.self) as? Mine
            completion(data, nil)
        }
    }
    
    static func customClassMapping() -> [String : String]? {
        let dic = ["data" : "\(MineData.self)"]
        return dic
    }

}

class MineData: NSObject {
    var has_new: Int = -1
    var has_new_user: Int = -1
    var availble_coupon_num = 0
}
