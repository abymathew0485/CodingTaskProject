//
//  CarouselView.swift
//  SampleProject1
//
//  Created by Aby Mathew on 20/09/22.
//

import UIKit


protocol CarouselViewDelegate: AnyObject {
    func didSeletectItem(at index: Int)
}

final class CarouselView: UIView {

    weak var delegate: CarouselViewDelegate?
    private var myCollectionView: UICollectionView!
    private var pageControll: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .secondaryAppColour
        pageControl.currentPageIndicatorTintColor = .primaryAppColour

        return pageControl
    }()

    private var carouselItemViewModels: [ItemDetails]? {
        didSet{
            myCollectionView.reloadData()
            let numberOfPages = self.carouselItemViewModels?.count ?? 0
            pageControll.numberOfPages = min(5, numberOfPages)
        }
    }

    override init(frame: CGRect) {

        super.init(frame: frame)
        initSubViews()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubViews()
    }

    private func initSubViews(){
        // collectionview
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(CarouselViewCell.self, forCellWithReuseIdentifier: CarouselViewCell.identifier)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.isPagingEnabled = true

        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        myCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        // page controller
        addSubview(pageControll)
        pageControll.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControll.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pageControll.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControll.topAnchor.constraint(equalTo: myCollectionView.bottomAnchor).isActive = true

    }

    public func configureCarousel(with viewModels: [ItemDetails]) {
        self.carouselItemViewModels = viewModels
    }

}

extension CarouselView : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselItemViewModels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CarouselViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselViewCell.identifier, for: indexPath) as! CarouselViewCell
        if let carouselVM = carouselItemViewModels {
            cell.configureCell(with: carouselVM[indexPath.item])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.95, height: collectionView.bounds.height * 0.9)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = currentPageIndex(for: scrollView)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.didSeletectItem(at: currentPageIndex(for: scrollView))
    }

    private func currentPageIndex(for scrollView: UIScrollView) -> Int {
        return Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
    }

}
