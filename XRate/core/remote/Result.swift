//
//  Result.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


public enum Result<R, E> {
    case success(payload: R)
    case failure(error : E)
}
