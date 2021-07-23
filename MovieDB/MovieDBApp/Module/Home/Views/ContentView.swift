//
//  ContentView.swift
//  FoodOrderingApp
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI
enum ThumbnailType {
    case big
    case small
    case pager
}
struct ContentView: View {
    @StateObject private var viewModel =  MovieListVM()
   
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            VStack {
                NavigationView()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment:.leading) {
                        TitleView(viewTitle: "Trending")
                        ZStack {
                            TabView{
                                ForEach(viewModel.trendingMovies) { movie in
                                    ThumbnailView(thumbnailType: .pager, movieData: CommonMovieModel(title: movie.title ?? "", posterUrl: movie.posterPath, popularityPercentage: movie.voteAverage))
                                        .padding()
                                        .shadow( radius: 8)
                                        
                                }
                            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        }
                        TitleView(viewTitle: "New Movies")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.nowPlayingMovies) { movie in
                                    ThumbnailView(thumbnailType: .small,movieData: CommonMovieModel(title: movie.title , posterUrl: movie.posterPath, popularityPercentage: movie.voteAverage))
                                        .padding()
                                        .shadow( radius: 8)
                                }
                            }
                        }
                        TitleView(viewTitle: "Popular")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(viewModel.topRatedMovies) { movie in
                                    ThumbnailView(thumbnailType: .big, movieData: CommonMovieModel(title: movie.title , posterUrl: movie.posterPath, popularityPercentage: movie.voteAverage))
                                        .padding()
                                        .shadow( radius: 8)
                                }
                            }
                        }
                    }
                    
                }
            }
        }.onAppear {
            viewModel.getMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct LabelView: View {
    var body: some View {
        Text("Hi there!")
            .padding(10)
            .font(.title)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.green).shadow(color: .gray, radius: 3))
    }
}
