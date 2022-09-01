//
//  TitleCell.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/1/22.
//

import UIKit

class TitleCellTableViewCell: UITableViewCell {
    
    static let identifier = "TitleCellTableViewCellIdentifier"
    
    lazy var image: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .red
        addSubview(image)
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor),
            image.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
