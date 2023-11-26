//
//  ExampleCollectionDataSource.swift
//  Example
//
//  Created by Emre on 13.05.2023.
//

import Foundation
import UIKit
import EDCarouselSPM

struct Onboarding {
    let color: UIColor
    let title: String
}

/// `ExampleCollectionDataSource` is a class that conforms to the `UICollectionViewDataSource` and `UICollectionViewDelegate` protocols.
/// It provides data and handles interactions for a `UICollectionView`.
final class ExampleCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    /// An array of `Onboarding` objects that will be used to populate the `UICollectionView`.
    private var items = [Onboarding]()
    
    /// A weak reference to the `UICollectionView` this data source is managing.
    private weak var collectionView: UICollectionView?
    
    /// A weak reference to the `UIPageControl` this data source is managing.
    private weak var pageControl: UIPageControl?
    
    /// A closure that gets called when the user stops dragging the collection view. This closure is optional and can be set to handle custom behavior when the dragging action ends.
    var scrollViewWillEndDragging: ((UIScrollView, CGPoint, UnsafeMutablePointer<CGPoint>) -> Void)?

    /// The initializer for the class. It sets the `collectionView` property and calls the `set(collectionView: UICollectionView)` method.
    /// - Parameter collectionView: The `UICollectionView` instance that this data source will manage.
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        set(collectionView: collectionView)
    }

    /// A method to update the `items` array and reload the collection view data.
    /// - Parameter items: An array of `Onboarding` objects that will be used to populate the `UICollectionView`.
    func updateData(items: [Onboarding]) {
        self.items = items
        collectionView?.reloadData()
    }

    /// A private method to set up the collection view with a custom layout, register the cell class, and set the delegate and data source.
    /// - Parameter collectionView: The `UICollectionView` instance that this data source will manage.
    private func set(collectionView: UICollectionView) {
        guard let layout = collectionView.collectionViewLayout as? CarouselFlowLayout else { return }
        let padding = 10.0
        layout.itemSize = CGSize(
            width: (collectionView.frame.size.width - padding) / 1.21,
            height: (collectionView.frame.size.width - padding) / 0.76
        )
        layout.spacingMode = CarouselFlowLayoutSpacingMode.overlap(visibleOffset: 200)
        layout.sideItemScale = 0.8
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.registerNib(ExampleCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
    }
    
    /// Provides the cell for each item in the `UICollectionView`. This is a required method for the `UICollectionViewDataSource` protocol.
    /// - Parameters:
    ///   - collectionView: The `UICollectionView` instance requesting the cell.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A configured `UICollectionViewCell` instance.
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(ExampleCollectionViewCell.self, for: indexPath) else {
            fatalError("UNABLE TO DEQUEUE CELL")
        }
        let item = items[indexPath.row]
        cell.set(item: item)
        return cell
    }

    /// Returns the number of items in the section. This is a required method for the `UICollectionViewDataSource` protocol.
    /// - Parameters:
    ///   - collectionView: The `UICollectionView` instance requesting this information.
    ///   - section: An index number identifying a section in `collectionView`.
    /// - Returns: The number of items in `section`.
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return items.count
    }

    /// Calls the `scrollViewWillEndDragging` closure if it's set. This is a delegate method for the `UIScrollViewDelegate` protocol.
    /// - Parameters:
    ///   - scrollView: The scroll-view object that is about to draw to a halt.
    ///   - velocity: The current velocity of the scroll view, measured in points per second.
    ///   - targetContentOffset: A pointer to a CGPoint structure. On return, the point specifies the stopping point of the scroll action.
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        scrollViewWillEndDragging?(scrollView, velocity, targetContentOffset)
    }
}

