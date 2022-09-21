//
//  DataSourceManager.swift
//  SampleProject1
//
//  Created by Aby Mathew on 21/09/22.
//

import Foundation


class DataSourceManager {

    static func carouselItems() -> [CarouselItemViewModel] {
        
        let iphones = [ListItemViewModel(imageName: "iphonex", titleText: "iPhone X"),
                       ListItemViewModel(imageName: "iphonered", titleText: "iPhone Red"),
                       ListItemViewModel(imageName: "iphone12", titleText: "iPhone 12"),
                       ListItemViewModel(imageName: "iphone13", titleText: "iPhone 13")]

        let iwatches = [ListItemViewModel(imageName: "iwatch1", titleText: "iWatch 1"),
                        ListItemViewModel(imageName: "iwatch2", titleText: "iWatch 2"),
                        ListItemViewModel(imageName: "iwatch3", titleText: "iWatch 3")]

        let iPads = [ListItemViewModel(imageName: "ipadmini", titleText: "iPad Mini"),
                     ListItemViewModel(imageName: "ipadpro", titleText: "iPad Pro")]

        let imacs = [ListItemViewModel(imageName: "imac27", titleText: "iMac 27"),
                     ListItemViewModel(imageName: "imacm1", titleText: "iMac M1 Chiip")]



        let allItems = iphones + iwatches + iPads + imacs

        return [CarouselItemViewModel(imageName: "allProducts", titleText: "All Apple Products",childItems: allItems) ,
                CarouselItemViewModel(imageName: "imac27", titleText: "iMacs",childItems: imacs),
                CarouselItemViewModel(imageName: "iphone13", titleText: "iPhones",childItems: iphones),
                CarouselItemViewModel(imageName: "iwatch1", titleText: "iWatches",childItems: iwatches),
                CarouselItemViewModel(imageName: "ipadmini", titleText: "iPads",childItems: iPads)
        ]
    }

}
