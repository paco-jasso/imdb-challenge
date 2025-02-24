//
//  HomeScreenViewModel.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import Foundation

protocol HomeScreenViewModelDelegate: AnyObject {
    func didFinishFetching()
    
    func didfinishWithError(_ string: String)
}

class HomeScreenViewModel {
    weak var homeScreenViewModelDelegate: HomeScreenViewModelDelegate?
    
    var movies: [Movie] = []
    
    func fetchPopularMovies() {
        //Create the URL
        let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
        let urlString = String(format: Constants.popularMoviesURL, languageCode)
        guard let url = URL(string: urlString) else {
            return
        }
        
        //Adding auth token to headers
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(Constants.authToken)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Create an HTTP request task
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if statusCode != 200 {
                    self?.handleError(data!)
                    return
                }
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            do {
                //Decode using model
                let decodeMovies = try JSONDecoder().decode(PopularMoviesResponse.self, from: data)
                DispatchQueue.main.async {
                    
                    //Save data and notify controller
                    self?.movies = decodeMovies.results
                    self?.homeScreenViewModelDelegate?.didFinishFetching()
                }
            } catch {
                print("JSON Decoding Failed: \(error)")
            }
            
        }
        task.resume()
    }
    
    func handleError(_ data: Data) {
        //Decode error and talk back to controller
        do {
            let error = try JSONDecoder().decode(ErrorResponse.self, from: data)
            DispatchQueue.main.async {
                self.homeScreenViewModelDelegate?.didfinishWithError(error.statusMessage)
            }
        } catch {
            print("Error: \(error)")
        }
    }
}
