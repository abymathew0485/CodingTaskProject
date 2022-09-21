//
//  CarouselItemViewModel.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import Foundation

class CarouselItemViewModel: ItemDetails {

    var imageName: String
    var titleText: String
    var childItems: [ItemDetails]?

    internal init(imageName: String = "sampleImage", titleText: String = "", childItems: [ItemDetails]? = nil) {
        self.imageName = imageName
        self.titleText = titleText
        self.childItems = childItems
    }
}
