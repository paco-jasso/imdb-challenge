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
    
    func setUpCellWith(movie: Movie) {
        titleLabel.text = movie.title
        genresLabel.text = formattedGenres(movie.genres)
        posterImage.getPoster(from: movie.posterPath)
    }
    
    func formattedGenres(_ genres: [Int]) -> String {
        return genres.map { String($0) }.joined(separator: ", ")
    }
}
