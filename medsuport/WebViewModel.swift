//
//  WebViewModel.swift
//  medsuport
//
//  Created by Guzu Daniel on 28.11.2024.
//

import Foundation

final class WebViewModel: ObservableObject {
    @Published var url: URL = URL(string: "https://www.medsuport.ro/login")!
}
