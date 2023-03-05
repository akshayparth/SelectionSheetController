//
//  SelectionSheetCellKind.swift
//  DeleteMe
//

//

import UIKit

extension String {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}
enum OptionsSheetKind: String {
    case info
    case value
    case done
    
    var rowHeight: CGFloat {
        switch self {
        case .info:
            return 44.0
        case .value:
            return 45.0
        case .done:
            return 44.0
        }
    }
    var reuseIdentifier: String {
        return "\(String(describing: self).firstUppercased)Cell"
    }
}
