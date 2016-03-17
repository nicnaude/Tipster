//
//  ExtensionDecimalPoints.swift
//  Tipster
//
//  Created by Nicholas Naudé on 16/03/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

import Foundation
import UIKit

public extension CGFloat {
    func roundToDecimals(decimals: Int = 2) -> CGFloat {
        let multiplier = CGFloat(10^decimals)
        return round(multiplier * self) / multiplier
    }
}