//
//  SelectionSheetViewModel.swift
//  DeleteMe
//

//

import UIKit

public class SelectionSheetDefaultDataSource: SelectionSheetDataSource {
    var options: [SelectionOption]
    public var allowsMultiSelection: Bool
    public var infoTitle: String
    
    private var selectedRows = [Int]()
    public var resetAllIndex: Int?
    
    public init(options: [SelectionOption], allowsMultiSelection: Bool, infoTitle: String, selectedValues:[String]? = nil, resetAllIndex: Int? = nil) {
        self.options = options
        self.allowsMultiSelection = allowsMultiSelection
        self.infoTitle = infoTitle
        self.resetAllIndex = resetAllIndex
        
        if let selectedValues = selectedValues {
            if !allowsMultiSelection {
                assert((selectedValues.count == 1) || (selectedValues.count == 0), "If single selection is expected then there could be atmost only one selected value")
            }
            
            if selectedValues.count > 0 {
                for selectedValue in selectedValues {
                    if let index = options.firstIndex(where: { $0.title == selectedValue }) {
                        selectedRows.append(index + 1)
                    }
                }
            }
        }
    }
    
    public func itemsCount() -> Int {
        return options.count
    }
    
    public func title(at row: Int) -> String {
        return options[row - 1].title
    }
    
    public func update(selected row: Int, completion: ()->Void) {
        if let index = selectedRows.firstIndex(of: row) {
            selectedRows.remove(at: index)
        } else {
            if !allowsMultiSelection {
                selectedRows.removeAll()
            }
            // Handle situation when resetAllIndex is provided
            if let resetAllIndex = resetAllIndex {
                // None is selected
                if row == resetAllIndex + 1 {
                    selectedRows.removeAll()
                }
                // value other than none is selected, however none was previously selected
                else if let selectedIndex = selectedRows.firstIndex(of: resetAllIndex + 1) {
                    selectedRows.remove(at: selectedIndex)
                }
            }
            selectedRows.append(row)
        }
        completion()
    }
    
    public func isCheckmarkEnabled(at row: Int) -> Bool {
        if let _ = selectedRows.firstIndex(of: row) {
            return true
        } else {
            return false
        }
    }
    
    public func actualSelectedRows() -> [Int] {
        guard selectedRows.count > 0 else {
            return [Int]()
        }
        return selectedRows.map{ $0 - 1 }
    }
    
    var doneButtonColor: UIColor  = UIColor.blue
}
