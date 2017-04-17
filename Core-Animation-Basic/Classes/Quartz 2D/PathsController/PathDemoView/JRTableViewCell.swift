//
//  JRTableViewCell.swift
//  Core-Animation-Basic
//
//  Created by wxiao on 2017/4/17.
//  Copyright © 2017年 王潇. All rights reserved.
//

import UIKit
import SnapKit

class JRTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func addNewView(view: UIView) {
		view.layer.borderColor = UIColor.black.cgColor
		view.layer.borderWidth = 1
		view.backgroundColor   = UIColor.gray.withAlphaComponent(0.1)
		contentView.addSubview(view)
		view.snp.makeConstraints { (make) in
			make.edges.equalTo(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
		}
		
	}
}
