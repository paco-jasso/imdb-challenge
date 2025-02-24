//
//  Constants.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import Foundation

class Constants {
    //Do not share this values to the public. Avoid pushing to repo.
    static let APIKey = "c663bf22155fc95f909eed318db106f9"
    static let authToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjYzYmYyMjE1NWZjOTVmOTA5ZWVkMzE4ZGIxMDZmOSIsIm5iZiI6MTc0MDM0NjI3My42NzcsInN1YiI6IjY3YmI5M2ExYTIzOTI5YWMyOGJlZjE0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LZJdsciPllY_3f9RlPrBotaeTLkwOFJheSvRJvqumEQ"
    
    //This is safe
    static let popularMoviesURL = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"
    static let postersURL = "https://image.tmdb.org/t/p/original"
}
