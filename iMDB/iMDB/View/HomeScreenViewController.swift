//
//  HomeScreenViewController.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import UIKit


class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
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
        collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        setUpUI()
        viewModel.fetchPopularMovies()
    }

    func setUpUI() {
        titleLabel.text = "iMDB"
        subtitleLabel.text = "Popular Movies Right Now"
    }

}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        cell.setUpCellWith(movie: viewModel.movies[indexPath.row])
        return cell
    }
    
    
}

extension HomeScreenViewController: HomeScreenViewModelDelegate {
    func didFinishFetching() {
        collectionView?.reloadData()
    }
}



