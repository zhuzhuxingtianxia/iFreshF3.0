//
//  ProductCell.swift
//  iFreshF
//
//  Created by Jion on 16/5/9.
//  Copyright © 2016年 Youjuke. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    static private let identifier = "ProductCell"
    
    //MARK: - 初始化子控件
    private lazy var goodsImageView: UIImageView = {
        let goodsImageView = UIImageView()
        return goodsImageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.font = HomeCollectionTextFont
        nameLabel.textColor = UIColor.black
        return nameLabel
    }()
    
    private lazy var fineImageView: UIImageView = {
        let fineImageView = UIImageView()
        fineImageView.image = UIImage(named: "jingxuan.png")
        return fineImageView
    }()
    
    private lazy var giveImageView: UIImageView = {
        let giveImageView = UIImageView()
        giveImageView.image = UIImage(named: "buyOne.png")
        return giveImageView
    }()
    
    private lazy var specificsLabel: UILabel = {
        let specificsLabel = UILabel()
        specificsLabel.textColor = UIColor.colorWithRGB(r: 100, g: 100, b: 100)
        specificsLabel.font = UIFont.systemFont(ofSize: 12)
        specificsLabel.textAlignment = .left
        return specificsLabel
    }()
    
    private lazy var buyView: BuyView = {
        let buyView = BuyView()
        return buyView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.colorWithRGB(r: 100, g: 100, b: 100)
        lineView.alpha = 0.05
        return lineView
    }()
    
    private var discountPriceView: DiscountPriceView?
    
    var addProductClick:((_ imageView: UIImageView) -> ())?
    
    // MARK: - 模型set方法
    var goods: Goods? {
        didSet {
            goodsImageView.sd_setImage(with: URL(string: goods!.img!), placeholderImage: UIImage(named: "v2_placeholder_square"))
            //goodsImageView.sd_setImageWithURL(NSURL(string: goods!.img!), placeholderImage: UIImage(named: "v2_placeholder_square"))
            nameLabel.text = goods?.name
            if goods!.pm_desc == "买一赠一" {
                giveImageView.isHidden = false
            } else {
                giveImageView.isHidden = true
            }
            
            if goods!.is_xf == 1 {
                fineImageView.isHidden = false
            } else {
                fineImageView.isHidden = true
            }
            
            if discountPriceView != nil {
                discountPriceView!.removeFromSuperview()
            }
            discountPriceView = DiscountPriceView(price: goods?.price, marketPrice: goods?.market_price)
            addSubview(discountPriceView!)
            
            specificsLabel.text = goods?.specifics
            buyView.goods = goods
        }

    }
    
    class func cellWithTableView(tableView: UITableView) -> ProductCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ProductCell
        
        if cell == nil {
            cell = ProductCell(style: .default, reuseIdentifier: identifier)
        }
        
        return cell!
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        selectionStyle = .none
        contentView.backgroundColor = UIColor.white
        
        addSubview(goodsImageView)
        addSubview(lineView)
        addSubview(nameLabel)
        addSubview(fineImageView)
        addSubview(giveImageView)
        addSubview(specificsLabel)
        addSubview(buyView)
        
        weak var tmpSelf = self
        buyView.clickAddShopCar = {
            if tmpSelf!.addProductClick != nil {
                tmpSelf!.addProductClick!(tmpSelf!.goodsImageView)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        goodsImageView.frame = CGRect(x:0, y:0, width:height, height:height)
        fineImageView.frame = CGRect(x:goodsImageView.frame.maxX, y:HotViewMargin, width:30, height:16)
        
        if fineImageView.isHidden {
            nameLabel.frame = CGRect(x:goodsImageView.frame.maxX + 3, y:HotViewMargin - 2, width:width - goodsImageView.frame.maxX, height:20)
        } else {
            nameLabel.frame = CGRect(x:fineImageView.frame.maxX + 3, y:HotViewMargin - 2, width:width - fineImageView.frame.maxX, height:20)
        }
        
        giveImageView.frame = CGRect(x:goodsImageView.frame.maxX, y:nameLabel.frame.maxY, width:35, height:15)
        
        specificsLabel.frame = CGRect(x:goodsImageView.frame.maxX, y:giveImageView.frame.maxY, width:width, height:20)
        discountPriceView?.frame = CGRect(x:goodsImageView.frame.maxX, y:specificsLabel.frame.maxY, width:60, height:height - specificsLabel.frame.maxY)
        lineView.frame = CGRect(x:HotViewMargin, y:height - 1, width:width - HotViewMargin, height:1)
        buyView.frame = CGRect(x:width - 85, y:height - 30, width:80, height:25)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
