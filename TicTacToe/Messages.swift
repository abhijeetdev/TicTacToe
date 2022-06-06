//
//  Messages.swift
//  TicTacToe
//
//  Created by Abhijeet Banarase on 04/06/2022.
//

import Foundation

struct PlayerMoveMessage: Codable {
    let id: Int
    let turn: String
}
