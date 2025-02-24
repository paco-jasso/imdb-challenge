//
//  MovieCell.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    func setUpCellWith(movie: Movie) {
        titleLabel.text = movie.title
        genresLabel.text = formattedGenres(movie.genres)
        posterImage.getPoster(from: movie.posterPath)
        
        layer.cornerRadius = 10.0
        clipsToBounds = true
        cellBackground.clipsToBounds = true
        cellBackground.layer.cornerRadius = 10.0
    }
    
    func formattedGenres(_ genres: [Int]) -> String {
        return genres.map { String($0) }.joined(separator: ", ")
    }
}
