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
        //Configure ViewModel
        self.viewModel = HomeScreenViewModel()
        super.init(coder: coder)
        self.viewModel.homeScreenViewModelDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Confirguring UICollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "MovieCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        
        setUpUI()
        viewModel.fetchPopularMovies()
    }

    func setUpUI() {
        //Dark/Light mode support
        ColorPalette.shared.setColorPalette(traitCollection)
        
        //Main UI elements
        titleLabel.textColor = ColorPalette.shared.accentFontColor
        subtitleLabel.textColor = ColorPalette.shared.accentFontColor
        
        view.backgroundColor = ColorPalette.shared.backgroundColor
        collectionView.backgroundColor = ColorPalette.shared.backgroundColor
    }
    
    func showDetailScreenFor(movie: Movie) {
        //This shows a new screen with the full details of the movie
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsScreen") as? DetailScreenViewController else {
            return
        }
        detailsViewController.movie = movie
        present(detailsViewController, animated: true, completion: nil)
    }

}

//UICollectionView Delegate & DataSource, here we manage the view
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetailScreenFor(movie: viewModel.movies[indexPath.row])
    }
    
}

extension HomeScreenViewController: HomeScreenViewModelDelegate {
    //Launch an alert with the HTTP error
    func didfinishWithError(_ string: String) {
        print("Error: \(string)")
        let alert = UIAlertController(title: "You succeeded at failing!",
                                      message: string,
                                      preferredStyle: .alert)
        let accept = UIAlertAction(title: "Great!", style: .default, handler: nil)
        alert.addAction(accept)
        present(alert, animated: true, completion: nil)
    }
    
    //Here we refresh the table after fetching data
    func didFinishFetching() {
        collectionView?.reloadData()
    }
}



