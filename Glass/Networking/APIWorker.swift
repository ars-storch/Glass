//
//  Networking.swift
//  Glass
//
//  Created by Арсений Сторчевой on 12.05.2022.
//

import SwiftUI
import SwiftyVK

final class APIWorker {
    
    class func authorize() {
        VK.sessions.default.logIn(
            onSuccess: { info in
                print("SwiftyVK: success authorize with", info)
            },
            onError: { error in
                print("SwiftyVK: authorize failed with", error)
            }
        )
    }
    
}
