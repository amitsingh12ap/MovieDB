//
//  ThumbnailView.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI

struct CommonMovieModel {
    var title: String
    var posterUrl: String
    var popularityPercentage: Double
}
struct ThumbnailView: View {
    @State var thumbnailType: ThumbnailType
    @State var movieData: CommonMovieModel
    @State var image = UIImage()
    
    @StateObject var imageLoader = ImageLoader()
    var body: some View {
        ZStack {
            Image(uiImage: image)
                .resizable()
                .onReceive(imageLoader.$data) { data in
                    guard let data = data else { return }
                    self.image = UIImage(data: data) ?? UIImage()
                }
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .onAppear {
                self.imageLoader.loadData(from: "w\(200)"+movieData.posterUrl)
            }
            GeometryReader { geometry in
             
                Circle().overlay(
                    ZStack {
                        Text("\(movieData.popularityPercentage.removeZerosFromEnd())")
                            .bold()
                            .font(.caption)
                            .foregroundColor(.white)
                        Circle()
                            .stroke(Color.gray,lineWidth: 1)
                    }
                ).foregroundColor(.black)
                    .frame(width: 30, height: 30)
                    .position(x: 40, y: geometry.size.height-5)
            }
        }
        
    }

}
extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
