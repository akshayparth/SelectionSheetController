//
//  SelectionSheetThemeProvider.swift
//  SelectionSheetController
//

import UIKit

public protocol SelectionSheetThemeProvider: AnyObject {
    var selectionSheetTitleColor: UIColor { get }
    var selectionSheetDoneButtonColor: UIColor { get }
    var selectionSheetCheckmarkColor: UIColor { get }
    var selectionSheetBackgroundColor: UIColor { get }
    var selectionSheetValueBackgroundColor: UIColor { get }
    var selectionSheetTitleBackgroundColor: UIColor { get }
    var selectionSheetDoneButtonBackgroundColor: UIColor { get }
}
