//
//  CouponData.swift
//  iFreshF
//
//  Created by Jion on 16/5/26.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class CouponData: NSObject, DictModelProtocol {

    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: [Coupon]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Coupon.self)"]
    }

    class func loadCouponData(completion:(_ data: CouponData?, _ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource: "MyCoupon", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict as! Dictionary<String, Any>, cls: CouponData.self) as? CouponData
            completion(data, nil)
        }
    }

}

class Coupon: NSObject, DictModelProtocol {
    var id: String?
    var card_pwd: String?
    /// 开始时间
    var start_time: String?
    /// 结束时间
    var end_time: String?
    /// 金额
    var value: String?
    var tid: String?
    /// 是否被使用 0 使用 1 未使用
    var is_userd: String?
    /// 0 可使用 1 不可使用
    var status: Int = -1
    var true_end_time: String?
    /// 标题
    var name: String?
    var point: String?
    var type: String?
    var order_limit_money: String?
    var desc: String?
    var free_freight: String?
    var city: String?
    var ctime: String?
    
    static func customClassMapping() -> [String : String]? {
        return ["desc" : "\(String.self)"]
    }
}
