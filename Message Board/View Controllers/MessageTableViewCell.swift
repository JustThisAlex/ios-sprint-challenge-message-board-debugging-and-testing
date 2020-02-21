//
//  MessageTableViewCell.swift
//  Message Board
//
//  Created by Alexander Supe on 21.02.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        let subv = UIView()
        subv.translatesAutoresizingMaskIntoConstraints = false
        subv.backgroundColor = .systemBlue
        addSubview(subv)
        subv.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        subv.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        subv.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        subv.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        subv.layer.cornerRadius = 20
        if textLabel != nil {
            subv.addSubview(textLabel!)
            textLabel?.translatesAutoresizingMaskIntoConstraints = false
            textLabel?.textColor = .white
            textLabel?.removeConstraints(textLabel?.constraints ?? [])
            textLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            textLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
            textLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
            textLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        }
        if detailTextLabel != nil {
            detailTextLabel?.textColor = .white
            detailTextLabel?.translatesAutoresizingMaskIntoConstraints = false
            if #available(iOS 13.0, *) { detailTextLabel?.textColor =  .secondaryLabel }
            else { detailTextLabel?.textColor =  .gray }
            detailTextLabel?.removeConstraints(textLabel?.constraints ?? [])
            detailTextLabel?.topAnchor.constraint(equalTo: subv.bottomAnchor, constant: 2).isActive = true
            detailTextLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        }
    }
}
