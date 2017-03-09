//
//  Supermarket.swift
//  iFreshF
//
//  Created by Jion on 16/5/9.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class Supermarket: NSObject ,DictModelProtocol{

    var code: Int = -1
    var msg: String?
    var reqid: String?
    var data: SupermarketResouce?

    class func loadSupermarketData(completion:(_ data: Supermarket?,_ error: NSError?) -> Void) {
        let path = Bundle.main.path(forResource:"supermarket", ofType: nil)
        let data = NSData(contentsOfFile: path!)
        if data != nil {
            let dict: NSDictionary = (try! JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.allowFragments)) as! NSDictionary
            let modelTool = DictModelManager.sharedManager
            let data = modelTool.objectWithDictionary(dict: dict as! Dictionary<String, Any>, cls: Supermarket.self) as? Supermarket
            completion(data, nil)
        }
    }
    class func searchCategoryMatchProducts(supermarketResouce: SupermarketResouce) -> [[Goods]]? {
        var arr = [[Goods]]()
        
        let products = supermarketResouce.products
        for cate in supermarketResouce.categories! {
            let goodsArr = products!.value(forKey: cate.id!) as! [Goods]
            arr.append(goodsArr)
        }
        return arr
    }
    
    
    static func customClassMapping() -> [String : String]? {
        return ["data" : "\(SupermarketResouce.self)"]
    }
    
}

class SupermarketResouce: NSObject ,DictModelProtocol{
    var categories: [Categorie]?
    var products: Products?
    var trackid: String?
    
    static func customClassMapping() -> [String : String]? {
        return ["categories" : "\(Categorie.self)", "products" : "\(Products.self)"]
    }
}

class Categorie: NSObject {
    var id: String?
    var name: String?
    var sort: String?
}

class Products: NSObject, DictModelProtocol {
    var a82: [Goods]?
    var a96: [Goods]?
    var a99: [Goods]?
    var a106: [Goods]?
    var a134: [Goods]?
    var a135: [Goods]?
    var a136: [Goods]?
    var a137: [Goods]?
    var a141: [Goods]?
    var a143: [Goods]?
    var a147: [Goods]?
    var a151: [Goods]?
    var a152: [Goods]?
    var a158: [Goods]?
    
    static func customClassMapping() -> [String : String]? {
        return ["a82" : "\(Goods.self)", "a96" : "\(Goods.self)", "a99" : "\(Goods.self)", "a106" : "\(Goods.self)", "a134" : "\(Goods.self)", "a135" : "\(Goods.self)", "a136" : "\(Goods.self)", "a141" : "\(Goods.self)", "a143" : "\(Goods.self)", "a147" : "\(Goods.self)", "a151" : "\(Goods.self)", "a152" : "\(Goods.self)", "a158" : "\(Goods.self)", "a137" : "\(Goods.self)"]
    }
}

