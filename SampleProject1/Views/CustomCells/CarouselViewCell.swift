//
//  CarouselViewCell.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import UIKit

final class CarouselViewCell: UICollectionViewCell {
    static let identifier: String = "CarouselViewCell"

    private var title: UILabel!

    var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewConfigurations()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewConfigurations()
    }

    private func viewConfigurations(){

        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.secondaryAppColour.cgColor

        // title label
        title = UILabel()
        title.textColor = .titleAppColour
        title.center = contentView.center
        contentView.addSubview(title)

        // icon imageview
        contentView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

        ])

    }

    func configureCell(with item: ItemDetails) {
        iconImageView.image = UIImage(named: item.imageName)
    }
}
