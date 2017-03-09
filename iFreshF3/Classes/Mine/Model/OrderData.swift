//
//  OrderData.swift
//  iFreshF
//
//  Created by Jion on 16/5/25.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class OrderData: NSObject, DictModelProtocol {

    var page: Int = -1
    var code: Int = -1
    var data: [Order]?
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(Order.self)"]
    }
    
    class func loadOrderData(completion:(_ data: OrderData?, _ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource: "MyOrders", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict as! Dictionary<String, Any> , cls: OrderData.self) as? OrderData
            completion(data, nil)
        }
    }

}
class Order: NSObject, DictModelProtocol {
    var star: Int = -1
    var comment: String?
    var id: String?
    var order_no: String?
    var accept_name: String?
    var user_id: String?
    var pay_code: String?
    var pay_type: String?
    var distribution: String?
    var status: String?
    var pay_status: String?
    var distribution_status: String?
    var postcode: String?
    var telphone: String?
    var country: String?
    var province: String?
    var city: String?
    var address: String?
    var longitude: String?
    var latitude: String?
    var mobile: String?
    var payable_amount: String?
    var real_amount: String?
    var pay_time: String?
    var send_time: String?
    var create_time: String?
    var completion_time: String?
    var order_amount: String?
    var accept_time: String?
    var lastUpdateTime: String?
    var preg_dealer_type: String?
    var user_pay_amount: String?
    var order_goods: [[OrderGoods]]?
    var enableComment: Int = -1
    var isCommented: Int = -1
    var newStatus: Int = -1
    var status_timeline: [OrderStatus]?
    var fee_list: [OrderFeeList]?
    var buy_num: Int = -1
    var showSendCouponBtn: Int = -1
    var dealer_name: String?
    var dealer_address: String?
    var dealer_lng: String?
    var dealer_lat: String?
    var buttons: [OrderButton]?
    var detail_buttons: [OrderButton]?
    var textStatus: String?
    var in_refund: Int = -1
    var checknum: String?
    var postscript: String?
    
    static func customClassMapping() -> [String : String]? {
        return ["order_goods" : "\(OrderGoods.self)", "status_timeline" : "\(OrderStatus.self)", "fee_list" : "\(OrderFeeList.self)", "buttons" : "\(OrderButton.self)", "detail_buttons" : "\(OrderButton.self)"]
    }
}

class OrderGoods: NSObject {
    var goods_id: String?
    var goods_price: String?
    var real_price: String?
    var isgift: Int = -1
    var name: String?
    var specifics: String?
    var brand_name: String?
    var img: String?
    var is_gift: Int = -1
    var goods_nums: String?
}

class OrderStatus: NSObject {
    var status_title: String?
    var status_desc: String?
    var status_time: String?
}

class OrderFeeList: NSObject {
    var text: String?
    var value: String?
}

class OrderButton: NSObject {
    var type: Int = -1
    var text: String?
}

