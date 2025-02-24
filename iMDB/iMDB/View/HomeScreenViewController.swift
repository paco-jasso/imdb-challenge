//
//  HomeScreenViewController.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import UIKit


class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: HomeScreenViewModel
    
    required init?(coder: NSCoder) {
        self.viewModel = HomeScreenViewModel()
        super.init(coder: coder)
        self.viewModel.homeScreenViewModelDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setUpUI()
        viewModel.fetchPopularMovies()
    }

    func setUpUI() {
        
    }

}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension HomeScreenViewController: HomeScreenViewModelDelegate {
    func didFinishFetching() {
        collectionView?.reloadData()
    }
}



