//
//  ContentView.swift
//  medsuport
//
//  Created by Guzu Daniel on 28.11.2024.
//

import SwiftUI

struct MedSupportView: View {
    @ObservedObject var viewModel: WebViewModel
    @State private var isOpeningExternally = false
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        WebView(url: viewModel.url)
            .ignoresSafeArea()
            .onOpenURL { url in
                handleIncomingURL(url: url)
            }
    }
    
    private func handleIncomingURL(url: URL) {
        let stringURL = url.absoluteString
        
        if isOpeningExternally {
            return
        }
        
        // Check if the URL contains "medsuport.ro", otherwise open in browser
        if !stringURL.contains("medsuport.ro") && UIApplication.shared.canOpenURL(url) {
            isOpeningExternally = true  // Set flag to avoid infinite loop
            UIApplication.shared.open(url, options: [:]) { success in
                // Reset flag after URL is opened externally
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isOpeningExternally = false
                }
            }
        } else {
            // Update the URL to be loaded in the WebView
            viewModel.url = url
        }
    }
}

#Preview {
    let viewModel = WebViewModel()
    MedSupportView(viewModel: viewModel)
}
