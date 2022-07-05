//
//  Questions.swift
//  Quizzler
//
//  Created by Elzada Kushbakova on 4/7/22.
//

import Foundation

enum Questions{
    case one
    case two
    case three
    
    var title: String{
        switch self {
        case .one:
            return "Is sky is blue?"
        case .two:
            return "It's winter now?"
        case .three:
            return "Are you blond"
        }
    }
    
    var answers: String{
        switch self {
        case .one:
            return "Yes"
        case .two:
            return "No"
        case .three:
            return "Yes"
        }
    }
}
