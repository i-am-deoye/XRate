//
//  State.swift
//  XRate
//
//  Created by Moses on 25/07/2021.
//

import Foundation


public enum XRState<R> {
    case loading
    case result(payload: R)
    case failure(error : String)
}
