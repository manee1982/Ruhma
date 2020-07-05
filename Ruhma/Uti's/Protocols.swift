//
//  Protocols.swift
//  Ruhma
//
//  Created by Manee Osman on 7/5/20.
//  Copyright © 2020 Manee Osman. All rights reserved.
//

import UIKit

protocol tryAgainDelegate {
    func tryAgainAfterNetWorkDissconnect()
}

@objc protocol CellDelegate {
    func cellButtonTapped(cell: UITableViewCell, params: [String: Any]?)
    @objc optional func cancelDelegateTask(params: [String: Any]?)
}
