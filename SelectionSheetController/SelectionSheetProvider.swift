//
//  SelectionSheetProvider.swift
//  SelectionSheetController
//

import UIKit

public protocol SelectionSheetProvider: AnyObject {
    func provideSelectionSheet(dataSource: SelectionSheetDataSource?, themeProvider: SelectionSheetThemeProvider?, selectionSheetDelegate: SelectionSheetDelegate, tag: Int) -> SelectionSheetController
}

public extension SelectionSheetProvider {
    func provideSelectionSheet(dataSource: SelectionSheetDataSource?, themeProvider: SelectionSheetThemeProvider?, selectionSheetDelegate: SelectionSheetDelegate, tag: Int) -> SelectionSheetController {
        let bundle = Bundle(for: SelectionSheetController.self)
        let storyboard = UIStoryboard(name: String(describing: SelectionSheetController.self), bundle: bundle)
        let selectionSheet = storyboard.instantiateViewController(withIdentifier: String(describing: SelectionSheetController.self))  as! SelectionSheetController
        selectionSheet.tag = tag
        selectionSheet.dataSource = dataSource
        selectionSheet.themeProvider = themeProvider
        selectionSheet.selectionSheetDelegate = selectionSheetDelegate
        return selectionSheet
    }
}
