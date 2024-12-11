//
//  NewsReaderAppApp.swift
//  NewsReaderApp
//
//  Created by Mohar on 11/12/24.
//

import SwiftUI

@main
struct NewsReaderAppApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            HomeContentView().environmentObject(articleBookmarkVM)
        }
    }
}
