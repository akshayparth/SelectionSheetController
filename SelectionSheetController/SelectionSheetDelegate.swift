//
//  SelectionSheetDelegate.swift
//  SelectionSheetController
//

import UIKit

public protocol SelectionSheetDelegate: AnyObject {
    func didSelect(rows: [Int], for tag: Int)
}
