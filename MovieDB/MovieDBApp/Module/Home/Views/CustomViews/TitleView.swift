//
//  TitleView.swift
//  MovieDB
//
//  Created by Amit Singh on 21/07/21.
//

import SwiftUI

struct TitleView: View {
    @State var viewTitle: String = ""
    var body: some View {
        Text(viewTitle)
            .bold()
            .foregroundColor(.white)
            .font(.callout)
            .padding(.leading, 20)
    }
}


struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
