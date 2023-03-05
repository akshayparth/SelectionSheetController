//
//  SelectionSheetDataSource.swift
//  SelectionSheetController
//

import UIKit

public protocol SelectionSheetDataSource: AnyObject {
    func itemsCount() -> Int
    func title(at row: Int) -> String
    var allowsMultiSelection: Bool { get }
    func isCheckmarkEnabled(at row: Int) -> Bool
    func update(selected row: Int, completion: ()->Void)
    func actualSelectedRows() -> [Int]
    var infoTitle: String { get }
    var resetAllIndex: Int? { get }
}
