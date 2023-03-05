//
//  SelectionSheetPresenter.swift
//  SelectionSheetController
//

import UIKit

public protocol SelectionSheetPresenter: AnyObject {
    func present(selectionSheet: SelectionSheetController)
}

public extension SelectionSheetPresenter where Self: UIViewController {
    func present(selectionSheet: SelectionSheetController) {
        selectionSheet.modalPresentationStyle = .overFullScreen
        present(selectionSheet, animated: true, completion: nil)
    }
}
