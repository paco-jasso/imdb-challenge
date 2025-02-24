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
        //UI Styling
        posterImage.clipsToBounds = true
        posterImage.layer.cornerRadius = 10.0
        
        view.backgroundColor = ColorPalette.shared.backgroundColor
        titleLabel.textColor = ColorPalette.shared.baseFontColor
        genresLabel.textColor = ColorPalette.shared.accentFontColor
        releaseDateLabel.textColor = ColorPalette.shared.baseFontColor
        overviewLabel.textColor = ColorPalette.shared.baseFontColor
        
    }
    
    func setUpData() {
        //Display the data on the screen
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
        //Change from API's generic date format to full date
        let apiFormat = DateFormatter()
        apiFormat.dateFormat = "yyyy-MM-dd"
        let date = apiFormat.date(from: date) ?? Date()
        
        let longFormat = DateFormatter()
        longFormat.dateFormat = "MMMM d, yyyy"
        
        return longFormat.string(from: date)
    }
}
