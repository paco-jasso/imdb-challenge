//
//  DetailScreenViewController.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import UIKit


class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpData()
    }
    
    func setUpUI() {
        posterImage.clipsToBounds = true
        posterImage.layer.cornerRadius = 10.0
        
        
    }
    
    func setUpData() {
        posterImage.getPoster(from: movie.posterPath)
        titleLabel.text = movie.title
        genresLabel.text = formattedGenres(movie.genres)
        releaseDateLabel.text = formattedDate(movie.release)
        overviewLabel.text = movie.overview
    }
    
    func formattedGenres(_ genres: [Int]) -> String {
        return genres.map { String($0) }.joined(separator: ", ")
    }
    
    func formattedDate(_ date: String) -> String {
        let apiFormat = DateFormatter()
        apiFormat.dateFormat = "yyyy-MM-dd"
        let date = apiFormat.date(from: date) ?? Date()
        
        let longFormat = DateFormatter()
        longFormat.dateFormat = "MMMM d, yyyy"
        
        return longFormat.string(from: date)
    }
}
