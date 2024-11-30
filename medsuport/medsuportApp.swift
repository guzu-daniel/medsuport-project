//
//  medsuportApp.swift
//  medsuport
//
//  Created by Guzu Daniel on 28.11.2024.
//

import SwiftUI
import UIKit

@main
struct medsuportApp: App {
    
    var body: some Scene {
        WindowGroup {
            MedSupportView(viewModel: WebViewModel())
        }
    }
}
