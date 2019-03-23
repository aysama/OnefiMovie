//
//  OneFi_MovieTests.swift
//  OneFi-MovieTests
//
//  Created by Olatunji Fagbore on 22/03/2019.
//  Copyright © 2019 Softskan Limited. All rights reserved.
//

import XCTest
@testable import Pods_OneFi_Movie
@testable import OneFi_Movie

class OneFi_MovieTests: XCTestCase {
    
    var collectionData = [AnyObject]()
    
    //Check Loop on Homepage
    func testMovieLoop() {
        let movies = ["Batman", "Batman and Robin", "Batman", "Batman", "Batman Returns", "Batman Forever", "Batman & Robin", "Batman Begins", "The Dark Knight", "The Dark Knight Rises", "Batman v Superman: Dawn of Justice", "Suicide Squad", "Justice League", "Joker", "Superman", "Man Of Steel", "Ant-man", "Spider-Man: Homecoming"]
        let years = [1943, 1949, 1966, 1989, 1992, 1995, 1997, 2005, 2008, 2012, 2016, 2016, 2017, 2019, 1978, 2013, 2015, 2017]
        for i in 0...movies.count-1 {
            let mov = movies[i]
            let yr = years[i]
            let urlstring = "https://www.omdbapi.com/?apikey=1fe468b0&t=\(mov)&y=\(yr)"
            let urlString2 = urlstring.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let myurl = URL(string: urlString2 ?? "http://google.com")!
        }
       
    }
    
    //Check CollectionView on HomePage
    func testCollectionView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        _ = vc.view
        
        XCTAssertNotNil(vc.collectionView)
    }
    
    
    //Check TableView on DetailsPage
    func testTableView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let home = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let vc = storyboard.instantiateViewController(withIdentifier: "movieDetails") as! DetailViewController
        _ = vc.view
        //vc.detailArray = home.collectionData[0]

        XCTAssertNotNil(vc.tableView)
    }
    

}
