//
//  PlayTogather.swift
//  TicTacToe
//
//  Created by Abhijeet Banarase on 03/06/2022.
//

import Foundation
import GroupActivities

struct PlayTogether: GroupActivity {

    var metadata: GroupActivityMetadata {
        var metadata = GroupActivityMetadata()
        metadata.title = NSLocalizedString("Play Together",
                                           comment: "Title of group activity")
        metadata.type = .generic
        return metadata
    }

}
