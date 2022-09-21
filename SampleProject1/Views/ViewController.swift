//
//  ViewController.swift
//  SampleProject1
//
//  Created by Aby Mathew on 20/09/22.
//

import UIKit


final class ViewController: UIViewController {

    private let searchBar = UISearchBar()
    private var searchResults: [ItemDetails] = []
    private var carouselView: CarouselView?
    private var carouselItemVMs: [CarouselItemViewModel]!

    private var listItemVMs: [ItemDetails]? {
        didSet{
            reloadListView()
        }
    }

    private var loadingItems: [ItemDetails] {
        return searchBar.searchTextField.text?.isEmpty == false ? searchResults : listItemVMs ?? []
    }

    private var tableview: UITableView = {
        let tableView = UITableView()
        tableView.register(ListItemCell.self, forCellReuseIdentifier: ListItemCell.identifier)
        return tableView
    }()

    fileprivate func reloadListView() {
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView()
        addCarousalView()
    }

    private func addTableView() {
        // list view
        tableview.dataSource = self
        tableview.delegate = self
        searchBar.delegate = self

        view.addSubview(tableview)

        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        tableview.sectionHeaderHeight = 60
    }

    private func addCarousalView() {
        carouselItemVMs = DataSourceManager.carouselItems()
        if carouselItemVMs.isEmpty == false {
            carouselView = CarouselView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.25))
            carouselView?.configureCarousel(with: carouselItemVMs) // method Dependency Injection
            tableview.tableHeaderView = carouselView
            listItemVMs = carouselItemVMs[0].childItems
            carouselView?.delegate = self
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListItemCell.identifier, for: indexPath) as! ListItemCell
            cell.configure(with: loadingItems[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ViewController: CarouselViewDelegate {
    // CarouselView delegate method for update tableview list based on carousel item's childs
    func didSeletectItem(at index: Int) {
        listItemVMs = carouselItemVMs[index].childItems
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContent(for: searchText)
        // Reload the table view with the search result data.
        reloadListView()
    }

    func filterContent(for searchText: String) {
        // Update the searchResults array with matches
        searchResults = listItemVMs?.filter({ item -> Bool in
            let match = item.titleText.range(of: searchText, options: .caseInsensitive)
            // Return the result if the range contains a match.
            return match != nil
        }) ?? []

    }
}
