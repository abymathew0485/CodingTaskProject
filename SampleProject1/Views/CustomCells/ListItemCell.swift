//
//  ListItemCell.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import UIKit

final class ListItemCell: UITableViewCell {

    static let identifier =  "ListItemCell"

    private var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .titleAppColour
        return title
    }()

    private var iconImageView: UIImageView = {
        let image = UIImageView()
        image.layer.borderColor = UIColor.secondaryAppColour.cgColor
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewConfigurations()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewConfigurations()
    }

    private func viewConfigurations(){

        // Icon image
        contentView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        // Title label
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    public func configure(with listItem: ItemDetails){
        titleLabel.text = listItem.titleText
        iconImageView.image = UIImage(named: listItem.imageName)
    }

}
