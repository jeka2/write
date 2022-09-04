//
//  TitleTableCellViewModel.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/3/22.
//

import Foundation
import UIKit

struct TitleTableCellViewModel {
    
    let model: Title
    
    var titleString: NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: model.titleName.uppercased())
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        return attributedString
    }
    
    init(model: Title) {
        self.model = model
    }
    
}
