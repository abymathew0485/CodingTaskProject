//
//  ItemDetails Protocol.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import Foundation

protocol ItemDetails {
    var imageName: String {get set}
    var titleText: String {get set}

    var childItems: [ItemDetails]? {get set}
}

