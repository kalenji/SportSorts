//
//  CommentView.swift
//  SportSorts
//
//  Created by Kalin Gavrilov on 18.02.23.
//

import SwiftUI

struct CommentView: View {
    let comment: Comment

    var body: some View {
        VStack(alignment: .leading) {
            Text(comment.text)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment(text: "Great place!", locationID: "1"))
    }
}
