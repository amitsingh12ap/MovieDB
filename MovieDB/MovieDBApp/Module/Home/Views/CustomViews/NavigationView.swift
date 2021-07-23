//
//  NavigationView.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("movieDB")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 30, alignment: .center)
                .clipped()
                
            Spacer()
        }.padding()
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
