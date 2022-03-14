//
//  Extension .swift
//  SwiftUI_VK
//
//  Created by Максим Валюшко on 14.03.2022.
//

import Foundation

extension DateFormatter {
    static func newsFeedFormat(for dateInt: Int) -> String {
        let dateFormatter = DateFormatter()
        let timeInterval = TimeInterval(dateInt)
        let date = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateFormat = "MM.dd.yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
