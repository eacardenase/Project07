//
//  DetailVC.swift
//  Project07
//
//  Created by Edwin Cardenas on 2/2/23.
//

import UIKit
import WebKit

class DetailVC: UIViewController {
    
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detailItem = detailItem else { return }
        
        let html = """
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <style>
                    p {
                        font-size: 150%;
                    }
                </style>
            </head>
            <body>
                <h1>\(detailItem.title)</h1>
                <p>\(detailItem.body)</p>
            </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    
}
