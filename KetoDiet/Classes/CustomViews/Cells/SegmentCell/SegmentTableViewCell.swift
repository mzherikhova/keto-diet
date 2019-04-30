//
//  SegmentTableViewCell.swift
//  KetoDiet
//
//  Created by Margarita Zherikhova on 06/04/2019.
//  Copyright © 2019 mzherikhova.ru. All rights reserved.
//

import UIKit

class SegmentTableViewCell: UITableViewCell,NibLoadable {

    @IBOutlet private weak var segmentControl:UISegmentedControl!
    
    var indexChanged: ItemClosure<Int>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        addTargets()
    }
    
    func set(titles:[String]) {
        segmentControl.removeAllSegments()
        titles.enumerated().forEach { i, title in
            segmentControl.insertSegment(withTitle: title, at: i, animated: true)
            
        }
        segmentControl.selectedSegmentIndex = 0
    }

    private func addTargets() {
        segmentControl.addTarget(self, action: #selector(segmentControlChangedIndex(sender:)), for: .valueChanged)
    }
    
    @objc private func segmentControlChangedIndex(sender: UISegmentedControl) {
        indexChanged?(sender.selectedSegmentIndex)
    }
    
}
