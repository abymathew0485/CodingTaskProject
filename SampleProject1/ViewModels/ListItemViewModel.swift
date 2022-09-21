//
//  ListItemViewModel.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import Foundation

class ListItemViewModel: ItemDetails {

    var imageName: String
    var titleText: String
    var childItems: [ItemDetails]? = []

    internal init(imageName: String = "product1", titleText: String = "", childItems: [ItemDetails]? = nil) {
        self.imageName = imageName
        self.titleText = titleText
        self.childItems = childItems
    }
}
