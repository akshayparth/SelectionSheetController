//
//  SelectionSheetController.swift
//  DeleteMe
//

//

import UIKit

public class SelectionSheetController: UITableViewController {
    static var storyboardName = "SelectionSheet"
    weak var dataSource: SelectionSheetDataSource?
    weak var themeProvider: SelectionSheetThemeProvider?
    weak var selectionSheetDelegate: SelectionSheetDelegate?
    
    private var totalItemsCount = 0
    var tag: Int!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemsCount = dataSource?.itemsCount() {
            totalItemsCount = itemsCount + 2
        } else {
            totalItemsCount = 0
        }
        
        view.backgroundColor = themeProvider?.selectionSheetBackgroundColor
        tableView.tableFooterView = UIView()
        
        configureTapGesture()
        configureCellsBottomDisplay()
    }
    
    // MARK:- Basic configurations
    private func configureCellsBottomDisplay() {
        var contentInsetTop = tableView.bounds.size.height - UIApplication.shared.statusBarFrame.height
        for i in 0..<totalItemsCount {
            let rowHeight = tableView(tableView, heightForRowAt: IndexPath(row: i, section: 0))
            contentInsetTop = contentInsetTop - rowHeight
            if contentInsetTop <= 0 {
                contentInsetTop = 0
                break
            }
        }
        tableView.contentInset = UIEdgeInsets.init(top: contentInsetTop, left: 0, bottom: 0, right: 0)
    }
    
    private func configureTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapOutsideToDismiss))
        self.tableView.backgroundView = UIView()
        self.tableView.backgroundView?.addGestureRecognizer(tap)
    }
    
    @objc func tapOutsideToDismiss() {
        dismiss(animated: true, completion: nil)
    }

    // MARK:- Table view data source, delegate implementations
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalItemsCount
    }
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {
            // info cell
            return 35.0
        } else if row == totalItemsCount - 1 {
            // done cell
            return 44.0
        } else {
            // value cell
            return 38.0
        }
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0 {
            // info cell
            let infoCell = tableView.dequeueReusableCell(withIdentifier: String(describing: InfoCell.self), for: indexPath)
            infoCell.textLabel?.text = dataSource?.infoTitle
            infoCell.textLabel?.textColor = themeProvider?.selectionSheetTitleColor
            infoCell.backgroundColor = themeProvider?.selectionSheetTitleBackgroundColor
            return infoCell
        } else if row == totalItemsCount - 1 {
            // done cell
            let doneCell = tableView.dequeueReusableCell(withIdentifier: String(describing: DoneCell.self), for: indexPath)
            doneCell.backgroundColor = themeProvider?.selectionSheetDoneButtonBackgroundColor
            doneCell.textLabel?.textColor = themeProvider?.selectionSheetDoneButtonColor
            
            return doneCell
        } else {
            // value cell
            let valueCell = tableView.dequeueReusableCell(withIdentifier: String(describing: ValueCell.self), for: indexPath)
            valueCell.backgroundColor = themeProvider?.selectionSheetValueBackgroundColor
            valueCell.textLabel?.text = dataSource?.title(at: row)
            valueCell.tintColor = themeProvider?.selectionSheetCheckmarkColor
            if let showCheckmark = dataSource?.isCheckmarkEnabled(at: row), showCheckmark {
                valueCell.accessoryType = .checkmark
            } else {
                valueCell.accessoryType = .none
            }
            return valueCell
        }
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 0 {
            // info cell
            // do nothing
        } else if row == totalItemsCount - 1 {
            // done cell
            dismiss(animated: true) {
                self.selectionSheetDelegate?.didSelect(rows: self.dataSource?.actualSelectedRows().sorted() ?? [Int](), for: self.tag)
            }
        } else {
            // value cell
            dataSource?.update(selected: row, completion: {
                self.tableView.reloadData()
            })
        }
    }
    
}
