//
//  TitleCell.swift
//  Writing
//
//  Created by Yevgeniy Ivanov on 9/1/22.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleCellTableViewCellIdentifier"
    
    // TODO: - Figure out why dimensions do not match container
    private var titleImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private var headerLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        addSubview(titleImage)
        addSubview(headerLabel)
        layoutConstraints()
    }
    
    private func layoutConstraints() {
        NSLayoutConstraint.activate([
            titleImage.topAnchor.constraint(equalTo: topAnchor),
            titleImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleImage.leftAnchor.constraint(equalTo: leftAnchor),
            titleImage.heightAnchor.constraint(equalToConstant: 200),
            titleImage.widthAnchor.constraint(equalToConstant: 150),
            
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            headerLabel.leftAnchor.constraint(equalTo: titleImage.rightAnchor, constant: 20),
            headerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        ])
    }
    
    func configure(with viewModel: TitleTableCellViewModel) {
        titleImage.image = UIImage(systemName: "star.fill")
        headerLabel.attributedText = viewModel.titleString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
